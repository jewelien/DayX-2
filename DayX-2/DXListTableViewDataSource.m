//
//  DXListTableViewDataSource.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DXListTableViewDataSource.h"
#import "Entry.h"

@implementation DXListTableViewDataSource


-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//from solution branch???
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Entry loadEntriesFromDefaults].count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *entries = [Entry loadEntriesFromDefaults];
    Entry *entry = entries[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//??UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = entry.title;
    return cell;
}

@end
