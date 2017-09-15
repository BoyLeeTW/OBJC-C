//
//  CommentTableViewCell.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/14.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *userNameLabel;

@property (nonatomic, strong) UILabel *commentContentLabel;

@property (nonatomic, strong) UIImageView *userPhotoImageView;


@end
