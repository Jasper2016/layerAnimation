//
//  HotBasicAnimate.m
//  CAnimationToVideo
//
//  Created by mac on 8/18/13.
//  Copyright (c) 2013 mac. All rights reserved.
//

#import "HotBasicAnimate.h"

#define kFadeInDuration     0.35

#define kFadeOutDuration    0.35

@implementation HotBasicAnimate

+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time; //有闪烁次数的动画
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.4];
    animation.repeatCount=repeatTimes;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=NO;
    return  animation;
}

+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes //路径动画
{
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path=path;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=NO;
    animation.duration=time;
    animation.repeatCount=repeatTimes;
    return animation;
}
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount //旋转
{
//    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0,direction);
//    CABasicAnimation* animation;
//    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    
//    //animation.toValue= [[NSValue valueWithCATransform3D:rotationTransform];
//    animation.duration= dur;
//    animation.autoreverses= NO;
//    animation.cumulative= YES;
//    animation.removedOnCompletion=NO;
//    animation.fillMode=kCAFillModeForwards;
//    animation.repeatCount= repeatCount;
//    animation.delegate= self;
//    
//    return animation;
    
    return nil;
}


#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

+(CABasicAnimation *)rotate3DByYaxis:(CGFloat)duration withBeginTime:(CGFloat)beginTime withAngle:(CGFloat)value
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    CGFloat Angle = DEGREES_TO_RADIANS(180);
    animation.toValue=[NSNumber numberWithFloat: Angle]; 
    
    animation.duration=duration;
    animation.beginTime = beginTime;
    
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return animation;
}

+(CABasicAnimation *)moveYAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime frome:(CGFloat)frome to:(CGFloat)to
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.duration=duration;
    animation.beginTime = beginTime;
    animation.removedOnCompletion=NO;

    animation.fromValue= [NSNumber numberWithFloat:frome];
    
    animation.toValue= [NSNumber numberWithFloat:to];
    
    animation.fillMode=kCAFillModeBoth;
  
    return animation;
}

+(CABasicAnimation *)rotate3DByXaxis:(CGFloat)duration withBeginTime:(CGFloat)beginTime withAngle:(CGFloat)value
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
    animation.toValue=[NSNumber numberWithFloat: M_PI * value];
    
    animation.duration=duration;
    animation.beginTime = beginTime;
    
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
}


+(CABasicAnimation *)movePointAni:(CGFloat)duration withBeginTime:(CGFloat)beginTime withCenter:(CGPoint )point
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation"];
    //animation.toValue=[NSValue valueWithCGPoint:point];
    
    animation.duration=duration;
    animation.beginTime = beginTime;
    
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)scaleAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime toScale:(CGFloat)value
{
    CABasicAnimation *scaleAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //animation.fromValue=orginMultiple;
    scaleAnimation.fromValue=    [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue=    [NSNumber numberWithFloat:value];
    
    scaleAnimation.duration= duration;
    scaleAnimation.beginTime= beginTime;
    scaleAnimation.removedOnCompletion=NO;
    
    scaleAnimation.repeatCount = 1;
    
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    scaleAnimation.fillMode=kCAFillModeForwards;
    
    return scaleAnimation;
}

+(CAAnimationGroup *)groupAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime aniArray:(NSArray *)aniArray
{
    //    NSArray *tempArray = aniArray;
    
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    animation.animations= aniArray;
    animation.duration= duration;
    animation.beginTime= beginTime;
    animation.removedOnCompletion=NO;
    animation.repeatCount = 1;
    // animation.fillMode=kCAFillModeForwards;
    
    return animation;
}

+(CAAnimationGroup *)opacityInOut:(CGFloat)duration withBeginTime:(CGFloat)beginTime isOutEnable:(BOOL)yesOut
{
//    NSArray *tempArray = aniArray;
    
    CABasicAnimation *animationIn=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animationIn.fromValue=[NSNumber numberWithFloat:0];
    animationIn.toValue=[NSNumber numberWithFloat:1.0];
    animationIn.beginTime = beginTime+CACurrentMediaTime();
    animationIn.duration=kFadeInDuration;
    animationIn.removedOnCompletion=NO;
    animationIn.autoreverses =NO;
    
    
    CABasicAnimation *animationOut=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animationOut.fromValue=[NSNumber numberWithFloat:1.0];
    animationOut.toValue=[NSNumber numberWithFloat:0];
    animationOut.beginTime = (duration-kFadeOutDuration) +CACurrentMediaTime();
    animationOut.duration=kFadeOutDuration;
    animationOut.removedOnCompletion=NO;
    animationOut.autoreverses =NO;
    
    
    NSArray *animateList = nil;
    if (yesOut==YES) {
            animateList =[NSArray arrayWithObjects:animationOut,animationIn,  nil];
    }else{
        animateList =[NSArray arrayWithObjects:animationIn,  nil];
    }
    
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    animation.animations= animateList;
    animation.duration= duration;
    animation.beginTime= beginTime;
    animation.removedOnCompletion=NO;
    animationOut.autoreverses =NO;
    animation.repeatCount = 1;
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
}


+(CABasicAnimation *)opacityAnimation:(CGFloat)duration withBeginTime:(CGFloat)beginTime isOpacity:(BOOL)isOpacity withToValue:(CGFloat)values

{
   CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    if (isOpacity==NO) {

        animation.fromValue=[NSNumber numberWithFloat:1.0];
        animation.toValue=[NSNumber numberWithFloat:values];
    }else{
        animation.fromValue=[NSNumber numberWithFloat:values];
        animation.toValue=[NSNumber numberWithFloat:1.0];
    }
    animation.beginTime = beginTime;
    animation.duration=duration;
    animation.removedOnCompletion=NO;
    animation.autoreverses =NO;
   // animation.repeatDuration = 0;
   // animation.repeatCount = 23;


    animation.fillMode = kCAFillModeBoth;
    
    return animation;
}


+(CAKeyframeAnimation *)opacityShowAndCloseAni:(CGFloat)duration withBeginTime:(CGFloat)beginTime withopacity:(CGFloat)value;
{
    CAKeyframeAnimation *firstAnimation=[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    firstAnimation.duration=duration;
    firstAnimation.beginTime = beginTime;
    firstAnimation.removedOnCompletion = NO;
    
    firstAnimation.values = @[[NSNumber numberWithFloat:0.0],
                              [NSNumber numberWithFloat:value]];
    
//    firstAnimation.values = @[[NSNumber numberWithFloat:0.0],
//                              [NSNumber numberWithFloat:value],
//                              [NSNumber numberWithFloat:value],
//                              [NSNumber numberWithFloat:value],
//                              [NSNumber numberWithFloat:0.0]];
    
    firstAnimation.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    firstAnimation.fillMode = kCAFillModeForwards;
    
    return firstAnimation;
}

+(CABasicAnimation *)frameMoveAni:(CGFloat)duration withBeginTime:(CGFloat)beginTime currentFrame:(CGRect)oldFrame
                                                                                newFrame:(CGRect)newFrame
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"frame"];
    
    animation.duration=duration;
    animation.beginTime = beginTime;
    
  //  [animation setFromValue:[NSValue valueWithCGRect:oldFrame]];
   // [animation setToValue:[NSValue valueWithCGRect:newFrame]];
    animation.removedOnCompletion=NO;
    //animation.fillMode=kCAFillModeForwards;
    
    return animation;
}

@end
