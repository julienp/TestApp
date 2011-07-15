//
//  TestAppTests.m
//  TestAppTests
//
//  Created by Julien Poissonnier on 7/15/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import "TestAppTests.h"
#import "TestAppAppDelegate.h"
#import <UIKit/UIKit.h>

@implementation TestAppTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//- (void)testExample
//{
//    STFail(@"Unit tests are not implemented yet in TestAppTests");
//}

- (void)testAppDelegate
{
    TestAppAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    STAssertTrue([delegate isKindOfClass:[TestAppAppDelegate class]] , @"Delegate should be a TestAppDelegate");
}

- (void)testTableViewCell
{
    TestAppAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    UITableViewController *tvc = [[[delegate navigationController] viewControllers] objectAtIndex:0];
    UITableViewCell *cell = [tvc tableView:tvc.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    STAssertTrue([cell.textLabel.text isEqualToString: @"TilingScrollview"], @"Text should be 'TilingScrollview'");
}

@end
