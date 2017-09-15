//
//  ComemntUserPhotoModel.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/15.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "CommentUserPhotoModel.h"

@implementation CommentUserPhotoModel


- (instancetype)initWithUserId:(NSString *) userId userPhoto:(UIImage *) userPhoto {
    
    _userId = userId;
    
    _userPhoto = userPhoto;
    
    
    return self;
}


@end
