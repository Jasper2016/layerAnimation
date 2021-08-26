//
//  AVSceneTransiteRotateToSale.m
//  TestVideoPreViewing
//
//  Created by mac on 15/3/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//  duration  2.0s 

#import "AVCommonCaseHeader.h"

#import "AVSceneTransiteRotateToSale.h"

#import "CAMultiColorLayer.h"

#define paramSale           2*1.6

#define paramSaleTwo        4*1.6

#define paramSaleThree      4*1.6

@implementation AVSceneTransiteRotateToSale

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    [rootLayer addSublayer: nextLayer];
    
    CAMultiColorLayer *colorLayerOne = [[CAMultiColorLayer alloc] init];
    
    colorLayerOne.frame = CGRectMake(0, 0, 600*paramSale, 600*paramSale);
    
    
    colorLayerOne.position = currentLayer.position;;
    
    
    NSArray *colorList = @[
                           (id)[[UIColor blueColor] colorWithAlphaComponent:0.3].CGColor,
                           (id)UIColorFromRGB(0xc41939).CGColor,
                           
                           ];
    
    NSArray *sideList = @[
                          [NSValue valueWithCGSize: CGSizeMake(600*paramSale, 400*paramSale)],
                          [NSValue valueWithCGSize: CGSizeMake(300*paramSale, 25*paramSale)],
                          
                          ];
    
    colorLayerOne.colorArr = colorList;
    
    colorLayerOne.sideArr = sideList;
    
    [colorLayerOne setNeedsDisplay];
    
    [currentLayer addSublayer: colorLayerOne];
    
    CATransform3D rotate45s = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    CATransform3D starttransform = CATransform3DScale(rotate45s, 0.01, 0.01, 1.0);
    
    CATransform3D endtransform = CATransform3DScale(rotate45s, 1.16, 1.16, 1.0);
    
    //  tempLayer.transform = starttransform;
    
    CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] transform3D:0.8 withBeginTime:0 fromValue:starttransform toValue:endtransform];
    
    CABasicAnimation *faleInOne =  [[AVBasicRouteAnimate defaultInstance] opacityFromTo:0.01 withBeginTime:0 fromValue:0.0 toValue:1.0];
    
    CAAnimationGroup *animationGroupOne = [[AVBasicRouteAnimate defaultInstance] groupAni:1.0 withBeginTime:beginTime aniArr: @[faleInOne,saleToOne]];
    
    animationGroupOne.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [colorLayerOne addAnimation: animationGroupOne forKey:@"sale"];
    colorLayerOne.opacity = 0;
    //    Second
    
    
    CAMultiColorLayer *colorLayerTwo = [[CAMultiColorLayer alloc] init];
    
    colorLayerTwo.frame = CGRectMake(0, 0, 160*paramSaleTwo, 160*paramSaleTwo);
    
    colorLayerTwo.position = currentLayer.position;;
    
    
    NSArray *colorListTwo = @[
                              (id)UIColorFromRGB(0xc36e47).CGColor,
                              (id)[[UIColor redColor] colorWithAlphaComponent:0.3].CGColor,
                              (id)[[UIColor redColor] colorWithAlphaComponent:0.15].CGColor,
                              ];
    
    NSArray *sideListTwo = @[
                             [NSValue valueWithCGSize: CGSizeMake(160*paramSaleTwo, 40*paramSaleTwo)],
                             [NSValue valueWithCGSize: CGSizeMake(90*paramSaleTwo, 20*paramSaleTwo)],
                             [NSValue valueWithCGSize: CGSizeMake(70*paramSaleTwo, 10*paramSaleTwo)],
                             
                             ];
    
    colorLayerTwo.colorArr = colorListTwo;
    
    colorLayerTwo.sideArr = sideListTwo;
    
    [colorLayerTwo setNeedsDisplay];
    
    [currentLayer addSublayer: colorLayerTwo];
    
    CATransform3D starttransformTwo = CATransform3DScale(rotate45s, 0.01, 0.01, 1.0);
    
    CATransform3D endtransformTwo = CATransform3DScale(rotate45s, 2.0, 2.0, 1.0);
    
    //  tempLayer.transform = starttransform;
    
    CABasicAnimation *saleToTwo = [[AVBasicRouteAnimate defaultInstance] transform3D:1.3 withBeginTime:0 fromValue:starttransformTwo toValue:endtransformTwo];
    
    CABasicAnimation *faleInTwo =  [[AVBasicRouteAnimate defaultInstance] opacityFromTo:0.01 withBeginTime:0 fromValue:0.0 toValue:1.0];
    
    CAAnimationGroup *animationGroupTwo = [[AVBasicRouteAnimate defaultInstance] groupAni:1.4 withBeginTime:beginTime+0.3 aniArr: @[saleToTwo,faleInTwo]];
    
    //animationGroupTwo.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [colorLayerTwo addAnimation: animationGroupTwo forKey:@"sale"];
    colorLayerTwo.opacity = 0;
    
    //three
    
    CAMultiColorLayer *colorLayerThree = [[CAMultiColorLayer alloc] init];
    
    colorLayerThree.frame = CGRectMake(0, 0, 160*paramSaleTwo, 160*paramSaleTwo);
    
    colorLayerThree.position = currentLayer.position;;
    
    
    NSArray *colorListThree = @[
                                (id)UIColorFromRGB(0x56739f).CGColor,
                                (id)UIColorFromRGB(0xc0a965).CGColor,
                                ];
    
    NSArray *sideListThree = @[
                               [NSValue valueWithCGSize: CGSizeMake(160*paramSaleTwo, 40*paramSaleTwo)],
                               [NSValue valueWithCGSize: CGSizeMake(110*paramSaleTwo, 20*paramSaleTwo)],
                               
                               
                               ];
    
    colorLayerThree.colorArr = colorListThree;
    
    colorLayerThree.sideArr = sideListThree;
    
    [colorLayerThree setNeedsDisplay];
    
    [currentLayer addSublayer: colorLayerThree];
    
    CATransform3D starttransformThree = CATransform3DScale(rotate45s, 0.01, 0.01, 1.0);
    
    CATransform3D endtransformThree = CATransform3DScale(rotate45s, 1.3, 1.3, 1.0);
    
    //  tempLayer.transform = starttransform;
    
    CABasicAnimation *saleToThree = [[AVBasicRouteAnimate defaultInstance] transform3D:1.5 withBeginTime:0 fromValue:starttransformThree toValue:endtransformThree];
    
    CABasicAnimation *scaleFaleIn =  [[AVBasicRouteAnimate defaultInstance] opacityFromTo:0.6 withBeginTime:0.8 fromValue:1.0 toValue:0.6];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:1.5 withBeginTime:beginTime+0.5 aniArr: @[scaleFaleIn,saleToThree]];
    
    [colorLayerThree addAnimation: animationGroup forKey:@"sale"];
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    colorLayerThree.opacity = 0;
    
    //Four
    
    CALayer *maskLayer = [CALayer layer];
    
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    
    maskLayer.frame = CGRectMake(0, 0, 90*paramSaleTwo, 90*paramSaleTwo);
    
    maskLayer.position = currentLayer.position;
    
    CATransform3D starttransformMask = CATransform3DScale(rotate45s, 0.01, 0.01, 1.0);
    
    CATransform3D endtransformMask = CATransform3DScale(rotate45s, 1.5, 1.5, 1.0);
    
    [nextLayer setMask: maskLayer];
    
    CABasicAnimation *saleToMask = [[AVBasicRouteAnimate defaultInstance] transform3D:1.4 withBeginTime:0 fromValue:starttransformMask toValue:endtransformMask];
    
    CABasicAnimation *scaleFaleMask =  [[AVBasicRouteAnimate defaultInstance] opacityFromTo:0.01 withBeginTime:0 fromValue:0.0 toValue:1.0];
    
    CAAnimationGroup *animationGroupMask = [[AVBasicRouteAnimate defaultInstance] groupAni:1.4 withBeginTime:beginTime+0.5 aniArr: @[scaleFaleMask,saleToMask]];
    
    [maskLayer addAnimation: animationGroupMask forKey:@"sale"];
    
    animationGroupMask.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    maskLayer.opacity = 0;

}


@end
