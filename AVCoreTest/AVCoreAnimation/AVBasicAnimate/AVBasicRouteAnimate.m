//
//  AVBasicRouteAnimate.m
//  LTStackView
//
//  Created by mac on 15/1/14.
//  Copyright (c) 2015年 ltebean. All rights reserved.
//

#import "AVBasicRouteAnimate.h"

#import "AVBasicBottomAnimate.h"

#import "JNWSpringAnimation.h"

@implementation AVBasicRouteAnimate

#pragma mark Singleton methods
#pragma mark 单例方法

static AVBasicRouteAnimate *defaultInstance = nil;

+ (AVBasicRouteAnimate *)defaultInstance
{
    @synchronized(self){
        if (defaultInstance == nil) {
            defaultInstance = [[AVBasicRouteAnimate alloc] init];
            
        }
    }
    return defaultInstance;
}

-(CAAnimationGroup *)groupAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime aniArr:(NSArray *)aniArr
{
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    animationGroup.duration= duration;
    
    animationGroup.beginTime= beginTime;
    
    animationGroup.removedOnCompletion=NO;
    
    animationGroup.fillMode=kCAFillModeBoth;
    
    animationGroup.autoreverses =NO;
    
    animationGroup.animations = aniArr;
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animationGroup;
}

-(CABasicAnimation *)opacityOpen:(CFTimeInterval)beginTime
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance] opacityUnit:KsetAVToValue duration:kOpacityDuration withBeginTime:beginTime fromValue:0 toValue:1.0f];
    
    return basicAnimation;
}

-(CABasicAnimation *)opacityOpen:(CFTimeInterval)beginTime isAnimate:(BOOL)isAnimate
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  opacityUnit:KsetAVToValue duration:isAnimate?kOpacityDuration:0.01f withBeginTime:beginTime fromValue:0 toValue:1.0f];
    
 //   NSLog(@"opacityOpen =%@", basicAnimation);
    
    return basicAnimation;
}

-(CABasicAnimation *)opacityOpen:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  opacityUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:0 toValue:1.0f];
    
    return basicAnimation;
}

-(CAKeyframeAnimation *)opacityOpenClose:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime isAnimate:(BOOL)isAnimate
{
    NSArray *alphaValues2 = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:1],
                              [NSNumber numberWithFloat:1],
                              [NSNumber numberWithFloat:0],
                              ];
    
    NSArray *keyTime2 = @[
                          [NSNumber numberWithFloat:0],
                          [NSNumber numberWithFloat:isAnimate? 0.3*duration : duration*0.01],
                          [NSNumber numberWithFloat:isAnimate? 0.7*duration : 1-( duration*0.01)],
                          [NSNumber numberWithFloat:1],
                          ];
    
    CAKeyframeAnimation *animationGroup = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaValues2 keyTimes:keyTime2];
    animationGroup.fillMode=kCAFillModeBoth;
    
    return animationGroup;
}

-(CABasicAnimation *)customCGFloat:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue propertyName:(NSString *)propertyName
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  customCGFloatUnit:KsetAVAllValue duration:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue propertyName:propertyName];
    
    return basicAnimation;
}

-(CABasicAnimation *)customCGPoint:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue propertyName:(NSString *)propertyName
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  customCGPointUnit:KsetAVAllValue duration:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue propertyName:propertyName];
    
    return basicAnimation;
}

-(CABasicAnimation *)customBasic:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(id)fromValue toValue:(id)toValue propertyName:(NSString *)propertyName
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  customBasicUnit:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue propertyName:propertyName];
    
    return basicAnimation;
}

-(CAKeyframeAnimation *)customKeyframePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime propertyName:(NSString *)propertyName path:(CGMutablePathRef)path
{
    CAKeyframeAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  customKeyframeUnit:duration withBeginTime:beginTime propertyName:propertyName path:path];
    
    return basicAnimation;
}

-(CAKeyframeAnimation *)customKeyframe:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime propertyName:(NSString *)propertyName values:(NSArray *)values keyTimes:(NSArray *)keyTimes
{
    CAKeyframeAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  customKeyframeUnit:duration withBeginTime:beginTime propertyName:propertyName values:values keyTimes:keyTimes];
    
    return basicAnimation;
}

-(CABasicAnimation *)opacityClose:(CFTimeInterval)beginTime
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  opacityUnit:KsetAVToValue duration:kOpacityDuration withBeginTime:beginTime fromValue:1.0 toValue:0.0f];
    
    return basicAnimation;
}

-(CABasicAnimation *)opacityClose:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  opacityUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:1.0 toValue:0.0f];
    
    return basicAnimation;
}

-(CABasicAnimation *)opacityFromTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  opacityUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue];
    
    return basicAnimation;
}

-(CABasicAnimation *)transform3D:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CATransform3D)fromValue toValue:(CATransform3D)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  transformUnit:KsetAVAllValue duration:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue];
    
    return basicAnimation;
}

-(CABasicAnimation *)moveXYCenterTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGPoint)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  moveXYCenterUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:CGPointMake(0, 0) toValue:toValue];
    
    return basicAnimation;
}

-(CABasicAnimation *)moveXYCenterTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  moveXYCenterUnit:KsetAVAllValue duration:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue];
    
    return basicAnimation;
}

-(CABasicAnimation *)scaleTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  scaleXYUnit:KsetAVAllValue duration:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue];
    
    return basicAnimation;
}

-(CABasicAnimation *)scaleTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  scaleXYUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:0 toValue:toValue];
    
    return basicAnimation;
}

-(CABasicAnimation *)rotationX:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  rotationUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:CATransform3DIdentity toValue:CATransform3DMakeRotation(DEGREES_TO_RADIANS(toValue) ,1 ,0 ,0)];
    
    return basicAnimation;
}

-(CABasicAnimation *)rotationY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  rotationUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:CATransform3DIdentity toValue:CATransform3DMakeRotation(DEGREES_TO_RADIANS(toValue) ,0 ,1 ,0)];
    
    return basicAnimation;
}

-(CABasicAnimation *)rotationZ:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  rotationUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:CATransform3DIdentity toValue:CATransform3DMakeRotation(DEGREES_TO_RADIANS(toValue) ,0 ,0 ,1)];
    
    return basicAnimation;
}

-(CABasicAnimation *)rotationZ:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime  fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue
{
    CABasicAnimation *basicAnimation = [[AVBasicBottomAnimate defaultInstance]  rotationUnit:KsetAVToValue duration:duration withBeginTime:beginTime fromValue:CATransform3DMakeRotation(DEGREES_TO_RADIANS(fromValue) ,0 ,0 ,1) toValue:CATransform3DMakeRotation(DEGREES_TO_RADIANS(toValue) ,0 ,0 ,1)];
    
    return basicAnimation;
}

-(JNWSpringAnimation *)springCenterAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue mass:(CGFloat)mass
{
    JNWSpringAnimation *moveCenter1 = [JNWSpringAnimation animationWithKeyPath:@"position"];
    
    moveCenter1.fromValue = [NSValue valueWithCGPoint:fromValue];
    
    moveCenter1.toValue = [NSValue valueWithCGPoint: toValue];
    
    moveCenter1.removedOnCompletion=NO;
    moveCenter1.fillMode=kCAFillModeBoth;
    moveCenter1.autoreverses=NO;
    
    moveCenter1.beginTime = beginTime;
    
    moveCenter1.mass =mass;
    
    moveCenter1.damping = 40;
    
    return moveCenter1;
}

@end
