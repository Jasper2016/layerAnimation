//
//  AVShapeBaseLayer.m
//  AVCoreTest
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AVShapeBaseLayer.h"

@implementation AVShapeBaseLayer

- (id)initWithFrame:(CGRect)frame slidePath:(CGPathRef)slidePath  fillColor:(UIColor *)fillColor
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;

        self.path = slidePath;
        
        self.fillColor = fillColor.CGColor;
        
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame bezierPath:(UIBezierPath *)bezierPath  fillColor:(UIColor *)fillColor
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.path = bezierPath.CGPath;
        
        self.fillColor = fillColor.CGColor;
        
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
         bezierPath:(UIBezierPath *)bezierPath
          fillColor:(UIColor *)fillColor
        strokeColor:(UIColor *)strokeColor
          lineWidth:(CGFloat)lineWidth
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.path = bezierPath.CGPath;
        
        self.fillColor = fillColor.CGColor;
        
        self.strokeColor = strokeColor.CGColor;
        
        self.lineWidth = lineWidth;
        
        
    }
    return self;
}

@end
