//
//  AVSceneTransite2DMove.m
//  TestVideoPreViewing
//
//  Created by mac on 15/1/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransite2DMove.h"

#import "AVCommonHeader.h"

#import "AVSceneAnimate.h"

@implementation AVSceneTransite2DMove

+(CAAnimationGroup *)transiteMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sceneLayerCenter:(CGPoint)layerCenter
{
    
    switch (transiteFactor) {
        case AVAniXYRightToLeft:
        {
        
            CGPoint toValue = layerCenter;
            
            CGPoint fromValue = CGPointMake(toValue.x ,-toValue.y);
            
            NSLog(@"fromValue %f", fromValue.y);
            
            CABasicAnimation *opacityIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:kOpacityFromZero];

            CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:kAniBTimeZero fromValue:fromValue toValue:toValue];
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[opacityIn, moveCenter1]];
            
            return animationGroup;
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            break;
        }
        default:
            break;
    }
    
    return nil;
}


@end
