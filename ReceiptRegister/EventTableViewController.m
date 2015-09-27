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
#import "EventInputViewController.h"
#import "PricedTableItem.h"
//#import "DETransitioningDelegate.h"

@interface EventTableViewController ()

@end

@implementation EventTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

        self.title = @"Events";
        self.user = [User getData];//[NSMutableArray array];
        if(self.user == nil) {
            self.user = [[User alloc] initWithEvents:[[NSArray alloc] init]];
        }
        //self.expenseControllers = [NSMutableArray array];
        self.numRows = [self.user.events count];
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editNewObject:)];
        self.navigationItem.rightBarButtonItem = addButton;
        self.navigationItem.leftBarButtonItem = editButton;
        self.isEditable = NO;
        /*[[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveData)
                                                     name:@"UIApplicationWillResignActiveNotification"
                                                   object:nil];*/
    }
    return self;
}
-(void) insertNewObject:(id) sender {
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    self.tempController = [[EventInputViewController alloc] init];
    [self presentViewController:self.tempController animated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateTable)
                                                 name:@"Input updated."
                                               object:nil];
    /*self.eventInput = [UIAlertController alertControllerWithTitle:@"Event Name"
                                                                   message:@"Please enter an event name and date."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [[NSNotificationCenter defaultCenter] postNotificationName: @"Event Input updated."
                                                                                                                  object:nil];
                                                          }];
    
    [self.eventInput addAction:defaultAction];
    
    [self.eventInput addTextFieldWithConfigurationHandler:^(UITextField *text) {
        text.placeholder = @"Event Name";
    }];

    [self presentViewController:self.eventInput animated:YES completion:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateTable)
                                                 name:@"Event Input updated."
                                               object:nil];*/
    //ADD SOME WAY TO CANCEL UPDATE
}
-(void) editNewObject:(id) sender {
    self.isEditable = YES;
}

-(void) updateTable {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSMutableArray *arr = [self.user.events mutableCopy];
    [arr insertObject:self.tempController.item atIndex:0];
    self.user.events = [arr copy];
    self.numRows++;
    [self.tableView reloadData];
}
-(void) updateTableEdited {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.tableView reloadData];
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
-(void) saveData {
    [User saveData:self.user];
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
    if(self.isEditable) {
        self.isEditable = NO;
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
        [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
        //http://stackoverflow.com/questions/2578614/transparent-background-with-a-modal-uiviewcontroller
        //EventDurationViewController *newView = [[EventDurationViewController alloc] init];
//        id <UIViewControllerTransitioningDelegate> myDelegate = [DETransitioningDelegate new];
 //       newView.transitioningDelegate = myDelegate;
        self.tempController = [[EventInputViewController alloc] initWithData:[self.user.events objectAtIndex:indexPath.row]];
        [self presentViewController:self.tempController animated:YES completion:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateTableEdited)
                                                     name:@"Input updated."
                                                   object:nil];
    } else {
        ExpenseTableViewController *newView = [[ExpenseTableViewController alloc] init];//self.expenseControllers[indexPath.row];
        newView.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        newView.event = self.user.events[indexPath.row];
        newView.refreshTableView = self.tableView;
        [self.navigationController pushViewController:newView animated:YES];
    }
    return;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    Event *e = self.user.events[indexPath.row];
    cell.textLabel.text = e.name;
    cell.detailTextLabel.text = e.cost;
    // Configure the cell...
    return cell;
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
        NSMutableArray *arr = [self.user.events mutableCopy];
        [arr removeObjectAtIndex:indexPath.row];
        self.user.events = [arr copy];
        //[self.expenseControllers removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"OVERRIDDEN");
}


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
