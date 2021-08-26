//
//  AVArtAniCase.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVArtAniCase.h"

#import "AVArtAniWedding.h"

#import "AVArtWedingMagazine.h"

@implementation AVArtAniCase

+(void)AVArtAni:(CFTimeInterval)beginTime  currentLayer:(AVBasicLayer *)currentLayer AniDTO:(AVAniDTO *)sAniDTO
{
    
    switch (sAniDTO.themeStyle) {
        case AVWedding:
        {
            switch (sAniDTO.series) {
                case AVWeddingAndWhite:
                {
                    [AVArtAniWedding AVArtAniWeddingWhite:beginTime aAniDTO:sAniDTO.sceneDTO artParameters:sAniDTO.sceneDTO.artParameters Layer:currentLayer];
                                        
                    break;
                }
                    
                case AVWeddingAndSFresh:
                {
                    [AVArtAniWedding AVArtAniWeddingSFresh:beginTime AniDTO:sAniDTO.sceneDTO artParameters:sAniDTO.sceneDTO.artParameters Layer:currentLayer];
                    
                    break;
                }
                    
                case AVWeddingAndMagazine:
                {
                    [AVArtWedingMagazine AVArtAniWeddingMagazine:beginTime aAniDTO:sAniDTO.sceneDTO artParameter:sAniDTO.sceneDTO.artParameters Layer:currentLayer];
                    
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
