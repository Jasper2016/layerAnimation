//
//  AVSceneTransiteSlideCarryArt.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransiteSlideCarryArt.h"

#import "AVSceneAniEnumType.h"

#import "AVStaticFunc.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

#import "AVSceneAnimateCamera.h"

#import "AVTheme.h"

@implementation AVSceneTransiteSlideCarryArt


#define kMaskLayerWith       160

#define kShadowOffset       16

+(void)sceneTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    [rootLayer addSublayer: nextLayer];
    
    
    NSString *textDefualtInfo =@"<grayBg> My heart never knew </grayBg> \n <main>   So if i</main> <body> were to fall in love</body> ";
    
    NSString *titleInfo = [AVDicKeyValueUnit dicNSStringValue:aniParameter key:KAVArtSceneTextKey defaultValue:textDefualtInfo];
    
    AVBottomLayer *bgFloorLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,kAVWindowWidth+kMaskLayerWith, kAVWindowHeight)
                                                               bgColor:[UIColor clearColor].CGColor];
    
    [rootLayer addSublayer: bgFloorLayer];
    
    
    AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kMaskLayerWith)
                                                           bgColor:[UIColor whiteColor].CGColor];
    
    [bgFloorLayer addSublayer: artLayer];
    
    AVColorTextLayer *textLayer = [[AVColorTextLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kMaskLayerWith-10)
                                                           attributedText:titleInfo
                                                                 withType:AVColorTextForTitle];
    [artLayer addSublayer: textLayer];
   
    textLayer.top +=20;
    
    textLayer.alignmentMode = kCAAlignmentCenter;
    
    textLayer.truncationMode = kCAAlignmentCenter;
    
    [bgFloorLayer addSublayer: nextLayer];
    
    CGPoint startCenter = CGPointZero;
    
    CGPoint endCenter = CGPointZero;
    
    switch (transiteFactor) {
        case AVAniXYRightToLeft:
        {
            [artLayer openShadowEffct:AVLayerShadowDicUp];
            
            artLayer.transform =  CATransform3DMakeRotation(-M_PI_2, 0, 0, 1);
            
            artLayer.position = CGPointMake(kMaskLayerWith/2, kAVWindowCenter.y);
            
            nextLayer.position = CGPointMake(kAVWindowCenter.x+kMaskLayerWith, kAVWindowCenter.y);
            
            bgFloorLayer.anchorPoint =  CGPointMake(0.0, 0.0);
            
            startCenter = CGPointMake(kAVWindowWidth+kShadowOffset, 0);
            
            endCenter = CGPointMake(-kMaskLayerWith, 0);
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            [artLayer openShadowEffct:AVLayerShadowDicDown];
            
            artLayer.transform =  CATransform3DMakeRotation(-M_PI_2, 0, 0, 1);
            
            artLayer.position = CGPointMake(kMaskLayerWith/2+kAVWindowWidth, kAVWindowCenter.y);
            
            nextLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
            
            bgFloorLayer.anchorPoint =  CGPointMake(1.0, 0.0);
            
            startCenter = CGPointMake(-kShadowOffset, 0);
            
            endCenter = CGPointMake(kAVWindowWidth+kMaskLayerWith, 0);
            
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            [artLayer openShadowEffct:AVLayerShadowDicDown];
            
            artLayer.position = CGPointMake(kAVWindowCenter.x, kMaskLayerWith/2+kAVWindowHeight);
            
            nextLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
            
            bgFloorLayer.anchorPoint =  CGPointMake(0.0, 1.0);
            
            startCenter = CGPointMake(0,  -kMaskLayerWith-kShadowOffset);
            
            endCenter = CGPointMake(0, kAVWindowHeight);
            
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            [artLayer openShadowEffct:AVLayerShadowDicUp];
            
            artLayer.position = CGPointMake(kAVWindowCenter.x, kMaskLayerWith/2);
            
            nextLayer.position = CGPointMake(kAVWindowCenter.x, kMaskLayerWith+kAVWindowCenter.y);
            
            bgFloorLayer.anchorPoint =  CGPointMake(0.0, 1.0);
            
            startCenter = CGPointMake(0, (2*kAVWindowHeight)+kMaskLayerWith+kShadowOffset);
            
            endCenter = CGPointMake(0,  kAVWindowHeight-kMaskLayerWith);
            
            break;
        }
        default:
            break;
    }
    
    CAKeyframeAnimation *moveMaskAni = [[AVSceneAnimateCamera defaultInstance] centerAniMoveXY:duration withBeginTime:beginTime startCenter:startCenter endCenter:endCenter];
    
    
    [bgFloorLayer addAnimation: moveMaskAni forKey:@"moveAni"];
}
@end
