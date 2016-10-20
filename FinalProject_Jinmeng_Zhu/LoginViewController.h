//
//  LoginViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserCategory.h"
#import "mainViewController.h"
#import "SignupViewController.h"
@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;




- (IBAction)loginAction:(id)sender;
- (IBAction)signupAction:(id)sender;

@end
