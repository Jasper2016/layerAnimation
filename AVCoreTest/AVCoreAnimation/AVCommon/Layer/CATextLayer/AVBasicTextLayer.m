//
//  AVBasicTextLayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBasicTextLayer.h"
#import "AVTextFontConstant.h"

@implementation AVBasicTextLayer

- (id)initTextLayerWithFrame:(CGRect)frame
                        text:(id)text
                   textModel:(VCAnimateTextModel *)textModel
{
    self = [self init];
    if (self) {
        self.frame = frame;
        self.string = text;
        self.wrapped = YES;
        self.alignmentMode = kCAAlignmentLeft;
        //   self.contentsScale = [UIScreen mainScreen].scale;
        
        self.foregroundColor = textModel.textFontColor.CGColor;
        
        if ([[VCEditTextManager sharedInstance] isFontISExist:textModel.textFontName])
        {
            self.font = (__bridge CFTypeRef _Nullable)(textModel.textFontName);
            self.fontSize =  textModel.textFontSize;
        }
        else
        {
            
            self.font = (__bridge CFTypeRef _Nullable)(kDefalutFontName);
            self.fontSize =  kDefalutMinTitleFontSize;
            
            
            //            [[VCEditTextManager sharedInstance] downloadWithfontName:textModel.textFontName progressHandler:^(float percent) {
            //
            //                DLog(@"percent = %@",@(percent));
            //
            //            } completion:^(NSString *fontName) {
            //                dispatch_async( dispatch_get_main_queue(), ^ {
            //                    self.font = (__bridge CFTypeRef _Nullable)(textModel.textFontName);
            //                    self.fontSize = kAVCeilf(textModel.textFontSize);
            //                });
            //                
            //            }];
        }
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame intText:(NSString *)intText textFont:(UIFont *)textFont textColor:(UIColor *)textColor
{
    self = [self init];
    if (self) {
        self.frame = frame;
        
        self.string = intText;
//        
        self.font = (__bridge CFTypeRef)textFont;
        
        self.fontSize = textFont.pointSize;
//
//        CFStringRef fontName = (__bridge CFStringRef)textFont.fontName;
//        CGFontRef fontRef = CGFontCreateWithFontName(fontName);
//        self.font = fontRef;
//        self.fontSize = textFont.pointSize;
//        CGFontRelease(fontRef);
        
        self.alignmentMode = kCAAlignmentCenter;

        self.truncationMode = kCATruncationNone;
        
        self.foregroundColor = textColor.CGColor;
        
        self.contentsScale = [UIScreen mainScreen].scale;
        
        self.wrapped = YES; //设置后会自动换行
        
    }
    return self;
}

-(void)openTextDefultShadow
{
    self.masksToBounds = NO;
    self.shadowColor = [UIColor blackColor].CGColor;
    self.shadowOffset = CGSizeMake(2.0f,2.0f);
    self.shadowOpacity = 0.6;
}

- (void)configShadowColor:(UIColor *)color shadowOpacity:(float)opacity shadowOffset:(CGSize)offset{

    self.shadowColor = color.CGColor;
    self.shadowOpacity = opacity;
    self.shadowOffset = offset;
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
