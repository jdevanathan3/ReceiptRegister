//
//  Event.h
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PricedTableItem.h"
@interface Event : PricedTableItem <NSCoding>
@property(strong, nonatomic) NSMutableArray *expenses;
@property(strong, nonatomic) NSDate *startDate;
@property(strong, nonatomic) NSDate *endDate;
-(id)initWithName:(NSString *)name;
-(void) updateCost;
@end
