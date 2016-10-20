//
//  SellViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserCategory.h"

@interface SellViewController : UIViewController

@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;

@property (weak, nonatomic) IBOutlet UITextField *bookNameField;
@property (weak, nonatomic) IBOutlet UITextField *authorNameField;
@property (weak, nonatomic) IBOutlet UITextField *pubNameField;
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;

@property (weak, nonatomic) IBOutlet UITextField *dateCell;






@end
