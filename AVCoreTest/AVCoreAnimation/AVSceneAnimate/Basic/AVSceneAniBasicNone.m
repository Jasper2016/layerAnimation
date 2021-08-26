//
//  AVSceneAniBasicNone.m
//  VCore
//
//  Created by mac on 15/9/23.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "AVSceneAniBasicNone.h"

#import "AVSceneAnimate.h"

#import "AVAniScaleSlowBasic.h"

#import "AVCommonHeader.h"

#import "AVSceneAniEnumType.h"


@implementation AVSceneAniBasicNone

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer
{
    switch (factor) {
        case AVSceneAniBaseNoneFaceCenter:
        {
            CGFloat radio = currentLayer.bounds.size.width/kAVWindowWidth;
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:currentLayer.contentLayer.bounds];
            
            currentLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            CGFloat scaleRadio = (radio > faceAwareRect.windowsRadio) ? faceAwareRect.windowsRadio:radio;
            
           // CGFloat scaleRadio = faceAwareRect.windowsRadio;
            
            currentLayer.contentLayer.position = faceAwareRect.windowsCenter;
            
            [currentLayer.contentLayer setValue:[NSNumber numberWithFloat:scaleRadio] forKeyPath:@"transform.scale"];
            
            
            break;
        }
            
        case AVSceneAniBaseNoneNo:
        {
            
    
            break;
        }
            
        default:
            break;
    }
}

@end
