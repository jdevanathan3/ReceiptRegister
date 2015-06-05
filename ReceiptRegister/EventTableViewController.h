//
//  EventTableViewController.h
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/4/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewController : UITableViewController
@property(strong, retain) NSMutableArray *events;
@property(strong, retain) NSMutableArray *expenseControllers;
@property int numRows;
@end
