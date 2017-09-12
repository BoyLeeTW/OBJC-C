//
//  LoginViewController.m
//  Objective-C-C
//
//  Created by Ｍason Chang on 2017/9/11.
//  Copyright © 2017年 Brad. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "ProductViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [_loginButton addTarget:self action:@selector(fbLogIn) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)fbLogIn {
    
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    login.loginBehavior = FBSDKLoginBehaviorBrowser;
    [login logInWithReadPermissions:@[@"public_profile", @"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        
        if (error) {
            
            NSLog(@"Unexpected login error: %@", error);
            NSString *alertMessage = error.userInfo[FBSDKErrorLocalizedDescriptionKey] ?: @"There was a problem logging in. Please try again later.";
            NSString *alertTitle = error.userInfo[FBSDKErrorLocalizedTitleKey] ?: @"Oops";
            [[[UIAlertView alloc] initWithTitle:alertTitle
                                        message:alertMessage
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
            
        } else if (result.isCancelled) {
            
            // Handle cancellations
            
        } else {
            
            if (result.token)
            {

                if ([FBSDKAccessToken currentAccessToken]) {
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"email, name, picture"}]
                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                         if (!error) {
                             NSLog(@"fetch user:%@", result);
                             [[NSUserDefaults standardUserDefaults] setObject:[result valueForKeyPath:@"name"] forKey:@"name"];
                             [[NSUserDefaults standardUserDefaults] setObject:[result valueForKeyPath:@"email"] forKey:@"email"];
                             [[NSUserDefaults standardUserDefaults] setObject:[result valueForKeyPath:@"picture"] forKey:@"picture"];
                             [[NSUserDefaults standardUserDefaults] setObject:[FBSDKAccessToken currentAccessToken].tokenString forKey:@"token"];
                             
                             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                             UITabBarController *tabBarVC = [storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
                             
                             [[UIApplication sharedApplication].keyWindow setRootViewController:tabBarVC];
                             
                         } else {
                             NSLog(@"%@",error);
                         }
                        }];
                     }
                    
                }
            
                
            }
        
            
        }
     
        
    ];
    
    
}

@end
