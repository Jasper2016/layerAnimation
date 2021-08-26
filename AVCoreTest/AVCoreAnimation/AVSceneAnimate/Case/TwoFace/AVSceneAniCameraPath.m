//
//  AVSceneAniCameraPath.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//
// ~~~~  aniParameter 前三个参数为 CGRect

#import "AVSceneAniCameraPath.h"

#import "AVSceneAnimateCamera.h"

#import "AVSceneAniEnumType.h"

#import "AVCommonHeader.h"

#import "AVSceneAnimate.h"

#import "AVAniScaleSlowBasic.h"

#import "AVRectUnit.h"

@implementation AVSceneAniCameraPath

+(void)sceneAniCamera:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)currentLayer
{
    
    if (aniParameter ==nil) {
        NSLog(@"AVSceneAniCameraPath nil");
    }
    
    FaceDetectDTO *faceDto = [aniParameter objectForKey:KAVFaceDtoKey];
    
    CAMediaTimingFunction *timingFunc = (CAMediaTimingFunction *)[aniParameter objectForKey:kAVCAMediaTimingKey];
    
    switch (factor) {
        case AVAniCameraTwoContinue:
        {
            
            CAAnimationGroup *cameraPathAni = [[AVSceneAnimateCamera defaultInstance] cameraMovePath:kSAniAfterScaleSlow(duration) withBeginTime:beginTime startArea:faceDto.faceStruct1 twoArea:faceDto.faceStruct2 endArea:faceDto.faceAwareStruct windowArea:currentLayer.contentLayer.frame twoSpeed: 0.6];
            
            if (timingFunc) {
                cameraPathAni.timingFunction = timingFunc;
            }
            
            [currentLayer.contentLayer addAnimation:cameraPathAni forKey:@"cameraPathAni"];
            
            CABasicAnimation *saleSlow = [[AVBasicRouteAnimate defaultInstance] scaleTo:KScaleSlowHalfDuration withBeginTime:kAniBTime(cameraPathAni, 0) toValue:kGetScaleParam(kAVRectWindow, kAVRectWindow)];
            saleSlow.fillMode=kCAFillModeForwards;
            
            [currentLayer.contentLayer addAnimation: saleSlow forKey:@"sale"];
            
            
            break;
        }
        
            
        case AVAniCameraTwoNoFadeMove:
        {
            
            CAAnimationGroup *cameraPathAni = [[AVSceneAnimateCamera defaultInstance] cameraNotMovePath:duration withBeginTime:beginTime startArea:faceDto.faceStruct1 twoArea:faceDto.faceStruct2 endArea:faceDto.faceAwareStruct windowArea:currentLayer.contentLayer.frame];
            
            if (timingFunc) {
                cameraPathAni.timingFunction = timingFunc;
            }
            
            [currentLayer.contentLayer addAnimation:cameraPathAni forKey:@"cameraPathAni"];
            
            break;
        }
            
        case AVAniCameraSwitchFaceFade:
        {
            currentLayer.contentLayer.opacity = 0.0;
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)currentLayer.contentLayer.contents];
            
            CGRect newStartRect = [AVRectUnit getSceneCropImageRect:contendImage.size contendLayerSize:currentLayer.contentLayer.bounds.size partRect:faceDto.faceStruct1.onImageFaceRect];

            //first
            CGImageRef imageRef1 = CGImageCreateWithImageInRect([contendImage CGImage], newStartRect);
            UIImage *result1 = [UIImage imageWithCGImage:imageRef1];
            CGImageRelease(imageRef1);
            
            AVBasicLayer *startLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:kAVRectWindow
                                                                 withImage:result1];
            
            [currentLayer addSublayer: startLayer];
            
            CAAnimationGroup *cameraPathAni = [[AVSceneAnimateCamera defaultInstance] cameraSwitchFadeEaseInOut:duration-1 withBeginTime:beginTime];
            
            [startLayer addAnimation:cameraPathAni forKey:@"cameraPathAni"];
            
            CGRect newTwoRect = [AVRectUnit getSceneCropImageRect:contendImage.size contendLayerSize:currentLayer.contentLayer.bounds.size partRect:faceDto.faceStruct2.onImageFaceRect];
            //two
            CGImageRef imageRef2 = CGImageCreateWithImageInRect([contendImage CGImage], newTwoRect);
            UIImage *result2 = [UIImage imageWithCGImage:imageRef2];
            CGImageRelease(imageRef2);
            
            AVBasicLayer *twoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:kAVRectWindow
                                                                 withImage:result2];
            
            [currentLayer addSublayer: twoLayer];
            twoLayer.opacity= 0;
            
            CAAnimationGroup *cameraPathAni2 = [[AVSceneAnimateCamera defaultInstance] cameraSwitchFadeEaseInOut:duration-1 withBeginTime:beginTime+0.8];
            
            [twoLayer addAnimation:cameraPathAni2 forKey:@"cameraPathAni"];
            
            CGRect newEndRect = [AVRectUnit getSceneCropImageRect:contendImage.size contendLayerSize:currentLayer.contentLayer.bounds.size partRect:faceDto.faceAwareStruct.onImageFaceRect];
           
            //End
            CGImageRef imageRef3 = CGImageCreateWithImageInRect([contendImage CGImage], newEndRect);
            UIImage *result3 = [UIImage imageWithCGImage:imageRef3];
            CGImageRelease(imageRef3);
            
            AVBasicLayer *endLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                            vContentRect:kAVRectWindow
                                                               withImage:result3];
            
            [currentLayer addSublayer: endLayer];
            endLayer.opacity= 0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0 isAnimate:NO];
            
            CABasicAnimation *endSaleAni = [AVAniScaleSlowBasic scaleSlowInBasic:0 fromScaleValue:1];
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:AVScaleSlowDuration withBeginTime:beginTime+2.0 aniArr: @[opacityOpen,endSaleAni]];
            
//            CAAnimationGroup *animationGroup = [AVAniScaleSlowBasic scaleSlowInOpacityOpen:beginTime+2.0];
            
            [endLayer addAnimation:animationGroup forKey:@"animationGroup"];
            
            break;
        }
            
        case AVAniCenterToOneMoveOneFace:
        {
            NSArray *keyValues = @[
                                   [NSValue valueWithCGPoint:faceDto.faceAwareStruct.windowsCenter],
                                   [NSValue valueWithCGPoint:faceDto.faceAwareStruct.windowsCenter],
                                   
                                   [NSValue valueWithCGPoint:faceDto.faceStruct2.windowsCenter],
                                   [NSValue valueWithCGPoint:faceDto.faceStruct2.windowsCenter],
                                   
                                   [NSValue valueWithCGPoint:faceDto.faceStruct1.windowsCenter],
                                   [NSValue valueWithCGPoint:faceDto.faceStruct1.windowsCenter],
                                   ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0.0],
                                 [NSNumber numberWithFloat:0.3],
                                 
                                 [NSNumber numberWithFloat:0.4],
                                 [NSNumber numberWithFloat:0.6],
                                 
                                 [NSNumber numberWithFloat:0.7],
                                 [NSNumber numberWithFloat:1.0],
                                 ];
            
            CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:keyValues keyTimes:keyTime];
            moveCenter1.fillMode=kCAFillModeBoth;
            
            NSArray *scaleKeyValues = @[
                                        
                                        [NSNumber numberWithFloat:faceDto.faceStructEnd.windowsRadio],
                                        [NSNumber numberWithFloat:faceDto.faceStructEnd.windowsRadio+AVScaleSlowOffsetTime2],
                                        
                                        [NSNumber numberWithFloat:faceDto.faceStruct2.windowsRadio],
                                        [NSNumber numberWithFloat:faceDto.faceStruct2.windowsRadio+AVScaleSlowOffsetTime2],
                                        
                                        [NSNumber numberWithFloat:faceDto.faceStruct1.windowsRadio],
                                        [NSNumber numberWithFloat:faceDto.faceStruct1.windowsRadio+AVScaleSlowOffsetTime2],
                                        
                                        ];
            
            
            CAKeyframeAnimation *saleTo1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleKeyValues keyTimes:keyTime];
            moveCenter1.fillMode=kCAFillModeBoth;
            
            CAAnimationGroup *animationGroup2 = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,saleTo1]];
            
            [currentLayer.contentLayer addAnimation:animationGroup2 forKey:@"alphaAni"];
        }
        default:
            break;
    }
}
@end
