//
//  User.h
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/30/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>
@property(strong, nonatomic) NSArray *events;
-(id) initWithEvents: (NSArray *)events;
+(void) saveData:(User *)user;
+(User *) getData;
@end
