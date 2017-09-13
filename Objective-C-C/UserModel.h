//
//  User.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property NSString *fbID;

@property NSString *fbPhotoURLString;

@property NSString *fbName;

- (id)initWithFbId:(NSString*) fbId fbName:(NSString*) name fbPhotoURLString:(NSString*) photoURLString;



@end
