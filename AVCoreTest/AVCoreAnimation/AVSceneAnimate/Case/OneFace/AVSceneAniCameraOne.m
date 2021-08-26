//
//  AVSceneAniCameraOne.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneAniCameraOne.h"

#import "AVSceneAnimate.h"

#import "AVAniScaleSlowBasic.h"

#import "AVCommonHeader.h"

#import "AVSceneAniEnumType.h"

#import "AVAniCameraOneFaceShake.h"

@implementation AVSceneAniCameraOne

+(void)sceneOneFaceAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer
{
    if (aniParameter ==nil) {
        NSLog(@"AVSceneAniCameraOne  nil");
        return;
    }
    
    FaceDetectDTO *faceDto = [aniParameter objectForKey:KAVFaceDtoKey];
    
    switch (factor) {
        case AVAniCameraOneShakeMoveIn:
        {
            
            CAAnimationGroup *cameraPathAni = [AVAniCameraOneFaceShake oneFaceShakeMoveIn:duration withBeginTime:beginTime faceArea:faceDto.faceStruct1  faceAwareRect:faceDto.faceAwareStruct contentRect:layer.contentLayer.bounds];
            
            [layer.contentLayer addAnimation:cameraPathAni forKey:@"cameraPathAni"];
            
            break;
        }
            
        case AVAniCameraOneShakeMoveOut:
        {
            
            CAAnimationGroup *cameraPathAni = [AVAniCameraOneFaceShake oneFaceShakeMoveOut:duration withBeginTime:beginTime faceArea:faceDto.faceStruct1  faceAwareRect:faceDto.faceAwareStruct contentRect:layer.contentLayer.bounds];
            
            [layer.contentLayer addAnimation:cameraPathAni forKey:@"cameraPathAni"];
            
            break;
        }
            
        default:
            break;
    }
}


@end
