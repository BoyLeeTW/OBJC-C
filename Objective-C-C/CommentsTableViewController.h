//
//  CommentsTableViewController.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/14.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CommentProvider.h"
#import "ProductInfoTableViewCell.h"
#import "CommentModel.h"

typedef enum {
    
    productInfo = 0,
    comments
    
} CommentsTableViewSection;


@interface CommentsTableViewController : UITableViewController {
    
    CommentsTableViewSection commentsTableViewSection;
    
}

@property (strong, nonatomic) NSString *productId;

@property (strong, nonatomic) NSString *productName;

@property (nonatomic) double *productPrice;

@property (strong, nonatomic) UIImage *productImage;


@property (strong, nonatomic) NSMutableArray<CommentModel*> *comments;


@end
