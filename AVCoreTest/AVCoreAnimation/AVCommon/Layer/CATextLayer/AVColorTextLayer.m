//
//  AVColorTextLayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVColorTextLayer.h"


#import "AVStaticFunc.h"

#import <CoreText/CoreText.h>

#import "NSString+WPAttributedMarkup.h"

#import "WPAttributedStyleAction.h"

#define kSizeOffset         10

@implementation AVColorTextLayer

- (id)initWithFrame:(CGRect)frame
{
    self = [self init];
    if (self) {
        self.frame = frame;
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame attributedText:(NSString *)text;
{
    self = [self init];
    if (self) {
        self.frame = frame;
        
        self.string =[text attributedStringWithStyleBook:[self textStyleRule]];
        
       // self.alignmentMode = @"center";
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame attributedText:(NSString *)text withType:(AVColorTextSizeType)sizeType;
{
    self = [self init];
    if (self) {
        self.frame = frame;
        
        switch (sizeType) {
            case AVColorTextForContend:
            {
                self.string =[text attributedStringWithStyleBook:[self textStyleRule]];
                break;
            }
            case AVColorTextForTitle:
            {
                self.string =[text attributedStringWithStyleBook:[self textTitleStyleRule]];
                
                break;
            }
            case AVColorTextForCarryTitle:
            {
                self.string =[text attributedStringWithStyleBook:[self textTitleStyleRule]];
                
                break;
            }
            default:
                break;
        }
        
    }
    return self;
}

-(NSDictionary *)textStyleRule
{
    NSDictionary *style = @{
                            //small
                            @"graySS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:17+kSizeOffset],
                                  [[UIColor grayColor]colorWithAlphaComponent:1]],
                            
                            @"mark1S" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:40+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:0.9]],
                            
                            @"blueS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:20+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 1)],
                            
                            @"whitleS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:20+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:1]],
                            
                            @"greenS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:20+kSizeOffset],
                                   UIColorFromRGBAlpha(0xb9cba8, 1)],
                            
                            @"grayS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:20+kSizeOffset],
                                  [[UIColor grayColor]colorWithAlphaComponent:1]],
                            
                            @"blueSneS" :
                                @[[UIFont fontWithName:@"SnellRoundhand" size:25+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 1)],
                            
                            //center
                            @"mark1" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:50+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:0.9]],
                            
                            @"blue" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:25+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            @"whitle" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:25+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:0.9]],
                            
                            @"green" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:25+kSizeOffset],
                                  UIColorFromRGBAlpha(0xb9cba8, 1)],
                            
                            @"gray" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:25+kSizeOffset],
                                  [[UIColor grayColor]colorWithAlphaComponent:0.8]],
                            
                            @"blueSne" :
                                @[[UIFont fontWithName:@"SnellRoundhand" size:30+kSizeOffset],
                                   UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            @"whitle1" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:30+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:0.9]],
                            
                            //bold
                            
                            @"blueB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:25+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            @"whitleB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:25+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:0.9]],
                            
                            @"greenB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:25+kSizeOffset],
                                   UIColorFromRGBAlpha(0xb9cba8, 1)],
                            
                            @"grayB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:25+kSizeOffset],
                                  [[UIColor grayColor]colorWithAlphaComponent:0.8]],
                            
                            @"blueSneB" :
                                @[[UIFont fontWithName:@"SnellRoundhand-Bold" size:30+kSizeOffset],
                                   UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            @"blue1B" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:30+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            //MAC
                            @"blueMB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:30+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            @"whitleMB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:30+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:0.9]],
                            
                            @"grayMB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:30+kSizeOffset],
                                  UIColorFromRGBAlpha(0xb9cba8, 1)],
                            
                            @"blueSneMB" :
                                @[[UIFont fontWithName:@"SnellRoundhand-Bold" size:35+kSizeOffset],
                                 [UIColor whiteColor]],
                            
                            @"blue1MB" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:35+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 0.9)],
                            
                            @"whitle1M" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:35+kSizeOffset],
                                  [[UIColor whiteColor]colorWithAlphaComponent:1]],
                            
                            @"green1M" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:35+kSizeOffset],
                                  UIColorFromRGBAlpha(0xb9cba8, 1)],
                            
                            //end
                        
                            };
    
    return style;
}

-(NSDictionary *)textTitleStyleRule
{
    NSDictionary *style = @{
                            @"main" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:35+kSizeOffset],
                                  UIColorFromRGB(0x00b7f2)],
                            @"grayBg": @[[UIColor darkGrayColor],[UIFont fontWithName:@"HelveticaNeue" size:26+kSizeOffset],
                                         @{NSBackgroundColorAttributeName : [[UIColor grayColor]colorWithAlphaComponent:0.9]}
                                         ],
                            @"body" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:25.0+kSizeOffset],
                                  [UIColor darkGrayColor]],
                            
                            @"thumb":[UIImage imageNamed:@"spark"],
                            };
    
    return style;
}

-(NSDictionary *)textCarrayTitleStyleRule
{
    NSDictionary *style = @{
                            @"blue" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:25+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 1)],
                            
                            @"whitleS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:20+kSizeOffset],
                                  [[UIColor grayColor]colorWithAlphaComponent:1]],
                            
                            @"blue1B" :
                                @[[UIFont fontWithName:@"HelveticaNeue-Bold" size:30+kSizeOffset],
                                  UIColorFromRGBAlpha(0x00b7f2, 1)],
                            
                            @"whitleS" :
                                @[[UIFont fontWithName:@"HelveticaNeue" size:20+kSizeOffset],
                                  [[UIColor grayColor]colorWithAlphaComponent:1]],
                            };
    
    return style;
}

-(CALayer *)maskLayer
{
    if (!_maskLayer) {
        
        _maskLayer =[[CALayer alloc] init];
        
        _maskLayer.frame =self.bounds;
        
        _maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        
        // [self addSublayer: _maskLayer];
    }
    
    return _maskLayer;
}


@end
