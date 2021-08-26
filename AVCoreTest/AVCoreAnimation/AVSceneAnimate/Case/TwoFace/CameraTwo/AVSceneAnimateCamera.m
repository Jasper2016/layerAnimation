//
//  AVSceneAnimateCamera.m
//  TestVideoPreViewing
//
//  Created by mac on 15/1/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAnimateCamera.h"

#import "AVCommonHeader.h"

#import "AVRectUnit.h"

#import "AVConstant.h"

#import "CAMediaTimingFunction+AdditionalEquations.h"

#import "AVAniScaleSlowBasic.h"

@implementation AVSceneAnimateCamera

#pragma mark Singleton methods
#pragma mark 单例方法

static AVSceneAnimateCamera *defaultInstance = nil;

+ (AVSceneAnimateCamera *)defaultInstance
{
    @synchronized(self){
        if (defaultInstance == nil) {
            defaultInstance = [[AVSceneAnimateCamera alloc] init];
            
        }
    }
    return defaultInstance;
}

-(CGVector)getScaleRadio:(CGRect)faceAwareRect partArea:(CGRect)partArea
{
    CGFloat radioWidth =  faceAwareRect.size.width/partArea.size.width;
    
    CGFloat radioHight =  faceAwareRect.size.height/partArea.size.height;
    
    CGVector radio = CGVectorMake(radioWidth, radioHight);
    
    return radio;
}

-(CAAnimationGroup *)cameraMovePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea endArea:(CGRect)endArea windowArea:(CGRect)windowArea
{
    CGVector startParma = [self getScaleRadio:windowArea partArea:startArea];
    
    CGVector endParma = [self getScaleRadio:windowArea partArea:endArea];
    
    //start
    CGPoint startCenterPoint= [AVRectUnit getScaleEndCenterPoint:startParma startFrame:startArea endFrame:windowArea];
    
    //end
    CGPoint endCenterPoint= [AVRectUnit getScaleEndCenterPoint:endParma startFrame:endArea endFrame:windowArea];
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:0 fromValue:startCenterPoint toValue:endCenterPoint];
    
    CABasicAnimation *saleTo1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:0 fromValue:startParma.dy toValue: endParma.dy];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,saleTo1]];
    
    
    return animationGroup;
}

-(CAAnimationGroup *)cameraMoveAnglePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea startAngle:(CGFloat)startAngle endArea:(CGRect)endArea endAngle:(CGFloat)endAngle windowArea:(CGRect)windowArea
{
    CGVector startParma = [self getScaleRadio:windowArea partArea:startArea];
    
    CGVector endParma = [self getScaleRadio:windowArea partArea:endArea];
    
    //start
    CGPoint startCenterPoint= [AVRectUnit getScaleEndCenterPoint:startParma startFrame:startArea endFrame:windowArea];
    
    //end
    CGPoint endCenterPoint= [AVRectUnit getScaleEndCenterPoint:endParma startFrame:endArea endFrame:windowArea];
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:0 fromValue:startCenterPoint toValue:endCenterPoint];
    
    CABasicAnimation *saleTo1 = [[AVBasicRouteAnimate alloc] scaleTo:duration withBeginTime:0 fromValue:startParma.dy toValue: endParma.dy];
    
    CABasicAnimation *angleAni = nil;
    if ((startAngle != 0) || (endAngle != 0)){
        
        angleAni = [[AVBasicRouteAnimate alloc] rotationZ:duration withBeginTime:0 fromValue:startAngle toValue:endAngle];
        angleAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    }
    
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,saleTo1, angleAni]];
    
    
    return animationGroup;
}


-(CAAnimationGroup *)cameraMoveThreePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea  secondArea:(CGRect)secondArea endArea:(CGRect)endArea windowArea:(CGRect)windowArea
{
    CGVector startParma = [self getScaleRadio:windowArea partArea:startArea];
    
    CGVector secondParma = [self getScaleRadio:windowArea partArea:secondArea];
    
    CGVector endParma = [self getScaleRadio:windowArea partArea:endArea];
    
    //start
    CGPoint startCenterPoint= [AVRectUnit getScaleEndCenterPoint:startParma startFrame:startArea endFrame:windowArea];
    
    //second
    CGPoint secondCenterPoint= [AVRectUnit getScaleEndCenterPoint:secondParma startFrame:secondArea endFrame:windowArea];
    
    //end
    CGPoint endCenterPoint= [AVRectUnit getScaleEndCenterPoint:endParma startFrame:endArea endFrame:windowArea];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.3],
                         [NSNumber numberWithFloat:0.7],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:startCenterPoint],
                              [NSValue valueWithCGPoint:secondCenterPoint],
                              [NSValue valueWithCGPoint:secondCenterPoint],
                              [NSValue valueWithCGPoint:endCenterPoint],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:startParma.dy],
                             [NSNumber numberWithFloat:secondParma.dy],
                             [NSNumber numberWithFloat:secondParma.dy],
                             [NSNumber numberWithFloat:endParma.dy],
                             
                             ];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    
    return animationGroup;
}

-(ScaleEndCenterRadio)getScaleEndAreaCenter:(CGRect)partArea contendRect:(CGRect)contendRect
{
    if (contendRect.size.width > contendRect.size.height){
        // 横图
        CGFloat rectRadio =  kAVRectWindow.size.height/partArea.size.height;
        
        CGFloat scaleEndOriginX = CGRectGetMidX(kAVRectWindow)- (CGRectGetMidX(contendRect)*rectRadio);
        
        CGFloat scaleEndOriginY = CGRectGetMidY(contendRect)- (CGRectGetMidY(contendRect)*rectRadio);
        
        CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
        
        CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(partArea)*rectRadio)-scaleEndOrigin.x-(partArea.origin.x*2*rectRadio),
                                                 (CGRectGetMidY(partArea)*rectRadio)-scaleEndOrigin.y-(partArea.origin.y*2*rectRadio));
        
        
        return ScaleRadioMake(scaleEndAreaCenter, rectRadio);
        
    }else{
        
        //竖图
        CGFloat rectRadio =  kAVRectWindow.size.height/partArea.size.height;
        
        CGFloat scaleEndOriginX = CGRectGetMidX(contendRect)- (CGRectGetMidX(contendRect)*rectRadio);
        
        CGFloat scaleEndOriginY = CGRectGetMidY(kAVRectWindow)- (CGRectGetMidY(contendRect)*rectRadio);
        
        CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
        
        CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(partArea)*rectRadio)-scaleEndOrigin.x-(partArea.origin.x*2*rectRadio),
                                                 (CGRectGetMidY(partArea)*rectRadio)-scaleEndOrigin.y-(partArea.origin.y*2*rectRadio));
        
        return ScaleRadioMake(scaleEndAreaCenter, rectRadio);
        
        
    }
}

-(CAAnimationGroup *)cameraMovePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(FaceRectMode)startArea twoArea:(FaceRectMode)twoArea endArea:(FaceRectMode)endArea windowArea:(CGRect)windowArea twoSpeed:(CGFloat)twoKeyTime;
{
    
    NSArray *keyValues = @[
                           [NSValue valueWithCGPoint:startArea.windowsCenter],
                           [NSValue valueWithCGPoint:twoArea.windowsCenter],
                           [NSValue valueWithCGPoint:endArea.windowsCenter],
                           ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0.0],
                         [NSNumber numberWithFloat:twoKeyTime],
                         [NSNumber numberWithFloat:1.0],
                         ];
    
    
    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:keyValues keyTimes:keyTime];
    moveCenter1.fillMode=kCAFillModeBoth;
    
    
    NSArray *scaleKeyValues = @[
                                [NSNumber numberWithFloat:startArea.windowsRadio],
                                [NSNumber numberWithFloat:twoArea.windowsRadio],
                                [NSNumber numberWithFloat:endArea.windowsRadio],
                                ];
    
    
    CAKeyframeAnimation *saleTo1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleKeyValues keyTimes:keyTime];
    moveCenter1.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,saleTo1]];
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animationGroup;
}

-(CAKeyframeAnimation *)centerAniMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startCenter:(CGPoint)startCenter endCenter:(CGPoint)endCenter timingFunction:(CAMediaTimingFunction* )timeFunctions
{
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:startCenter],
                              [NSValue valueWithCGPoint:endCenter],
                              ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    
    scaleAni.fillMode=kCAFillModeBoth;
    
    if (timeFunctions) {
        
        scaleAni.timingFunction = timeFunctions;
    }
    
    return scaleAni;
}

-(CAKeyframeAnimation *)centerAniMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startCenter:(CGPoint)startCenter endCenter:(CGPoint)endCenter
{
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:startCenter],
                              [NSValue valueWithCGPoint:endCenter],
                              ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    
    scaleAni.fillMode=kCAFillModeBoth;
    
    return scaleAni;
}

-(CAAnimationGroup *)cameraNotMovePath:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(FaceRectMode)startArea twoArea:(FaceRectMode)twoArea endArea:(FaceRectMode)endArea windowArea:(CGRect)windowArea
{
    
    
    NSArray *keyValues = @[
                           [NSValue valueWithCGPoint:startArea.windowsCenter],
                           [NSValue valueWithCGPoint:startArea.windowsCenter],
                           
                           [NSValue valueWithCGPoint:twoArea.windowsCenter],
                           [NSValue valueWithCGPoint:twoArea.windowsCenter],
                           
                           [NSValue valueWithCGPoint:endArea.windowsCenter],
                           [NSValue valueWithCGPoint:endArea.windowsCenter],
                           ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0.0],
                         [NSNumber numberWithFloat:0.3],
                         
                         [NSNumber numberWithFloat:0.30001],
                         [NSNumber numberWithFloat:0.6],
                         
                         [NSNumber numberWithFloat:0.60001],
                         [NSNumber numberWithFloat:1.0],
                         ];
    
    
    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:keyValues keyTimes:keyTime];
    moveCenter1.fillMode=kCAFillModeBoth;
    
    
    NSArray *scaleKeyValues = @[
                                [NSNumber numberWithFloat:startArea.windowsRadio],
                                [NSNumber numberWithFloat:startArea.windowsRadio+AVScaleSlowOffsetTime],
                                
                                [NSNumber numberWithFloat:twoArea.windowsRadio],
                                [NSNumber numberWithFloat:twoArea.windowsRadio+AVScaleSlowOffsetTime],
                                
                                [NSNumber numberWithFloat:endArea.windowsRadio],
                                [NSNumber numberWithFloat:endArea.windowsRadio+AVScaleSlowOffsetTime],
                                ];
    
    
    CAKeyframeAnimation *saleTo1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleKeyValues keyTimes:keyTime];
    moveCenter1.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,saleTo1]];
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animationGroup;
}

-(CAAnimationGroup *)cameraMoveXY:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime startArea:(CGRect)startArea endArea:(CGRect)endArea windowArea:(CGRect)windowArea timingFunctoin:(CAMediaTimingFunction *)timingFunction
{
    
    CGFloat distance = (startArea.origin.x == endArea.origin.x)? kGetYDistance(startArea, endArea): kGetXDistance(startArea, endArea);
    
    CGFloat tempDuration = (distance*KScaleSlowFullDuration)/KScaleSlowFactorOffset;
    
    CGFloat aniDuration = (tempDuration>duration)?tempDuration:duration;
    
    if (timingFunction) {
        aniDuration = duration;
    }
    
    CAAnimationGroup *cameraMoveAni = [[AVSceneAnimateCamera defaultInstance] cameraMovePath:aniDuration withBeginTime:beginTime startArea:startArea endArea:endArea windowArea:windowArea];
    
    if (timingFunction) {
        cameraMoveAni.timingFunction = timingFunction;
    }
    
    return cameraMoveAni;
    
}


// 4s
-(CAAnimationGroup *)cameraSwitchFadeEaseInOut:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    NSArray *alphaValues = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             [NSNumber numberWithFloat:1],
                             
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             
                             ];
    CGFloat fadeDration =0.08;
    
    NSArray *alphakeyTime = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:fadeDration],
                              [NSNumber numberWithFloat:fadeDration+0.3],
                              
                              [NSNumber numberWithFloat:fadeDration+0.3+fadeDration],
                              [NSNumber numberWithFloat:fadeDration+0.3+fadeDration+0.3],
                              [NSNumber numberWithFloat:fadeDration+0.3+fadeDration+0.3+fadeDration],
                              
                              ];
    
    
    CAKeyframeAnimation *alphaAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniOpacity values:alphaValues keyTimes:alphakeyTime];
    alphaAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *saleToOne = [AVAniScaleSlowBasic scaleSlowInBasic:0 fromScaleValue:1];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[alphaAni,saleToOne]];
    
    return animationGroup;
}

@end
