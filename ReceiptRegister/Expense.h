//
//  Expense.h
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Expense : NSObject
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *cost;
-(id)initWithName:(NSString *)name
             cost:(float) cost;
@property float amountTotal;
@end
