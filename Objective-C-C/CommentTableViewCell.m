//
//  CommentTableViewCell.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/14.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell


@synthesize userNameLabel = _userNameLabel;

@synthesize userPhotoImageView = _userPhotoImageView;

@synthesize commentContentLabel = _commentContentLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    if(self) {
        
        self.userNameLabel = [[UILabel alloc] init];
        
        self.userPhotoImageView = [[UIImageView alloc] init];
        
        self.commentContentLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.userNameLabel];
        
        [self.contentView addSubview:self.userPhotoImageView];
        
        [self.contentView addSubview:self.commentContentLabel];
        
        
    }
    
    return self;
    
    
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    [self.userPhotoImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:self.contentView.bounds.size.width * 20 / 375].active = YES;
    
    [self.userPhotoImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:self.contentView.bounds.size.width * 20 /375].active = YES;
    
    [self.userPhotoImageView.widthAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 40 / 375].active = YES;
    
    [self.userPhotoImageView.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 40 / 375].active = YES;
    
    
    self.userPhotoImageView.layer.cornerRadius = self.userPhotoImageView.bounds.size.width / 2;
    
    self.userPhotoImageView.clipsToBounds = YES;
    
    self.userPhotoImageView.contentMode = UIViewContentModeScaleToFill;
    
    
    self.userPhotoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    
    
    
    
    [self.userNameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:self.contentView.bounds.size.width * 20 / 375].active = YES;
    
    [self.userNameLabel.leadingAnchor constraintEqualToAnchor:self.userPhotoImageView.trailingAnchor constant:self.contentView.bounds.size.width * 20 /375].active = YES;
    
    [self.userNameLabel.heightAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 14 / 375].active = YES;
    
//    [self.userNameLabel.widthAnchor constraintEqualToConstant:self.contentView.bounds.size.width * 275 / 375].active =YES;
    
    [self.userNameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -20].active = YES;
    
    
    self.userNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.commentContentLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant: -self.contentView.bounds.size.width * 14 / 375].active = YES;
    
    [self.commentContentLabel.topAnchor constraintEqualToAnchor:self.userNameLabel.bottomAnchor constant:self.contentView.bounds.size.width * 8 / 375].active = YES;
    
    [self.commentContentLabel.leadingAnchor constraintEqualToAnchor:self.userPhotoImageView.trailingAnchor constant:self.contentView.bounds.size.width * 20 / 375].active = YES;
    
    [self.commentContentLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -self.contentView.bounds.size.width * 20 / 375].active = YES;

    
    self.commentContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.commentContentLabel.numberOfLines = 0;
    
    self.commentContentLabel.lineBreakMode = NSLineBreakByWordWrapping;


    
    
}






@end
