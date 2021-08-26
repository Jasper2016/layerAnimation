//
//  DrawStrokeLayer.h
//  TestSceneEffect
//
//  Created by mac on 15/5/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "UILabel+Utilities.h"

@interface DrawStrokeLayer : CAShapeLayer

@property(nonatomic,strong) UILabel *textLabel;

@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

- (id)initWithFrame:(CGRect)frame textFont:(UIFont *)font  textColor:(UIColor *)textColor showText:(NSString *)showText;

- (void)doAnimation:(CFTimeInterval)duration  withBeginTime:(CFTimeInterval)beginTime;
@end
