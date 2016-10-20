//
//  mainViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()

@end

@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.users = ((UINavigationController *)[self.childViewControllers objectAtIndex:0];
   /*
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.filePath = [self.documentsPath stringByAppendingPathComponent:@"FinalProject_newfile.txt"];
    [NSFileManager defaultManager];
    
    self.users =[NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if(self.users==nil){
        self.users=[[UserCategory alloc]init];
    }
    
    for(User *user in self.users.users){
        if([user.name isEqualToString:self.logInUser.name]){
            self.logInUser = user;
        }
    }
    */
    
    ((PurchaseTableViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:0]).viewControllers objectAtIndex:0]).users = self.users;
    ((PurchaseTableViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:0]).viewControllers objectAtIndex:0]).logInUser = self.logInUser;
    
    ((SellViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:1]).viewControllers objectAtIndex:0]).users = self.users;
    ((SellViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:1]).viewControllers objectAtIndex:0]).logInUser = self.logInUser;
    
    ((RequestTableViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:2]).viewControllers objectAtIndex:0]).users = self.users;
    ((RequestTableViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:2]).viewControllers objectAtIndex:0]).logInUser = self.logInUser;
    
    ((MeTableViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:3]).viewControllers objectAtIndex:0]).users = self.users;
    ((MeTableViewController *)[((UINavigationController *)[self.childViewControllers objectAtIndex:3]).viewControllers objectAtIndex:0]).logInUser = self.logInUser;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
