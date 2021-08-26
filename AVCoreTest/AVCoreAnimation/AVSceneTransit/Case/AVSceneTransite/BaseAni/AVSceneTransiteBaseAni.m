//
//  AVSceneTransiteBaseAni.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransiteBaseAni.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

#import "AVSceneAniEnumType.h"

@implementation AVSceneTransiteBaseAni

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    
    switch (transiteFactor) {
        case AVAniBaseNotAni:
        {
            [rootLayer addSublayer: nextLayer];
            
            //nextLayer.backgroundColor = [UIColor yellowColor].CGColor;
            
            nextLayer.opacity =0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime isAnimate:NO];
            
            [nextLayer addAnimation: opacityOpen forKey:@"opacityOpen"];
            
            break;
        }
            
        case AVAniBaseNextInBack:
        {
            [rootLayer insertSublayer:nextLayer below:currentLayer];
            
            nextLayer.contentLayer.opacity =0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime isAnimate:NO];
            
            [nextLayer.contentLayer addAnimation: opacityOpen forKey:@"opacityOpen"];
            
            break;
        }
            
        case AVAniBaseFadeInOut:
        {
            [rootLayer addSublayer: nextLayer];
            
            nextLayer.opacity =0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime isAnimate:YES];
            
            [nextLayer addAnimation: opacityOpen forKey:@"opacityOpen"];
        
            break;
        }
        default:
            break;
    }
    
}

@end
