//
//  EventInputViewController.m
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/18/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import "EventInputViewController.h"
#import "Event.h"
@interface EventInputViewController ()

@end

@implementation EventInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIView *costView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 400, 100)];
    UILabel *startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 230, 300, 20)];
    startDateLabel.text = @"Start Date:";
    self.startDatePicker = [[UIDatePicker alloc] init];
    self.startDatePicker.datePickerMode = UIDatePickerModeDate;
    self.startDatePicker.frame = CGRectMake(75, 160, 300, 100);
    //UITextField *costInput = [[UITextField alloc] initWithFrame:CGRectMake(70, 70, 300, 20)];
    //
    UILabel *endDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 435, 300, 50)];
    endDateLabel.text = @"End Date:";
    self.endDatePicker = [[UIDatePicker alloc] init];
    self.endDatePicker.datePickerMode = UIDatePickerModeDate;
    self.endDatePicker.frame = CGRectMake(75, 380, 300, 100);
    //
    [self.view addSubview:startDateLabel];
    [self.view addSubview:self.startDatePicker];
    [self.view addSubview:endDateLabel];
    [self.view addSubview:self.endDatePicker];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateDataFields {
    [super updateDataFields];
    Event *e = [[Event alloc] initWithName:self.item.name];
    e.startDate = self.startDatePicker.date;
    e.endDate = self.endDatePicker.date;
    self.item = e;
    [self dismissViewControllerAnimated:YES completion:nil];;
    [[NSNotificationCenter defaultCenter] postNotificationName: @"Input updated."
                                                        object:nil];
}
- (id)initWithTitle:(NSString *) title {
    self = [super init];
    if (self) {
        self.item = [[Event alloc] initWithName:@"" cost:0.00];
        self.title = title;
    }
    return self;
}

- (id)initWithTitle:(NSString *) title
               cost: (NSString *) cost {
    self = [super init];
    if (self) {
        self.item = [[Event alloc] initWithName:title cost:[cost doubleValue]];
        self.title = title;
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.item = [[Event alloc] init];
    }
    return self;
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
