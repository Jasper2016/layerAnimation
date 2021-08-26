//
//  WeddingWhiteStartLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/3/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "WeddingWhiteStartLayer.h"

#import "AVBasicRouteAnimate.h"

#import "AVTentLayer.h"

@implementation WeddingWhiteStartLayer


- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef
{
    self = [super initWithFrame:frame bgColor:colorRef];
    if (self) {
        
        
        
    }
    return self;
}

- (void) showTextInfo:(NSString *)one two:(NSString *)two withBeginTime:(CFTimeInterval)beginTime
{
    UIImage *weddingIconOneImage = [UIImage imageNamed:@"kWeddingWhiteIcon1.png"];
    
    CALayer *weddingIconLayer = [CALayer layer];
    
    weddingIconLayer.frame = CGRectMake( 0, 0,weddingIconOneImage.size.width , weddingIconOneImage.size.height);
    
    weddingIconLayer.position = CGPointMake(self.position.x,  weddingIconOneImage.size.height/2);
    
    weddingIconLayer.contents = (id)weddingIconOneImage.CGImage;
    
    //weddingIconLayer.contentsGravity=kCAGravityResizeAspect;
    
    [self addSublayer: weddingIconLayer];
    
    //  kWeddingWhiteLine
    UIImage *weddingIconLineImage = [UIImage imageNamed:@"kWeddingWhiteLine.png"];
    
    AVTentLayer *tentLayer = [[AVTentLayer alloc] initWithFrame:CGRectMake(10 ,60 , weddingIconLineImage.size.width ,140)];
    
    [self addSublayer: tentLayer];
    
    tentLayer.opacity = 0.0f;
    
    CABasicAnimation *tendopacityOpenAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0.3 withBeginTime:beginTime];
    
    [tentLayer addAnimation:tendopacityOpenAni forKey:@"asdfg"];
    
    
    tentLayer.anchorPoint = CGPointMake(0.5, 0);
    
    [tentLayer showTextInfo:one two:two];
    
    NSValue *fromSize = [NSValue valueWithCGRect:CGRectMake(0, 0,  tentLayer.frame.size.width, 1)];
    
    NSValue *endSize = [NSValue valueWithCGRect:CGRectMake(0, 0,  tentLayer.frame.size.width, 125)];
    
    CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] customBasic:2 withBeginTime:beginTime fromValue:fromSize toValue:endSize propertyName:@"bounds"];
    
    saleToOne.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    tentLayer.masksToBounds = YES;
    
    [tentLayer addAnimation: saleToOne forKey:@"sale"];
    
    
    //end
    UIImage *weddingIconEndImage = [UIImage imageNamed:@"kWeddingWhiteIcon2.png"];
    
    CALayer *weddingIconEndLayer = [CALayer layer];
    
    weddingIconEndLayer.frame = CGRectMake( 0, 104,weddingIconEndImage.size.width , weddingIconEndImage.size.height);
    
    weddingIconEndLayer.position = CGPointMake(self.position.x,  310);
    
    weddingIconEndLayer.contents = (id)weddingIconEndImage.CGImage;
    
    weddingIconEndLayer.contentsGravity=kCAGravityResizeAspect;
    
    [self addSublayer: weddingIconEndLayer];
    
    weddingIconEndLayer.opacity = 0.0f;
    
    CABasicAnimation *opacityOpenendAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0.5 withBeginTime:beginTime+1.7];
    
    [weddingIconEndLayer addAnimation:opacityOpenendAni forKey:@"dfs"];
    
    
    
    //MOVE
    CALayer *weddingLineEndLayer = [CALayer layer];
    
    weddingLineEndLayer.frame = CGRectMake(20, 60, weddingIconLineImage.size.width-100, 1);
    
    weddingLineEndLayer.anchorPoint = CGPointMake(0.5, 0);
    
    weddingLineEndLayer.contents = (id)weddingIconLineImage.CGImage;
    
    //weddingLineEndLayer.contentsGravity=kCAGravityResizeAspectFill;
    
    [self addSublayer: weddingLineEndLayer];
    
    CABasicAnimation *moveLineToOne = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:2 withBeginTime:beginTime fromValue:CGPointMake(self.position.x, 131) toValue:CGPointMake(self.position.x, 260)];
    
    [weddingLineEndLayer addAnimation: moveLineToOne forKey:@"sale"];
}
@end
