//
//  PurchaseTableViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserCategory.h"
#import "Book.h"
#import "SellCategory.h"
@interface PurchaseTableViewController : UITableViewController

@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;

@property(strong, nonatomic) SellCategory *contents;
@property(strong, nonatomic) SellCategory *filteredContents;
@property(strong, nonatomic) Book *selected;

@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
- (IBAction)refresh:(id)sender;

@end
