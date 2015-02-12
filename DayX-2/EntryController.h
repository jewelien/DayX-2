//
//  EntryController.h
//  DayX-2
//
//  Created by Julien Guanzon on 2/11/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;


+ (EntryController *)sharedInstance;
-(void)addEntry:(Entry *)entry;
-(void)removeEntry:(Entry *)entry;
-(void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry;


- (void)loadFromDefaults;
- (void)synchronize;

@end
