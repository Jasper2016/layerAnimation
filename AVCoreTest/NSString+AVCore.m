//
//  NSString+AVCore.m
//  AVCoreTest
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSString+AVCore.h"

#import "NSString+Additions.h"

#define kmaxValues 20

#define  kDefaultBroadHeight   90

@implementation NSString (AVCore)

- (CGSize)textBroadSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize interval:(CGFloat)interval isDefluatWidth:(BOOL)isDefluatWidth
{
    
    CGSize textSize = [self sizeWithFont:font maxSize:CGSizeMake(maxSize.width - (2*interval), MAXFLOAT)];
    
    CGFloat textHight = textSize.height + (font.pointSize * kTextFontOffsetFactor);
    
    CGFloat textWidth = 0;
    if (isDefluatWidth == YES) {
        
        textWidth = maxSize.width;
    }else{
        
        if ((maxSize.width-(textSize.width+(2*interval))) < kmaxValues) {
            
            textWidth = maxSize.width;
        }else{
            
            textWidth = textSize.width+(2*interval);
        }
    }
    return CGSizeMake(textWidth, textHight + (2*interval));
}

- (CGSize)textBroadSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize interval:(CGFloat)interval isDefluatWidth:(BOOL)isDefluatWidth isDefaultHeight:(BOOL)isDefaultHeight
{
    
    CGSize textSize = [self sizeWithFont:font maxSize:CGSizeMake(maxSize.width - (2*interval), MAXFLOAT)];
    
    CGFloat textHight = textSize.height + (font.pointSize * kTextFontOffsetFactor);
    
    CGFloat textWidth = isDefluatWidth == YES?maxSize.width:textSize.width+(2*interval);
    
    CGFloat returnHight = isDefaultHeight == YES?MAX(kDefaultBroadHeight, textHight + (2*interval)):(textHight + (2*interval));
    
    return CGSizeMake(textWidth, returnHight);
}

@end
