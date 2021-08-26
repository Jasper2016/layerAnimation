//
//  AVSceneAniShakeMove.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAniShakeMove.h"

#import "AVSceneAnimateCamera.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

@implementation AVSceneAniShakeMove

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer
{
    switch (factor) {
        case AVAniShakeInRightToLeft:
        {

            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1.5],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.1],
                                     [NSNumber numberWithFloat:1.2],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.48],
                                 [NSNumber numberWithFloat:0.55],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CGFloat moveDiscX = (layer.contentLayer.frame.size.width - kAVWindowWidth)/2;
            
            NSArray *centerValues = @[
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow)-(CGRectGetWidth(kAVRectWindow)*0.4), CGRectGetMidY(kAVRectWindow))],
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow)-(CGRectGetWidth(kAVRectWindow)*0.3), CGRectGetMidY(kAVRectWindow)) ],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow))],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow)+moveDiscX, CGRectGetMidY(kAVRectWindow))],
                                      ];
            
            CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
            moveCenterAni.fillMode=kCAFillModeBoth;
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            scaleAni.fillMode=kCAFillModeBoth;
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
            
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            
            [layer.contentLayer addAnimation:animationGroup forKey:@"animationGroup"];
            
            break;
        }
            
        case AVAniShakeInLeftToRight:
        {
            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1.5],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.1],
                                     [NSNumber numberWithFloat:1.2],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.48],
                                 [NSNumber numberWithFloat:0.55],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CGFloat moveDiscX = (layer.contentLayer.frame.size.width - kAVWindowWidth)/2;
            
            NSArray *centerValues = @[
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow)-(CGRectGetWidth(kAVRectWindow)*0.4), CGRectGetMidY(kAVRectWindow))],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow)-(CGRectGetWidth(kAVRectWindow)*0.3), CGRectGetMidY(kAVRectWindow))],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow))],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake((CGRectGetMidX(kAVRectWindow)+moveDiscX), CGRectGetMidY(kAVRectWindow))],
                                      ];
            
            CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
            moveCenterAni.fillMode=kCAFillModeBoth;
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            scaleAni.fillMode=kCAFillModeBoth;
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
            
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            
            [layer.contentLayer addAnimation:animationGroup forKey:@"animationGroup"];
            
            break;
        }
            
        case AVAniShakeInTopToBottom:
        {
            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1.5],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.0],
                                     [NSNumber numberWithFloat:1.0],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.48],
                                 [NSNumber numberWithFloat:0.55],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CGFloat moveDiscY = (layer.contentLayer.frame.size.height - kAVWindowWidth)/2;
            
            NSArray *centerValues = @[
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)+CGRectGetHeight(kAVRectWindow)*0.5)],
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)+CGRectGetHeight(kAVRectWindow)*0.3) ],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)-(moveDiscY*0.5)  )],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)-moveDiscY)],
                                      ];
            
            CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
            moveCenterAni.fillMode=kCAFillModeBoth;
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            scaleAni.fillMode=kCAFillModeBoth;
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
            
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            
            [layer.contentLayer addAnimation:animationGroup forKey:@"animationGroup"];
            
            break;
        }
            
        case AVAniShakeInBottomToTop:
        {
            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1.5],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.1],
                                     [NSNumber numberWithFloat:1.2],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.48],
                                 [NSNumber numberWithFloat:0.55],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CGFloat moveDiscY = (layer.contentLayer.frame.size.height - kAVWindowWidth)/2;
            
            NSArray *centerValues = @[
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)-(CGRectGetHeight(kAVRectWindow)*0.5))],
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)-(CGRectGetHeight(kAVRectWindow)*0.4) ) ],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow))],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)+moveDiscY)],
                                      ];
            
            CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
            moveCenterAni.fillMode=kCAFillModeBoth;
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            scaleAni.fillMode=kCAFillModeBoth;
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
            
            animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            
            [layer.contentLayer addAnimation:animationGroup forKey:@"animationGroup"];
            
            break;
        }
            
        default:
            break;
    }
}

@end
