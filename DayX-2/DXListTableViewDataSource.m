//
//  DXListTableViewDataSource.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DXListTableViewDataSource.h"
#import "EntryController.h"

@implementation DXListTableViewDataSource


-(void)registerTableView:(UITableView *)tableView {
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//from solution branch???
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedInstance].entries.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = entry.title;
    return cell;
}

@end
