//
//  CustomCellBackground.m
//  TableView
//
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//  http://www.raywenderlich.com/2033/core-graphics-101-lines-rectangles-and-gradients
//

#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor *lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    CGRect paperRect = self.bounds;
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
}

@end
