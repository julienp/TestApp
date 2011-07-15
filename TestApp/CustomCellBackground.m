//
//  CustomCellBackground.m
//  TableView
//
//  Created by Julien Poissonnier on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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
    
    CGColorRef whiteColor = [UIColor colorWithRed:1.0 green:1.0 
                                             blue:1.0 alpha:1.0].CGColor; 
    CGColorRef lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 
                                                 blue:230.0/255.0 alpha:1.0].CGColor;
    
    CGRect paperRect = self.bounds;
    
    drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
}

@end
