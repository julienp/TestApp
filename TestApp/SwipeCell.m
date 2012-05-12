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
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *swipeView;
@property (nonatomic, assign) CGRect originalRect;
@property (nonatomic, assign) BOOL showingSwipeView;
@end

@implementation SwipeCell
@synthesize contentView = __contentView;
@synthesize swipeView = _swipeView;
@synthesize originalRect = _originalRect;
@synthesize showingSwipeView = _showingSwipeView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.showingSwipeView = NO;
        UINib *contentNib = [UINib nibWithNibName:@"SwipeCellContentView" bundle:nil];
        self.contentView = [[contentNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        UINib *swipeNib = [UINib nibWithNibName:@"SwipeCellSwipeView" bundle:nil];
        self.swipeView = [[swipeNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        [self.swipeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"carbon_fibre_v2.png"]]];
        [self.swipeView setHidden:YES];

        [self addSubview:self.contentView];
        [self insertSubview:self.swipeView belowSubview:self.contentView];
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
        [self.contentView setHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            self.contentView.frame = self.originalRect;
        } completion:^(BOOL finished) {
            [self.swipeView setHidden:YES];
        }];
        self.showingSwipeView = NO;
    } else {
        CGRect rect = self.contentView.frame;
        self.swipeView.frame = rect;
        self.originalRect = rect;
        [self.swipeView setHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            if (direction == UISwipeGestureRecognizerDirectionRight) {
                self.contentView.frame = CGRectMake(rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
            } else {
                self.contentView.frame = CGRectMake(-rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
            }
        } completion:^(BOOL finished) {
            [self.contentView setHidden:YES];
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
    [self.contentView setFrame:bounds];
}

- (void)setNeedsDisplay {
    [super setNeedsDisplay];
    if (!self.contentView.hidden)
        [self.contentView setNeedsDisplay];
    if (!self.swipeView.hidden)
        [self.swipeView setNeedsDisplay];
}

@end
