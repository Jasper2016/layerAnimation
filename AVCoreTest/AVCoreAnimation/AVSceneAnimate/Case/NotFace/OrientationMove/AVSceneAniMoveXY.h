//
//  AVSceneAniMoveXY.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSceneAniMoveXY : NSObject

+ (AVSceneAniMoveXY *)defaultInstance;

-(void)sceneAniFunc:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer;

@end
