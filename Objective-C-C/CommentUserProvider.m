//
//  CommentUserProvider.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/15.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "CommentUserProvider.h"

@implementation CommentUserProvider

+(instancetype) sharedInstance {
    
    static CommentUserProvider *instance = nil;
    static dispatch_once_t commentUser;
    dispatch_once(&commentUser, ^{
        instance = [[CommentUserProvider alloc] init];
    });
    
    return instance;
    
}

-(void)getProductCommentWithUserId:(NSString*) userId withCompletionHandler:(void (^__nonnull)(UIImage * __nullable userPhoto, NSError * __nullable error)) completionHandler {
    
    NSString *endPoint = @"/users/";
    
    NSMutableString *path = @"http://52.198.40.72/patissier";
    
    [path appendString:endPoint];
    
    NSString *userPhotoUrl = [NSString stringWithFormat:@"%@%@", userId, @"/picture.jpg"];
    
    [path appendString:userPhotoUrl];
    
    NSURL *fetchUserPhotoUrl = [NSURL URLWithString:path];
    
    
    NSData *data = [NSData dataWithContentsOfURL:fetchUserPhotoUrl];
    
    
    
    if ([UIImage imageWithData:data] == nil) {
        
        completionHandler(nil, [NSError init]);
        
        
    } else {
        
        completionHandler([UIImage imageWithData:data], nil);
        
    }

}



@end
