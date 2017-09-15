//
//  User.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UserModel.h"

@implementation UserModel

- (id)initWithFbId:(NSString*) fbId fbName:(NSString*) name fbPhotoURLString:(NSString*) photoURLString {
    
    self = [super init];
    
    if(self) {
        self.fbID = fbId;
        self.fbName = name;
        self.fbPhotoURLString = photoURLString;
    }
    
    
    
    return self;
}






@end
