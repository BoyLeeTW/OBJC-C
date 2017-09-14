//
//  Product.h
//  ObjDelegateTest
//
//  Created by moon on 2017/9/14.
//  Copyright © 2017年 Marvin Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property NSString *productId;
@property NSString *name;
@property NSNumber *price;

- (id)initWithName: (NSString *)productId name:(NSString *)name price:(NSNumber *)price;

@end
