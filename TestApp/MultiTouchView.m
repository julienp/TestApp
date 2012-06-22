//
//  MultiTouchView.m
//  CoreAnimationBasics
//
//  Created by Julien Poissonnier on 7/4/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import "MultiTouchView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MultiTouchView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

#pragma mark - View lifecycle

- (void)addDuck:(CGRect)rect {
    UIImageView *duck = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"psyduck.png"]];
    duck.layer.frame = rect;
    [duck setUserInteractionEnabled:YES];
    [duck addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveDuck:)]];
    [duck addGestureRecognizer:[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateDuck:)]];
    [self.view addSubview:duck];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"MultiTouch", @"MultiTouch");
    [self addDuck:CGRectMake(50, 100, 100, 100)];
    [self addDuck:CGRectMake(100, 200, 150, 150)];

}

- (void)rotateDuck:(UIRotationGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
        UIView *duck = recognizer.view;
        CATransform3D transform = CATransform3DRotate(duck.layer.transform, [recognizer rotation], 0, 0, 1);
        duck.layer.transform = transform;
        //rotation is the full rotation from the start of the gesture, but we want deltas, so set to 0 here
        recognizer.rotation = 0.0f;
    }
}

- (void)moveDuck:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
        UIView *duck = recognizer.view;
        CGPoint start = duck.layer.position;
        CGPoint translation = [recognizer translationInView:duck.superview];
        [CATransaction setDisableActions:YES];
        duck.layer.position = CGPointMake(start.x + translation.x, start.y + translation.y);
        //translation is the full translation from the start of the gesture, but we want deltas, so set to 0 here
        [recognizer setTranslation:CGPointMake(0, 0) inView:duck.superview];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
