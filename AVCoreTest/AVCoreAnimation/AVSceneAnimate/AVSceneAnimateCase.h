//
//  AVSceneAnimateCase.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import <UIKit/UIKit.h>

@class AVBasicLayer;

@class AVSceneDTO;

@interface AVSceneAnimateCase : NSObject

+(void) addAVAni:(CFTimeInterval)beginTime Layer:(AVBasicLayer *)layer AniDTO:(AVSceneDTO *)sAniDTO aniRootLayer:(CALayer *)rootLayer;

@end
