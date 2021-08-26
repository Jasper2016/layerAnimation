//
//  AVArtWedingMagazine.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVArtWedingMagazine.h"

#import "AVBasicTextLayer.h"

#import "DrawStrokeLayer.h"

#import "AVBarTextLayer.h"

#import "AVColorTextLayer.h"

#import "AVMaskBaiscLayer.h"

#import "AVFilterPhoto.h"

#import "AVVideoConstant.h"

#import "AVTheme.h"

#import "CCARadialGradientLayer.h"

#import "AVSceneAnimateCamera.h"

#import "AVAniAnalyConstant.h"

#define  kBrightSpotScreenOffset        20

#define kLastAnimationValue     @"kLastAnimationValue"

#define kLastAnimationKey       @"kLastAnimationKey"

#define KlightPointOffset       10

@implementation AVArtWedingMagazine

+(void)AVArtAniWeddingMagazine:(CFTimeInterval)beginTime aAniDTO:(AVSceneDTO *)sAniDTO artParameter:(NSDictionary *)artParameters Layer:(AVBasicLayer *)layer
{
    CFTimeInterval duration = sAniDTO.artDuration;
    
    switch (sAniDTO.artAniType) {
        
        case AVArtAniWeddingStart:
        {
            if (isDictionaryRangeError(artParameters , 2) ) {
                NSLog(@"artParameters else 2 count");
                return;
            }

            NSDictionary *inputDic = [artParameters objectForKey: kAVSceneAniStartParmKey];
            
            NSString *boyName = [inputDic objectForKey:kAVWiddingGroomKey];
            
            NSString *grilsName = [inputDic objectForKey:kAVWiddingBrideKey];
            
            NSArray *frontImageList =  [artParameters objectForKey:kAVWiddingdataList];
            
            // NSString *titleSting = [AVDicKeyValueUnit dicNSStringValue:inputDic key:kAVWiddingThemeKey defaultValue:@" "];
    
            
            NSInteger imagCount = [frontImageList count];
            
            CGPoint startPoint =  CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
            
            CGPoint endPoint =  CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y-20);
            
            for (NSInteger indexLoop = 0; indexLoop < imagCount ; indexLoop++) {
                
                
                UIImage *maskImage = [UIImage imageNamed:[frontImageList objectAtIndex: indexLoop]] ;
                
                AVBottomLayer *startMaskeLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                            withImage:maskImage];
                
                [layer addSublayer: startMaskeLayer];
                
                [startMaskeLayer openShadowEffct:AVLayerShadowDicDown];
                
                if (indexLoop== 2) {
                    
                    if (boyName && grilsName) {
                        
                        AVBasicTextLayer *boyLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(0, 460, 245, 90)
                                                                                          intText:boyName
                                                                                         textFont:[UIFont systemFontOfSize:40]
                                                                                        textColor:[UIColor whiteColor]];

                        
                        [startMaskeLayer addSublayer: boyLayer];
                        
                        AVBasicTextLayer *girlLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(350, 460, 245, 90)
                                                                                      intText:grilsName
                                                                                     textFont:[UIFont systemFontOfSize:40]
                                                                                    textColor:[UIColor whiteColor]];
                        
                        
                        [startMaskeLayer addSublayer: girlLayer];
                    }else{
                        
                        return;
                        
//                        AVBasicTextLayer *titleLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(105, 135, 300, 120)
//                                                                                    textFont:[UIFont systemFontOfSize:45]
//                                                                                    fontSize:45
//                                                                                   textColor: [UIColor darkTextColor]
//                                                                                   textSting:titleSting];
//                        
//                        [startMaskeLayer addSublayer: titleLayer];
                        
                    }
                
                }
                
                
                
                CABasicAnimation *currentDissmisAniMove = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime+((imagCount-indexLoop)*0.3) fromValue:startPoint toValue:endPoint];
                
                if (indexLoop ==0) {
                     currentDissmisAniMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                }else{
                    currentDissmisAniMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                }
                
                [startMaskeLayer addAnimation:currentDissmisAniMove forKey:@"moveAni"];
                
            }
            
            break;
        }
            
        case AVArtAniWeddingEnd:
        {
           // DLog(@"AVArtAniWeddingEnd");
            
//            NSDictionary *inputDic = [artParameters objectForKey: kAVSceneAniStartParmKey];
            
//            NSString *boyName = [inputDic objectForKey:kAVWiddingGroomKey];
//            
//            NSString *grilsName = [inputDic objectForKey:kAVWiddingBrideKey];
//            
//            NSString *dataString = [inputDic objectForKey:kAVWiddingDateKey];
            

                
//                NSString *textInfo = [NSString stringWithFormat: @"<whitleS>%@</whitleS>  <green1M>&</green1M> <whitleS>%@</whitleS>  \n <green>%@</green>", boyName, grilsName,dataString];
            
                layer.bgLayer.backgroundColor = [UIColor blackColor].CGColor;
            
                AVBasicTextLayer *girlLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(0, 200,600, 300)
                                                                              intText:@"Every scene is full of moving"
                                                                             textFont:[UIFont systemFontOfSize:40]
                                                                            textColor:[UIColor whiteColor]];
        
                
                [layer.bgLayer  addSublayer: girlLayer];
            
//                if (boyName && grilsName) {
//
//                
//                    AVColorTextLayer *textLayer = [[AVColorTextLayer alloc] initWithFrame:CGRectMake(0, kAVWindowCenter.y-100, kAVWindowWidth, 200)
//                                                                           attributedText:textInfo];
//                    
//                    
//                    textLayer.alignmentMode = kCAAlignmentCenter;
//                    
//                    textLayer.truncationMode = kCAAlignmentCenter;
//                    
//                    [layer.bgLayer addSublayer: textLayer];
//                
//                }
            
                
                [layer insertSublayer:layer.bgLayer below:layer.contentLayer];
            
                
                CATransform3D starttransformThree = CATransform3DIdentity;
                
                CATransform3D endtransformThree = CATransform3DMakeScale(1.0, 0.0, 1.0);
                
                //  tempLayer.transform = starttransform;
                
                CABasicAnimation *saleToThree = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime fromValue:starttransformThree toValue:endtransformThree];
                
                saleToThree.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                
                [layer.contentLayer addAnimation:saleToThree forKey:@"saleToThree"];

            break;
        }
            
        case AVArtAniTextShow:
        {
            [self AVArtAniProcess:duration withBeginTime:beginTime artFactor:sAniDTO.artFactor artParameters:artParameters currentLayer:layer];
            
            break;
        }
            
        case AVArtAniFlashinglights:
        {
            [self AVArtAniFlashinglights:duration withBeginTime:beginTime artFactor:sAniDTO.artFactor artParameters:artParameters currentLayer:layer];
            
            break;
        }
            
        case AVArtAniOpacityBlackBgText:
        {
            [self AVArtOpacityBgText:duration withBeginTime:beginTime artFactor:sAniDTO.artFactor artParameters:artParameters currentLayer:layer];
            
            break;
        }
        default:
            break;
    }
    
    
    
}

+(void)AVArtOpacityBgText:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime artFactor:(NSInteger)artFactor artParameters:(NSDictionary *)artParameters currentLayer:(AVBasicLayer *)currentLayer
{
    
    switch (artFactor) {
        case AVArtAniBgMaskBgtWhiteText:
        {
            NSString *dateString= IsDicValueNotDufalut(artParameters, kAVArtTextKey, @"Wedding's love story ~!");
            
            AVBottomLayer *startMaskeLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                          bgColor:[[UIColor blackColor]colorWithAlphaComponent:0.5].CGColor];
            
            [currentLayer addSublayer: startMaskeLayer];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc]  initWithFrame:kAVVideoEndTextRect
                                                                           intText:dateString
                                                                          textFont:[UIFont fontWithName:@"SnellRoundhand" size:51]
                                                                         textColor:[UIColor whiteColor]];
        
            
            [startMaskeLayer addSublayer: textLayer];
            
            
            CGPoint startPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            
            CGPoint endPoint = kAVWindowCenter;
            
            CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime+(duration*0.3) fromValue:startPoint toValue:endPoint];
            
            [startMaskeLayer addAnimation:moveCenter1 forKey:@"moveCenter1"];

            break;
        }
        default:
            break;
    }
    
    
}


+(void)AVArtAniFlashinglights:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime artFactor:(NSInteger)artFactor artParameters:(NSDictionary *)artParameters currentLayer:(AVBasicLayer *)currentLayer
{
    
    
    UIImage *maskImage = [UIImage imageNamed:@"Flashinglights3.png"] ;
    
    AVBottomLayer *startMaskeLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,800, 800)
                                                                withImage:maskImage];
    
    [currentLayer addSublayer: startMaskeLayer];
    
    startMaskeLayer.opacity =0;
    
    CGPoint startPoint = CGPointMake(KlightPointOffset, KlightPointOffset);
    
    CGPoint endPoint = CGPointMake(currentLayer.bounds.size.width-KlightPointOffset, currentLayer.bounds.size.height-KlightPointOffset);
    
    CAKeyframeAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpenClose:duration withBeginTime:0 isAnimate:NO];
    
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:1.6],
                             [NSNumber numberWithFloat:1.2],
                             [NSNumber numberWithFloat:1.0],
                             [NSNumber numberWithFloat:1.6],
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.38],
                         [NSNumber numberWithFloat:0.70],
                         [NSNumber numberWithFloat:1],
                         ];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:startPoint],
                              [NSValue valueWithCGPoint:endPoint],
                              ];
    
    NSArray *keyTime2 = @[
                          [NSNumber numberWithFloat:0],
                          [NSNumber numberWithFloat:1],
                          ];
    
    CAKeyframeAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.1 withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime2];
    
    moveAni.fillMode=kCAFillModeForwards;
    
    moveAni.repeatCount = 7;
    
    moveAni.autoreverses = YES;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveAni, opacityOpen,scaleAni]];
    
    [startMaskeLayer addAnimation:animationGroup forKey:@"animationGroup"];

}

+(void)AVArtAniProcess:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime artFactor:(NSInteger)artFactor artParameters:(NSDictionary *)artParameters currentLayer:(AVBasicLayer *)currentLayer
{
    //CGFloat testFlot = beginTime-CACurrentMediaTime();
    
    //NSLog(@" testFlot =%f", testFlot);
    
    if ([[artParameters allKeys] count]<2) {NSLog(@"KAVArtTextRectKey count <2"); return;}
    
    CGRect textArea = [[artParameters objectForKey:KAVArtTextRectKey] CGRectValue];
    
    NSString *textInfo = [artParameters objectForKey:KAVArtSceneTextKey];
    
    AVColorTextLayer *textLayer = [[AVColorTextLayer alloc] initWithFrame:textArea
                                                         attributedText:textInfo];
    
    
    [currentLayer addSublayer: textLayer];
    
    switch (artFactor) {
        case AVArtAniTextStandstill:
        {
            
            break;
        }
            
        case AVArtAniTextFadeInOut:
        {
            textLayer.maskLayer.opaque= 0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime ];
            
            textLayer.mask = textLayer.maskLayer;
            
            [textLayer.maskLayer addAnimation:opacityOpen forKey:@"opacityOpen"];
            
            break;
        }
            
        case AVArtAniTextPlay:
        {
            textLayer.mask = textLayer.maskLayer;
            
            CGPoint startPosition = CGPointMake(-(textLayer.frame.size.width/2), textLayer.frame.size.height/2);
            
            CGPoint nextPosition = CGPointMake(textLayer.frame.size.width/2, textLayer.frame.size.height/2);
            
            CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration/2 withBeginTime:beginTime+0.4 fromValue:startPosition toValue:nextPosition];
            
            [textLayer.maskLayer addAnimation: moveAni forKey:@"moveAni"];
            
            break;
        }
            
        case AVArtAniTextBottomToCenter:
        {
            textLayer.opaque= 0;
            
            CGPoint endCenterPoint = kCGRectCenterPoint(textArea);
            
            CGPoint startCenterPoint =CGPointMake(endCenterPoint.x, endCenterPoint.y+300);
            
            CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:0 fromValue:startCenterPoint toValue:endCenterPoint];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration*0.6 withBeginTime:0];
            
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,opacityOpen]];
            
            [textLayer addAnimation:animationGroup forKey:@"animationGroup"];
            break;
        }
            
        default:
            break;
            
    }

}


@end
