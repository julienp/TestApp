//
//  TilingFunViewController.m
//  TilingFun
//
//  Created by Julien Poissonnier on 7/8/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import "TilingViewController.h"
#import "TileView.h"

#define BIG 120000

@implementation TilingViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = NSLocalizedString(@"TilingScrollView", @"TilingScrollView");

    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollView.contentSize = CGSizeMake(BIG, BIG);
    scrollView.contentOffset = CGPointMake(BIG/2, BIG/2);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    TileView *tileView = [[TileView alloc] initWithFrame:CGRectMake(0, 0, BIG, BIG)];
    [scrollView addSubview:tileView];

    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
