//
//  Entry.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Entry.h"

static NSString * const titleKey = @"title";
static NSString * const textKey = @"text";
static NSString * const timeStampKey = @"timeStamp";
static NSString * const entriesKey = @"entries";

@implementation Entry

-(NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title) {
        [entryDictionary setObject:self.title forKey:titleKey];
    }
    if (self.text) {
        [entryDictionary setObject:self.text forKey:textKey];
    }
    if (self.timeStamp){
        [entryDictionary setObject:self.timeStamp forKey:timeStampKey];
    }
    
    return entryDictionary;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        self.text = dictionary[textKey];
        self.timeStamp = dictionary[timeStampKey];
    }
    return self;
}

+ (NSMutableArray *)loadEntriesFromDefaults {
    NSArray *entryDictionaries= [[NSUserDefaults standardUserDefaults] objectForKey:entriesKey];
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entries addObject:entry];
    }
    return entries;
}

+ (void)storeEntriesInDefaults:(NSArray *)entries {
    
}



@end
