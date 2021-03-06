//
//  Entry.h
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const titleKey = @"title";
static NSString * const textKey = @"text";
static NSString * const timeStampKey = @"timeStamp";


@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timeStamp;


-(NSDictionary *)entryDictionary;
-(id)initWithDictionary:(NSDictionary *)dictionary;


@end
