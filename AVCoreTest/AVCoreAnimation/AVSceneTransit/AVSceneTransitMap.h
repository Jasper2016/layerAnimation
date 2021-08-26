//
//  AVSceneTransitMap.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/9.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVCommonCaseHeader.h"

@interface AVSceneTransitMap : NSObject

+(CAAnimationGroup *) transitMap:(CFTimeInterval)beginTime transiteDTO:(AVSTransiteDTO *)transiteDTO;

@end
