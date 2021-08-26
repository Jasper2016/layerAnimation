//
//  AVSceneAnimateCamera.h
//  TestVideoPreViewing
//
//  Created by mac on 15/1/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVSceneAnimate.h"


@interface AVSceneAnimateCamera : NSObject
{
    
}

+ (AVSceneAnimateCamera *)defaultInstance;

-(CAAnimationGroup *)cameraMovePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea endArea:(CGRect)endArea windowArea:(CGRect)windowArea;

-(CAAnimationGroup *)cameraMoveAnglePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea startAngle:(CGFloat)startAngle endArea:(CGRect)endArea endAngle:(CGFloat)endAngle windowArea:(CGRect)windowArea;

-(CAKeyframeAnimation *)centerAniMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startCenter:(CGPoint)startCenter endCenter:(CGPoint)endCenter;


-(CAKeyframeAnimation *)centerAniMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startCenter:(CGPoint)startCenter endCenter:(CGPoint)endCenter timingFunction:(CAMediaTimingFunction* )timeFunctions;

//twoKeyTime : 0~ 1.0

-(CAAnimationGroup *)cameraMovePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(FaceRectMode)startArea twoArea:(FaceRectMode)twoArea endArea:(FaceRectMode)endArea windowArea:(CGRect)windowArea twoSpeed:(CGFloat)twoKeyTime;

-(CAAnimationGroup *)cameraNotMovePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(FaceRectMode)startArea twoArea:(FaceRectMode)twoArea endArea:(FaceRectMode)endArea windowArea:(CGRect)windowArea;


// timingFunction 有值时，duration 为 传递过来时间为准

//add three Area frame
-(CAAnimationGroup *)cameraMoveThreePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea  secondArea:(CGRect)secondArea endArea:(CGRect)endArea windowArea:(CGRect)windowArea;


-(CAAnimationGroup *)cameraMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea endArea:(CGRect)endArea windowArea:(CGRect)windowArea timingFunctoin:(CAMediaTimingFunction *)timingFunction;

-(CAAnimationGroup *)cameraSwitchFadeEaseInOut:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime;



@end
