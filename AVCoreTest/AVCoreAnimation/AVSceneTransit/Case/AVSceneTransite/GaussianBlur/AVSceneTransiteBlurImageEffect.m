//
//  AVSceneTransiteBlurImageEffect.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/14.
//  Copyright (c) 2015年 mac. All rights reserved.
// duration: 1.45

#import "AVSceneTransiteBlurImageEffect.h"

#import "UIImage+BoxBlur.h"

#import "AVCommonHeader.h"

@implementation AVSceneTransiteBlurImageEffect

+(void)blurEffect:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    
    [rootLayer addSublayer: nextLayer];
    nextLayer.opacity = 0.0f;
    
    CALayer *nextMastLayer = [CALayer layer];
    nextMastLayer.backgroundColor = [UIColor clearColor].CGColor;
    nextMastLayer.frame = currentLayer.bounds;
    [rootLayer addSublayer: nextMastLayer];
    nextMastLayer.opacity = 0.0f;
    UIImage *nextImage = [[UIImage alloc] initWithCGImage:(__bridge CGImageRef)(nextLayer.contentLayer.contents)];
    UIImage *blurNextImage = [nextImage  drn_boxblurImageWithBlur:0.9];
    nextMastLayer.contents = (id)blurNextImage.CGImage;
    
    CALayer *currentMastLayer = [CALayer layer];
    currentMastLayer.backgroundColor = [UIColor clearColor].CGColor;
    currentMastLayer.frame = currentLayer.bounds;
    [rootLayer addSublayer: currentMastLayer];
    currentMastLayer.opacity = 0.0f;
    UIImage *currentImage = [[UIImage alloc] initWithCGImage:(__bridge CGImageRef)(currentLayer.contentLayer.contents)];
    UIImage *blurImage = [currentImage  drn_boxblurImageWithBlur:0.9];
    currentMastLayer.contents = (id)blurImage.CGImage;
    
    NSArray *keyTime ;  NSArray *keyValues;
    
    keyTime = @[[NSNumber numberWithFloat:0.0f],
                [NSNumber numberWithFloat:0.6f],
                [NSNumber numberWithFloat:1.0f],
                ];
    
    keyValues = @[[NSNumber numberWithFloat:0.0f],
                [NSNumber numberWithFloat:1.0f],
                [NSNumber numberWithFloat:0.0f],
                ];

    
    CAKeyframeAnimation *opacityInOutAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration-kBirdAciteDuration-kOpacityDuration withBeginTime:kBTimeOffset(beginTime,0) propertyName:kAVBasicAniOpacity values:keyValues keyTimes:nil];
    opacityInOutAni.fillMode=kCAFillModeBoth;
    opacityInOutAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [currentMastLayer addAnimation:opacityInOutAni  forKey:@"opacityInOutAni"];
    
    CAKeyframeAnimation *opacityInOutNextAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration-kBirdAciteDuration-kOpacityDuration withBeginTime:kBTimeOffset(beginTime,0.25) propertyName:kAVBasicAniOpacity values:keyValues keyTimes:nil];
    opacityInOutNextAni.fillMode=kCAFillModeBoth;
    opacityInOutNextAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [nextMastLayer addAnimation:opacityInOutNextAni  forKey:@"opacityInOutNextAni"];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:kBirdAciteDuration withBeginTime:kBTimeOffset(beginTime,0.3)];
    
    [nextLayer addAnimation:opacityOpenAni  forKey:@"opacityOpenAni"];
    
}

@end
