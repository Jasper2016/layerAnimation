//
//  AVAniScaleSlowBasic.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVAniScaleSlowBasic.h"

#import "AVSceneAnimate.h"

#import "FaceDetectDTO.h"

@implementation AVAniScaleSlowBasic

+(CABasicAnimation *)scaleSlowOutBasic:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio
{
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:radio toValue:radio+AVScaleSlowOffsetTime];
    
    return saleToAni;
}

+(CABasicAnimation *)scaleSlowInBasic:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio
{
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:radio+AVScaleSlowOffsetTime toValue:radio];
    
    return saleToAni;
}

+(CABasicAnimation *)scaleSlowInBasic:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio
{
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:AVScaleSlowDuration withBeginTime:beginTime fromValue:radio+AVScaleSlowOffsetTime toValue:radio];
    
    return saleToAni;
}

+(CABasicAnimation *)scaleSlowOutBasic:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio
{
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:AVScaleSlowDuration withBeginTime:beginTime fromValue:radio toValue:radio+AVScaleSlowOffsetTime];
    
    return saleToAni;
}

+(CAAnimationGroup *)scaleSlowInOpacityOpen:(CFTimeInterval)beginTime
{
    CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0];
    
    CABasicAnimation *endSaleAni = [AVAniScaleSlowBasic scaleSlowInBasic:0 fromScaleValue:1];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:AVScaleSlowDuration withBeginTime:beginTime aniArr: @[opacityOpen,endSaleAni]];

    return animationGroup;
}

+(CAAnimationGroup *)scaleSlowOutOpacityOpen:(CFTimeInterval)beginTime
{
    CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0];
    
    CABasicAnimation *endSaleAni = [AVAniScaleSlowBasic scaleSlowOutBasic:0 fromScaleValue:1];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:AVScaleSlowDuration withBeginTime:beginTime aniArr: @[opacityOpen,endSaleAni]];
    
    return animationGroup;
}

+(CAAnimationGroup *)moveMustRightToLeft:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly
{
    CGFloat scaleRadio = faceRectStruct.windowsRadio;
    
    CGPoint scaleCenter = faceRectStruct.windowsCenter;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CGPoint endCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y);
    
    CGPoint startCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y);
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:startCenter],
                              
                              [NSValue valueWithCGPoint:endCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    return animationGroup;
}

+(CAAnimationGroup *)moveMustLeftToRight:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly
{
    
    CGFloat scaleRadio = faceRectStruct.windowsRadio;
    
    CGPoint scaleCenter = faceRectStruct.windowsCenter;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CGPoint startCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y);
    
    CGPoint endCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y);
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:endCenter],
                              
                              [NSValue valueWithCGPoint:startCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    return animationGroup;
}


+(CAAnimationGroup *)moveMustBottomToTop:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly
{
    
    CGFloat scaleRadio = faceRectStruct.windowsRadio;
    
    CGPoint scaleCenter = faceRectStruct.windowsCenter;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CGPoint startCenter = CGPointMake(scaleCenter.x, scaleCenter.y-kMoveSmallOffset);
    
    CGPoint endCenter = CGPointMake(scaleCenter.x, scaleCenter.y+kMoveSmallOffset);
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:endCenter],
                              
                              [NSValue valueWithCGPoint:startCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    return animationGroup;
}

+(CAAnimationGroup *)moveMustTopToBottom:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly

{
    
    CGFloat scaleRadio = faceRectStruct.windowsRadio;
    
    CGPoint scaleCenter = faceRectStruct.windowsCenter;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CGPoint endCenter = CGPointMake(scaleCenter.x, scaleCenter.y-kMoveSmallOffset);
    
    CGPoint startCenter = CGPointMake(scaleCenter.x, scaleCenter.y+kMoveSmallOffset);
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:endCenter],
                              
                              [NSValue valueWithCGPoint:startCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    return animationGroup;
}

+(CAAnimationGroup *)moveMustRightBottomToLeftUp:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly
{
    CGFloat scaleRadio = faceRectStruct.windowsRadio;
    
    CGPoint scaleCenter = faceRectStruct.windowsCenter;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CGPoint startCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y-kMoveSmallOffset);
    
    CGPoint endCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y+kMoveSmallOffset);
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:endCenter],
                              
                              [NSValue valueWithCGPoint:startCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    return animationGroup;
}

+(CAAnimationGroup *)moveMustLeftBottomToRightUp:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly
{
    CGFloat scaleRadio = faceRectStruct.windowsRadio;
    
    CGPoint scaleCenter = faceRectStruct.windowsCenter;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    
    CGPoint startCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y-kMoveSmallOffset);
    
    CGPoint endCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y+kMoveSmallOffset);
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:endCenter],
                              
                              [NSValue valueWithCGPoint:startCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    return animationGroup;
}
@end
