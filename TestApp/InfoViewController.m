//
//  InfoViewController.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/15/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
- (IBAction)done:(id)sender;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
