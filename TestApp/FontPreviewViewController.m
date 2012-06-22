//
//  FontPreviewViewController.m
//  TestApp
//
//  Created by Julien Poissonnier on 12/20/11.
//  Copyright (c) 2011 caffeine.lu. All rights reserved.
//

#import "FontPreviewViewController.h"

@interface FontPreviewViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)changeFontSize:(id)sender;
@end

@implementation FontPreviewViewController

#define INITIAL_SIZE 14.0

- (void)setup
{
    self.title = self.fontName;
    self.textView.text = self.text;
    self.textView.font = [UIFont fontWithName:self.fontName size:INITIAL_SIZE];
}

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
    [self setup];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeFontSize:(id)sender {
    CGFloat size = [(UISlider *)sender  value];
    self.textView.font = [UIFont fontWithName:self.fontName size:size];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.textView.text = self.text;
}

- (void)setFontName:(NSString *)fontName
{
    _fontName = fontName;
    self.textView.font = [UIFont fontWithName:self.fontName size:INITIAL_SIZE];
}

@end
