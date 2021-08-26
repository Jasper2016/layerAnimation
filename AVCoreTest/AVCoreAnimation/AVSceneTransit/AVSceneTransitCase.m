//
//  AVSceneTransitCase.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//
/*
 *   1. 镜头是切换 不干扰 镜头动画
 *
 *
 *
 *******/

#import "AVSceneTransitCase.h"

#import "ADTransition.h"

#import "ThrindLibHeader.h"

#import "AVSceneTransitCaseHeader.h"

#import "AVSceneTransitEnumType.h"

@implementation AVSceneTransitCase

+(void) addAVScene:(CFTimeInterval)beginTime currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer transiteDTO:(AVSTransiteDTO *)transiteDTO aniRootLayer:(CALayer *)rootLayer
{
    
    CFTimeInterval duration = transiteDTO.STFullDuration;
    
    //CGPoint sceneCenter = [[nextLayer valueForKey:@"position"] CGPointValue];
    
    switch (transiteDTO.STAniType) {
            
        case AVSceneTransiteAniBase:
        {
            [AVSceneTransiteBaseAni sceneTransite:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniADDualPushRotate:
        {
            ADTransition * animation = [[ADPushRotateTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualFold:
        {
            ADTransition * animation = [[ADFoldTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualBackFade:
        {
            ADTransition * animation = [[ADBackFadeTransition alloc] initWithDuration:duration withBeginTime:beginTime];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualFade:
        {
            ADTransition * animation = [[ADFadeTransition alloc] initWithDuration:duration withBeginTime:beginTime];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualSwap:
        {
            ADTransition * animation = [[ADSwapTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualFlip:
        {
            ADTransition * animation = [[ADFlipTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualSwipeFade:
        {
            ADTransition * animation = [[ADSwipeFadeTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualScale:
        {
            ADTransition * animation = [[ADScaleTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualGlue:
        {
            ADTransition * animation = [[ADGlueTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualZoom:
        {
            CGRect sourceRect =  CGRectMake(0, currentLayer.frame.size.height/2, currentLayer.frame.size.width, 5);
            
            ADTransition * animation = [[ADZoomTransition alloc] initWithSourceRect:sourceRect andTargetRect:currentLayer.frame forDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualGhost:
        {
            ADTransition * animation = [[ADGhostTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteAniADDualSwipe:
        {
            ADTransition * animation = [[ADSwipeTransition alloc] initWithDuration:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor sourceRect:currentLayer.bounds];
            
            [AVSceneTransiteADTransition transitionfromView:currentLayer toView:nextLayer  withTransition:animation];
            break;
        }
            
        case AVSceneTransiteSlideCarryArtDic:
        {
            
            [AVSceneTransiteSlideCarryArt sceneTransite:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor aniParameter:transiteDTO.STParameters currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransitePushMoveXDic:
        {
            [AVSceneTransitePushMoveDicSimple sceneTransite:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteFastMoveDic:
        {
            
            [AVSceneTransiteFastMove sceneTransite:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor aniParameter:transiteDTO.STParameters currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniWhiteFadeInOut:
        {
            [AVSTransiteWhiteColorFadeInOut sceneTransite:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor aniParameter:transiteDTO.STParameters currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniBrightSpot:
        {
            [AVSceneTransiteBrightSpot sceneBrightSpot:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniGradientFadeSlide:
        {
            [kAVSceneTransiteFadeInOut sceneGradientFadeSlide:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniColorPaleSlide:
        {
            [AVSceneTransiteColorPanle sceneColorPale :duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer];
            
            break;
        }
            
        case AVSceneTransiteAniShapeGeometry:
        {
            [AVSceneTransiteShapeGeometry sceneShapeGeometry:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor aniParameter:transiteDTO.STParameters currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniBlurImageEffect:
        {
            
            [AVSceneTransiteBlurImageEffect blurEffect :duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniColorSlide:
        {
            
            [AVSceneTransiteColorSlide ColorSlide :duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteAniColorBarArc:
        {
            
            [AVSceneTransiteColorBarArc ColorBarArc:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSceneTransiteRotate45ToSale:
        {
            
            [AVSceneTransiteRotateToSale sceneTransite:duration withBeginTime:beginTime sceneTransiteFactor:transiteDTO.STFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        default:
            break;
    }
    
}


@end
