//
//  SellDetailTableViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "SellDetailTableViewController.h"

@interface SellDetailTableViewController ()

@end

@implementation SellDetailTableViewController

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
    
    self.nameCell.textLabel.text = @"Name";
    self.authorCell.textLabel.text = @"Author";
    self.pubCell.textLabel.text = @"Publisher";
    self.soldCell.textLabel.text = @"Sold?";
    self.dateDealCell.textLabel.text = @"Deal Date";
    self.dateFirstCell.textLabel.text = @"Bought Date";
    self.priceCell.textLabel.text = @"Price";
    self.amountCell.textLabel.text = @"Amount";
    self.purchaserNameCell.textLabel.text = @"Purchaser";
    
    self.nameCell.detailTextLabel.text = self.book.bookName;
    self.authorCell.detailTextLabel.text = self.book.bookAuthor;
    self.pubCell.detailTextLabel.text = self.book.bookPublisher;
    self.soldCell.detailTextLabel.text = self.book.sold;
    
    if([self.book.sold isEqualToString:@"sold"]){
        self.dateDealCell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.book.dateOfDeal];
    }else{
        self.dateDealCell.detailTextLabel.text = @"Not Yet";
    }
    
    self.dateFirstCell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.book.dateOfNew];
    self.priceCell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.book.price];
    self.amountCell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.book.amount];;
    self.purchaserNameCell.detailTextLabel.text = self.book.sellerName;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 9;
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

@end