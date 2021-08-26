//
//  AVSceneAniMove3D.m
//  testTextPlayShow
//
//  Created by mac on 15/8/15.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "AVSceneAniMove3D.h"

#import "AVSceneAnimateCamera.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

#import "AVAniScaleSlowBasic.h"

#import "CAMediaTimingFunction+AdditionalEquations.h"

@implementation AVSceneAniMove3D

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer
{
    NSMutableArray *aniList =[[NSMutableArray alloc] init];

    
    CGPoint startPoint = [[aniParameter objectForKey:kStartPointKey] CGPointValue];
    
    CGPoint endPoint = [[aniParameter objectForKey:kEndPointKey] CGPointValue];
    
    CABasicAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:0  fromValue:startPoint toValue:endPoint];
    
    moveCenterAni.timingFunction = [CAMediaTimingFunction easeInOutSine];
    
    [aniList addObject: moveCenterAni];

    
    //保持 一个 角度 不变
    if ([aniParameter objectForKey:kKeppAnglekey]) {
        
        CGFloat keepAngle = [[aniParameter objectForKey:kKeppAnglekey] floatValue];
        
        [currentLayer setValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(keepAngle)] forKeyPath:@"transform.rotation.z"];
        
    }else if ([aniParameter objectForKey:kStartAnglekey] && [aniParameter objectForKey:kEndAnglekey])
    {
        
        CGFloat startAngle = [[aniParameter objectForKey:kStartAnglekey] floatValue];
        
        CGFloat endAngle = [[aniParameter objectForKey:kEndAnglekey] floatValue];
        
        CABasicAnimation *rotateCenterAni = [[AVBasicRouteAnimate defaultInstance] rotationZ:duration withBeginTime:0 fromValue:startAngle toValue:endAngle];
        
        rotateCenterAni.timingFunction = [CAMediaTimingFunction easeInOutSine];
        
          [aniList addObject: rotateCenterAni];
        
    }
    
    CAKeyframeAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpenClose:(2*duration)+2 withBeginTime:beginTime isAnimate:NO];


    [currentLayer addAnimation:opacityOpen forKey:@"closeAni"];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr: aniList];
    
//    animationGroup.timingFunction = [CAMediaTimingFunction easeOutCirc];
    
    [currentLayer addAnimation:animationGroup forKey:@"animationGroup"];

}


+(CABasicAnimation *)bgMoveAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime aniParameter:(NSDictionary *)aniParameter
{
    CGPoint startPoint = [[aniParameter objectForKey:kStartPointKey] CGPointValue];
    
    CGPoint endPoint = [[aniParameter objectForKey:kEndPointKey] CGPointValue];
    
    CABasicAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime  fromValue:startPoint toValue:endPoint];
    
    moveCenterAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    moveCenterAni.fillMode=kCAFillModeRemoved;
    
    return moveCenterAni;
}

@end
