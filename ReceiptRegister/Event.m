//
//  Event.m
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import "Event.h"
#import "Expense.h"
@implementation Event
-(id) initWithName: (NSString *)name
{
    self.name = name;
    self.amountTotal = 0;
    self.cost = [NSString stringWithFormat:@"%.02f", self.amountTotal];
    self.expenses = [NSMutableArray array];
    return self;
}
-(void) updateCost {
    float sum = 0;
    for (int x = 0; x < [self.expenses count]; x++) {
        Expense *e = self.expenses[x];
        sum += e.amountTotal;
    }
    self.amountTotal = sum;
    self.cost = [NSString stringWithFormat:@"%.02f", self.amountTotal];
}
@end
