//
//  AVThemeSeriesCase.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVThemeSeriesCase.h"

#import "AVThemeMaterial.h"

#import "AVEmitterCollect.h"

@implementation AVThemeSeriesCase

+(void)addThemeSeriesLayer:(CFTimeInterval)beginTime  currentLayer:(AVBasicLayer *)currentLayer AniDTO:(AVAniDTO *)sAniDTO;
{
    switch (sAniDTO.themeStyle) {
        case AVWedding:
        {
            switch (sAniDTO.series) {
                case AVWeddingAndWhite:
                {
                    AVBasicLayer *materialLayer = [AVThemeMaterial AVWeddingAndWhiteBorder:currentLayer];
                    
                  //  layer.bgLayer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
                    
                    [currentLayer addSublayer: materialLayer];
                    
                    break;
                }
                    
                case AVWeddingAndSFresh: //此去放粒子效果
                {
                    
                    CGRect bgFrame = [[sAniDTO.seriParameters objectForKey: KAVMapRectKey] CGRectValue];
                    
                    NSArray *cellImageList = [sAniDTO.seriParameters objectForKey: kSFreshCellImageList] ;
                    
                    CAEmitterLayer *petalEmitterLayer = [[AVEmitterCollect alloc] petalEmitter:bgFrame cellImagePathList:cellImageList];
                    
                    petalEmitterLayer.beginTime = beginTime;
                    
                    [currentLayer.contentLayer addSublayer: petalEmitterLayer];
                    
                    break;
                }
                    
                case AVWeddingAndMagazine: //
                {
                    
                    break;
                }
                default:
                    break;
            }
            break;
        }
            
        case AVBabyGrouUp:
        {
            switch (sAniDTO.series) {
                case AVWeddingAndWhite:
                {
                    break;
                }
                    
                case AVWeddingAndSFresh:
                {
                    break;
                }
                default:
                    break;
            }
            break;
        }
            
        case AVTraveling:
        {
            switch (sAniDTO.series) {
                case AVWeddingAndWhite:
                {
                    break;
                }
                    
                case AVWeddingAndSFresh:
                {
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
    
}


@end
