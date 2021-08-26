//
//  AVArtAniCase.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVCommonCaseHeader.h"

@interface AVArtAniCase : NSObject

+(void)AVArtAni:(CFTimeInterval)beginTime  currentLayer:(AVBasicLayer *)currentLayer AniDTO:(AVAniDTO *)sAniDTO;

@end
