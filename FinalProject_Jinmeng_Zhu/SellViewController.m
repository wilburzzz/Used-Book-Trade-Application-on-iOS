//
//  SellViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "SellViewController.h"
#import "Book.h"
#import "PicViewController.h"
@interface SellViewController ()

@end

@implementation SellViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillLayoutSubviews
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.filePath = [self.documentsPath stringByAppendingPathComponent:@"FinalProject_newfile.txt"];
    [NSFileManager defaultManager];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(updateTextField:)forControlEvents:UIControlEventValueChanged];
    
    [self.dateCell setInputView:datePicker];
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"addPic"]){
        Book *book = [[Book alloc]init];
        book.bookName = [self.bookNameField text];
        book.bookAuthor = [self.authorNameField text];
        book.bookPublisher = [self.pubNameField text];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        book.amount = [numberFormatter numberFromString:[self.amountField text]];
        book.price = [numberFormatter numberFromString:[self.priceField text]];
        
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        book.dateOfNew = [formatter dateFromString:self.dateCell.text] ;
        book.sellerName = self.logInUser.name;
        
        UIViewController *dvc = segue.destinationViewController;
        ((PicViewController *)dvc).book = book;
        ((PicViewController *)dvc).logInUser = self.logInUser;
        ((PicViewController *)dvc).users = self.users;
    }
}

- (void)updateTextField:(id)sender{
    if([self.dateCell isFirstResponder]){
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        UIDatePicker *picker = (UIDatePicker*)self.dateCell.inputView;
        
        self.dateCell.text = [formatter stringFromDate:picker.date];
        
    }
}

-(void)pickerValueChanged:(UIDatePicker *)picker{
    
    self.dateCell.text = picker.date.description;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.bookNameField.text = @"";
    self.authorNameField.text = @"";
    self.priceField.text = @"";
    self.amountField.text = @"";
    self.pubNameField.text = @"";
    self.dateCell.text = @"";
}

@end
