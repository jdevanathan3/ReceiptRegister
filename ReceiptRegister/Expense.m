//
//  Expense.m
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import "Expense.h"

@implementation Expense
-(id) initWithName: (NSString *)name
              cost: (float) cost
{
    self.name = name;
    self.amountTotal = cost;
    self.cost = [NSString stringWithFormat:@"%.02f", self.amountTotal];
    return self;
}
@end
