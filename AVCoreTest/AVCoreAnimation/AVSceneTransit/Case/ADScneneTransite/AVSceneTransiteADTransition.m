//
//  AVSceneTransiteADTransition.m
//  RadialGradientLayerSample
//
//  Created by mac on 15/2/4.
//  Copyright (c) 2015年 Cocoapps. All rights reserved.
//

#import "AVSceneTransiteADTransition.h"
#import <QuartzCore/CoreAnimation.h>
#import <objc/runtime.h>

#import "ADTransitionController.h"

@implementation AVSceneTransiteADTransition

+ (void)transitionfromView:(CALayer *)layerOut toView:(CALayer *)layerIn withTransition:(ADTransition *)transition
{
    layerIn.doubleSided = NO;
    layerOut.doubleSided = NO;
    
    transition.type = ADTransitionTypePush;
    
    [self _setupLayers:@[layerIn, layerOut]];
    [CATransaction setCompletionBlock:^{
        [self _teardownLayers:@[layerIn, layerOut]];
        
    }];
    
    if ([transition isKindOfClass:[ADTransformTransition class]]) { // ADTransformTransition
        
        UIView *wrapperView = [[ADTransitionView alloc] initWithFrame: layerOut.bounds];
        
        [layerOut.superlayer addSublayer: wrapperView.layer];
        
        [wrapperView.layer addSublayer: layerIn];
        
        [wrapperView.layer addSublayer: layerOut];
        
        CALayer *_containerLayer = wrapperView.layer;
        
        [transition setCompletedBlock:^(BOOL isSuccess, NSString *errorMsg) {
            
            CALayer *contextView = layerOut.superlayer.superlayer;
            
            layerOut.frame = _containerLayer.frame;
            [contextView addSublayer:layerOut];
            
            layerIn.frame = _containerLayer.frame;
            [contextView addSublayer:layerIn];
            [_containerLayer removeFromSuperlayer];
            
        }];
        
        ADTransformTransition * transformTransition = (ADTransformTransition *)transition;
        layerIn.transform = transformTransition.inLayerTransform;
        layerOut.transform = transformTransition.outLayerTransform;

        CAKeyframeAnimation * outKeyFrameOpacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        outKeyFrameOpacityAnimation.values = @[@0.5f,
                                               @1.0f];
        outKeyFrameOpacityAnimation.duration = transformTransition.animation.duration;
        //outKeyFrameOpacityAnimation.fillMode=kCAFillModeBoth;
       // outKeyFrameOpacityAnimation.beginTime  =transformTransition.animation.beginTime;
        [layerIn addAnimation:outKeyFrameOpacityAnimation forKey:nil];

        
        // We now balance viewIn.layer.transform by taking its invert and putting it in the superlayer of viewIn.layer
        // so that viewIn.layer appears ok in the final state.
        // (When pushing, viewIn.layer.transform == CATransform3DIdentity)
        _containerLayer.transform = CATransform3DInvert(layerIn.transform);
        
        [_containerLayer addAnimation:transformTransition.animation forKey:nil];
        
        
    } else if ([transition isKindOfClass:[ADDualTransition class]]) { // ADDualTransition
        
        [transition setCompletedBlock:^(BOOL isSuccess, NSString *errorMsg) {
            
            [layerOut removeFromSuperlayer];
            
        }];
        
        [layerOut.superlayer addSublayer: layerIn];
        
        ADDualTransition * dualTransition = (ADDualTransition *)transition;
        [layerIn addAnimation:dualTransition.inAnimation forKey:nil];
        [layerOut addAnimation:dualTransition.outAnimation forKey:nil];
    } else if (transition != nil) {
        NSAssert(FALSE, @"Unhandled ADTransition subclass!");
    }
}

+ (void)_teardownLayers:(NSArray *)layers {
    for (CALayer * layer in layers) {
        layer.shouldRasterize = NO;
    }
}

+ (void)_setupLayers:(NSArray *)layers {
    for (CALayer * layer in layers) {
        layer.shouldRasterize = YES;
        layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
}

@end
