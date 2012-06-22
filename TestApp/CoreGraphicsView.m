//
//  CoreGraphicsView.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/17/11.
//  Copyright 2011 caffeine.lu. All rights reserved.
//

#import "CoreGraphicsView.h"

@interface CoreGraphicsView ()
@property (nonatomic) CGGradientRef gradient;
@end

@implementation CoreGraphicsView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (CGGradientRef)gradient
{
    if (_gradient == nil) {
        CGFloat colors[6] = { 138.0f/255.0f, 1.0f,
                              162.0f/255.0f, 1.0f,
                              206.0f/255.0f, 1.0f};
        CGFloat locations[3] = {0.05f, 0.45f, 0.95f};
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        _gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 3);
        CGColorSpaceRelease(colorSpace);
    }
    return _gradient;
}

- (void)fillCircleCenteredAt:(CGPoint)center
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:center radius:50.0f startAngle:0.0 endAngle:2.0 * M_PI clockwise:NO];
    [path fill];
}

- (void)clippedImage
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGRect clippingRect = CGRectMake(50, 200, 120, 120);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:clippingRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 20)];
    [path addClip];
    [[UIImage imageNamed:@"coffee_square.png"] drawAtPoint:CGPointMake(50, 200)];

    CGContextRestoreGState(ctx);
}

- (void)shadowedText
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:16];
    NSInteger shadowHeight = 2.0;
    CGSize fontSize = [@"Moooo!" sizeWithFont:font];
    CGRect mooRect = CGRectMake(50, 350, fontSize.width, fontSize.height);
    
    CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, -shadowHeight), 0.0, [UIColor darkGrayColor].CGColor);
    [@"Moooo!" drawInRect:mooRect withFont:font];
    
    CGContextRestoreGState(ctx);
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] setFill];
    UIRectFill(self.bounds);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = [self gradient];
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.bounds), 0.0f);
    CGPoint endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    
    [self fillCircleCenteredAt:CGPointMake(100.0f, 100.0f)];
    
    [self clippedImage];
    
    [self shadowedText];
}

@end
