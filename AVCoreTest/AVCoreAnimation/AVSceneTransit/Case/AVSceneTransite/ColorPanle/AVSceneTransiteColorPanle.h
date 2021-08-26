//
//  AVSceneColorPale.h
//  TestVideoPreViewing
//
//  Created by mac on 15/2/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVCommonHeader.h"

@interface AVSceneTransiteColorPanle : NSObject
{
    
}

+(void)sceneColorPale:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer;
@end
