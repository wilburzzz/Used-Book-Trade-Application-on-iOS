//
//  mainViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCategory.h"
#import "User.h"
#import "PurchaseTableViewController.h"
#import "SellViewController.h"
#import "RequestTableViewController.h"
#import "MeTableViewController.h"
@interface mainViewController : UITabBarController

@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;
@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;

@end
