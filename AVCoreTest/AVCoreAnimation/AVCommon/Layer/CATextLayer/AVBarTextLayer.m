//
//  AVBarTextLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/4/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBarTextLayer.h"

@implementation AVBarTextLayer

- (id)initWithFrameOlny:(CGRect)frame textFont:(UIFont *)font fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textSting:(NSString *)textSting bgImage:(UIImage *)bgImage
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.contents = (__bridge id)bgImage.CGImage;
        
        
        _textLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(0, 3, self.frame.size.width, self.frame.size.height)
                                                                      intText:textSting
                                                                     textFont:[UIFont systemFontOfSize:40]
                                                                    textColor:[UIColor whiteColor]];
        
        [self addSublayer: _textLayer];

    }
    return self;
}

- (id)initWithFrame:(CGRect)frame textFont:(UIFont *)font fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textSting:(NSString *)textSting bgImage:(UIImage *)bgImage
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.contents = (__bridge id)bgImage.CGImage;
        
        _textLayer = [[AVBasicTextLayer alloc] initWithFrame:self.bounds intText:textSting textFont:font textColor:textColor];
        
        [self addSublayer: _textLayer];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame textFont:(UIFont *)font fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textSting:(NSString *)textSting
            bgColor:(UIColor *)bgcolor
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        _textLayer = [[AVBasicTextLayer alloc] initWithFrame:self.bounds intText:textSting textFont:font textColor:textColor];
        
        [self addSublayer: _textLayer];
        
        self.backgroundColor = bgcolor.CGColor;
    }
    return self;
}

@end
