//
//  PricedTableItem.h
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/18/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PricedTableItem : NSObject<NSCoding>
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *cost;
-(id)initWithName:(NSString *)name
             cost:(float) cost;
@property float amountTotal;
@property(strong, nonatomic) NSDate *date;
+(NSString *) getPathToArchiveWithFileName:(NSString *) fileName;
+(void) saveDataExclusive:(NSArray *) items;
+(PricedTableItem *) getDataWithNumber:(int) number;
+(NSString *)determineID;
-(void) encodeWithCoder:(NSCoder *)anEncoder;
-(id) initWithCoder:(NSCoder *)aDecoder;
@end
