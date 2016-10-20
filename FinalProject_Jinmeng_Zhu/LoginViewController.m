//
//  LoginViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.filePath = [self.documentsPath stringByAppendingPathComponent:@"FinalProject_newfile.txt"];
    [NSFileManager defaultManager];
    
    self.users =[NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if(self.users==nil){
        self.users=[[UserCategory alloc]init];
    }

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

- (IBAction)loginAction:(id)sender {
    NSString *name = [self.nameField text];
    NSString *password = [self.passwordField text];
    BOOL flag = false;
    for(User *u in self.users.users){
        if([u.name isEqualToString:name]){
            flag = true;
            if([u.password isEqualToString:password]){
                self.logInUser = u;
                [self performSegueWithIdentifier:@"login" sender:self];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Wrong Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                break;
            }
        }
    }
    
    if(!flag){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Name doesn't exist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (IBAction)signupAction:(id)sender {
    [self performSegueWithIdentifier:@"signup" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"login"]){
        UIViewController *dvc = segue.destinationViewController;
        ((mainViewController *)dvc).users = self.users;
        ((mainViewController *)dvc).logInUser = self.logInUser;
    }else if([[segue identifier] isEqualToString:@"signup"]){
        UIViewController *dvc = segue.destinationViewController;
        ((SignupViewController *)dvc).users = self.users;
    }
}

































@end
