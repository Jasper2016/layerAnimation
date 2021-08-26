//
//  AVSceneTransiteShapeGeometry.h
//  TestVideoPreViewing
//
//  Created by mac on 15/2/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneTransiteShapeGeometry : NSObject
{

}

+(void)sceneShapeGeometry:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer  aniRootLayer:(CALayer *)rootLayer;

@end
