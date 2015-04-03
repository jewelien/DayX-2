//
//  DXDetailViewController.h
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Entry;

//???
static NSString * const EntryKey = @"entry";

@interface DXDetailViewController : UIViewController


//@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, assign) NSInteger index;
//
//-(void)updateWithDictionary:(NSDictionary *) dictionary;
//
-(void) updateWithEntry:(Entry *)entry;


@end
