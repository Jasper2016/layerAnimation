//
//  AVTextAttributedHelper.m
//  AVCoreTest
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AVTextAttributedHelper.h"
#import "AVConstant.h"
#import "VCAnimateTextModel.h"
#import "VCEditTextManager.h"

#import <CoreText/CoreText.h>

#define kDefultTextName     @"PingFangSC-Regular"

#define kDefultTextSize      30


@implementation AVTextAttributedHelper

- (CGSize)boundingRectTextModel:(VCAnimateTextModel *)textModel
                      photoDesc:(NSString *)photoDesc
                       areaSize:(CGSize)areaSize
                   isEqualWidth:(BOOL)isEqualWidth
                  isEqualHeight:(BOOL)isEqualHeight
{
    
    if ([[VCEditTextManager sharedInstance] isFontISExist:textModel.textFontName])
    {
        UIFont *font = [UIFont fontWithName:textModel.textFontName size:textModel.textFontSize];

        NSString *textString = photoDesc;
      
        return [self boundingRectWithSize:areaSize textColor:textModel.textFontColor
                          textFont:font
                              text:textString
                      isEqualWidth:isEqualWidth
               isEqualHeight:isEqualHeight];
        
    }
    else
    {
        __weak typeof(self)weakSelf = self;
        
        //默认
        [[VCEditTextManager sharedInstance] downloadWithfontName:textModel.textFontName progressHandler:^(float percent) {
            
            NSLog(@"percent = %@",@(percent));
            
        } completion:^(NSString *fontName) {
            __strong typeof(weakSelf)strongSelf = weakSelf;
            dispatch_async(dispatch_get_main_queue(), ^{
               
                UIFont *font = [UIFont fontWithName:fontName size:textModel.textFontSize];
                NSString *textString = @"";
                if (textModel.textContent.length > 0) {
                    
                    textString = textModel.textContent;
                }else{
                    
                    textString = photoDesc;
                }
                [strongSelf boundingRectWithSize:areaSize
                                 textColor:textModel.textFontColor textFont:font
                                      text:textString
                              isEqualWidth:isEqualWidth
                             isEqualHeight:isEqualHeight];
                
            });
        }];
    }
    return CGSizeZero;
}

-(CGSize)boundingRectWithSize:(CGSize)size
                    textColor:(UIColor *)textColor
                     textFont:(UIFont *)textFont
                         text:(NSString *)text
                 isEqualWidth:(BOOL)isEqualWidth
                isEqualHeight:(BOOL)isEqualHeight
{
    if (textColor && textFont && text){
        
        
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];

        paragraphStyle.alignment = NSTextAlignmentCenter;
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        
        NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,NSParagraphStyleAttributeName
                                     ,textFont,NSFontAttributeName,
                                     textColor,NSForegroundColorAttributeName, nil];
        
         self.attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];

        
        CGSize newSize = [self boundingRectWithSizeAttribute:size];
        
        CGFloat retureWidth = isEqualWidth?size.width : newSize.width;
        
        CGFloat retureHeight = isEqualHeight?size.height :newSize.height;
        
        return CGSizeMake(retureWidth, retureHeight);
    
        
//        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.lineSpacing = 1.0;
//        paragraphStyle.alignment = NSTextAlignmentCenter;
//        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//        
//        NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,NSParagraphStyleAttributeName , [NSNumber numberWithFloat:3.0] , NSKernAttributeName,textFont,NSFontAttributeName,textColor,NSForegroundColorAttributeName, nil];
//        self.attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
//        
//        CGSize newSize = [self.attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
//        
//        newSize.height = isEqualHeight?MAX(kDefaultBroadHeight,ceilf(newSize.height)):ceilf(newSize.height);
//        
//        CGFloat retureWidth = isEqualWidth?size.width : ceilf(newSize.width);
//        
//        CGFloat retureHeight = ceilf(newSize.height + kAVTextRadio(textFont.pointSize));
//        
//        return CGSizeMake(retureWidth, retureHeight);
    
    }else{
    
        return size;
    }

}

- (CGSize)boundingRectWithSizeAttribute:(CGSize)size {
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedString);
    CGSize targetSize = CGSizeMake(size.width, CGFLOAT_MAX);
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [self.attributedString length]), NULL, targetSize, NULL);
    CFRelease(framesetter);
    return fitSize;
}

@end
