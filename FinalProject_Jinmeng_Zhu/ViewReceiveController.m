//
//  ViewReceiveController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "ViewReceiveController.h"

@interface ViewReceiveController ()

@end

@implementation ViewReceiveController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bookNameCell.textLabel.text = @"Name";
    self.bookNameCell.detailTextLabel.text = self.request.forBook.bookName;
    
    self.senderNameCell.textLabel.text = @"Name";
    self.senderNameCell.detailTextLabel.text = self.request.sendUser.name;
    
    self.senderregionCell.textLabel.text = @"Region";
    self.senderregionCell.detailTextLabel.text = self.request.sendUser.region;
    
    self.emailCell.textLabel.text = @"email";
    self.emailCell.detailTextLabel.text = self.request.sendUser.email;

    self.teleCell.textLabel.text = @"Tel No";
    self.teleCell.detailTextLabel.text = self.request.sendUser.region;

    self.request.watch = @"checked";
    
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.filePath = [self.documentsPath stringByAppendingPathComponent:@"FinalProject_newfile.txt"];
    [NSFileManager defaultManager];
    
    
    if([self.request.approve isEqualToString:@"approved"]){
        [self.approveButton setEnabled:false];
    }else{
        [self.approveButton setEnabled:YES];
    }
    
    if([self.request.forBook.sold isEqualToString:@"sold"]){
        [self.soldButton setEnabled:false];
    }else{
        [self.soldButton setEnabled:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section==0){
        return  1;
    }else if(section==1){
        return 4;
    }else{
        return 2;
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)approveAction:(id)sender {
    
    for(User *user in self.users.users){
        for(Request *request in user.sendList.sendList){
            if([request.forBook.bookName isEqualToString:self.request.forBook.bookName]){
                request.approve = @"approved";
            }
        }
    }
    
    for(User *user in self.users.users){
        for(Request *request in user.receiveList.receiveList){
            if([request.forBook.bookName isEqualToString:self.request.forBook.bookName]){
                request.approve = @"approved";
                [self.approveButton setEnabled:false];
            }
        }
    }
    
    [NSKeyedArchiver archiveRootObject:self.users toFile:self.filePath];
}

- (IBAction)soldAction:(id)sender {
    
    for(User *user in self.users.users){
        for(Book *oneBook in user.sellList.sellList){
            if([oneBook.bookName isEqualToString:self.request.forBook.bookName]){
                oneBook.sold = @"sold";
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                
                [formatter setDateFormat:@"yyyy-MM-dd"];
                oneBook.dateOfDeal = [NSDate date];
                [self.request.sendUser.purchaseList.purchaseList addObject:oneBook];
                [self.soldButton setEnabled:false];
            }
        }
    }
    
    [NSKeyedArchiver archiveRootObject:self.users toFile:self.filePath];
    
}
@end
