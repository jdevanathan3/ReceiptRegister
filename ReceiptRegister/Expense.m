//
//  Expense.m
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import "Expense.h"
static int savedExpenseAmount;
@implementation Expense
+(NSString *) determineID {
    return @"expense";
}
+(void) incrementSavedAmount {
    savedExpenseAmount++;
}
+(int) getSavedAmount {
    return savedExpenseAmount;
}
+(void) setSavedAmount:(int) num {
    savedExpenseAmount = num;
}
@end
