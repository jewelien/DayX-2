//
//  PageViewDataSource.m
//  DayX-2
//
//  Created by Julien Guanzon on 2/12/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "PageViewDataSource.h"
#import "EntryController.h"
#import "DXDetailViewController.h"
@implementation PageViewDataSource

-(UIViewController *)viewControllerAtIndex:(NSInteger) index {
    if (index < 0 || index >= [[EntryController sharedInstance].entries count]){
        return nil;
    }
    
    DXDetailViewController *detailViewController = [DXDetailViewController new];
    detailViewController.index = index;
    return detailViewController;
    
}

//UIViewController  is DXDetailViewController - parens is casting it.
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger beforeIndex = ((DXDetailViewController *) viewController).index - 1;
    return [self viewControllerAtIndex:beforeIndex];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger afterIndex = ((DXDetailViewController *) viewController).index + 1;
    return [self viewControllerAtIndex:afterIndex];
}



@end










