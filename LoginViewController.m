//
//  LoginViewController.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/11.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)logIn {
    
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    login.loginBehavior = FBSDKLoginBehaviorBrowser;
    [login logInWithRead:@[@"public_profile",@"email"] from
    
    
}



@end
