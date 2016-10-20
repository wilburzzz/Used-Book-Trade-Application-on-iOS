//
//  MeTableViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "MeTableViewController.h"
#import "purchaseHistoryTableViewController.h"
#import "sellHistoryTableViewController.h"

@interface MeTableViewController ()

@end

@implementation MeTableViewController

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
    
    self.purchaseCell.textLabel.text = @"Purchase History";
    self.purchaseCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[self.logInUser.purchaseList.purchaseList count]];
    
    self.sellCell.textLabel.text = @"Sell History";
    self.sellCell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[self.logInUser.sellList.sellList count]];
    
    self.title = self.logInUser.name;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"purchaseSegue"]){
        UIViewController *dc = segue.destinationViewController;
        ((purchaseHistoryTableViewController *)dc).logInUser = self.logInUser;
        ((purchaseHistoryTableViewController *)dc).users = self.users;
        //((RequestListViewController *)dc).requestArray = self.logInUser.sendList.sendList;
        
    }else if([[segue identifier] isEqualToString:@"sellSegue"]){
        UIViewController *dc = segue.destinationViewController;
        ((sellHistoryTableViewController *)dc).logInUser = self.logInUser;
        ((sellHistoryTableViewController *)dc).users = self.users;
        //((RequestListViewController *)dc).requestArray = self.logInUser.receiveList.receiveList;
        
}
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0){
        [self performSegueWithIdentifier:@"purchaseSegue" sender:self];
    }else{
        [self performSegueWithIdentifier:@"sellSegue" sender:self];
    }
    
}






























@end
