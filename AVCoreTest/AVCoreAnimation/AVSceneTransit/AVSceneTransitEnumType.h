//
//  AVSceneTransitEnumType.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

typedef enum {
    AVTransitionRightToLeft=0,
    AVTransitionLeftToRight,
    AVTransitionTopToBottom,
    AVTransitionBottomToTop,
    
} AVSTDirection;

typedef enum {
    AVSceneTransiteBrightSpotLeftUpToRightBottom=0,
    AVSceneTransiteBrightSpotCenterToBig,
    AVSceneTransiteBrightSpotFadeInOut,
    
} AVSceneTransiteBrightSpotMode;

typedef enum {
    AVSceneTransiteColorPanleOverRightToLeft=0,
    AVSceneTransiteColorPanleOverLeftToRight,
    AVSceneTransiteColorPanleOverxxxx,
    
} AVSceneTransiteColorPanleMode;

typedef enum {
    AVSTShapeGeometryARCToFull=0,    // 圆形 
    AVSTShapeGeometryMoveRectangularoFull=1,
    AVSTShapeGeometryFiveStarToFull=2,
    AVSTShapeGeometryLoveHeartToFull=3,
    AVSTShapeGeometryTwoARCToFull=4,   //两个圆从中间 依次放大
    AVSTShapeGeometryMoreARCRoundShow=5,
    AVSTShapeGeometryMoreColorBarMove=6,
    
} AVSceneTransiteShapeGeometryMode;

typedef enum {
    AVSTFadeInOutMyMask=0,
    AVSTWhiteColorFadeInOutSample,   //1s
    AVSTWhiteColorFadeInOutGlitEffect, //耀光 2s
    
    AVSTWhiteColorFlashingLightsEffect,  // 2
    
} AVSTransiteWhiteColorFadeInOutMode;

typedef enum {
    AVSTColorSlideTriangleLeftToRight,
    AVSTColorSlideTriangleBottomToTop,
    AVSTColorSlideColorClothRightTopToLeftBottom,
    AVSTColorSlideColorClothLeftTopToRightBottom,
    
} AVSceneTransiteColorSlideMode;


typedef enum {
    
    AVSceneTransiteAniBase =0, //AVSceneTransiteAniADDualSlide =0,
    
    AVSceneTransiteAniADDualPushRotate=1,
    
    AVSceneTransiteAniADDualFold=2,
    
    AVSceneTransiteAniADDualBackFade=3,
    
    AVSceneTransiteAniADDualFade=4,
    
    AVSceneTransiteAniADDualSwap=5,
    
    AVSceneTransiteAniADDualFlip=6,
    
    AVSceneTransiteAniADDualSwipeFade=7,
    
    AVSceneTransiteAniADDualScale=8,
    
    AVSceneTransiteAniADDualGlue=9,
    
    AVSceneTransiteAniADDualZoom=10,
    
    AVSceneTransiteAniADDualGhost,
    
    AVSceneTransiteAniADDualSwipe=12,
    
    AVSceneTransiteSlideCarryArtDic=13,   //携带 文字 或者图片 滑动切换页面
    
    AVSceneTransitePushMoveXDic = 14,
    
    AVSceneTransiteFastMoveDic =15,  //刀切的效果
    
    AVSceneTransiteAniWhiteFadeInOut=16,
    
    AVSceneTransiteAniBrightSpot=17,
    
    AVSceneTransiteAniGradientFadeSlide=18,
    
    AVSceneTransiteAniColorPaleSlide=19,
    
    AVSceneTransiteAniShapeGeometry=20,
    
    AVSceneTransiteAniBlurImageEffect=21,
    
    AVSceneTransiteAniColorSlide=22,
    
    AVSceneTransiteAniColorBarArc=23,
    
    AVSceneTransiteRotate45ToSale=24,
    
    
} AVSceneTransiteAniType;

