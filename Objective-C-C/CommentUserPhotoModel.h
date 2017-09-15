//
//  ComemntUserPhotoModel.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/15.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommentUserPhotoModel : NSObject

@property (strong, nonatomic, readonly) NSString *userId;

@property (strong, nonatomic, readonly) UIImage *userPhoto;


- (instancetype)initWithUserId:(NSString *) userId userPhoto:(UIImage *) photo;


@end
