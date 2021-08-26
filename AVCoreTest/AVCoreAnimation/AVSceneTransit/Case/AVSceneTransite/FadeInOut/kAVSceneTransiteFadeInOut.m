//
//  kAVSceneTransiteFadeInOut.m
//  TestVideoPreViewing
//
//  Created by mac on 15/1/23.
//  Copyright (c) 2015年 mac. All rights reserved.
// durion : 1

#import "kAVSceneTransiteFadeInOut.h"

#import "AVSceneAniEnumType.h"

#import "AVCommonHeader.h"

#import "AVSceneTransite.h"


#define UIColorFromHexAlpha(hexValue, a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]


@implementation kAVSceneTransiteFadeInOut

+ (NSArray *)getGradientColors
{
    return [NSArray arrayWithObjects:
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.99) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.95) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.9) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.8) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.7) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.6) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.5) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.4) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.3) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.2) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.1) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.05) CGColor],
            (id)[UIColorFromHexAlpha(0xffffff, 0.01) CGColor],
            nil];
}

+(void)sceneGradientFadeSlide:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    CAGradientLayer  *maskLayer = [CAGradientLayer layer];
    
    CGPoint nextPosition ;
    
    switch (transiteFactor)
    {
        case AVAniXYRightToLeft:
        {
            maskLayer.startPoint = CGPointMake(1, 0.5);
            maskLayer.endPoint = CGPointMake(0, 0.5);
            maskLayer.frame = CGRectMake(nextLayer.frame.size.width, 0, 2*nextLayer.frame.size.width, nextLayer.frame.size.height);
            
            nextPosition = CGPointMake( maskLayer.position.x - maskLayer.frame.size.width,  maskLayer.position.y);
            
            break;
        }
        case AVAniXYLeftToRight:
        {
            maskLayer.startPoint = CGPointMake(0, 0.5);
            maskLayer.endPoint = CGPointMake(1, 0.5);
            maskLayer.frame = CGRectMake(-2*nextLayer.frame.size.width, 0, 2*nextLayer.frame.size.width, nextLayer.frame.size.height);
            
            nextPosition = CGPointMake(maskLayer.position.x + maskLayer.frame.size.width, maskLayer.position.y);
            break;
        }
        case AVAniXYTopToBottom:
        {
            maskLayer.startPoint = CGPointMake(0.5, 0);
            maskLayer.endPoint = CGPointMake(0.5, 1);
            maskLayer.frame = CGRectMake(0, -2*nextLayer.frame.size.height, nextLayer.frame.size.width, 2*nextLayer.frame.size.height);
            
            nextPosition = CGPointMake( maskLayer.position.x,  maskLayer.position.y + maskLayer.frame.size.height);
            break;
        }
        case AVAniXYBottomToTop:
        {
            maskLayer.startPoint = CGPointMake(0.5, 1);
            maskLayer.endPoint = CGPointMake(0.5, 0);
            maskLayer.frame = CGRectMake(0, nextLayer.frame.size.height, nextLayer.frame.size.width, 2*nextLayer.frame.size.height);
            
            nextPosition = CGPointMake( maskLayer.position.x,  maskLayer.position.y - maskLayer.frame.size.height);
            break;
        }
    
    }

    [rootLayer addSublayer: nextLayer];
    
    CABasicAnimation *opacityToAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:kAVSceneTransiteNextLayerOpacityDuration withBeginTime:beginTime];
    
    [nextLayer addAnimation:opacityToAni forKey:@"opacityToAni"];
    
    [nextLayer setMask: maskLayer];
    
    maskLayer.colors = [self getGradientColors];
    
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue: nextPosition];
    
    [maskLayer addAnimation: moveAni forKey:@"moveAni"];
    
}

@end
