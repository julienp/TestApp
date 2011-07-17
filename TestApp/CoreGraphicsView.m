//
//  CoreGraphicsView.m
//  TestApp
//
//  Created by Julien Poissonnier on 7/17/11.
//  Copyright 2011 caffeine.lu. All rights reserved.
//

#import "CoreGraphicsView.h"

@implementation CoreGraphicsView {
    CGGradientRef _gradient;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gradient = NULL;
    }
    return self;
}

- (CGGradientRef)gradient {
    if (NULL == _gradient) {
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

- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] setFill];
    UIRectFill(self.bounds);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = [self gradient];
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.bounds), 0.0f);
    CGPoint endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);    
}

@end
