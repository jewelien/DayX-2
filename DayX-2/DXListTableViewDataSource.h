//
//  DXListTableViewDataSource.h
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DXListTableViewDataSource : NSObject <UITableViewDataSource>

-(void)registerTableView:(UITableView *)tableView;

@end
