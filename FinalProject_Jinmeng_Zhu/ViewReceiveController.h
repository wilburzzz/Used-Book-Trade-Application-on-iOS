//
//  ViewReceiveController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserCategory.h"
#import "Request.h"
#import "Book.h"

@interface ViewReceiveController : UITableViewController

@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
@property(strong, nonatomic) UserCategory *users;
@property(strong, nonatomic) User *logInUser;
@property(strong, nonatomic) Request *request;


@property (weak, nonatomic) IBOutlet UITableViewCell *bookNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *senderNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *senderregionCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *emailCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *teleCell;


@property (weak, nonatomic) IBOutlet UITableViewCell *approveCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *soldCell;

@property (weak, nonatomic) IBOutlet UIButton *approveButton;
@property (weak, nonatomic) IBOutlet UIButton *soldButton;


- (IBAction)approveAction:(id)sender;
- (IBAction)soldAction:(id)sender;






@end
