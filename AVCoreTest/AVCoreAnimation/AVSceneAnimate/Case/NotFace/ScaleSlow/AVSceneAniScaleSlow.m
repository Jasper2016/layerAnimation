//
//  AVSceneAniScaleSlow.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAniScaleSlow.h"

#import "AVAniScaleSlowBasic.h"

#import "CAMediaTimingFunction+AdditionalEquations.h"

#import "AVConstant.h"

#define kScaleOffset            1.5

@implementation AVSceneAniScaleSlow

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer
{
 
    BOOL isHasFace = NO;
    
    FaceDetectDTO *faceRectDto = nil;
    
    if (aniParameter && [aniParameter allValues]>0) {

         faceRectDto = [aniParameter objectForKey:KAVFaceDtoKey];
        
        isHasFace =faceRectDto.faceCount >0 ? YES:NO;
    
    }
    
    switch (factor) {
        case AVScaleSlowCenterIn:
        {
            CGFloat scaleRadio = isHasFace?faceRectDto.faceAwareStruct.windowsRadio:1;
            
            CGPoint scaleCenter = isHasFace?faceRectDto.faceAwareStruct.windowsCenter:kCGRectWindowCenter;
            
            CABasicAnimation *saleToOne = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:scaleRadio];
            
            layer.contentLayer.position = scaleCenter;
    
            [layer.contentLayer addAnimation: saleToOne forKey:@"sale"];

            break;
        }
            
        case AVScaleSlowCenterInShake:
        {
            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1.43],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.03],
                                     [NSNumber numberWithFloat:1],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.58],
                                 [NSNumber numberWithFloat:0.65],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            
            scaleAni.fillMode=kCAFillModeBoth;
            
            layer.contentLayer.position = kCGRectWindowCenter;
            
            [layer.contentLayer addAnimation:scaleAni forKey:@"scaleAni"];
            
            break;
        }
            
        case AVScaleSlowCenterOut:
        {
            CGFloat scaleRadio = isHasFace?faceRectDto.faceAwareStruct.windowsRadio:1;
            
            CGPoint scaleCenter = isHasFace?faceRectDto.faceAwareStruct.windowsCenter:kCGRectWindowCenter;
            
            CABasicAnimation *saleToOne = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:scaleRadio];
            
            layer.contentLayer.position = scaleCenter;
            
            [layer.contentLayer addAnimation: saleToOne forKey:@"sale"];
            
            break;
        }
            
        case AVScaleSlowCenterOutShake:
        {
            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1],
                                     [NSNumber numberWithFloat:1.03],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.43],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.58],
                                 [NSNumber numberWithFloat:0.65],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            
            scaleAni.fillMode=kCAFillModeBoth;

            layer.contentLayer.position = kCGRectWindowCenter;
            
            [layer.contentLayer addAnimation:scaleAni forKey:@"scaleAni"];
            
            break;
        }
            
        case AVSceneAniYScaleCenterIn:
        {
            BOOL isHasFace = NO;
            
            FaceDetectDTO *faceRectDto = nil;
            
            if (aniParameter && [aniParameter allValues]>0) {
                
                faceRectDto = [aniParameter objectForKey:KAVFaceDtoKey];
                
                isHasFace =faceRectDto.faceCount >0 ? YES:NO;
                
            }
            
            NSArray *scaleValues = @[
                                     [NSNumber numberWithFloat:1.43],
                                     [NSNumber numberWithFloat:1.4],
                                     [NSNumber numberWithFloat:1.03],
                                     [NSNumber numberWithFloat:1],
                                     ];
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.58],
                                 [NSNumber numberWithFloat:0.65],
                                 [NSNumber numberWithFloat:1],
                                 ];
            
            CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
            
            scaleAni.fillMode=kCAFillModeBoth;
            
            layer.contentLayer.position = kCGRectWindowCenter;
            
            [layer.contentLayer addAnimation:scaleAni forKey:@"scaleAni"];
            
            break;
        }
        
        case AVSceneAniBaseScaleCenterOut:
        {
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:1 toValue:kScaleOffset];
            
            saleToAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];
            
            [layer.contentLayer addAnimation:saleToAni forKey:@"scaleAni"];
            
            break;
        }
            
        case AVSceneAniBaseScaleCenterIn:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
                [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:kScaleOffset toValue:1.0];
            
            saleToAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];
            
            [layer.contentLayer addAnimation:saleToAni forKey:@"scaleAni"];
            
            break;
        }
            
        case AVSceneAniScaleCenterIn:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:faceAwareRect.windowsRadio+0.4 toValue:faceAwareRect.windowsRadio];
            
            saleToAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];
            
            [layer.contentLayer addAnimation:saleToAni forKey:@"scaleAni"];
            
            break;
        }
            
        case AVSceneAniScaleCenterOut:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:faceAwareRect.windowsRadio toValue:faceAwareRect.windowsRadio+0.4];
            
            saleToAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];
            
            [layer.contentLayer addAnimation:saleToAni forKey:@"scaleAni"];
            
            break;
        }
            
        case AVScaleSlowHasParam:
        {
            NSArray *parameters = [aniParameter allValues];
            
            if ([parameters count] !=1) {
                NSLog(@"AVSceneAniScaleSlow not 1");
            }
            
            NSNumber *tempValue = [parameters objectAtIndex:0];
            
            CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime  toValue:[tempValue floatValue]];
            
            [layer.contentLayer addAnimation: saleToOne forKey:@"sale"];
            
            break;
        }
        default:
            break;
    }
}

@end
