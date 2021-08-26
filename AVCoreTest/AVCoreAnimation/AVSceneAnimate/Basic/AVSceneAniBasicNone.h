//
//  AVSceneAniBasicNone.h
//  VCore
//
//  Created by mac on 15/9/23.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniBasicNone : NSObject


+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer;

@end
