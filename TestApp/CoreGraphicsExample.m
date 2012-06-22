//
//  CoreGraphicsExample.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/17/11.
//  Copyright 2011 caffeine.lu. All rights reserved.
//

#import "CoreGraphicsExample.h"
#import "CoreGraphicsView.h"

@implementation CoreGraphicsExample

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)loadView
{
    self.view = [[CoreGraphicsView alloc] initWithFrame:CGRectZero]; //navigationController resizes view before presenting
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
