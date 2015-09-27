//
//  EventInputViewController.h
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/18/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"
@interface EventInputViewController : InputViewController
@property(strong, nonatomic) UIDatePicker *startDatePicker;
@property(strong, nonatomic) UIDatePicker *endDatePicker;
@end
