//
//  sceneMoveShakeWhiteAni.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "sceneMoveShakeWhiteAni.h"

#import "AVCommonCaseHeader.h"

#import "AVConstant.h"

#import "AVAniScaleSlowBasic.h"

#import "AVFilterPhoto.h"

///  3s


@implementation sceneMoveShakeWhiteAni

+(void)sceneAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime factor:(NSInteger)factor aniParameter:(NSDictionary *)aniParameter layer:(AVBasicLayer *)layer
{
   // CAMediaTimingFunction *timingFunc = (CAMediaTimingFunction *)[aniParameter objectForKey:kAVCAMediaTimingKey];
    
    BOOL isHasFace = NO;
    
    FaceDetectDTO *faceRectDto = nil;
    
    if (aniParameter && [aniParameter allValues]>0) {
        
        faceRectDto = [aniParameter objectForKey:KAVFaceDtoKey];
        
        isHasFace =faceRectDto.faceCount >0 ? YES:NO;
        
    }
    
    switch (factor) {
        case AVAniXYRightToLeft:
        {
            CAAnimationGroup *animationGroup = [AVAniScaleSlowBasic moveMustRightToLeft:duration withBeginTime:beginTime withFaceStruct:isHasFace?faceRectDto.faceAwareStruct:FaceRectStructZero isSlowly:YES];
            
            [layer.contentLayer addAnimation:animationGroup forKey:@"sdf"];
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            AVBasicLayer *startLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:layer.contentLayer.bounds
                                                                 withImage:filterImage];
            
            startLayer.contentLayer.opacity = 0;
            
            [layer addSublayer: startLayer];
            
            CAAnimationGroup *animationGroup2 = [AVAniScaleSlowBasic moveMustRightToLeft:duration withBeginTime:0 withFaceStruct:isHasFace?faceRectDto.faceStruct1:FaceRectStructZero isSlowly:YES];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0 isAnimate:NO];
            
            CAAnimationGroup *animation2 = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime+(duration*0.35) aniArr: @[animationGroup2,opacityOpen]];
            
            [startLayer.contentLayer addAnimation:animation2 forKey:@"sdf"];
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            
            
            CAAnimationGroup *animationGroup = [AVAniScaleSlowBasic moveMustLeftToRight:duration withBeginTime:beginTime withFaceStruct:isHasFace?faceRectDto.faceAwareStruct:FaceRectStructZero isSlowly:YES];
            
            [layer.contentLayer addAnimation:animationGroup forKey:@"sdf"];
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
            
            AVBasicLayer *startLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                              vContentRect:layer.contentLayer.bounds
                                                                 withImage:filterImage];
            
            startLayer.contentLayer.opacity = 0;
            
            [layer addSublayer: startLayer];
            
            CAAnimationGroup *animationGroup2 = [AVAniScaleSlowBasic moveMustLeftToRight:duration withBeginTime:0 withFaceStruct:isHasFace?faceRectDto.faceStruct1:FaceRectStructZero isSlowly:YES];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0 isAnimate:NO];
            
            CAAnimationGroup *animation2 = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime+(duration*0.35) aniArr: @[animationGroup2,opacityOpen]];
            
            [startLayer.contentLayer addAnimation:animation2 forKey:@"sdf"];
            
            break;
        }
        default:
            break;
    }
    
}

@end
