//
//  AVSTransiteWhiteColorFadeInOut.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/14.
//  Copyright (c) 2015年 mac. All rights reserved.
//    1s 

#import "AVSTransiteWhiteColorFadeInOut.h"

#import "AVSceneTransitEnumType.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

@implementation AVSTransiteWhiteColorFadeInOut

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    
    [rootLayer addSublayer: nextLayer];
    
    nextLayer.maskLayer.opacity = 0;
    
    switch (transiteFactor) {
        case AVSTFadeInOutMyMask:
        {
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime];
            
            [nextLayer.maskLayer addAnimation: opacityOpen forKey:@"opacityOpen"];
            
            break;
        }
            
        case AVSTWhiteColorFadeInOutSample:
        {
            
            CALayer *whitelLayer = [CALayer layer];
            
            whitelLayer.backgroundColor = [UIColor whiteColor].CGColor;
            
            whitelLayer.frame = nextLayer.bounds;
            
            [rootLayer addSublayer: whitelLayer];
            
            NSArray *alphaValues = @[
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:0.96],
                                     [NSNumber numberWithFloat:0.96],
                                     [NSNumber numberWithFloat:0],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.45],
                                 [NSNumber numberWithFloat:0.6],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CAKeyframeAnimation *alphaAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaValues keyTimes:keyTime];
            alphaAni.fillMode=kCAFillModeBoth;
            
            [whitelLayer addAnimation:alphaAni forKey:@"alphaAni"];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime+(duration*0.5)];
            
            [nextLayer.maskLayer addAnimation: opacityOpen forKey:@"opacityOpen"];

            
            break;
        }
            
        case AVSTWhiteColorFadeInOutGlitEffect:
        {
            
            CAGradientLayer * whitelLayer = [CAGradientLayer layer];
            whitelLayer.frame =kAVRectWindow;
            [rootLayer addSublayer:whitelLayer];
            
            whitelLayer.startPoint = CGPointMake(0.0, 0.0);
            whitelLayer.endPoint = CGPointMake(1.0, 1.0);
            
            whitelLayer.colors = @[
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor,
                                   (id) [[UIColor whiteColor]colorWithAlphaComponent:0.3].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.6].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.3].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.8].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.6].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.7].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor,
                                   ];
            
            [rootLayer addSublayer: whitelLayer];
            
            NSArray *alphaValues = @[
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:1],
                                     [NSNumber numberWithFloat:1],
                                     [NSNumber numberWithFloat:0],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.45],
                                 [NSNumber numberWithFloat:0.7],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            
            CAKeyframeAnimation *alphaAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaValues keyTimes:keyTime];
            alphaAni.fillMode=kCAFillModeBoth;
            
            [whitelLayer addAnimation:alphaAni forKey:@"alphaAni"];
            
            
            
            CALayer *whitelBgLayer = [CALayer layer];
            
            whitelBgLayer.backgroundColor = [UIColor whiteColor].CGColor;
            
            whitelBgLayer.frame = nextLayer.bounds;
            
            [rootLayer addSublayer: whitelBgLayer];
            
            NSArray *alphaValues2 = @[
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:0.90],
                                      [NSNumber numberWithFloat:0.90],
                                      [NSNumber numberWithFloat:0],
                                      ];
            
            NSArray *keyTime2 = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:1],
                                  ];
            
            CAKeyframeAnimation *whiteBgAlphaAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration-(duration*0.3) withBeginTime:beginTime+(duration*0.4) propertyName:kAVBasicAniOpacity values:alphaValues2 keyTimes:keyTime2];
            whiteBgAlphaAni.fillMode=kCAFillModeBoth;
            
            [whitelBgLayer addAnimation:whiteBgAlphaAni forKey:@"alphaAni"];
            
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime+(duration*0.7) isAnimate:NO];
            
            [nextLayer.maskLayer addAnimation: opacityOpen forKey:@"opacityOpen"];

            
            break;
        }
            
        case AVSTWhiteColorFlashingLightsEffect:
        {
            
            nextLayer.maskLayer.opacity = 0;
            
            
            CAGradientLayer * whitelLayer = [CAGradientLayer layer];
            whitelLayer.frame =kAVRectWindow;
            [rootLayer addSublayer:whitelLayer];
            
            whitelLayer.startPoint = CGPointMake(0.0, 0.0);
            whitelLayer.endPoint = CGPointMake(1.0, 1.0);
            
            whitelLayer.colors = @[
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor,
                                   (id) [[UIColor whiteColor]colorWithAlphaComponent:0.3].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.6].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.5].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.6].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.7].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.5].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.5].CGColor,
                                   (id)[[UIColor whiteColor]colorWithAlphaComponent:0.2].CGColor,
                                   ];
            
            [currentLayer addSublayer: whitelLayer];
            
            NSArray *alphaValues = @[
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:1],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            
            CAKeyframeAnimation *alphaAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.2 withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaValues keyTimes:keyTime];
            alphaAni.fillMode=kCAFillModeBoth;
            
            alphaAni.repeatCount= 6;
            
            [whitelLayer addAnimation:alphaAni forKey:@"alphaAni"];
            
            
            
            
            CALayer *whitelBgLayer = [CALayer layer];
            
            whitelBgLayer.backgroundColor = [UIColor whiteColor].CGColor;
            
            whitelBgLayer.frame = nextLayer.bounds;
            
            [rootLayer addSublayer: whitelBgLayer];
            
            NSArray *alphaValues2 = @[
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:0.93],
                                      [NSNumber numberWithFloat:0.93],
                                      [NSNumber numberWithFloat:0],
                                      ];
            
            NSArray *keyTime2 = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:1],
                                  ];
            
            CAKeyframeAnimation *whiteBgAlphaAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration-(duration*0.3) withBeginTime:beginTime+(duration*0.4) propertyName:kAVBasicAniOpacity values:alphaValues2 keyTimes:keyTime2];
            whiteBgAlphaAni.fillMode=kCAFillModeBoth;
            
            [whitelBgLayer addAnimation:whiteBgAlphaAni forKey:@"alphaAni"];
            
            
            
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime+(duration*0.7) isAnimate:NO];
            
            [nextLayer.maskLayer addAnimation: opacityOpen forKey:@"opacityOpen"];

            
            
            break;
        }
        default:
            break;
    }
}

@end
