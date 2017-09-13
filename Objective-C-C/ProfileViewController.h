//
//  ProfileViewController.h
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userPhotoImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UIButton *changeToFavoriteButton;

@property (weak, nonatomic) IBOutlet UIButton *changeToPurchasedButton;

@property (weak, nonatomic) IBOutlet UITableView *purchasedTableView;

@property (weak, nonatomic) IBOutlet UICollectionView *favoriteCollectionView;

@end
