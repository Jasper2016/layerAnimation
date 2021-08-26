//
//  AVSTransiteWhiteColorFadeInOut.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/14.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AVBasicLayer;

@interface AVSTransiteWhiteColorFadeInOut : NSObject

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer;

@end
