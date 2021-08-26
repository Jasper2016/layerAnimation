//
//  AVAniScaleSlowBasic.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVCommonCaseHeader.h"

@class FaceDetectDTO;

@interface AVAniScaleSlowBasic : NSObject

+(CABasicAnimation *)scaleSlowOutBasic:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio;

+(CABasicAnimation *)scaleSlowOutBasic:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio;

+(CABasicAnimation *)scaleSlowInBasic:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio;

+(CABasicAnimation *)scaleSlowInBasic:(CFTimeInterval)beginTime fromScaleValue:(CGFloat)radio;

+(CAAnimationGroup *)scaleSlowInOpacityOpen:(CFTimeInterval)beginTime;

+(CAAnimationGroup *)scaleSlowOutOpacityOpen:(CFTimeInterval)beginTime;

//move

+(CAAnimationGroup *)moveMustRightToLeft:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly;

+(CAAnimationGroup *)moveMustLeftToRight:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly;

+(CAAnimationGroup *)moveMustTopToBottom:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly;

+(CAAnimationGroup *)moveMustBottomToTop:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly;

+(CAAnimationGroup *)moveMustRightBottomToLeftUp:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly;

+(CAAnimationGroup *)moveMustLeftBottomToRightUp:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime withFaceStruct:(FaceRectMode )faceRectStruct isSlowly:(BOOL)isSlowly;

@end
