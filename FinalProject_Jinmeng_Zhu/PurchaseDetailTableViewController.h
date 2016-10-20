//
//  PurchaseDetailTableViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Book.h"
#import "UserCategory.h"

@interface PurchaseDetailTableViewController : UITableViewController

@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;
@property(strong, nonatomic) Book *book;

@property (weak, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *authorCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *pubCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *soldCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *amountCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *priceCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *dateFirstCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *dateDealCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *sellerNameCell;



@end
