//
//  AVSceneAniMoveXY.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAniMoveXY.h"

#import "AVSceneAnimateCamera.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

#import "AVAniScaleSlowBasic.h"

/*
 *通过 是否传 timingFunc 来 判断 是否是 规定的慢 duration 还是 穿传入的 duration
 *
 *                if (timingFunc) {
                        cameraPathAni.timingFunction = timingFunc;
                    }
 *
 *
 *
 ***/

@implementation AVSceneAniMoveXY

#pragma mark Singleton methods
#pragma mark 单例方法

static AVSceneAniMoveXY *defaultInstance = nil;

+ (AVSceneAniMoveXY *)defaultInstance
{
    @synchronized(self){
        if (defaultInstance == nil) {
            defaultInstance = [[AVSceneAniMoveXY alloc] init];
            
        }
    }
    return defaultInstance;
}

-(void)sceneAniFunc:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer
{
   //CAMediaTimingFunction *timingFunc = (CAMediaTimingFunction *)[aniParameter objectForKey:kAVCAMediaTimingKey];
    
   //FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
    
    switch (factor) {
        case AVAniXYRightToLeft:
        {
            
            CGPoint endCenter = kCGRectCenterPoint(kAVRectWindow);
            
            CGFloat moveDiscX = (layer.contentLayer.frame.size.width - kAVWindowWidth)/2;
            
            CGPoint startCenter = CGPointMake(endCenter.x+moveDiscX, endCenter.y);
            
            CAKeyframeAnimation *moveAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration withBeginTime:beginTime startCenter:startCenter endCenter:endCenter];
            
//            if (timingFunc) {
//                moveAni.timingFunction = timingFunc;
//            }
            
            [layer.contentLayer addAnimation:moveAni forKey:@"moveAni"];
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            CGPoint startCenter = kCGRectCenterPoint(kAVRectWindow);
            
            CGFloat moveDiscX = (layer.contentLayer.frame.size.width - kAVWindowWidth)/2;
            
            CGPoint endCenter = CGPointMake(startCenter.x+moveDiscX, startCenter.y);
            
            CAKeyframeAnimation *moveAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration withBeginTime:beginTime startCenter:startCenter endCenter:endCenter];
//            
//            if (timingFunc) {
//                moveAni.timingFunction = timingFunc;
//            }
            
            [layer.contentLayer addAnimation:moveAni forKey:@"moveAni"];
            
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            
            CGPoint endCenter = kCGRectCenterPoint(kAVRectWindow);
            
            CGFloat moveDiscY = (layer.contentLayer.frame.size.height - kAVWindowWidth)/2;
            
            CGPoint startCenter = CGPointMake(endCenter.x, endCenter.y+moveDiscY);
            
            CAKeyframeAnimation *moveAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration withBeginTime:beginTime startCenter:startCenter endCenter:endCenter];
            
//            if (timingFunc) {
//                moveAni.timingFunction = timingFunc;
//            }
            
            [layer.contentLayer addAnimation:moveAni forKey:@"moveAni"];
            
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            CGPoint startCenter = kCGRectCenterPoint(kAVRectWindow);
            
            CGFloat moveDiscY = (layer.contentLayer.frame.size.height - kAVWindowWidth)/2;
            
            CGPoint endCenter = CGPointMake(startCenter.x, startCenter.y+moveDiscY);
            
            CAKeyframeAnimation *moveAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration withBeginTime:beginTime startCenter:startCenter endCenter:endCenter];
            
//            if (timingFunc) {
//                moveAni.timingFunction = timingFunc;
//            }
            
            [layer.contentLayer addAnimation:moveAni forKey:@"moveAni"];
            
            break;
        }
            

            
        case AVAniXYCustom:
        {
            NSArray *parameters = [aniParameter allValues];
            
            if ([parameters count] !=2) {
                NSLog(@"AVAniXYCustom not 2");
            }
            
            CGRect startArea = [[parameters objectAtIndex:0] CGRectValue];
            
            CGRect endArea =[[parameters objectAtIndex:1] CGRectValue];
            
            CAAnimationGroup *cameraPathAni = [[AVSceneAnimateCamera defaultInstance] cameraMovePath:duration withBeginTime:beginTime startArea:startArea endArea:endArea windowArea:kAVRectWindow ];
//            
//            if (timingFunc) {
//                cameraPathAni.timingFunction = timingFunc;
//            }
            
            [layer.contentLayer addAnimation:cameraPathAni forKey:[NSString stringWithFormat:@"%d", arc4random()/100]];
            
            
            break;
        }
        default:
            break;
    }
}


@end
