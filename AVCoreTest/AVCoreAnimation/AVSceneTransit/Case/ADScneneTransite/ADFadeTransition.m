//
//  ADFadeTransition.m
//  AppLibrary
//
//  Created by Patrick Nollet on 14/03/11.
//  Copyright 2011 Applidium. All rights reserved.
//

#import "ADFadeTransition.h"

@implementation ADFadeTransition

- (id)initWithDuration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation * inFadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    inFadeAnimation.fromValue = @0.0f;
    inFadeAnimation.toValue = @1.0f;
    inFadeAnimation.duration = duration;
    inFadeAnimation.fillMode=kCAFillModeBoth;
    inFadeAnimation.beginTime =beginTime;
    
    CABasicAnimation * outFadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    outFadeAnimation.fromValue = @1.0f;
    outFadeAnimation.toValue = @0.0f;
    outFadeAnimation.duration = duration;
    outFadeAnimation.fillMode=kCAFillModeBoth;
    outFadeAnimation.beginTime =beginTime;
    
    
    self = [super initWithInAnimation:inFadeAnimation andOutAnimation:outFadeAnimation];
    return self;
}

@end
