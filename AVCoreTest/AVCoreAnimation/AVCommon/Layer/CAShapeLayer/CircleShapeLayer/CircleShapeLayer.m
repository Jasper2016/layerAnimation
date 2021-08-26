//
//  CircleShapeLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/5/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CircleShapeLayer.h"

@implementation CircleShapeLayer

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.path = [self drawPathWithArcCenter];
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:0.4f].CGColor;
        self.lineWidth = 20;
        
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.path = [self drawPathWithArcCenter];
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.progressLayer.lineWidth = 20;
        self.progressLayer.lineCap = kCALineCapRound; //设置线头的样式为圆的
        self.progressLayer.lineJoin = kCALineJoinRound; //设置线段转折点的样式
        [self addSublayer:self.progressLayer];
        
    }
    return self;
}

- (CGPathRef)drawPathWithArcCenter {
    
    CGFloat position_y = self.frame.size.height/2;
    CGFloat position_x = self.frame.size.width/2; // Assuming that width == height
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:position_y
                                      startAngle:(-M_PI/2)
                                        endAngle:(3*M_PI/2)
                                       clockwise:YES].CGPath;
}

@end
