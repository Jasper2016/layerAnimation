//
//  AVSceneTransiteRotateToSale.h
//  TestVideoPreViewing
//
//  Created by mac on 15/3/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//


@class AVBasicLayer;

@interface AVSceneTransiteRotateToSale : NSObject
{

}

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer;
@end
