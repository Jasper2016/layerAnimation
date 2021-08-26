//
//  AVAniCameraOneFaceShake.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVAniCameraOneFaceShake.h"

#import "AVCommonHeader.h"

#import "AVRectUnit.h"

#import "AVConstant.h"

#import "AVSceneAnimate.h"

#import "CAMediaTimingFunction+AdditionalEquations.h"

#import "AVAniScaleSlowBasic.h"

@implementation AVAniCameraOneFaceShake


//移动一会颤抖  --in
+(CAAnimationGroup *)oneFaceShakeMoveIn:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime faceArea:(FaceRectMode)faceArea faceAwareRect:(FaceRectMode)faceAwareRect contentRect:(CGRect)contentRect
{
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:faceArea.windowsRadio],
                             [NSNumber numberWithFloat:faceArea.windowsRadio-0.1],
                             [NSNumber numberWithFloat:faceAwareRect.windowsRadio+0.1],
                             [NSNumber numberWithFloat:faceAwareRect.windowsRadio],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.54],
                         [NSNumber numberWithFloat:0.70],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:faceArea.windowsCenter],
                              [NSValue valueWithCGPoint:faceArea.windowsCenter],
                              [NSValue valueWithCGPoint:faceAwareRect.windowsCenter],
                              [NSValue valueWithCGPoint:faceAwareRect.windowsCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animationGroup;
    
}

//移动一会颤抖  --out
+(CAAnimationGroup *)oneFaceShakeMoveOut:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime faceArea:(FaceRectMode)faceArea  faceAwareRect:(FaceRectMode)faceAwareRect contentRect:(CGRect)contentRect
{
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:faceAwareRect.windowsRadio],
                             [NSNumber numberWithFloat:faceAwareRect.windowsRadio+0.1],
                             [NSNumber numberWithFloat:faceArea.windowsRadio-0.1],
                             [NSNumber numberWithFloat:faceArea.windowsRadio],
                             
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.54],
                         [NSNumber numberWithFloat:0.70],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:faceAwareRect.windowsCenter],
                              [NSValue valueWithCGPoint:faceAwareRect.windowsCenter],
                              [NSValue valueWithCGPoint:faceArea.windowsCenter],
                              [NSValue valueWithCGPoint:faceArea.windowsCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animationGroup;
    
}

@end
