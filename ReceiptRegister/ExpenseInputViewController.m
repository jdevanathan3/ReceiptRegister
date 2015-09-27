//
//  ExpenseInputViewController.m
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/18/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import "ExpenseInputViewController.h"

@interface ExpenseInputViewController ()

@end

@implementation ExpenseInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.costView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 400, 100)];
    UILabel *costLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 72, 100, 20)];
    UITextField *costInput = [[UITextField alloc] initWithFrame:CGRectMake(70, 70, 300, 20)];
    costInput.borderStyle = UITextBorderStyleRoundedRect;
    costLabel.text = @"Cost:";
    costInput.keyboardType = UIKeyboardTypeDecimalPad;
    self.costInput = costInput;
    self.costInput.delegate = self;
    [self.costView addSubview:costLabel];
    [self.costView addSubview:costInput];
    //
    //Default values(upon going back to same inputView)
    self.costInput.text = self.item.cost;
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    costInput.inputAccessoryView = numberToolbar;
    //
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 300, 50)];
    self.dateLabel.text = @"Date of Expense:";
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.frame = CGRectMake(50, 250, 300, 100);
    //
    [self.contentSubview addSubview:self.costView];
    [self.contentSubview addSubview:self.dateLabel];
    [self.contentSubview addSubview:self.datePicker];

    // Do any additional setup after loading the view.
}
- (void)updateDataFields{
    [super updateDataFields];
    self.item.date = self.datePicker.date;
    self.item.cost = self.costInput.text;
    self.item.amountTotal = [self.item.cost doubleValue];
    int amntTimes100 = self.item.amountTotal * 100;
    self.item.amountTotal = ((double)amntTimes100) / 100;
    self.item.cost = [NSString stringWithFormat:@"%.02f", self.item.amountTotal];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName: @"Input updated."
                                                        object:nil];
}
- (id)initWithTitle:(NSString *) title {
    self = [super init];
    if (self) {
        self.item = [[Expense alloc] initWithName:@"" cost:0.00];
        self.title = title;
    }
    return self;
}

- (id)initWithTitle:(NSString *) title
               cost: (NSString *) cost {
    self = [super init];
    if (self) {
        self.item = [[Expense alloc] initWithName:title cost:[cost doubleValue]];
        self.title = title;
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
