//
//  ShapeGradientLayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/2/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface ShapeGradientLayer : CAGradientLayer
{

}

@property (nonatomic, strong) CAShapeLayer *shapeLayer;


- (id)initWithFrame:(CGRect)frame;

- (void)setStart:(CGFloat)start;

- (void)setEnd:(CGFloat)end;

- (void)setTriangleShapeFunc;

@end
