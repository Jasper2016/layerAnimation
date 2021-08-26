//
//  ShapeGradientLayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShapeGradientLayer.h"


@import UIKit;

@implementation ShapeGradientLayer

- (id)initWithFrame:(CGRect)frame
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;

        
    }
    return self;
}

- (void)setTriangleShapeFunc
{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.bounds = self.bounds;
    _shapeLayer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    
    self.shapeLayer.path = [[self shapeForBounds: self.bounds] CGPath];
    
    _shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    // This color doesn't matter since we only care about whether or
    // not there is alpha when masking.
    _shapeLayer.strokeColor = [[UIColor clearColor] CGColor];
    
    _shapeLayer.strokeStart = 0.0f;
    
    _shapeLayer.strokeEnd = 1.0f;
    
    _shapeLayer.lineWidth = 3;
    
    
    self.mask = _shapeLayer;

}

- (UIBezierPath *)shapeForBounds:(CGRect)bounds
{
    CGPoint point1 = CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY(bounds));
    CGPoint point2 = CGPointMake(CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    CGPoint point3 = CGPointMake(CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path closePath];
    
    return path;
}

- (void)setStart:(CGFloat)start
{
    _shapeLayer.strokeStart = start;
}

- (void)setEnd:(CGFloat)end
{
    _shapeLayer.strokeEnd = end;
}


@end
