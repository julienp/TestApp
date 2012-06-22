//
//  MasterViewController.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/15/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import "MasterViewController.h"
#import "InfoViewController.h"
#import "TilingViewController.h"
#import "MultiTouchView.h"
#import "TableView.h"
#import "CoreGraphicsExample.h"
#import "LazyTable.h"
#import "FontViewController.h"
#import "EventKitViewController.h"
#import "PullToRefresh.h"
#import "SwipeCellViewController.h"

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Test App", @"Test App");
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(toggleInfo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)toggleInfo {
    InfoViewController *info = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    info.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:info animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = NSLocalizedString(@"TilingScrollview", @"TilingScrollview");
            break;
        case 1:
            cell.textLabel.text = NSLocalizedString(@"MultiTouch", @"MultiTouch");
            break;
        case 2:
            cell.textLabel.text = NSLocalizedString(@"TableView", @"TableView");
            break;
        case 3:
            cell.textLabel.text = NSLocalizedString(@"CoreGraphics", @"CoreGraphics");
            break;
        case 4:
            cell.textLabel.text = NSLocalizedString(@"LazyTable", @"LazyTable");
            break;
        case 5:
            cell.textLabel.text = NSLocalizedString(@"Fonts", @"Fonts");
            break;
        case 6:
            cell.textLabel.text = NSLocalizedString(@"EventKit", @"EventKit");
            break;
        case 7:
            cell.textLabel.text = NSLocalizedString(@"PullToRefresh", @"PullToRefresh");
            break;
        case 8:
            cell.textLabel.text = NSLocalizedString(@"SwipeCell", @"SwipeCell");
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailViewController;
    
    switch (indexPath.row) {
        case 0:
            detailViewController = [[TilingViewController alloc] initWithNibName:@"TilingViewController" bundle:nil];
            break;
        case 1:
            detailViewController = [[MultiTouchView alloc] initWithNibName:@"MultiTouchView" bundle:nil];
            break;            
        case 2:
            detailViewController = [[TableView alloc] initWithNibName:@"TableView" bundle:nil];
            break;            
        case 3:
            detailViewController = [[CoreGraphicsExample alloc] init];
            break;            
        case 4:
            detailViewController = [[LazyTable alloc] init];
            break;
        case 5:
            detailViewController = [[FontViewController alloc] init];
            break;
        case 6:
            detailViewController = [[EventKitViewController alloc] init];
            break;
        case 7:
            detailViewController = [[PullToRefresh alloc] init];
            break;
        case 8:
            detailViewController = [[SwipeCellViewController alloc] init];
            break;
        default:
            break;
    }

    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
