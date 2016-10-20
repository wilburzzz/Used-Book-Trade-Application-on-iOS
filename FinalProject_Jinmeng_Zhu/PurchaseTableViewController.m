//
//  PurchaseTableViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 4/30/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "PurchaseTableViewController.h"
#import "BookTableViewController.h"
#import "SellerTableViewController.h"
@interface PurchaseTableViewController ()

@end

@implementation PurchaseTableViewController

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
    
    
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.filePath = [self.documentsPath stringByAppendingPathComponent:@"FinalProject_newfile.txt"];
    [NSFileManager defaultManager];
    /*
    self.users =[NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if(self.users==nil){
        self.users=[[UserCategory alloc]init];
    }
    */
    
    //self.title = @"Books on Sale";
    
    self.contents = [[SellCategory alloc]init];
    for(User *user in self.users.users){
        for(Book *book in user.sellList.sellList){
            if([book.sold isEqualToString:@"unsold"]){
                [self.contents.sellList addObject:book];
                //NSLog(@"%@", book.bookName);
            }
        }
    }
    
    self.filteredContents = [[SellCategory alloc]init];
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
    
    if(tableView==self.tableView){
        NSLog(@"%lu", (unsigned long)[self.contents.sellList count]);
        return [self.contents.sellList count];
    }else{
        return [self.filteredContents.sellList count];
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    
    if(cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(tableView==self.searchDisplayController.searchResultsTableView){
        cell.textLabel.text = [[self.filteredContents.sellList objectAtIndex:indexPath.row] bookName];
    }else{
        Book *book = (Book *)[self.contents.sellList objectAtIndex:indexPath.row];
        cell.textLabel.text = book.bookName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ $",book.price];
        cell.imageView.image = book.picture;
        
    }
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.selected = (Book*)[self.contents.sellList objectAtIndex:indexPath.row];
    
    if(self.tableView == tableView)
    {
        [self performSegueWithIdentifier:@"bookDetail" sender:self];
    }
    else {
        self.selected = (Book*)[self.filteredContents.sellList objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:@"bookDetail" sender:self];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"bookDetail"]){
        
        UIViewController *btvc = segue.destinationViewController;
        ((BookTableViewController *)btvc).book = self.selected;
        ((BookTableViewController *)btvc).logInUser = self.logInUser;
        ((BookTableViewController *)btvc).users = self.users;
        
    }else if([[segue identifier] isEqualToString:@"accDetail"]){
        UIViewController *stvc = segue.destinationViewController;
        ((SellerTableViewController *)stvc).book = self.selected;
        ((SellerTableViewController *)stvc).logInUser = self.logInUser;
        ((SellerTableViewController *)stvc).users = self.users;
        
        
    }
}



- (void)filteredContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate* resultPredicate = [NSPredicate predicateWithFormat:@"self.bookName contains[c] %@", searchText];
    self.filteredContents.sellList = (NSMutableArray*)[self.contents.sellList filteredArrayUsingPredicate:resultPredicate];
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filteredContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    self.selected = (Book*)[self.contents.sellList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"accDetail" sender:self];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    //[self.presentingViewController];
    
    
}



- (IBAction)refresh:(id)sender {
    [self.refreshControl beginRefreshing];
    dispatch_queue_t otherQ= dispatch_queue_create("Q", NULL);
    dispatch_async(otherQ, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
        });
    });
    


}
@end
