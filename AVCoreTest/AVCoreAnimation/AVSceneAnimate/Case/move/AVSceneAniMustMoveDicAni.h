//
//  AVSceneAniMustMoveDicAni.h
//  testTextPlayShow
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniMustMoveDicAni : NSObject

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer;

@end
