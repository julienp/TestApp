//
//  SwipeCell.m
//  TestApp
//
//  Created by Julien Poissonnier on 5/12/12.
//  Copyright (c) 2012 caffeine.lu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SwipeCell.h"

@interface SwipeCell ()
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIView *swipeView;
@property (nonatomic, assign) CGRect originalRect;
@property (nonatomic, assign) BOOL showingSwipeView;
@end

@implementation SwipeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.originalRect = CGRectZero;
        self.showingSwipeView = NO;
        UINib *contentNib = [UINib nibWithNibName:@"SwipeCellContentView" bundle:nil];
        self.mainView = [contentNib instantiateWithOwner:self options:nil][0];
        [self.mainView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"brillant.png"]]];
        UINib *swipeNib = [UINib nibWithNibName:@"SwipeCellSwipeView" bundle:nil];
        self.swipeView = [swipeNib instantiateWithOwner:self options:nil][0];
        [self.swipeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"carbon_fibre_v2.png"]]];
        [self.swipeView setHidden:YES];

        [self addSubview:self.mainView];
        [self insertSubview:self.swipeView belowSubview:self.mainView];
    }
    return self;
}

- (IBAction)beep:(id)sender;
{
    NSLog(@"beep!");
}

- (void)swipe:(UISwipeGestureRecognizerDirection)direction
{
    if (self.showingSwipeView) {
        [self.mainView setHidden:NO];
        CGRect rect = self.mainView.frame;
        //move the mainView to the proper side before it's moved in
        if (direction == UISwipeGestureRecognizerDirectionRight) {
            if (rect.origin.x > 0) {
                rect.origin.x = -rect.origin.x;
                self.mainView.frame = rect;
            }
        } else {
            if (rect.origin.x < 0) {
                rect.origin.x = -rect.origin.x;
                self.mainView.frame = rect;
            }
        }
        [UIView animateWithDuration:0.5 animations:^{
            self.mainView.frame = self.originalRect;
        } completion:^(BOOL finished) {
            [self.swipeView setHidden:YES];
        }];
        self.showingSwipeView = NO;
    } else {
        CGRect rect = self.mainView.frame;
        self.swipeView.frame = rect;
        self.originalRect = rect;
        [self.swipeView setHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            if (direction == UISwipeGestureRecognizerDirectionRight) {
                self.mainView.frame = CGRectMake(rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
            } else {
                self.mainView.frame = CGRectMake(-rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
            }
        } completion:^(BOOL finished) {
            [self.mainView setHidden:YES];
        }];
        self.showingSwipeView = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{

}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CGRect bounds = self.bounds;
    bounds.size.height -= 1;
    [self.swipeView setFrame:bounds];
    [self.mainView setFrame:bounds];
}

- (void)setNeedsDisplay {
    [super setNeedsDisplay];
    if (!self.mainView.hidden)
        [self.mainView setNeedsDisplay];
    if (!self.swipeView.hidden)
        [self.swipeView setNeedsDisplay];
}

@end
