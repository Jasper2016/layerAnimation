//
//  AVSceneAniMoveShakeColorWhite.h
//  VCore
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniMoveShakeColorWhite : NSObject


+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer aniRootLayer:(CALayer *)rootLayer;

@end
