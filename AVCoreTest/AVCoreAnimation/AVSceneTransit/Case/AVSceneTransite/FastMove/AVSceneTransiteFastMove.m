//
//  AVSceneTransiteFastMove.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransiteFastMove.h"

#import "GeometryGradientLayer.h"

#import "AVSceneAniEnumType.h"

#import "AVStaticFunc.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

#import "AVSceneAnimateCamera.h"


#define kTwoKnifeOffset         80


@implementation AVSceneTransiteFastMove

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer  aniRootLayer:(CALayer *)rootLayer
{
    CGPoint startPoint = CGPointZero;
    
    CGPoint endPoint =  kAVWindowCenter;

    [rootLayer addSublayer: nextLayer];
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            startPoint =  CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            startPoint = CGPointMake(-kAVWindowCenter.x,kAVWindowCenter.y);

            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            startPoint = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustBottomToTop:
        {
            startPoint = CGPointMake(kAVWindowCenter.x,kAVWindowHeight+kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustLeftBottomToRightUp:
        {
            startPoint =  CGPointMake(-(kAVWindowWidth/2)-kTwoKnifeOffset,kAVWindowHeight+(kAVWindowHeight/2)+kTwoKnifeOffset);

            CATransform3D rotateNext45s = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
            
            CATransform3D startNexttransform = CATransform3DScale(rotateNext45s, 1.4, 1.4, 1.0);
            
            nextLayer.maskLayer.transform = startNexttransform;
            

            
            break;
        }
            
        case AVAniMoveMustRightUpToLeftBottom:
        {
            
            startPoint =  CGPointMake(kAVWindowWidth+kAVWindowCenter.x+kTwoKnifeOffset,-kTwoKnifeOffset-kAVWindowCenter.y);
            
            CATransform3D rotateNext45s = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
            
            CATransform3D startNexttransform = CATransform3DScale(rotateNext45s, 1.4, 1.4, 1.0);
            
            nextLayer.maskLayer.transform = startNexttransform;

            
            break;
        }
            
        case AVAniMoveMustRightBottomToLeftUp:
        {

            startPoint =  CGPointMake(kAVWindowWidth+(kAVWindowWidth/2)+kTwoKnifeOffset,kAVWindowHeight+(kAVWindowHeight/2)+kTwoKnifeOffset);
            
            CATransform3D rotateNext45s = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            
            CATransform3D startNexttransform = CATransform3DScale(rotateNext45s, 1.4, 1.4, 1.0);
            
            nextLayer.maskLayer.transform = startNexttransform;
            
            break;
        }
            
        case AVAniMoveMustLeftUpToRightBottom:
        {
            startPoint =  CGPointMake(-kTwoKnifeOffset-kAVWindowCenter.x,-kTwoKnifeOffset-kAVWindowCenter.y);
            
            CATransform3D rotateNext45s = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            
            CATransform3D startNexttransform = CATransform3DScale(rotateNext45s, 1.4, 1.4, 1.0);
            
            nextLayer.maskLayer.transform = startNexttransform;
            
            break;
        }
            
        case AVAniMoveColorWhiteTwoKnife:
        {
           CFTimeInterval durationAni = 0.35;
            
            //white
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)currentLayer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:currentLayer.contentLayer.bounds];
            
            AVBasicLayer *currentWhiteLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                                     vContentRect:currentLayer.contentLayer.bounds
                                                                        withImage:filterImage];
            

            [currentWhiteLayer.contentLayer setValue:[NSNumber numberWithFloat:1.3] forKeyPath:@"transform.scale"];
            
            currentWhiteLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [rootLayer insertSublayer:currentWhiteLayer below:nextLayer];
            
            
            CGPoint startPoint =  CGPointMake(-((kAVWindowWidth/2)+kTwoKnifeOffset), kAVWindowHeight+(kAVWindowHeight/2)+kTwoKnifeOffset);
            
            CGPoint endPoint = kAVWindowCenter;
            
            CATransform3D rotate45s = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
            
            CATransform3D starttransform = CATransform3DScale(rotate45s, 1.4, 1.4, 1.0);
            
            currentWhiteLayer.maskLayer.transform = starttransform;
            
            CABasicAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:durationAni withBeginTime:beginTime fromValue:startPoint toValue:endPoint];
            
            [currentWhiteLayer.maskLayer addAnimation:moveCenterAni forKey:@"moveCenterAni"];
            
            //next show
            CGPoint startNextPoint =  CGPointMake(kAVWindowWidth+(kAVWindowWidth/2)+kTwoKnifeOffset,kAVWindowHeight+(kAVWindowHeight/2)+kTwoKnifeOffset);
            
            CGPoint endNextPoint = kAVWindowCenter;
            
            CATransform3D rotateNext45s = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            
            CATransform3D startNexttransform = CATransform3DScale(rotateNext45s, 1.4, 1.4, 1.0);
            
            nextLayer.maskLayer.transform = startNexttransform;
            
            CABasicAnimation *moveNextCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:durationAni withBeginTime:beginTime+durationAni fromValue:startNextPoint toValue:endNextPoint];
            
            [nextLayer.maskLayer addAnimation:moveNextCenterAni forKey:@"moveCenterAni"];
//            
//               CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:0.5 withBeginTime:beginTime+durationAni+durationAni fromValue:1 toValue:1.4];
//            
//            
//            [nextLayer.contentLayer addAnimation: saleToAni forKey:@"sale"];
            
            return;
            
            break;
        }
            
            
        default:
            return;
            break;
            
            
    }
    
    CABasicAnimation *moveNextCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPoint toValue:endPoint];
    
    [nextLayer.maskLayer addAnimation:moveNextCenterAni forKey:@"moveCenterAni"];
    
}

@end
