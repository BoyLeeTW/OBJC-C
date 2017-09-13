//
//  ProfileViewController.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/13.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setUpUI];
    
    [self.changeToPurchasedButton addTarget:self action:@selector(pressChangeToPurchased) forControlEvents:UIControlEventTouchUpInside];
    
    [self.changeToFavoriteButton addTarget:self action:@selector(pressChangeToFavorite) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setUpUI {
    
    // setupPhoto
    
    NSString *userPictureURL = [NSUserDefaults.standardUserDefaults stringForKey:@"pictureURL"];
    
    NSURL *url = [NSURL URLWithString:userPictureURL];
    
    NSLog(@"%@", url);
    
    if (url == nil) {
        
        // Todo: Error handling
        
    } else {
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        self.userPhotoImageView.image = [UIImage imageWithData:data];
        self.userPhotoImageView.contentMode = UIViewContentModeScaleAspectFill;
        
    }

    
    // setup nameLabel
    
    self.userNameLabel.text = [NSUserDefaults.standardUserDefaults stringForKey:@"name"];
    
    
    // setup changeButton
    
    self.changeToFavoriteButton.layer.cornerRadius = 4;
    self.changeToFavoriteButton.clipsToBounds = YES;
    self.changeToPurchasedButton.layer.cornerRadius = 4;
    self.changeToPurchasedButton.clipsToBounds = YES;
    
    
    
}

- (void)pressChangeToPurchased {
    
    self.changeToPurchasedButton.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
    self.changeToFavoriteButton.backgroundColor = [UIColor clearColor];
    [self.purchasedTableView setHidden:NO];
    [self.favoriteCollectionView setHidden:YES];
    
    
}

- (void)pressChangeToFavorite {
    
    self.changeToFavoriteButton.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
    self.changeToPurchasedButton.backgroundColor = [UIColor clearColor];
    [self.purchasedTableView setHidden:YES];
    [self.favoriteCollectionView setHidden:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
