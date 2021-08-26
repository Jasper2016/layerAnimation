//
//  AVWhiteStartLayer.m
//  testTextPlayShow
//
//  Created by mac on 15/9/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "AVWhiteStartLayer.h"

#import "AVBottomLayer.h"

#import "AVBasicTextLayer.h"

#import "AVStaticFunc.h"

#import "AVTheme.h"

#import "AVAniScaleSlowBasic.h"

@implementation AVWhiteStartLayer

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect vContentImage:(UIImage *)vContentImage  loveImage:(UIImage *)loveImage maskImage:(UIImage *)maskImage
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = vBorderRect;
        
        [self addSublayer: self.bgLayer];
        
        self.photoLayer.frame = vContentRect;
        
        if (vContentImage) {
            
            self.photoLayer.contentLayer.frame  = self.photoLayer.bounds;
            
            self.photoLayer.contentLayer.contents = (id)vContentImage.CGImage;
            
            [self.bgLayer addSublayer: self.photoLayer];
        }
        
        AVBottomLayer *startMaskeLayer = [[AVBottomLayer alloc] initWithFrame:vBorderRect
                                                                    withImage:maskImage];


        [self.bgLayer setMask: startMaskeLayer];
        
        self.contentLayer.contents = (id)loveImage.CGImage;
        
        [self addSublayer: self.contentLayer];
        
        self.masksToBounds = YES;
        
        
    }
    return self;
}

-(void)setFaceCenter:(NSDictionary *)aniParameter vContentRect:(CGRect)vContentRect
{
    CGFloat radio = vContentRect.size.width/self.frame.size.width;
    
    self.photoLayer.contentLayer.frame = CGRectMake(0, 0, radio*vContentRect.size.width, radio*vContentRect.size.height);
    
    FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:self.photoLayer.contentLayer.bounds];
    
    self.contentLayer.position = faceAwareRect.windowsCenter;
    
    [self.contentLayer setValue:[NSNumber numberWithFloat:faceAwareRect.windowsRadio] forKeyPath:@"transform.scale"];

}

-(void)startAnimation:(NSDictionary *)inputDic
{
    CGFloat fontSize = 45;
    
    CGFloat fontHight = 62;
    
    UIFont *font = [UIFont fontWithName:@"SnellRoundhand-Black" size:fontSize];
    
    NSString *boyName = [inputDic objectForKey:kAVWiddingGroomKey];
    
    NSString *grilsName = [inputDic objectForKey:kAVWiddingBrideKey];
    
    if (boyName && grilsName){
        
        AVBasicTextLayer *girlLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 450,600, fontHight)
                                                                      intText:grilsName
                                                                     textFont:font
                                                                    textColor:UIColorFromRGBAlpha(0xc9e300, 1)];

        
        [self addSublayer: girlLayer];
        
        girlLayer.masksToBounds = NO;
        
        
        AVBasicTextLayer *andLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 450+fontHight-10,600, 40)
                                                                      intText:@"&"
                                                                     textFont:font
                                                                    textColor:UIColorFromRGBAlpha(0xc9e300, 1)];
        
        
        [self addSublayer: andLayer];
        
        
        AVBasicTextLayer *girlsLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 450+fontHight+40-20,600, fontHight)
                                                                       intText:boyName
                                                                      textFont:font
                                                                     textColor:UIColorFromRGBAlpha(0xc9e300, 1)];
        
        [self addSublayer: girlsLayer];
    }
}

@end
