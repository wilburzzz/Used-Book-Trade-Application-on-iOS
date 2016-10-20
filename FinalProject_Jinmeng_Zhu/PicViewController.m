//
//  PicViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "PicViewController.h"

@interface PicViewController ()

@end

@implementation PicViewController

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

- (IBAction)submitBookAction:(id)sender {
    
    [self.logInUser.sellList.sellList addObject:self.book];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Book Added" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alert show];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [NSKeyedArchiver archiveRootObject:self.users toFile:self.filePath];
}

- (IBAction)addPicAction:(id)sender {
    UIImagePickerController* picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self presentViewController:picker animated:YES completion:nil];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    self.book.picture = self.imageView.image;
}







@end
