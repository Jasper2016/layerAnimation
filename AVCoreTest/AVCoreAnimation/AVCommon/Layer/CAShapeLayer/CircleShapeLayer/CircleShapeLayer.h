//
//  CircleShapeLayer.h
//  TestSceneEffect
//
//  Created by mac on 15/5/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CircleShapeLayer : CAShapeLayer

@property (nonatomic) UIColor *progressColor;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef;

@end
