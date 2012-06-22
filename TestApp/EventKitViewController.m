//
//  EventKitViewController.m
//  TestApp
//
//  Created by Julien Poissonnier on 4/5/12.
//  Copyright (c) 2012 caffeine.lu. All rights reserved.
//

#import "EventKitViewController.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface EventKitViewController ()
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) EKEventStore *store;
@property (nonatomic, strong) EKEventViewController *detailViewController;
@end

@implementation EventKitViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"EventKit";
    self.store = [[EKEventStore alloc] init];
    //fetch events for -1 day to +1 day from now from all calendars
    NSDate *startDate = [NSDate dateWithTimeIntervalSinceNow:-86400];
	NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:86400];
	NSPredicate *predicate = [self.store predicateForEventsWithStartDate:startDate endDate:endDate 
                                                          calendars:self.store.calendars]; 
	NSArray *events = [self.store eventsMatchingPredicate:predicate];
    self.events = events;
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CalendarCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = [self.events[indexPath.row] title];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	self.detailViewController = [[EKEventViewController alloc] initWithNibName:nil bundle:nil];			
	self.detailViewController.event = self.events[indexPath.row];
	self.detailViewController.allowsEditing = NO;
	[self.navigationController pushViewController:self.detailViewController animated:YES];

}

@end
