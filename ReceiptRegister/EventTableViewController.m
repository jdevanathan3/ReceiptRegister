//
//  EventTableViewController.m
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/4/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import "EventTableViewController.h"
#import "Event.h"
#import "ExpenseTableViewController.h"

@interface EventTableViewController ()

@end

@implementation EventTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Events";
        self.events = [NSMutableArray array];
        self.expenseControllers = [NSMutableArray array];
        self.numRows = [self.events count];
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
        self.navigationItem.rightBarButtonItem = addButton;
        
        //self.events = @[@"Event1", @"Event2", @"Event3", @"Event4", @"Event5"];
        //NSLog(self.events);
    }
    return self;
}
-(void) insertNewObject:(id) sender {
    [self updateTableForRow:self.numRows];
    self.numRows++;
    [self.tableView reloadData];
}
// REMAKE THIS METHOD
-(void) updateTableForRow:(int) x {
    NSString *event = [NSString stringWithFormat:@"Event%d", x];
    Event *e = [[Event alloc] initWithName:event];
    ExpenseTableViewController *eVC = [[ExpenseTableViewController alloc] init];
    [self.events insertObject:e atIndex:x];
    [self.expenseControllers insertObject:eVC atIndex:x];
}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView reloadData];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.numRows;
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath
{
    ExpenseTableViewController *newView = self.expenseControllers[indexPath.row];
    newView.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    newView.event = self.events[indexPath.row];
    newView.refreshTableView = self.tableView;
    [self.navigationController pushViewController:newView animated:YES];
    return;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    Event *e = self.events[indexPath.row];
    cell.textLabel.text = e.name;
    cell.detailTextLabel.text = e.cost;
    // Configure the cell...
    return cell;
}

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
