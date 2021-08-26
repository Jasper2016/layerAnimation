//
//  AVShapeBaseLayer.h
//  AVCoreTest
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

@interface AVShapeBaseLayer : CAShapeLayer
{

}

- (id)initWithFrame:(CGRect)frame slidePath:(CGPathRef)slidePath  fillColor:(UIColor *)fillColor;

- (id)initWithFrame:(CGRect)frame bezierPath:(UIBezierPath *)bezierPath  fillColor:(UIColor *)fillColor;

- (id)initWithFrame:(CGRect)frame
         bezierPath:(UIBezierPath *)bezierPath
          fillColor:(UIColor *)fillColor
          strokeColor:(UIColor *)strokeColor
          lineWidth:(CGFloat)lineWidth;
@end
