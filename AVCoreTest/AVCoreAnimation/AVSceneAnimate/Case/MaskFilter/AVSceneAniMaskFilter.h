//
//  AVSceneAniMaskFilter.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//


#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniMaskFilter : NSObject

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)currentLayer  aniRootLayer:(CALayer *)rootLayer;

@end
