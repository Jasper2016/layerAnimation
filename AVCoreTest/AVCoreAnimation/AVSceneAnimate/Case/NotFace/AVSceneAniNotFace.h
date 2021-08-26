//
//  AVSceneAniNotFace.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniNotFace : NSObject


+(void)sceneNotFaceAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer;

@end
