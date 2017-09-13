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
    
    [self setUpUI];
    
    
    [_loginButton addTarget:self action:@selector(fbLogIn) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setUpUI {
    
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.view.bounds;
    
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithRed:3/255.0 green:63/255.0 blue:122/255.0 alpha:1] CGColor],
                       (id)[[UIColor colorWithRed:4/255.0 green:107/255.0 blue:149/255.0 alpha:1] CGColor],nil];
    
    [self.gradientView.layer insertSublayer:gradient atIndex:0];
    
    self.gradientView.alpha = 0.8;
    
    
    _loginButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:53/255.0 blue:71/255.0 alpha:1.0];
    
    [_loginButton setTitle:@"Sign In with Facebook" forState:UIControlStateNormal];
    
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _loginButton.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1].CGColor;
    
    _loginButton.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    
    _loginButton.layer.shadowRadius = 2;
    
    _loginButton.layer.shadowOpacity = 1.0;
    
    _loginButton.layer.cornerRadius = 2.0;
    
    _loginButton.clipsToBounds = YES;
    
    _loginButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    _loginButton.titleLabel.minimumScaleFactor = 0.1;
    
    
    self.titleLabel.text = @"Pâtissier";
    
    
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
