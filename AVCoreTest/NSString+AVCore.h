//
//  NSString+AVCore.h
//  AVCoreTest
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 mac. All rights reserved.
//
#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


#define  kTextFontOffsetFactor       0.43

#define  kTextFontOffsetFactor2       0.215


@interface NSString (AVCore)

/**
 * 根据文字算背景框Size
 *
 * @param font 文字
 * @param maxSize 计算外框的大概Size
 * @param interval 文字到框的距离
 * @param isDefluatWidth 是否需要默认宽度
 * @param isDefaultHeight 是否需要默认高度
 *
 * return 外框的Size
 */

- (CGSize)textBroadSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize interval:(CGFloat)interval isDefluatWidth:(BOOL)isDefluatWidth;


- (CGSize)textBroadSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize interval:(CGFloat)interval isDefluatWidth:(BOOL)isDefluatWidth isDefaultHeight:(BOOL)isDefaultHeight;



@end
