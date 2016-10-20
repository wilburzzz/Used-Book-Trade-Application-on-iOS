//
//  PicViewController.h
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "UserCategory.h"
#import "Book.h"
@interface PicViewController : UIViewController

@property(strong, nonatomic) NSString *documentsPath;
@property(strong, nonatomic) NSString *filePath;
@property(strong, nonatomic) User *logInUser;
@property(strong, nonatomic) Book *book;
@property(strong, nonatomic) UserCategory *users;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)submitBookAction:(id)sender;
- (IBAction)addPicAction:(id)sender;
@end
