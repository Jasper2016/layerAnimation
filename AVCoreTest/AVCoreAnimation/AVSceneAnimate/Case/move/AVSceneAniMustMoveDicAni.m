//
//  AVSceneAniMustMoveDicAni.m
//  testTextPlayShow
//
//  Created by mac on 15/8/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAniMustMoveDicAni.h"

#import "AVSceneAnimateCamera.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

#import "AVAniScaleSlowBasic.h"

#define kMoveSmallOffset  20

#define kScaleSmallOffset 0.15

#define kMoveSmallDuation    5.0f

@implementation AVSceneAniMustMoveDicAni

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer
{
    
    FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
    
    BOOL isSlowly= NO;
    
    layer.contentLayer.position = faceAwareRect.windowsCenter;
    
    NSLog(@"AVSceneAniMustMoveDicAni x=%f, y=%f", faceAwareRect.windowsCenter.x, faceAwareRect.windowsCenter.y );
    
    [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];

    
    CGPoint endCenter = CGPointZero;
    
    CGPoint startCenter = CGPointZero;
    
    CGFloat scaleRadio = faceAwareRect.windowsRadio;
    
    CGPoint scaleCenter = faceAwareRect.windowsCenter;
    
    
    switch (factor) {
        case AVAniMoveMustRightToLeft:
        {
            
             endCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y);
            
             startCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y);
            
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
             startCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y);
            
             endCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y);
            
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            startCenter = CGPointMake(scaleCenter.x, scaleCenter.y-kMoveSmallOffset);
            
            endCenter = CGPointMake(scaleCenter.x, scaleCenter.y+kMoveSmallOffset);
            
            break;
        }
            
        case AVAniMoveMustBottomToTop:
        {
            
            endCenter = CGPointMake(scaleCenter.x, scaleCenter.y-kMoveSmallOffset);
            
            startCenter = CGPointMake(scaleCenter.x, scaleCenter.y+kMoveSmallOffset);
            
            break;
        }
            
        case AVAniMoveMustLeftBottomToRightUp:
        {
            endCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y-kMoveSmallOffset);
            
            startCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y+kMoveSmallOffset);
            
            break;
        }
            
        case AVAniMoveMustRightUpToLeftBottom:
        {
            startCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y-kMoveSmallOffset);
            
            endCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y+kMoveSmallOffset);
            
            break;
        }
            
        case AVAniMoveMustRightBottomToLeftUp:
        {
             endCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y-kMoveSmallOffset);
            
             startCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y+kMoveSmallOffset);
            
            break;
        }
            
        case AVAniMoveMustLeftUpToRightBottom:
        {
            startCenter = CGPointMake(scaleCenter.x-kMoveSmallOffset, scaleCenter.y-kMoveSmallOffset);
            
            endCenter = CGPointMake(scaleCenter.x+kMoveSmallOffset, scaleCenter.y+kMoveSmallOffset);
            
            break;
        }
        
            
        default:
            return;
            break;
    }
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             [NSNumber numberWithFloat:scaleRadio+kScaleSmallOffset],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:startCenter],
                              
                              [NSValue valueWithCGPoint:endCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:isSlowly?kMoveSmallDuation:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:isSlowly?kMoveSmallDuation:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    [layer.contentLayer addAnimation:animationGroup forKey:@"moveAni"];
}

@end
