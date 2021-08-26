//
//  AVSceneAniMaskFilter.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAniMaskFilter.h"

#import "AVSceneAnimateCamera.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

#import "AVAniScaleSlowBasic.h"

//#define kMoveSmallOffset  30

#define kScaleSmallOffset 0.15

@implementation AVSceneAniMaskFilter

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)currentLayer  aniRootLayer:(CALayer *)rootLayer
{
    switch (factor) {
        case AVMaskFilterSharpenRestore:
        {
            // 每个 画面 都要做 镜头 探索处理
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:currentLayer.contentLayer.bounds];
            
            NSInteger filterType = [AVDicKeyValueUnit dicNSIntegerValue:aniParameter key:kSceneFilterKey defaultValue:AVImageFilterBrightness];
            
            currentLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            
            [currentLayer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
             UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)currentLayer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:filterType];
            
            
            AVBasicLayer *effectLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                               vContentRect:currentLayer.contentLayer.bounds
                                                                  withImage:filterImage];
            
            [currentLayer addSublayer: effectLayer];
            
            effectLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            CABasicAnimation *closeAni = [[AVBasicRouteAnimate defaultInstance] opacityClose:duration withBeginTime: beginTime];
            
            [effectLayer addAnimation:closeAni forKey:@"closeAni"];
            
            break;
        }
            
        case AVMaskFilterSharpenWhiteShining:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:currentLayer.contentLayer.bounds];
        
            
            [currentLayer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio+kScaleSmallOffset] forKeyPath:@"transform.scale"];
            
            UIImage *filterWihteImage = [UIImage imageWithCGImage:(CGImageRef)currentLayer.contentLayer.contents];
            
            UIImage *brightnessfilterImage = [[AVFilterPhoto alloc] filterGPUImage:filterWihteImage filterType:AVImageFilterBrightness];
            
            AVBasicLayer *brightnessLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                   withImage:brightnessfilterImage];
            
            
            [brightnessLayer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio+kScaleSmallOffset] forKeyPath:@"transform.scale"];
            
            [rootLayer addSublayer: brightnessLayer];
            
            CGPoint startCenter = CGPointMake(faceAwareRect.windowsCenter.x-kMoveSmallOffset, faceAwareRect.windowsCenter.y);
            
            
            CGPoint endCenter = CGPointMake(faceAwareRect.windowsCenter.x+kMoveSmallOffset, faceAwareRect.windowsCenter.y);
            
            CAKeyframeAnimation *currentMoveAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration+2 withBeginTime:beginTime startCenter:startCenter endCenter:endCenter];
            
            [currentLayer.contentLayer addAnimation:currentMoveAni forKey:@"aniInCloseShning"];
            
            //next
            NSArray *alphaValues2 = @[
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:0.6],
                                      [NSNumber numberWithFloat:0],
                                      ];
            
            NSArray *keyTime2 = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.5],
                                  [NSNumber numberWithFloat:1],
                                  ];
            
            CAKeyframeAnimation *moveAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration+2 withBeginTime:0 startCenter:startCenter endCenter:endCenter];
            
            CAKeyframeAnimation *aniInClose = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:0 propertyName:kAVBasicAniOpacity values:alphaValues2 keyTimes:keyTime2];
            aniInClose.repeatCount =7;
            aniInClose.removedOnCompletion = NO;
            aniInClose.fillMode = kCAFillModeForwards;
            
            CAAnimationGroup *animationGroup2 = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveAni,aniInClose]];
            
            [brightnessLayer.contentLayer addAnimation:animationGroup2 forKey:@"moveAni"];
            
            break;
        }
            
        case AVMaskFilterNotOriginalToBlur:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:currentLayer.contentLayer.bounds];
            
            [currentLayer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            currentLayer.contentLayer.position = faceAwareRect.windowsCenter;
            

            
            
            break;
        }
            
        case AVMaskFilterNotOriginal:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:currentLayer.contentLayer.bounds];
            
            [currentLayer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            currentLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            break;
        }

    }
}

@end
