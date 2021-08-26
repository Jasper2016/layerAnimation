//
//  AVArtAniWedding.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVArtAniWedding.h"

#import "WeddingWhiteStartLayer.h"

#import "AVBasicTextLayer.h"

#import "DrawStrokeLayer.h"

#import "AVBarTextLayer.h"

#import "AVColorTextLayer.h"

#import "AVMaskBaiscLayer.h"

#import "AVFilterPhoto.h"

#import "AVVideoConstant.h"

#import "AVTheme.h"

#import "AVAniAnalyConstant.h"

#import "AVDicKeyValueUnit.h"

@implementation AVArtAniWedding

+(void)AVArtAniWeddingWhite:(CFTimeInterval)beginTime aAniDTO:(AVSceneDTO *)sAniDTO artParameters:(NSDictionary *)artParameters Layer:(AVBasicLayer *)layer;
{
    
    CFTimeInterval duration = sAniDTO.artDuration;
    
    switch (sAniDTO.artAniType) {
            
        case AVArtAniWeddingStart:
        {
            
            NSDictionary *inputDic = [artParameters objectForKey: kAVSceneAniStartParmKey];
            
            NSString *boyName =   [inputDic objectForKey:kAVWiddingGroomKey];
            
            NSString *grilsName = [inputDic objectForKey:kAVWiddingBrideKey];
            
            NSString *dataString = [AVDicKeyValueUnit dicNSStringValue:inputDic key:kAVWiddingDateKey defaultValue:@" "];
            
            
            NSString *brideAndGroom = nil;
            
            if (boyName && grilsName) {
                
                 brideAndGroom = [NSString stringWithFormat:@"%@ & %@", grilsName, boyName];
            }else{
                 brideAndGroom = [AVDicKeyValueUnit dicNSStringValue:inputDic key:kAVWiddingThemeKey defaultValue:@" "];
            }
       
            
            layer.bgLayer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor;
            
           
            [layer addSublayer: layer.bgLayer];
            
            WeddingWhiteStartLayer *factorLayer = [[WeddingWhiteStartLayer alloc] initWithFrame: CGRectMake(10, 85, 580, 330)
                                                                                        bgColor:[UIColor clearColor].CGColor];
            
            [factorLayer showTextInfo:brideAndGroom two:dataString withBeginTime:beginTime];
            
            [layer.bgLayer addSublayer: factorLayer];
            
            
            factorLayer.opacity = 0.0f;
            
            
            CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityFromTo:0.3 withBeginTime:beginTime fromValue:0.0f toValue:0.7f];

            
            [factorLayer addAnimation:opacityOpenAni forKey:@"dfs"];
            
            
            break;
        }
            
        case AVArtAniWeddingEnd:
        {
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:artParameters contendRect:layer.contentLayer.bounds];
            
            UIImage *contendImage = [UIImage imageWithCGImage:(CGImageRef)layer.contentLayer.contents];
            
            UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterGaussianBlur];
            
            AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:layer.contentLayer.bounds
                                                                  withImage:filterImage];
            blurLayer.backgroundColor= [UIColor grayColor].CGColor;
            [layer addSublayer: blurLayer];
            
            blurLayer.opacity = 0;
            
            CABasicAnimation *openAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime: beginTime];
            
            [blurLayer addAnimation:openAni forKey:@"closeAni"];
            
            [blurLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];
            
            blurLayer.position = faceAwareRect.windowsCenter;
            
            
            break;
        }
        default:
            break;
    }

    
}

+(void)AVArtAniWeddingSFresh:(CFTimeInterval)beginTime AniDTO:(AVSceneDTO *)sAniDTO artParameters:(NSDictionary *)artParameters Layer:(AVBasicLayer *)layer
{
    CFTimeInterval duration = sAniDTO.artDuration;
    
    switch (sAniDTO.artAniType) {
        case AVArtAniWeddingStart:
        {
            NSDictionary *inputDic = [artParameters objectForKey: kAVSceneAniStartParmKey];
            
            NSString *boyName = [inputDic objectForKey:kAVWiddingGroomKey];
            
            NSString *grilsName = [inputDic objectForKey:kAVWiddingBrideKey];
            
            NSString *brideAndGroom = nil;
            
            if (boyName && grilsName) {
                
                brideAndGroom = [NSString stringWithFormat:@"%@ & %@", grilsName, boyName];
            }else{
                brideAndGroom = [AVDicKeyValueUnit dicNSStringValue:inputDic key:kAVWiddingThemeKey defaultValue:@" "];
            }
            
            DrawStrokeLayer *drawBoyLayer = [[DrawStrokeLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-500)/2, 215, 500, 80) textFont:[UIFont fontWithName:@"SnellRoundhand" size:46] textColor:UIColorFromRGB(0x96d1a4)  showText:brideAndGroom];
            
            [layer addSublayer: drawBoyLayer];
            
            [drawBoyLayer doAnimation:duration withBeginTime:beginTime];
            
            break;
        }
            
        case AVArtAniWeddingEnd:
        {
            

            
            break;
        }
        default:
            break;
    }
    
}


@end
