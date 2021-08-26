//
//  GeometryGradientLayer.h
//  TestSceneEffect
//
//  Created by mac on 15/2/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef enum {
    radientColorBarLeftToRight,
    radientColorBarRightToLeft,
    radientColorBarTopToBottom,
    radientColorBarBottomToTop,
    radientColorBarLeftTopToRightBottom,
    radientColorBarRightBottomToLeftTop
    
} GeometryGradientColorBarMode;

@interface GeometryGradientLayer : CAGradientLayer
{

}

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, assign) GeometryGradientColorBarMode colorBarDirection;

- (id)initWithFrame:(CGRect)frame;
@end
