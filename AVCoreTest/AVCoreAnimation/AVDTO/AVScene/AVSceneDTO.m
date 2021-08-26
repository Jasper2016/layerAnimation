//
//  AVSceneDTO.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneDTO.h"

@implementation AVSceneDTO

- (id)init
{
    self = [super init];
    
    if (self)
    {
        //   _sceneDTO = [[AVSceneDTO alloc] init];
        
        self.aniType = AVSceneAniYNone;
        
        self.factor = 0;
        
        self.artAniType = AVArtAniNone;
        
        self.beginTime = 0;
        
        self.fullDuration = 0;
        
        self.isHasArt = NO;
        
        self.artBeginTime = 0;
        
    }
    
    return self;
}

//默认设置
-(void)setFullDuration:(CFTimeInterval)fullDuration
{
    if (_fullDuration !=fullDuration) {
        
        _fullDuration = fullDuration;
        
        self.artDuration = fullDuration;
        
        self.aniDuration = fullDuration;
    }
}
//
//-(void)setBeginTime:(CFTimeInterval)beginTime
//{
//    if (_beginTime != beginTime) {
//        
//        _beginTime = beginTime;
//        
//        self.artBeginTime = beginTime;
//    }
//}

@end
