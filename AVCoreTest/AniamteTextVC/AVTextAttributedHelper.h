//
//  AVTextAttributedHelper.h
//  AVCoreTest
//
//  Created by mac on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "VCAnimateTextModel.h"

//某些动画的文字，需要具体高度 eg：showHouse whiteSlider
#define  kDefaultBroadHeight   kAVCeilf(90)

@interface AVTextAttributedHelper : NSObject
{
}

@property (nonatomic, copy) NSMutableAttributedString *attributedString;

- (CGSize)boundingRectTextModel:(VCAnimateTextModel *)textModel
                      photoDesc:(NSString *)photoDesc
                       areaSize:(CGSize)areaSize
                   isEqualWidth:(BOOL)isEqualWidth
                  isEqualHeight:(BOOL)isEqualHeight;

-(CGSize)boundingRectWithSize:(CGSize)size
                    textColor:(UIColor *)textColor
                     textFont:(UIFont *)textFont
                         text:(NSString *)text
                 isEqualWidth:(BOOL)isEqualWidth
                isEqualHeight:(BOOL)isEqualHeight;


@end
