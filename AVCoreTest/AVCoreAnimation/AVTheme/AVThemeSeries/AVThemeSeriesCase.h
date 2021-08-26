//
//  AVThemeSeriesCase.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVCommonCaseHeader.h"  //主题系列下面的 公共层

@interface AVThemeSeriesCase : NSObject


+(void)addThemeSeriesLayer:(CFTimeInterval)beginTime  currentLayer:(AVBasicLayer *)currentLayer AniDTO:(AVAniDTO *)sAniDTO;

@end
