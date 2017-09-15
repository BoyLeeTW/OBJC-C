//
//  CommentModel.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (strong, nonatomic, readonly) NSString *userName;
@property (strong, nonatomic, readonly) NSString *userComment;
@property (strong, nonatomic, readonly) NSString *userId;


- (instancetype)initWithUserName:(NSString *) userName userId:(NSString *) userId userComment:(NSString *) userComment;



@end
