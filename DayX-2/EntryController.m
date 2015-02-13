//
//  EntryController.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/11/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "EntryController.h"

static NSString * const entryListKey = @"entryList";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;


@end

@implementation EntryController


+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}


-(void)addEntry:(Entry *)entry {

    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray: self.entries];
    if (!entry) {
        return;
    }
    [mutableArray addObject:entry];
    self.entries = mutableArray;
    [self synchronize];
    
}


-(void)removeEntry:(Entry *)entry {
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    if (!entry) {
        return;
    }
    [mutableArray removeObject:entry];
    self.entries = mutableArray;
    [self synchronize];
    
}
-(void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry {
    if (!oldEntry || !newEntry) {
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    if ([mutableArray containsObject:oldEntry]) {
        NSInteger oldEntryIndex = [mutableArray indexOfObject:oldEntry];
        [mutableArray replaceObjectAtIndex:oldEntryIndex withObject:newEntry];
    }
    self.entries = mutableArray;
    [self synchronize];
}



- (void)loadFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entryDictionary in entryDictionaries) {
        [entries addObject:[[Entry alloc] initWithDictionary:entryDictionary ]];
    }
    self.entries = entryDictionaries;
}

- (void)synchronize {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey: entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




@end
