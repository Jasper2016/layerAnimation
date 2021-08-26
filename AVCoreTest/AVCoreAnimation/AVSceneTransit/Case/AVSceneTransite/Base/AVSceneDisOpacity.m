//
//  AVSceneDisOpacity.m
//  TestVideoPreViewing
//
//  Created by mac on 15/1/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneDisOpacity.h"

#import "AVBasicRouteAnimate.h"

#import "AVSceneTransite.h"

@implementation AVSceneDisOpacity

+(CAAnimationGroup *)disappearOpacity:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CFTimeInterval)toValue
{
    
    CABasicAnimation *opacityToAni = [[AVBasicRouteAnimate alloc] opacityFromTo:duration withBeginTime:0 fromValue:1.0f toValue:toValue];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr: @[opacityToAni]];
    
    return animationGroup;
}



@end
