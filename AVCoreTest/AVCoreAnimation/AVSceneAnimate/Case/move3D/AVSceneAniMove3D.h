//
//  AVSceneAniMove3D.h
//  testTextPlayShow
//
//  Created by mac on 15/8/15.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVBasicLayer;


@interface AVSceneAniMove3D : NSObject
{

}

// scene ani
+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime  aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer;


//BG ani
+(CABasicAnimation *)bgMoveAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime aniParameter:(NSDictionary *)aniParameter;

@end
