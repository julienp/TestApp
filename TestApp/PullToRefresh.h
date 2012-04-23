//
//  PullToRefresh.h
//  TestApp
//
//  Created by Julien Poissonnier on 4/23/12.
//  Copyright (c) 2012 caffeine.lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullToRefresh : UITableViewController
- (void)refresh;
- (void)stopLoading;
@end
