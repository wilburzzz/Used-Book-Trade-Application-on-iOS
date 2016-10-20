//
//  purchaseHistoryTableViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Book.h"
#import "UserCategory.h"
@interface purchaseHistoryTableViewController : UITableViewController


@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;
@property(strong, nonatomic) Book *selected;
@end
