//
//  ExpenseTableViewController.h
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "InputViewController.h"

@interface ExpenseTableViewController : UITableViewController
@property(strong, nonatomic) Event *event;
@property int numRows;
@property int selectedRow;
@property(strong, nonatomic) UITableView *refreshTableView;
@property(strong, nonatomic) InputViewController *selectedInput;

@end
