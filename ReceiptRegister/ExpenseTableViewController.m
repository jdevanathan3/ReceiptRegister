//
//  ExpenseTableViewController.m
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import "ExpenseTableViewController.h"
#import "Expense.h"
#import "InputViewController.h"
#import "ExpenseInputViewController.h"
@interface ExpenseTableViewController ()

@end

@implementation ExpenseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
        self.navigationItem.rightBarButtonItem = addButton;
    }
    
    return self;
}

-(void) insertNewObject:(id) sender {
    //Make a popup dialog that takes in information to make Expense object
    self.selectedInput = [[ExpenseInputViewController alloc] initWithTitle:@"Input Expense:"];
    [self.navigationController pushViewController:self.selectedInput animated:YES];
    //Should wait for an NSNotificationCenter here
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataRetrieved)
                                           name:@"Input updated."
                                         object:nil];
    NSLog(@"GO");
}
-(void) dataRetrieved {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    Expense *e = self.selectedInput.item;
    [self.event.expenses insertObject:e atIndex:self.numRows];
    self.numRows++;
    [self.event updateCost];
    [self.tableView reloadData];
}
-(void) dataRetrievedFromExistingPath {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.event.expenses[self.selectedRow] = self.selectedInput.item;
    Expense *e = self.event.expenses[self.selectedRow];
    //NSLog(e.name);
    [self.event updateCost];
    [self.tableView reloadData];
    
}
/*-(void) updateTableForRow:(int) x {
    NSString *name = [NSString stringWithFormat:@"Expense%d", x];
    Expense *e = [[Expense alloc] initWithName:name cost:0.01];
    [self.event.expenses insertObject:e atIndex:x];
}*/

- (void)viewDidLoad
{
    if(self.event.expenses == nil) {
        self.event.expenses = [[NSMutableArray alloc] init];
    }
    self.numRows = [self.event.expenses count];
    [super viewDidLoad];
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.numRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    NSLog(@"HERE!");
    Expense *e = self.event.expenses[indexPath.row];
    NSLog(e.name);
    cell.textLabel.text = e.name;
    
    //NSLog(e.name);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSString *s = [e.cost stringByAppendingString:[@"" stringByPaddingToLength:65
                                                        withString:@" "
                                                   startingAtIndex:0]];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    cell.detailTextLabel.text = [s stringByAppendingString:[dateFormatter stringFromDate:e.date]];
    //cell.detailTextLabel.text = [NSString concat:(e.cost,@" ",[e.date description])];
    // Configure the cell...
    
    return cell;
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        [self.refreshTableView reloadData];
    }
    [super viewWillDisappear:animated];
}

-(void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath
{
    
    Expense *e = self.event.expenses[indexPath.row];
    self.selectedRow = indexPath.row;
    NSLog(@"%d", self.selectedRow);
    self.selectedInput = [[ExpenseInputViewController alloc] initWithTitle:e.name cost:e.cost];
    [self.navigationController pushViewController:self.selectedInput animated:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataRetrievedFromExistingPath)
                                                 name:@"Input updated."
                                               object:nil];
    
    return;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        self.numRows--;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.event.expenses removeObjectAtIndex:indexPath.row];
        [self.event updateCost];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
