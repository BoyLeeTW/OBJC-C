//
//  Product.m
//  ObjDelegateTest
//
//  Created by moon on 2017/9/14.
//  Copyright © 2017年 Marvin Lin. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize productId = _productId;
@synthesize name = _name;
@synthesize price = _price;

- (id)initWithName:(NSString *)productId name:(NSString *)name price:(NSNumber *)price {

    self = [super init];
    
    if (self) {
        self.productId = productId;
        self.name = name;
        self.price = price;
    }
    
    return self;
}

@end
