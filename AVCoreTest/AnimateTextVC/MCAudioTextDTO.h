//
//  MCAudioTextDTO.h
//  MyTest
//
//  Created by xwxing on 2018/9/12.
//  Copyright © 2018年 x. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,TextAnimateType) {

    VCTextAnimateTypeNone = 1,
    VCTextAnimateTypeWriter,// 打字机
    VCTextAnimateTypeScale,// 缩放
    
};

typedef NS_ENUM(NSUInteger, TextTransAniType) {

    VCTransitionTypeUp = 1,
    VCTransitionTypeUpScale,// 缩放
    VCTransitionTypeClockwise,// 顺时针
    VCTransitionTypeAnticlockwise// 逆时针
    
};

@interface MCAudioTextDTO : NSObject

@property (nonatomic, copy) NSString *textContent; //字幕内容（包含标题）

@property (nonatomic, copy) NSString *textFontName;//字幕的字体名字

@property (nonatomic, strong) UIColor *textFontColor;//字幕颜色

@property (nonatomic, assign) CGFloat textFontSize;//字幕大小

@property (nonatomic, assign) CFTimeInterval beginTime;//动画的开始时间

@property (nonatomic, assign) CFTimeInterval duration;//动画时间

@property (nonatomic, assign) CFTimeInterval transTime;//转场时间

@property (nonatomic, assign) CGFloat offsetY;//Y轴偏移的位置

@property (nonatomic, assign) CGSize textBgSize;//字幕背景Size

@property (nonatomic, assign) CGFloat textHeight;//字幕高度

@property (nonatomic, assign) CGFloat aniScaleValue;//文字缩放倍数

@property (nonatomic, assign) CGFloat transScaleValue;//转场缩放倍数

@property (nonatomic, assign) TextAnimateType animateType;

@property (nonatomic, assign) TextTransAniType transitionType;

- (void)encodeFromDic:(NSDictionary *)dic;

@end
