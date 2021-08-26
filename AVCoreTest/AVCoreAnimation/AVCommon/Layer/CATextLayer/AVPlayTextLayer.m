//
//  AVPlayTextLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/4/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVPlayTextLayer.h"

#import <CoreText/CoreText.h>

#import "NSString+WPAttributedMarkup.h"

#import "WPAttributedStyleAction.h"

#import "AVStaticFunc.h"

#import "AVCommonHeader.h"

#import "AVSceneAniEnumType.h"

#import "AVConstant.h"


@implementation AVPlayTextLayer

- (id)initWithFrame:(CGRect)frame attributeStringText:(NSMutableAttributedString *)attributeText
{
    self = [self init];
    if (self) {
        self.frame = frame;

       // self.contentsScale = [UIScreen mainScreen].scale;
        
        self.wrapped = YES; //设置后会自动换行
        
        self.string = attributeText;
        
//        self.alignmentMode = kCAAlignmentCenter;
//    
//        self.truncationMode = kCATruncationNone;
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame attributedText:(NSString *)text;
{
    self = [self init];
    if (self) {
        self.frame = frame;
        
        self.string =[text attributedStringWithStyleBook:[self textStyleRule]];
        
    }
    return self;
}


-(void)addAni:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime aniFactor:(NSInteger)aniFactor
{
    switch (aniFactor) {
        case AVArtAniTextStandstill:
        {
            
            break;
        }
            
        case AVArtAniTextFadeInOut:
        {
          //  self.mask = self.maskLayer;
            
            self.opacity= 0;
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime ];
            
            [self addAnimation:opacityOpen forKey:@"opacityOpen"];
            
            break;
        }
            
        case AVArtAniTextPlay:
        {
            self.mask = self.maskLayer;
            
            CGPoint startPosition = CGPointMake(-(self.frame.size.width/2), self.frame.size.height/2);
            
            CGPoint nextPosition = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
            
            CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPosition toValue:nextPosition];
            
            [self.maskLayer addAnimation: moveAni forKey:@"moveAni"];
            
            break;
        }
            
        case AVArtAniTextBottomToCenter:
        {
           // self.opaque= 0;
            
                        self.mask = self.maskLayer;
            
            CGPoint startCenterPoint =CGPointMake(0, self.bounds.size.height);
            
            CGPoint endCenterPoint =CGPointMake(0, 0);
            
            CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:0 fromValue:startCenterPoint toValue:endCenterPoint];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:0];
            
            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,opacityOpen]];
            
            self.maskLayer.anchorPoint = CGPointMake(0, 0);
            
            [self.maskLayer addAnimation:animationGroup forKey:@"animationGroup"];
            break;
        }
            
        case AVArtAniTextCenterToUpDown:
        {
            self.mask = self.maskLayer;
            
            NSArray *boundsKeyTime = @[
                                       [NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:1],
                                       ];
            
            NSArray *boundsValues = @[
                                      [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width, 0)],
                                      [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)],
                                      ];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
            
            [self.maskLayer addAnimation:boundsAni forKey:@"dsd"];
            break;
        }
            
        case AVArtAniTextCenterToLeftRight:
        {
            self.mask = self.maskLayer;
            
            NSArray *boundsKeyTime = @[
                                       [NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:1],
                                       ];
            
            NSArray *boundsValues = @[
                                      [NSValue valueWithCGRect:CGRectMake(0, 0, 0, self.frame.size.width)],
                                      [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)],
                                      ];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
            
            [self.maskLayer addAnimation:boundsAni forKey:@"dsd"];
            break;
        }
            
        default:
            break;
            
    }
    
    
}

-(NSDictionary *)textStyleRule
{
    NSDictionary *style = @{
                            @"main" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:30],
                                  UIColorFromRGB(0x00b7f2)],
                            @"grayBg": @[[UIColor whiteColor],[UIFont fontWithName:@"HelveticaNeue" size:21],
                                         @{NSBackgroundColorAttributeName : [[UIColor grayColor]colorWithAlphaComponent:0.9]}
                                         ],
                            @"body" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0],
                                  [UIColor whiteColor]],
                            
                            @"thumb":[UIImage imageNamed:@"spark"],
                            };
    
    return style;
}

@end
