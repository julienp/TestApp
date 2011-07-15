//
//  TableView.h
//  TestApp
//
//  Created by Julien Poissonnier on 7/15/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableView : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end