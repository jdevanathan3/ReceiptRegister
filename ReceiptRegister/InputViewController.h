//
//  InputViewController.h
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 6/7/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h";
#import "PricedTableItem.h"
@interface InputViewController : UIInputViewController <UITextFieldDelegate>
@property(strong, nonatomic) PricedTableItem *item;
@property(strong, nonatomic) UITextField *nameInput;
@property(strong, nonatomic) UITextField *costInput;
@property(strong, nonatomic) UIScrollView *contentSubview;
@property(strong, nonatomic) UIView *nameView;
@property(strong, nonatomic) UIButton *updateButton;
-(void) updateDataFields;
- (id)initWithData:(PricedTableItem *) data;
extern const CGRect *NAME_VIEW_RECT;

//@property(strong, nonatomic) Expense *expense;

/*@property(strong, nonatomic) NSString *nameText;
@property(strong, nonatomic) NSString *costText;*/

/*-(id)initWithTitle:(NSString *) title;
-(id)initWithTitle:(NSString *) title
              cost:(NSString *) cost;*/
@end
