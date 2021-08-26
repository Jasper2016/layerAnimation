//
//  AVSceneTransiteBrightSpot.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//


#import "AVSceneTransiteBrightSpot.h"

#import "CCARadialGradientLayer.h"

#import "AVSceneTransitEnumType.h"

#import "AVCommonHeader.h"

#define  kBrightSpotScreenOffset        20

#define kLastAnimationValue     @"kLastAnimationValue"

#define kLastAnimationKey       @"kLastAnimationKey"



@implementation AVSceneTransiteBrightSpot


+(void)sceneBrightSpot:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    
    CCARadialGradientLayer *radialGradientLayer = [CCARadialGradientLayer layer];
    
    radialGradientLayer.frame = currentLayer.bounds;
    
    switch (transiteFactor) {
        case AVSceneTransiteBrightSpotLeftUpToRightBottom:
        {
         
            nextLayer.opacity = 0.0f;
            [rootLayer addSublayer: nextLayer];
            
            CABasicAnimation *aniApacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:kAVSceneTransiteNextLayerOpacityDuration withBeginTime:kAVSceneTransiteNextLayerOpacityBeginTime(beginTime, (duration/2))];
            
            [nextLayer addAnimation:aniApacityOpen forKey:@"aniApacityOpen"];
            
            CGPoint gradientOriginBefromPostion = CGPointMake(-kBrightSpotScreenOffset, -kBrightSpotScreenOffset);
            
            CGPoint gradientOriginAfterPostion = CGPointMake(currentLayer.bounds.size.width+kBrightSpotScreenOffset, currentLayer.bounds.size.height+kBrightSpotScreenOffset);
            
            radialGradientLayer.colors = @[
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:1.0].CGColor,
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:0.96f].CGColor,
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:0.90].CGColor,
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:0.0f].CGColor,
                                           ];
            radialGradientLayer.locations = @[@0,
                                              @0.1,
                                              @0.2,
                                              @1];
            radialGradientLayer.gradientOrigin = gradientOriginBefromPostion;
            radialGradientLayer.gradientRadius = 20;
            
            radialGradientLayer.frame = currentLayer.bounds;
            
            [rootLayer addSublayer: radialGradientLayer];
            
            NSArray *keyTime = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.45],[NSNumber numberWithFloat:0.55],[NSNumber numberWithFloat:1.0],
            nil];
            
            NSArray *gradientRadiusValue = [NSArray arrayWithObjects:[NSNumber numberWithFloat:20], [NSNumber numberWithFloat:750], [NSNumber numberWithFloat:10],
                                nil];
            
            NSArray *gradientOriginArr = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:gradientOriginBefromPostion], [NSValue valueWithCGPoint:currentLayer.position], [NSValue valueWithCGPoint:gradientOriginAfterPostion],nil];
            
            CAKeyframeAnimation *gradientRadiusAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:kAVSTransiteNextLayerSubAniBTime propertyName:@"gradientRadius" values:gradientRadiusValue keyTimes:keyTime];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:kAVSceneTransiteNextLayerOpacityDuration withBeginTime:beginTime];
            
           // CABasicAnimation *gradientOriginUpMoveAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration/2 withBeginTime:beginTime fromValue:kAniParamNotNil toValue:[NSValue valueWithCGPoint:currentLayer.position] propertyName:@"gradientOrigin"];
            
            //CABasicAnimation *gradientOriginDownMoveAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration/2 withBeginTime:beginTime+1.0f fromValue:kAniParamNotNil toValue:[NSValue valueWithCGPoint:gradientOriginAfterPostion] propertyName:@"gradientOrigin"];
            
            CAKeyframeAnimation *gradientOriginAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:kAVSTransiteNextLayerSubAniBTime propertyName:@"gradientOrigin" values:gradientOriginArr keyTimes:keyTime];
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[gradientRadiusAni, gradientOriginAni, opacityOpen]];
            
            [radialGradientLayer addAnimation:animationGroup forKey:@"animationGroup"];

            break;
        }
            
        case AVSceneTransiteBrightSpotCenterToBig:
        {
            
            radialGradientLayer.colors = @[
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:1.0].CGColor,
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:1.0].CGColor,
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:1.0].CGColor,
                                           (id)[[UIColor whiteColor] colorWithAlphaComponent:0.0].CGColor
                                           ];
            
            
            
            //最下面一层
            radialGradientLayer.locations = @[@0.02, @0.4, @0.6, @0.9];
            radialGradientLayer.gradientOrigin = currentLayer.position;
            radialGradientLayer.gradientRadius = 0;

            nextLayer.opacity = 0.0f;
            [rootLayer addSublayer: nextLayer];
            
            CABasicAnimation *aniApacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0.3 withBeginTime:beginTime];
            
            [nextLayer addAnimation:aniApacityOpen forKey:@"aniApacityOpen"];
            
            
            [nextLayer setMask: radialGradientLayer];
            
            NSArray *keyTime = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0],
                                nil];
            
            NSArray *keyValues = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:300],[NSNumber numberWithFloat:800],
                                  nil];
            
            CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:@"gradientRadius" values:keyValues keyTimes:keyTime];
            
            
            [radialGradientLayer addAnimation:opacityAni forKey:@"opacityAni"];
            
            break;
        }
            
        case AVSceneTransiteBrightSpotFadeInOut:
        {
        
            radialGradientLayer.colors = @[
                                           (id)[UIColor whiteColor].CGColor,
                                           (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8],
                                           (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.78],
                                           (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:0.77]
                                           ];
            
            
            radialGradientLayer.locations = @[@0.02, @0.4, @0.6, @0.9];
            radialGradientLayer.gradientOrigin = currentLayer.position;
            radialGradientLayer.gradientRadius = 2000;
            
            nextLayer.opacity = 0.0f;
            [rootLayer addSublayer: nextLayer];
            
            CABasicAnimation *aniApacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0.3 withBeginTime:kAVSceneTransiteNextLayerOpacityBeginTime(beginTime, duration*0.3)];
            
            [nextLayer addAnimation:aniApacityOpen forKey:@"aniApacityOpen"];
            
            CALayer *whiteLayer = [CALayer layer];
            
            whiteLayer.frame = currentLayer.bounds;
            
            whiteLayer.backgroundColor = [UIColor whiteColor].CGColor;
            
            [rootLayer addSublayer: whiteLayer];
            
            [whiteLayer setMask: radialGradientLayer];
            whiteLayer.opacity = 0.0f;
        
            NSArray *keyTime = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0],
                                nil];
            
            NSArray *keyValues = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.97],[NSNumber numberWithFloat:0.0],
                                nil];
        
            CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:keyValues keyTimes:keyTime];
        
            
            [whiteLayer addAnimation:opacityAni forKey:@"opacityAni"];
            
            break;
        }
        default:
            break;
    }
    
    
}

@end
