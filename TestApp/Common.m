//
//  CustomCellBackground.h
//  TableView
//
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//  http://www.raywenderlich.com/2033/core-graphics-101-lines-rectangles-and-gradients
//

#import "Common.h"

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef fromColor, CGColorRef toColor) 
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id)fromColor, (__bridge id)toColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}
