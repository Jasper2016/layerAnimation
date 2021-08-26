//
//  AVSceneTransitCase.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVCommonCaseHeader.h"

@interface AVSceneTransitCase : NSObject

+(void) addAVScene:(CFTimeInterval)beginTime currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer transiteDTO:(AVSTransiteDTO *)transiteDTO aniRootLayer:(CALayer *)rootLayer;

@end
