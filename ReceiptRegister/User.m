//
//  User.m
//  ReceiptRegister
//
//  Created by Jayanth Devanathan on 7/30/15.
//  Copyright (c) 2015 Jayanth Devanathan. All rights reserved.
//

#import "User.h"

@implementation User 
-(id) initWithEvents: (NSArray *)events {
    self = [super init];
    if(self) {
        self.events = events;
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.events = [aDecoder decodeObjectForKey:@"events"];
    }
    return self;
}
-(void) encodeWithCoder:(NSCoder *)anEncoder {
    [anEncoder encodeObject:self.events forKey:@"events"];
}
+(NSString *)getPathToArchive {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:@"user.model"];
}
+(void) saveData:(User *)user {
    //NSString *fileName = [NSString stringWithFormat:[[self.class determineID] stringByAppendingString:@"%d.model"], [self.class getSavedAmount]];
    [NSKeyedArchiver archiveRootObject:user toFile:[self.class getPathToArchive]];
    //[NSKeyedArchiver archiveRootObject:(id)savedEventAmount toFile:@"savedEventAmount.model"];
   // NSString *newContents = [NSString stringWithFormat:@"%d", [self.class getSavedAmount]]; // New string.
    
}
+(User *) getData {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self.class getPathToArchive]];
}
@end
