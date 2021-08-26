//
//  AVSceneTransite.h
//  TestVideoPreViewing
//
//  Created by mac on 15/1/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import "AVBasicAnimate.h"

#define kAVSTKeyScaleY   @"kAVSTScaleY"

#define kAVSTKeyOpacity   @"kAVSTOpacity"

#define kAVSTKeyCenter   @"kAVSTCenter"

#define kAVSTKeyCGRect   @"kAVSTKeyCGRect"

#define kAVSceneTransiteDuration   0.4

#define kCATransactionBTime(beginTime)       (beginTime-CACurrentMediaTime())


#define kAVSceneTransiteKeyValue    @"kAVSceneTransite"

#define kAVSceneTransiteDisappearOpacity   0.4

#define kAVSceneTransiteNextLayerOpacityDuration   0.1

#define kAVSTransiteNextLayerSubAniBTime   kSceneAniParamNot

#define kAVSceneTransiteNextLayerOpacityBeginTime(beginTime, duration)     (beginTime+duration)
