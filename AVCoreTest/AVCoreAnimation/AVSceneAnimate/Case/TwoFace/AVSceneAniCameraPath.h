//
//  AVSceneAniCameraPath.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import <UIKit/UIKit.h>

@class AVBasicLayer;


@interface AVSceneAniCameraPath : NSObject

+(void)sceneAniCamera:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)currentLayer;

@end
