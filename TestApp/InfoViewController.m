//
//  InfoViewController.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"

@implementation InfoViewController
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"README" ofType:@"md"];
    NSError *error;
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (contents == nil) {
        NSLog(@"Error reading file %@ %@", path, error);
        abort();
    }
    self.textView.text = contents;
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
