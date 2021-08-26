//
//  AVSceneTransiteBaseAni.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneTransiteBaseAni : NSObject
{
    
}

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer;


@end
