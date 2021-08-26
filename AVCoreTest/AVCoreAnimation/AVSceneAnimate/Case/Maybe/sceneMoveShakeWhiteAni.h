//
//  sceneMoveShakeWhiteAni.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface sceneMoveShakeWhiteAni : NSObject

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer;

@end
