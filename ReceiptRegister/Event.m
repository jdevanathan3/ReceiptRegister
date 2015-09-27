//
//  Event.m
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//
#import "Event.h"
#import "Expense.h"
static int savedEventAmount;
@implementation Event
-(id) initWithName: (NSString *)name
{
    self = [super initWithName:name cost:0.00];
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.expenses = [aDecoder decodeObjectForKey:@"expenses"];
        self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
        self.startDate = [aDecoder decodeObjectForKey:@"endDate"];
    }
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
-(void) encodeWithCoder:(NSCoder *)anEncoder {
    [super encodeWithCoder:anEncoder];
    [anEncoder encodeObject:self.expenses forKey:@"expenses"];
    [anEncoder encodeObject:self.startDate forKey:@"startDate"];
    [anEncoder encodeObject:self.endDate forKey:@"endDate"];
}
@end
