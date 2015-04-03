//
//  Entry.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Entry.h"

@implementation Entry

//takes entry its called on and return dictionary. gives values and keys instead of objects.
//CONVERT ENTRY OBJECT TO DICTIONARY (format).
-(NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title) {
        [entryDictionary setObject:self.title forKey:titleKey];
        //equvalent to "entryDictionary[titleKey] = self.title"
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



@end
