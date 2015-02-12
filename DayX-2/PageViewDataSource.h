//
//  PageViewDataSource.h
//  DayX-2
//
//  Created by Julien Guanzon on 2/12/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIkit.h"

@interface PageViewDataSource : NSObject <UIPageViewControllerDataSource>

-(UIViewController *)viewControllerAtIndex:(NSInteger) index;

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController;

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController;

@end
