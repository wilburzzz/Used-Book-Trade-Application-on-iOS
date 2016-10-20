//
//  BookTableViewController.m
//  FinalProject_Jinmeng_Zhu
//
//  Created by 朱金孟 on 5/1/15.
//  Copyright (c) 2015 JINMENG_ZHU. All rights reserved.
//

#import "BookTableViewController.h"

@interface BookTableViewController ()

@end

@implementation BookTableViewController

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
    
    
    for(User* user in self.users.users){
        NSLog(@"%@", user.name);
        if([user.name isEqualToString:self.book.sellerName]){
            self.seller = user;
            break;
        }
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    //self.buyDateCell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [formatter dateFromString:[NSString stringWithFormat:@"%@", self.book.dateOfNew]]];
    //book.dateOfNew = [formatter dateFromString:self.dateCell.text] ;
    
    self.nameCell.textLabel.text = @"Name";
    self.nameCell.detailTextLabel.text = self.book.bookName;
    
    self.authorCell.textLabel.text = @"Author";
    self.authorCell.detailTextLabel.text = self.book.bookAuthor;
    
    self.pubCell.textLabel.text = @"Publisher";
    self.pubCell.detailTextLabel.text = self.book.bookPublisher;
    
    self.buyDateCell.textLabel.text = @"Bought Date";
    self.buyDateCell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.book.dateOfNew];
    
    self.amountCell.textLabel.text = @"Amount";
    self.amountCell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.book.amount];
    
    self.priceCell.textLabel.text = @"Price";
    self.priceCell.detailTextLabel.text = [NSString stringWithFormat:@"%@", self.book.price];
    
    self.sellerCell.textLabel.text = @"Seller";
    self.sellerCell.detailTextLabel.text = self.book.sellerName;

    for(Request *req in self.logInUser.sendList.sendList){
        if([req.forBook.bookName isEqualToString:self.book.bookName]){
            [self.requestButton setEnabled:false];
        }
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section == 0){
        return 7;
    }else{
        return 1;
    }
    //return 0;
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

- (IBAction)requestAction:(id)sender {
    
    
    
    
    if([self.seller.name isEqualToString: self.logInUser.name]){
           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Do not send request to yourself" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
    
        Request *request = [[Request alloc]init];
        
        [self.logInUser.sendList.sendList addObject:request];
        [self.seller.receiveList.receiveList addObject:request];
        request.forBook = self.book;
        request.sendUser = self.logInUser;
        request.receiveUser = self.seller;
        [sender setEnabled:false];
    }
    
    [NSKeyedArchiver archiveRootObject:self.users toFile:self.filePath];
    
    
}






















@end
