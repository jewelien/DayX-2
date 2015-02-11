//
//  EntryController.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/11/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "EntryController.h"

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;


@end

@implementation EntryController


//+ (EntryController *)sharedInstance {
//    EntryController *sharedInstance = nil;
//static dispatch_once_t onceToken;
//dispatch_once(&onceToken, ^{
//    sharedInstance = [[EntryController alloc] init];
//    [sharedInstance ];
//});
//
//
//    return sharedInstance;
//}



-(void)addEntry:(Entry *)entry {

    NSMutableArray *mutableArray = self.entries.mutableCopy;
    if (!entry) {
        return;
    }
    [mutableArray addObject:entry];
    self.entries = mutableArray;
    
}


-(void)removeEntry:(Entry *)entry {
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    if (!entry) {
        return;
    }
    [mutableArray removeObject:entry];
    self.entries = mutableArray;
    
}
-(void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry {
    if (!oldEntry) {
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    NSInteger oldEntryIndex = [mutableArray indexOfObject:oldEntry];
    [mutableArray replaceObjectAtIndex:oldEntryIndex withObject:newEntry];
    self.entries = mutableArray;
    
}




@end
