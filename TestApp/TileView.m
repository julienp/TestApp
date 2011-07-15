//
//  TileView.m
//  TilingFun
//
//  Created by Julien Poissonnier on 7/8/11.
//  Copyright 2011 Julien Poissonnier. All rights reserved.
//

#import "TileView.h"
#import <QuartzCore/CATiledLayer.h>

#define SIZE 120

@implementation TileView

+ (Class)layerClass {
    return [CATiledLayer class];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CATiledLayer *tiledLayer = (CATiledLayer *)self.layer;
        CGFloat sf = self.contentScaleFactor;
        tiledLayer.tileSize = CGSizeMake(SIZE * sf, SIZE * sf);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"coffee_square.png"];
    [image drawInRect:rect];
}

@end
