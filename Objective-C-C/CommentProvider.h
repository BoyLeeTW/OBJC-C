//
//  CommentProvider.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"
@interface CommentProvider : NSObject

+(instancetype _Nullable )sharedInstance;

-(void)getProductCommentWithProductId:(NSString*) productId withCompletionHandler:(void (^__nonnull)(NSMutableArray<CommentModel *> * __nullable comments, NSError * __nullable error)) completionHandler;


-(NSMutableArray<CommentModel *> *_Nullable)parseCommentsJSON: (NSData *_Nullable)data;



@end
