//
//  AVSceneTransitePushMoveDicSimple.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransitePushMoveDicSimple.h"

#import "AVSceneAniEnumType.h"

#import "AVStaticFunc.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

#import "AVSceneAnimateCamera.h"

#define kPushMoveOffset  10

@implementation AVSceneTransitePushMoveDicSimple


+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    
    CGPoint startPoint = CGPointZero; CGPoint endPoint =  CGPointZero;
    
    CGPoint startNextPoint = CGPointZero; CGPoint endNextPoint =  CGPointZero;
    
    startPoint =  CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
    
    switch (transiteFactor) {
        case AVAniXYRightToLeft:
        {
            [rootLayer addSublayer: nextLayer];
            
            endPoint = CGPointMake(-kAVWindowCenter.x-kPushMoveOffset,  kAVWindowCenter.y);
            
            startNextPoint =  CGPointMake(kAVWindowWidth+kAVWindowCenter.x+kPushMoveOffset, kAVWindowCenter.y);
            
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            [rootLayer addSublayer: nextLayer];
            
            endPoint = CGPointMake(kAVWindowWidth+kAVWindowCenter.x,  kAVWindowCenter.y);
            
            startNextPoint =  CGPointMake(-kAVWindowCenter.x-kPushMoveOffset, kAVWindowCenter.y);
            
            
            
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            [rootLayer addSublayer: nextLayer];
            
            endPoint = CGPointMake(kAVWindowCenter.x,  kAVWindowHeight+kAVWindowCenter.x+kPushMoveOffset);
            
            startNextPoint =  CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            [rootLayer addSublayer: nextLayer];
            
            startNextPoint = CGPointMake(kAVWindowCenter.x,  kAVWindowHeight+kAVWindowCenter.x+kPushMoveOffset);
            
            endPoint =  CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            
            break;
        }
            
        case AVAniXYPushCurrentUp:
        {
           // [rootLayer addSublayer: nextLayer];
            [rootLayer insertSublayer:nextLayer below:currentLayer];
        
            nextLayer.contentLayer.opacity =0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime isAnimate:NO];
            
             //currentDissmisAniMove.fillMode=kCAFillModeForwards;
            
            [nextLayer.contentLayer addAnimation: opacityOpen forKey:@"opacityOpen"];
        
            
            endPoint =  CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            CABasicAnimation *currentDissmisAniMove = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue:endPoint];
            
            currentDissmisAniMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

           // currentDissmisAniMove.fillMode=kCAFillModeForwards;
            
            [currentLayer addAnimation:currentDissmisAniMove forKey:@"moveAni"];
            
            return;
            
            
            break;
        }
            
        case AVAniXYPushRightToLeftEdgeText:
        {

        }
            
        default:
            break;
    }
    
    endNextPoint = CGPointMake(kAVWindowCenter.x,  kAVWindowCenter.y);
    
    nextLayer.position = startNextPoint;
    
    CABasicAnimation *currentDissmisAniMove = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue:endPoint];
    
    currentDissmisAniMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
     currentDissmisAniMove.fillMode=kCAFillModeRemoved;
    
   // CABasicAnimation *closeAni = [[AVBasicRouteAnimate defaultInstance] opacityClose:beginTime+duration];
    
    //CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    //animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
   // [currentLayer addAnimation:closeAni forKey:@"closeAni"];
    
    [currentLayer addAnimation:currentDissmisAniMove forKey:@"moveAni"];
    
    
    CABasicAnimation *transfromMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startNextPoint toValue:endNextPoint];
    
    transfromMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //transfromMoveAni.fillMode=kCAFillModeForwards;

    [nextLayer addAnimation:transfromMoveAni forKey:@"moveAni"];

}

@end
