//
//  ProductProvider.h
//  Objective-C-C
//
//  Created by moon on 2017/9/15.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductManagerDelegate

-(void) didGetNextPageProducts:(NSArray *) fetchedProducts;

-(void) didGetProducts:(NSArray *) fetchedProducts;

-(void) didFail:(NSError *) error;

@end

@interface ProductProvider : NSObject

@property (weak, atomic) id <ProductManagerDelegate> delegate;

//Singleton
+(instancetype) sharedInstance;

-(void) requestProduct;

-(void) requestNextPage;

@end
