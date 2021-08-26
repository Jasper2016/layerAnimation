//
//  HotBasicAnimate.h
//  CAnimationToVideo
//
//  Created by mac on 8/18/13.
//  Copyright (c) 2013 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <QuartzCore/QuartzCore.h>

@interface HotBasicAnimate : NSObject
{

}

+(CAAnimationGroup *)groupAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime aniArray:(NSArray *)aniArray;

+(CAKeyframeAnimation *)opacityShowAndCloseAni:(CGFloat)duration withBeginTime:(CGFloat)beginTime withopacity:(CGFloat)value;

+(CABasicAnimation *)frameMoveAni:(CGFloat)duration withBeginTime:(CGFloat)beginTime currentFrame:(CGRect)oldFrame
                         newFrame:(CGRect)newFrame;

+(CABasicAnimation *)scaleAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime toScale:(CGFloat)value;

+(CABasicAnimation *)movePointAni:(CGFloat)duration withBeginTime:(CGFloat)beginTime withCenter:(CGPoint )point;

// animate for rotate3D
+(CABasicAnimation *)rotate3DByYaxis:(CGFloat)duration withBeginTime:(CGFloat)beginTime withAngle:(CGFloat)value;

+(CABasicAnimation *)rotate3DByXaxis:(CGFloat)duration withBeginTime:(CGFloat)beginTime withAngle:(CGFloat)value;

+(CABasicAnimation *)opacityAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime isOpacity:(BOOL)isOpacity withToValue:(CGFloat)values;

+(CABasicAnimation *)moveYAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime frome:(CGFloat)frome to:(CGFloat)to;
@end
