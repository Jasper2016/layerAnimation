//
//  AVTimeLineTextLayer.h
//  AVCoreTest
//
//  Created by yinshengqi on 17/3/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "AVTimeLineTypedefEnum.h"
#import "NSString+AVCore.h"
@class AVBasicTextLayer;

@interface AVTimeLineTextLayer : CALayer
- (instancetype)initWithFrame:(CGRect)borderRect
                     position:(CGPoint)position
                     withText:(NSString *)text
                         font:(UIFont *)font
                     interval:(CGFloat)interval
                    borderDic:(AVBorderRrrowDicType)borderDic;

- (instancetype)initWithPosition:(CGPoint)position
                            size:(CGSize)size
                        withText:(NSString *)text
                            font:(UIFont *)font
                  isDefluatWidth:(BOOL)isDefluatWidth
                        interval:(CGFloat)interval
                       borderDic:(AVBorderRrrowDicType)borderDic;
@end
