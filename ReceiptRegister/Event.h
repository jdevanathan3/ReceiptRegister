//
//  Event.h
//  Test2
//
//  Created by Devanathan, JAY (CORP) on 6/5/15.
//  Copyright (c) 2015 Devanathan, JAY (CORP). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *cost;
@property float amountTotal;
@property(strong, nonatomic) NSMutableArray *expenses;
-(id)initWithName:(NSString *)name;
-(void) updateCost;

@end
