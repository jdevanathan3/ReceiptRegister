//
//  InputViewController.m
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 6/7/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end
@implementation InputViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //
    self.contentSubview.contentSize = CGSizeMake(400, 10000);
    self.contentSubview = [[UIScrollView alloc] init];
    //
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    scrollView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width,
                                  [[UIScreen mainScreen] bounds].size.height);
    scrollView.contentSize = CGSizeMake(320, 750);
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    self.contentSubview = scrollView;
    //
    [self.contentSubview setScrollEnabled:YES];
    [self.contentSubview flashScrollIndicators];
    self.nameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 100)];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 72, 100, 20)];
    UITextField *nameInput = [[UITextField alloc] initWithFrame:CGRectMake(70, 70, 300, 20)];
    nameInput.borderStyle = UITextBorderStyleRoundedRect;
    nameLabel.text = @"Name:";
    nameInput.keyboardType = UIKeyboardTypeDefault;
    self.nameInput = nameInput;
    self.nameInput.delegate = self;
    [self.nameView addSubview:nameLabel];
    [self.nameView addSubview:nameInput];
    self.nameInput.text = self.item.name;
    //
    self.updateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.updateButton.frame = CGRectMake(90, 550, 200, 100);
    [self.updateButton setTitle:@"Update" forState:UIControlStateNormal];
    [self.updateButton addTarget:self action:@selector(updateDataFields) forControlEvents:UIControlEventTouchUpInside];
    //
    [self.view addSubview:self.contentSubview];
    self.view.tintColor = [UIColor redColor];
    [self.contentSubview addSubview:self.nameView];
    [self.contentSubview addSubview:self.updateButton];
}
-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //NSLog(@"10 BANDS");
    //self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentSubview.frame = CGRectMake(0, 0, 400, 700);
}
- (void)updateDataFields {
    self.item.name = self.nameInput.text;
}
-(void)cancelNumberPad{
    [self.costInput resignFirstResponder];
    self.costInput.text = @"";
}

-(void)doneWithNumberPad{
    NSString *numberFromTheKeyboard = self.costInput.text;
    [self.costInput resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithData:(PricedTableItem *) data {
    self = [super init];
    if (self) {
        self.item = data;
    }
    return self;
}
- (id)init {
    self = [super init];
    if (self) {
        self.item = [[PricedTableItem alloc] init];
    }
    return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
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
