//
//  CommentProvider.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "CommentProvider.h"

@implementation CommentProvider

+(instancetype) sharedInstance {
    
    static CommentProvider *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CommentProvider alloc] init];
    });
    
    return instance;
    
}

-(void)getProductCommentWithProductId:(NSString*) productId withCompletionHandler:(void (^__nonnull)(NSMutableArray<CommentModel *> * __nullable comments, NSError * __nullable error)) completionHandler {
    
    __block NSMutableArray<CommentModel*> *comments = [[NSMutableArray alloc] init];
    
    NSString *urlString = @"http://52.198.40.72/patissier/api/v1/products/5947974173a7f08ded3e8269/comments";
    
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL: [NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"GET"];
    
    [request setValue:@"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI1OTY1ZTZlYTQ3NGM3MjQ0ZGI0YzcyNDQiLCJleHAiOjE1MzE1MzM5MjcuOTQ5LCJpYXQiOjE0OTk5OTc5MjcuOTQ5MzEsImlzcyI6IjU5MjUxY2IxNDdkNTNiMDg1Y2EwNzY1NCIsInR5cGUiOiJhcHAiLCJ2ZXJzaW9uIjoiMS4wIn0.hp7r9ruTWP6zbfj6n6GSb2Sl0lMskmxj8MhtXD2MTeo" forHTTPHeaderField:@"Authorization"];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask =
    [
        session dataTaskWithRequest:request
        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         
            if(error) {
                
                completionHandler(nil,error);
                
            } else {
                
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                
                NSLog(@"%@", httpResponse);
                
                switch (httpResponse.statusCode) {
                        
                    case 200:
                        
                        comments = [self parseCommentsJSON:data];
                        
                        completionHandler(comments, nil);
                        
                        break;
                        
                    default:
                        
                        NSLog(@"httpResponse statusCode is not 200.");
                        
                        
                        break;
                }
                
                
            }
            
        }
     ];
    
    [dataTask resume];
    
}

-(NSMutableArray<CommentModel *> *_Nullable)parseCommentsJSON: (NSData *_Nullable)data {
    
    NSMutableArray<CommentModel*> *commentArray = [[NSMutableArray alloc] init];
    
    NSError *jsonError;
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (jsonError) {
        
        NSLog(@"==Error: %@", jsonError);
        
        
    } else {
        
        // Success Parsing JSON
        
        NSDictionary *jsonObject = (NSDictionary *)jsonResponse;
        
        if (jsonObject == nil) {
            
            return nil;
            
        }
        
        NSDictionary *comments = [jsonObject objectForKey:@"data"];
        
        if (comments == nil) {
            return nil;
        }
        
        for (NSDictionary *comment in comments) {
            
            NSString *commentId = [comment objectForKey:@"id"];
            
            NSString *productId = [comment objectForKey:@"product_id"];
            
            NSString *userComment = [comment objectForKey:@"text"];
            
            NSDictionary *user = [comment objectForKey:@"user"];
            
            NSString *userId = [user objectForKey:@"id"];
            
            NSString *userName = [user objectForKey:@"name"];
            
            
            CommentModel *commentObject = [[CommentModel alloc] initWithUserName:(NSString *)userName userId:(NSString *)userId userComment:(NSString *)userComment];
            
            [commentArray addObject:commentObject];
            
        }
        
    }
    
    return commentArray;
    
    
    
}






@end
