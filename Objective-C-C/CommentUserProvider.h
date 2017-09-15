//
//  CommentUserProvider.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/15.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentUserPhotoModel.h"

@interface CommentUserProvider : NSObject

+(instancetype _Nullable )sharedInstance;

-(void)getProductCommentWithUserId:(NSString*) userId withCompletionHandler:(void (^__nonnull)(UIImage * __nullable userPhoto, NSError * __nullable error)) completionHandler;

@end
