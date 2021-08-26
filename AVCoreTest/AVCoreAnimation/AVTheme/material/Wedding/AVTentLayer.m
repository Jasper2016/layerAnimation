//
//  AVTentLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/3/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVTentLayer.h"

@implementation AVTentLayer


- (void) showTextInfo:(NSString *)one two:(NSString *)two
{
    UIImage *weddingIconLineImage = [UIImage imageNamed:@"kWeddingWhiteLine.png"];
    
    CALayer *weddingLineLayer = [CALayer layer];
    
    weddingLineLayer.frame = CGRectMake( 0, 0, weddingIconLineImage.size.width , weddingIconLineImage.size.height);
    
    weddingLineLayer.position = CGPointMake(self.position.x, 2);
    
    weddingLineLayer.contents = (id)weddingIconLineImage.CGImage;
    
    weddingLineLayer.contentsGravity=kCAGravityResizeAspect;
    
    [self addSublayer: weddingLineLayer];
    
    CATextLayer *textOneLayer = [CATextLayer layer];
    
    textOneLayer.font = (__bridge CFTypeRef)[UIFont fontWithName:@"SnellRoundhand" size:40];
    
    textOneLayer.fontSize = 40;
    
    textOneLayer.frame =  CGRectMake(0 ,  weddingIconLineImage.size.height+8, self.frame.size.width, 57);
    
    textOneLayer.string = one;
    
    textOneLayer.foregroundColor = [UIColor whiteColor].CGColor;
    
    textOneLayer.alignmentMode = kCAAlignmentCenter;
    
    [self addSublayer: textOneLayer];
    
    CATextLayer *textTwoLayer = [CATextLayer layer];
    
    textTwoLayer.font = (__bridge CFTypeRef)[UIFont fontWithName:@"SnellRoundhand" size:40];
    
    textTwoLayer.fontSize = 40;
    
    textTwoLayer.frame =  CGRectMake(0 , textOneLayer.frame.origin.y+ textOneLayer.frame.size.height+5, self.frame.size.width, 64);
    
    textTwoLayer.string = two;
    
    textTwoLayer.foregroundColor = [UIColor whiteColor].CGColor;
    
    textTwoLayer.alignmentMode = kCAAlignmentCenter;
    
    [self addSublayer: textTwoLayer];
    
    
}



@end
