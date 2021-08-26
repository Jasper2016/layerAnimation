//
//  AVSceneAnimateCase.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAnimateCase.h"

#import "AVBasicLayer.h"

#import "AVSceneDTO.h"

#import "AVSceneAniCaseHeader.h"

/*
 *
 * 考虑到 任何图片（不管是有face或者没有face ） 都有 sceneAni 都可以能 easyMoveIn, easyMoveOut,所以在这里加
 *
 * AVSceneAniOrienteMove,  AVSceneAniScaleZCenter, AVSceneAniNoFaceShakeMove  没有face 情况下使用，但 考虑到此 动画是基本的效果，所以放在这里
 *
 * AVSceneAniOrienteMove  四个方向的移动
 *  
 * AVSceneAniScaleZCenter  Z轴 ScaleIn 或者 ScaleOut
 *
 * AVSceneAniNoFaceShakeMove  从 四个边 向中点移动，有 shake effect
 *
 *
 *
 *
 *
 */

@implementation AVSceneAnimateCase

+(void) addAVAni:(CFTimeInterval)beginTime Layer:(AVBasicLayer *)layer AniDTO:(AVSceneDTO *)sAniDTO aniRootLayer:(CALayer *)rootLayer
{
    CFTimeInterval duration = sAniDTO.fullDuration;
    
    switch (sAniDTO.aniType) {
            
        case AVSceneAniOrienteMove:
        {
            
            [[AVSceneAniMoveXY defaultInstance] sceneAniFunc:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer];
            
            break;
        }
            
        case AVSceneAniScaleZCenter:
        {
            
            [AVSceneAniScaleSlow sceneAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer];
            
            break;
        }
            
        case AVSceneAniNoFaceShakeMove:
        {
            
            [AVSceneAniShakeMove sceneAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer];
            
            break;
        }
            
        case AVSceneAniOneFace:
        {
            
            [AVSceneAniCameraOne sceneOneFaceAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer];
            
            break;
        }
            
        case AVSceneAniMoveShakeWhite:
        {
            
            [AVSceneAniMoveShakeColorWhite sceneAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneAniYCameraPath:
        {
            [AVSceneAniCameraPath sceneAniCamera:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer];
            
            break;
        }
            
        case AVSceneAniMaskSharpenFilter:
        {
            [AVSceneAniMaskFilter sceneAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer  aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneAniMustMoveDic:
        {
            [AVSceneAniMustMoveDicAni sceneAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters layer:layer];
            
            break;
        }
            
        case AVSceneAniBaseNone:
        {
            [AVSceneAniBasicNone sceneAni:duration withBeginTime:beginTime factor:sAniDTO.factor aniParameter:sAniDTO.parameters currentLayer:layer];
            
            break;
        }
            
            
        default:
            break;
    }
}

@end
