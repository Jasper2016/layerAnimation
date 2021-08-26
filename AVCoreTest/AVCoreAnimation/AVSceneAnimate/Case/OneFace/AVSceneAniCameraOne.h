//
//  AVSceneAniCameraOne.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniCameraOne : NSObject

+(void)sceneOneFaceAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer;

@end
