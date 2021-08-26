//
//  AVSceneTransite2DMove.h
//  TestVideoPreViewing
//
//  Created by mac on 15/1/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVSceneTransite2DMove : NSObject
{

}
+(CAAnimationGroup *)transiteMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sceneLayerCenter:(CGPoint)layerCenter;


@end
