//
//  AVSceneAniMoveShakeColorWhite.m
//  VCore
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "AVSceneAniMoveShakeColorWhite.h"

#import "AVSceneAnimateCamera.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

#import "AVAniScaleSlowBasic.h"

#import "AVFilterPhoto.h"

#define kDefultScaleVale            1.2

@implementation AVSceneAniMoveShakeColorWhite


+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer aniRootLayer:(CALayer *)rootLayer
{
    
    BOOL isHasFace = NO;
    
    FaceDetectDTO *faceRectDto = nil;
    
    if (aniParameter && [aniParameter allValues]>0) {
        
        faceRectDto = [aniParameter objectForKey:KAVFaceDtoKey];
        
        isHasFace =faceRectDto.faceCount >0 ? YES:NO;
    }
    
    switch (factor) {
            
        case AVAniShakeWhiteShowFace:
        {
            
            CGPoint imageCenter = CGPointMake(CGRectGetMidX(layer.contentLayer.bounds), CGRectGetMidY(layer.contentLayer.bounds));
            
            CAAnimationGroup *mustMoveAni = [AVAniScaleSlowBasic moveMustLeftToRight:duration withBeginTime:beginTime withFaceStruct:isHasFace?faceRectDto.faceAwareStruct:FaceRectStructZero isSlowly:YES];
            
            [layer.contentLayer addAnimation:mustMoveAni forKey:@"mustMoveAni"];
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            AVBasicLayer *fitlerWhiteLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:layer.contentLayer.bounds
                                                                 withImage:filterImage];
            
            fitlerWhiteLayer.contentLayer.opacity = 0;
            
            [rootLayer addSublayer: fitlerWhiteLayer];
            
            
            FaceRectMode rectCenterScaleStruct = FaceRectStructMake(imageCenter, kDefultScaleVale, CGRectZero);
            
            CAAnimationGroup *animationGroup2 = [AVAniScaleSlowBasic moveMustLeftToRight:duration withBeginTime:0 withFaceStruct:isHasFace?faceRectDto.faceStruct1:rectCenterScaleStruct  isSlowly:YES];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0 isAnimate:NO];
            
            CAAnimationGroup *animation2 = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime+(duration*0.3) aniArr: @[animationGroup2,opacityOpen]];
            
            [fitlerWhiteLayer.contentLayer addAnimation:animation2 forKey:@"sdf"];
            
        
            break;
        }
            
        case AVAniShakeWhiteTORadio:
        {
            
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            CAAnimationGroup *mustMoveAni = [AVAniScaleSlowBasic moveMustLeftToRight:duration withBeginTime:beginTime withFaceStruct:faceAwareRect isSlowly:YES];
            
            [layer.contentLayer addAnimation:mustMoveAni forKey:@"mustMoveAni"];
            
            
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            AVBasicLayer *copyWhilteLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:layer.contentLayer.bounds
                                                                 withImage:filterImage];
            
            copyWhilteLayer.contentLayer.opacity = 0;
            
            [rootLayer addSublayer: copyWhilteLayer];
            
            CGPoint centerPoint = CGPointMake(faceAwareRect.windowsCenter.x, faceAwareRect.windowsCenter.y+60);
            
            FaceRectMode faceAwareWhitelRect = FaceRectStructMake(centerPoint, faceAwareRect.windowsRadio+0.4, faceAwareRect.onImageFaceRect);
            
            CAAnimationGroup *animationGroup2 = [AVAniScaleSlowBasic moveMustLeftToRight:duration withBeginTime:0 withFaceStruct:faceAwareWhitelRect isSlowly:YES];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:(duration*0.3) isAnimate:NO];
            
            CAAnimationGroup *animation2 = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[animationGroup2,opacityOpen]];
            
            copyWhilteLayer.contentLayer.position = faceAwareWhitelRect.windowsCenter;
            
            
            [copyWhilteLayer.contentLayer addAnimation:animation2 forKey:@"sdf"];
            
            break;
        }
            
        case AVAniShakeWhiteLeftRight:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            AVBasicLayer *filterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:layer.contentLayer.bounds
                                                                 withImage:filterImage];

            
            [layer addSublayer: filterLayer];
            
            filterLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            filterLayer.contentLayer.transform =  CATransform3DMakeScale(1.1, 1.1, 1.0);
            
             layer.contentLayer.transform =  CATransform3DMakeScale(1.1, 1.1, 1.0);
            
            
            NSArray *keyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.38],
                                 [NSNumber numberWithFloat:0.58],
                                 [NSNumber numberWithFloat:0.75],
                                 [NSNumber numberWithFloat:1],
                                 ];

            
            NSArray *centerValues = @[
                                      [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x+20, kAVWindowCenter.y)],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x+10, kAVWindowCenter.y)],
                                      
                                      [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x+5, kAVWindowCenter.y)],
                                      ];
            
            CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration/2 withBeginTime:beginTime  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
            moveCenterAni.fillMode=kCAFillModeBoth;
            
            moveCenterAni.repeatCount = 2;
            
            moveCenterAni.autoreverses = YES;
            
            [layer.contentLayer addAnimation: moveCenterAni forKey:@"moveCenterAni"];
            
            //
            [filterLayer.contentLayer addAnimation: moveCenterAni forKey:@"moveCenterAni"];
            

            CAKeyframeAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpenClose:duration-0.2 withBeginTime:beginTime+0.2 isAnimate:NO];

            [filterLayer.contentLayer addAnimation: opacityOpen forKey:@"opacityOpen"];
            
            
            break;
        }
            
        case AVAniShakeWhitePhotoTo4:
        {
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:layer.contentLayer.bounds];
            
            layer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [layer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            CAAnimationGroup *animationGroup = [AVAniScaleSlowBasic moveMustRightToLeft:duration withBeginTime:beginTime withFaceStruct: FaceRectStructZero isSlowly:YES];
            
            [layer.contentLayer addAnimation: animationGroup forKey:@"animationGroup"];
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            for (NSInteger index =0; index<4; index++) {
                
                AVBasicLayer *oneLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                   withImage:filterImage];
                
                
                [layer addSublayer: oneLayer];
                
                oneLayer.contentLayer.position = faceAwareRect.windowsCenter;
                
                [oneLayer.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
                
                oneLayer.contentLayer.opacity = 0;
                
                [oneLayer setValue:[NSNumber numberWithFloat:0.5] forKeyPath:@"transform.scale"];
                
                CAAnimationGroup *moveAni = [AVAniScaleSlowBasic moveMustRightToLeft:duration withBeginTime:0 withFaceStruct: FaceRectStructZero isSlowly:YES];
                
                CAKeyframeAnimation *opacityIn = [[AVBasicRouteAnimate defaultInstance] opacityOpenClose:1 withBeginTime:0 isAnimate:NO];
                
                CAAnimationGroup *animationGroup2 = [[AVBasicRouteAnimate defaultInstance] groupAni:kMoveSmallDuation withBeginTime:beginTime+0.8 aniArr: @[moveAni,opacityIn]];
                
                [oneLayer.contentLayer addAnimation: animationGroup2 forKey:@"animationGroup2"];
                
                switch (index) {
                    case 0:
                    {
                        oneLayer.position = CGPointMake(kAVWindowWidth*0.25, kAVWindowWidth*0.25);
                        break;
                    }
                        
                    case 1:
                    {
                        oneLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowWidth*0.25);
                        
                        break;
                    }
                        
                    case 2:
                    {
                        oneLayer.position = CGPointMake(kAVWindowWidth*0.25, kAVWindowWidth*0.75);
                        break;
                    }
                        
                    case 3:
                    {
                        oneLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowWidth*0.75);
                        break;
                    }
                    default:
                        break;
                }
                
            }
            
        }
            
        default:
            break;
    }
    
}

@end
