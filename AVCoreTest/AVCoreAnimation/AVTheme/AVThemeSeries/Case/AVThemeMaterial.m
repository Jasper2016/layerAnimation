//
//  AVThemeMaterial.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVThemeMaterial.h"

#import "CAMultiColorLayer.h"

#define kOffsetX      11

@implementation AVThemeMaterial

+(AVBasicLayer *)AVWeddingAndWhiteBorder:(AVBasicLayer *)cLayer
{
    CAMultiColorLayer *borthLayer = [[CAMultiColorLayer alloc] init];
    
    borthLayer.frame = CGRectMake(kOffsetX, kOffsetX, cLayer.frame.size.width-(2*kOffsetX), cLayer.frame.size.height-(2*kOffsetX));
    
    
    NSArray *colorList = @[
                           (id)[[UIColor whiteColor] colorWithAlphaComponent:0.9].CGColor,
                           (id)[[UIColor whiteColor] colorWithAlphaComponent:0.7].CGColor,
                           
                           ];
    
    NSArray *sideList = @[
                          [NSValue valueWithCGSize: CGSizeMake(cLayer.frame.size.width-(2*kOffsetX), 5)],
                          [NSValue valueWithCGSize: CGSizeMake(cLayer.frame.size.width-38, 2)],
                          
                          ];
    
    borthLayer.colorArr = colorList;
    
    borthLayer.sideArr = sideList;
    
    [borthLayer setNeedsDisplay];
    
    borthLayer.opacity = 0.6;

    return (AVBasicLayer *)borthLayer;
}

@end
