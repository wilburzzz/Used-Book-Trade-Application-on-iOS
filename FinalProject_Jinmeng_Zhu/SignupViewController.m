//
//  SignupViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

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

- (IBAction)submitAction:(id)sender {
    
    self.oneUser = [[User alloc]init];
    
    
    self.oneUser.name = [self.nameField text];
    
    NSString *pass1 = [self.passwordField1 text];
    NSString *pass2 = [self.passwordField2 text];
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    self.oneUser.telephoneNumber = [numberFormatter numberFromString:[self.teleField text]];
    self.oneUser.region = [self.regionField text];
    self.oneUser.email = [self.emailField text];
    
    if([self.oneUser.name isEqualToString:@""]||[[self.teleField text] isEqualToString:@""]||[self.oneUser.email isEqualToString:@""]||[self.oneUser.region isEqualToString:@""]||[pass1 isEqualToString:@""]||[pass2 isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please fill in all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if(![pass1 isEqualToString:pass2]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Password should be same" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        self.oneUser.password = pass1;
        [self.users.users addObject:self.oneUser];
        [self performSegueWithIdentifier:@"Go to Main" sender:self];
        self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        self.filePath = [self.documentsPath stringByAppendingPathComponent:@"FinalProject_newfile.txt"];
        [NSFileManager defaultManager];
        [NSKeyedArchiver archiveRootObject:self.users toFile:self.filePath];
    }
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Go to Main"]){
        UIViewController *dvc = segue.destinationViewController;
        ((mainViewController *)dvc).users = self.users;
        ((mainViewController *)dvc).logInUser = self.oneUser;
    }
}








@end
