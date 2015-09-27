//
//  ExpenseInputViewController.h
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/18/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"
@interface ExpenseInputViewController : InputViewController
@property(strong, nonatomic) UIDatePicker *datePicker;
@property(strong, nonatomic) UIView *costView;
@property(strong, nonatomic) UILabel *dateLabel;
- (id)initWithTitle:(NSString *) title;
- (id)initWithTitle:(NSString *) title
               cost: (NSString *) cost;
@end
