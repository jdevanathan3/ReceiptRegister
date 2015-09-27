//
//  EventTableViewController.h
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/4/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"
#import "User.h"
@interface EventTableViewController : UITableViewController
//@property(strong, retain) NSMutableArray *events;
@property(strong, nonatomic) User *user;
//@property(strong, retain) NSMutableArray *expenseControllers;
@property(strong, retain) UIAlertController *eventInput;
@property(strong, retain) InputViewController *tempController;
@property int numRows;
@property BOOL isEditable;
-(void) saveData;
@end
