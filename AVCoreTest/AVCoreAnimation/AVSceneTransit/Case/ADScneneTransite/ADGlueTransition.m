//
//  ADGlueTransition.m
//  ADTransitionController
//
//  Created by Pierre Felgines on 29/05/13.
//  Copyright (c) 2013 Applidium. All rights reserved.
//

#import "ADGlueTransition.h"
#import <UIKit/UIKit.h>

@implementation ADGlueTransition

- (id)initWithDuration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sourceRect:(CGRect)sourceRect {
    const CGFloat viewWidth = sourceRect.size.width;
    const CGFloat viewHeight = sourceRect.size.height;
    const CGFloat widthAngle = M_PI / 4.0f;
    const CGFloat heightAngle = M_PI / 6.0f;
    
    CABasicAnimation * inSwipeAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    inSwipeAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    CGPoint anchorPoint;
    CATransform3D startTranslation;
    CATransform3D rotation;
    switch (transiteFactor) {
        case ADTransitionRightToLeft:
        {
            inSwipeAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(1.5 *viewWidth, 0.0f, 0.0f)];
            anchorPoint = CGPointMake(0, 0.5f);
            startTranslation = CATransform3DMakeTranslation(-viewWidth * 0.5f, 0, 0);
            rotation = CATransform3DRotate(startTranslation,widthAngle, 0, 1.0f, 0);
        }
            break;
        case ADTransitionLeftToRight:
        {
            inSwipeAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(- 1.5 * viewWidth, 0.0f, 0.0f)];
            anchorPoint = CGPointMake(1.0f, 0.5f);
            startTranslation = CATransform3DMakeTranslation(viewWidth * 0.5f, 0, 0);
            rotation = CATransform3DRotate(startTranslation, -widthAngle, 0, 1.0f, 0);
        }
            break;
        case ADTransitionTopToBottom:
        {
            inSwipeAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0f, - 1.5 * viewHeight, 0.0f)];
            anchorPoint = CGPointMake(0.5f, 1.0f);
            startTranslation = CATransform3DMakeTranslation(0, viewHeight * 0.5f, 0);
            rotation = CATransform3DRotate(startTranslation, heightAngle, 1.0f, 0, 0);
        }
            break;
        case ADTransitionBottomToTop:
        {
            inSwipeAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0f, 1.5 * viewHeight, 0.0f)];
            anchorPoint = CGPointMake(0.5f, 0);
            startTranslation = CATransform3DMakeTranslation(0, -viewHeight * 0.5f, 0);
            rotation = CATransform3DRotate(startTranslation, -heightAngle, 1.0f, 0, 0);
        }
            break;
        default:
            NSAssert(FALSE, @"Unhandled ADTransitionOrientation");
            break;
    }
    inSwipeAnimation.duration = duration;

    CABasicAnimation * inPositionAnimation = [CABasicAnimation animationWithKeyPath:@"zPosition"];
    inPositionAnimation.fromValue = @-0.001;
    inPositionAnimation.toValue = @-0.001;
    inPositionAnimation.duration = duration;
    
    CAKeyframeAnimation * inKeyFrameOpacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    inKeyFrameOpacityAnimation.values = @[@0.0f,
                                          // @0.0f,
                                          // @0.5f,
                                          @1.0f];
    
    CAAnimationGroup * inAnimation = [CAAnimationGroup animation];
    inAnimation.animations = @[inSwipeAnimation, inPositionAnimation, inKeyFrameOpacityAnimation];
    inAnimation.duration = duration;
    inAnimation.fillMode=kCAFillModeBoth;
    inAnimation.beginTime =beginTime;
    
    
    CATransform3D endTranslation = CATransform3DTranslate(startTranslation, 0, 0, -viewWidth * 0.7f);
    
    CABasicAnimation * outAnchorPointAnimation = [CABasicAnimation animationWithKeyPath:@"anchorPoint"];
    outAnchorPointAnimation.fromValue = [NSValue valueWithCGPoint:anchorPoint];
    outAnchorPointAnimation.toValue = [NSValue valueWithCGPoint:anchorPoint];
    
    CAKeyframeAnimation * outTransformKeyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    outTransformKeyFrameAnimation.values = @[[NSValue valueWithCATransform3D:startTranslation], [NSValue valueWithCATransform3D:rotation], [NSValue valueWithCATransform3D:endTranslation]];
    outTransformKeyFrameAnimation.timingFunctions = [self getCircleApproximationTimingFunctions];
    
    CAKeyframeAnimation * outOpacityKeyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    outOpacityKeyFrameAnimation.values = @[@1.0f, @1.0f, @0.0f];
    
    CAAnimationGroup * outAnimation = [CAAnimationGroup animation];
    [outAnimation setAnimations:@[outOpacityKeyFrameAnimation, outTransformKeyFrameAnimation, outAnchorPointAnimation]];
    outAnimation.duration = duration;
    outAnimation.fillMode=kCAFillModeBoth;
    outAnimation.beginTime =beginTime;
    
    self = [super initWithInAnimation:inAnimation andOutAnimation:outAnimation];
    return self;
}

@end
