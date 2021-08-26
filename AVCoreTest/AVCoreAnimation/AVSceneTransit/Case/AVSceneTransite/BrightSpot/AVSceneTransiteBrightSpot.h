//
//  AVSceneTransiteBrightSpot.h
//  TestVideoPreViewing
//
//  Created by mac on 15/2/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneTransiteBrightSpot : NSObject
{

}

+(void)sceneBrightSpot:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer;

@end
