//
//  ServerModel.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "ServerModel.h"

@implementation ServerModel

- (id)initWithBaseURL: (NSString*) url {
    self = [super init];
    
        if (self) {
            self.baseURL = @"";
        }

    return self;
}


@end
