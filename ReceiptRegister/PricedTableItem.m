//
//  PricedTableItem.m
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/18/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import "PricedTableItem.h"
#import "Event.h"
static int savedDataAmount;
@implementation PricedTableItem
-(id) initWithName: (NSString *)name
              cost: (float) cost
{
    self.name = name;
    self.amountTotal = cost;
    self.cost = [NSString stringWithFormat:@"%.02f", self.amountTotal];
    self.date = [[NSDate alloc] init];
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.cost = [aDecoder decodeObjectForKey:@"cost"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.amountTotal = [self.cost doubleValue];
    }
    return self;
}
-(void) encodeWithCoder:(NSCoder *)anEncoder {
    [anEncoder encodeObject:self.name forKey:@"name"];
    [anEncoder encodeObject:self.cost forKey:@"cost"];
    [anEncoder encodeObject:self.date forKey:@"date"];
    self.amountTotal = [self.cost doubleValue];
}
+(NSString *)getPathToArchiveWithFileName:(NSString *) fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:fileName];
}

@end
