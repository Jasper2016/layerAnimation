//
//  AVBasicRouteAnimate.h
//  LTStackView
//
//  Created by mac on 15/1/14.
//  Copyright (c) 2015年 ltebean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@class JNWSpringAnimation;

@interface AVBasicRouteAnimate : NSObject

+ (AVBasicRouteAnimate *)defaultInstance;

-(CAAnimationGroup *)groupAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime aniArr:(NSArray *)aniArr;

-(CABasicAnimation *)opacityOpen:(CFTimeInterval)beginTime;

-(CABasicAnimation *)opacityOpen:(CFTimeInterval)beginTime isAnimate:(BOOL)isAnimate;

-(CABasicAnimation *)opacityOpen:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime;

-(CABasicAnimation *)opacityClose:(CFTimeInterval)beginTime;

-(CABasicAnimation *)opacityClose:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime;

-(CAKeyframeAnimation *)opacityOpenClose:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime isAnimate:(BOOL)isAnimate;

-(CABasicAnimation *)opacityFromTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;

-(CABasicAnimation *)transform3D:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CATransform3D)fromValue toValue:(CATransform3D)toValue;

-(CABasicAnimation *)moveXYCenterTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGPoint)toValue;

-(CABasicAnimation *)moveXYCenterTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue   toValue:(CGPoint)toValue;

-(CABasicAnimation *)scaleTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue;

-(CABasicAnimation *)scaleTo:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;

-(CABasicAnimation *)rotationX:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue;

-(CABasicAnimation *)rotationY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue;

-(CABasicAnimation *)rotationZ:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CGFloat)toValue;

-(CABasicAnimation *)rotationZ:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime  fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;

-(CABasicAnimation *)customCGFloat:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue propertyName:(NSString *)propertyName;

-(CABasicAnimation *)customBasic:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(id)fromValue toValue:(id)toValue propertyName:(NSString *)propertyName;

-(CABasicAnimation *)customCGPoint:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue propertyName:(NSString *)propertyName;

-(CAKeyframeAnimation *)customKeyframePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime propertyName:(NSString *)propertyName path:(CGMutablePathRef)path;

-(CAKeyframeAnimation *)customKeyframe:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime propertyName:(NSString *)propertyName values:(NSArray *)values keyTimes:(NSArray *)keyTimes;



//JNWSpringAnimation
-(JNWSpringAnimation *)springCenterAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue mass:(CGFloat)mass;


@end
