//
//  CommentModel.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

- (instancetype)initWithUserName:(NSString *) userName userId:(NSString *) userId userComment:(NSString *) userComment {
    
    _userName = userName;
    
    _userId = userId;
    
    _userComment = userComment;
    
    return self;
}



@end
