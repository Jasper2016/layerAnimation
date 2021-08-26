//
//  VCoreTransformFadeLayer.m
//  AVCoreTest
//
//  Created by gemin on 2017/7/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCoreTransformFadeLayer.h"
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    kSubLayerTag = 0x1000,
    
} ETranformFadeLayerValue;


@interface VCoreTransformFadeLayer ()


@end

@implementation VCoreTransformFadeLayer

- (void)drawInContext:(CGContextRef)ctx
{
    [super drawInContext:ctx];
    [self.fillColor setFill];
    
    if (self.areaColor && self.paths.count) {
        
        UIBezierPath *path = nil;
        
        for (int i = 0; i < self.paths.count; i++) {
            
            i == 0 ? path = self.paths[i] : [path appendPath:self.paths[i]];
        }
        
        CGFloat red   = 0;
        CGFloat green = 0;
        CGFloat blue  = 0;
        CGFloat alpha = 0;
        [self.areaColor getRed:&red green:&green blue:&blue alpha:&alpha];
        
        CGContextAddPath(ctx, path.CGPath);
        CGContextSetRGBFillColor(ctx, red, green, blue, alpha);
        CGContextFillPath(ctx);
        
    } else {
        
        for (UIBezierPath *path in self.paths) {
            
            CGContextAddPath(ctx, path.CGPath);
            CGContextSetBlendMode(ctx, kCGBlendModeClear);
            CGContextFillPath(ctx);
        }
    }

}

@end
