//
//  AVBasicAnimate.h
//  LTStackView
//
//  Created by mac on 15/1/14.
//  Copyright (c) 2015年 ltebean. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>

typedef enum {
    
    KsetAVAllValue = 1,
    KsetAVToValue ,
    KsetAVfromValue ,
    
}AVSetBasciMode;

typedef enum {
    
    KAVSetBasciValueCGFloat = 1,
    KAVSetBasciValueCGPoint ,
    KAVSetBasciValueCATransform3D ,
    
}AVSetBasciValueType;

#define kAVBasicAniOpacity              @"opacity"

#define kAVBasicAniTransformScale       @"transform.scale"

#define kAVBasicAniPosition             @"position"

#define kAVBasicAniPath                 @"path"

#define kAVBasicAniFrame                @"frame"

#define kAVBasicAniBounds               @"bounds"

#define kAVBasicAniContents               @"contents"

#define kAVBasicAniTransform               @"transform"

#define kAVBasicAniTransformRotation    @"transform.rotation"

#define kAVBasicAniRotationX            @"transform.rotation.x"

#define kAVBasicAniRotationZ            @"transform.rotation.z"

#define kAVShapeStrokeEnd               @"strokeEnd"


#define kOpacityDuration           0.3

#define kBirdAciteDuration           0.35

#define kBirdOpenDuration           0.30

#define kSceneAniParamNot   0

#define kAniParamNotNil   nil

#define kAllAniTimeOffset           1.0f

#define kSceneBTime(rootLayer, x)            ([rootLayer convertTime:CACurrentMediaTime() fromLayer:rootLayer.superlayer]+x)



#define kAniBTime(x, offset)  (x.duration+x.beginTime+offset)

#define kBTimeOffset(beginTime, Offse)     (beginTime+Offse)

#define kSceneLayerDuration        [[AVConfig currentConfig].sceneLayerDuration floatValue]

#define kSceneTransitDuration         [[AVConfig currentConfig].sceneTransitDuration floatValue]

#define KScaleSlowHalfDuration      (KScaleSlowFullDuration/2)

#define KScaleSlowHalfOffset      (KScaleSlowFullOffset/2)

#define KSAniAddScaleSlow(duration, slow)  (duration-slow)

#define kSAniAfterScaleSlow(duration)  KSAniAddScaleSlow(duration, 0.8)

#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)
