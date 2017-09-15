//
//  ProductProvider.m
//  Objective-C-C
//
//  Created by moon on 2017/9/15.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "ProductProvider.h"
#import "Product.h"
#import "AFNetworking.h"

@implementation ProductProvider {
    
    NSMutableArray *products;

}

@synthesize delegate;

+(instancetype) sharedInstance {
    
    static ProductProvider *instance = nil;
    return instance;
}

-(instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        products = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) requestProduct {
    
    NSMutableArray *fetchedProducts = [[NSMutableArray alloc] init];
    
    NSLog(@"Starting fetching products information");
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setValue:@"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI1OTU0OTM4NWU2Y2I2MDE5MjBjYzYwMTkiLCJleHAiOjE1MzAzMzc0MTguOTI4LCJpYXQiOjE0OTg4MDE0MTguOTI4OTgsImlzcyI6IjU5MjUxY2IxNDdkNTNiMDg1Y2EwNzY1NCIsInR5cGUiOiJhcHAiLCJ2ZXJzaW9uIjoiMS4wIn0.9JPKO_NHz9gLBeb3gPegdb8yuvS-wwV4wg4CDiQ8l0Q" forHTTPHeaderField:@"Authorization"];
    
    [manager GET:@"http://52.198.40.72/patissier/api/v1/products"
      parameters: nil progress: nil success:^(NSURLSessionTask *task, id responseObject) {
          
          NSLog(@"JSON: %@", responseObject);
          
          NSArray *jsonObj = [responseObject objectForKey:@"data"];
          
          NSDictionary *nextPage = [responseObject objectForKey:@"paging"];
          
          NSString *nextPageToken = [nextPage objectForKey:@"next"];
          
          
          
          NSLog(@"%@", nextPageToken);
          
          for (NSDictionary *eachProduct in jsonObj) {
              
              Product *product = [[Product alloc] init];
              
              NSDictionary *b4Input = eachProduct;
              
              product.productId = [b4Input objectForKey:@"id"];
              product.name = [b4Input objectForKey:@"name"];
              product.price = [b4Input objectForKey:@"price"];
              
              [fetchedProducts addObject:product];
          }
          
          dispatch_async(dispatch_get_main_queue(), ^(void) {
              
              [self.delegate didGetProducts: fetchedProducts];
              
          });
          
      } failure:^(NSURLSessionTask *operation, NSError *error) {
          NSLog(@"Error: %@", error);
          
          dispatch_async(dispatch_get_main_queue(), ^(void) {
              
              [self.delegate didFail: error];
              
          });
          
      }];
}

-(void) requestNextPage {
    
    
    
}

@end
