//
//  AVAlbum.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//


typedef enum {
    
    AVVHorizontal= 0,
    AVVVertical,
    AVVSquare,
    
} AVVSizeMode;

typedef enum {
    
    AVMediaVideo= 0,
    AVMediaPhoto,
    AVMediaMusic,
    
} AVCompMediaType;

typedef NS_ENUM(NSInteger, AVImageFilterType) {
    AVImageFilterNone =0,
    AVImageFilterBlackWhite,
    AVImageFilterGaussianBlur,
    AVImageFilter2IOS7Blur1,
    AVImageFilteriOS7GaussianBlur,
    AVImageFilterCenterGaussianBlur,
    AVImageFilterVignette,
    AVImageFilterToneCurve,      //色调曲线
    AVImageFilterToneCurve2,
    AVImageFilterNostalgia,      //还旧
    AVImageFilterGete,
    AVImageFilterQinglu,
    AVImageFilterQingxin,
    AVImageFilterYanHong,         //艳红
    AVImageFilterHuanghun,
    AVImageFilterSketch,       //漫画
    AVImageFilterBrightness, // 曝光
    AVImageFilterWhiteBalance,
};

typedef NS_ENUM(NSInteger, AVCustomFilterType) {
    AVImageFilter2None =0,
    AVImageFilter2Amaro =1,
    AVImageFilter2SoftElegance=2,
    AVImageFilter2MissEtikate=3,
    AVImageFilter2Nashville=4,
    AVImageFilter2LordKelvin=5,
    AVImageFilter2Amatorka=6,
    AVImageFilter2Rise=7,
    AVImageFilter2Hudson=8,
    AVImageFilter2XproII=9,
    AVImageFilter21977=10,
    AVImageFilter2Valencia=11,
    AVImageFilter2Walden=12,
    AVImageFilter2Lomo=13,
    AVImageFilter2Inkwell=14,
    AVImageFilter2Sierra=15,
    AVImageFilter2Earlybird=16,
    AVImageFilter2Toaster=17,
    AVImageFilter2Brannan=18,
    AVImageFilter2Hefe=19,
    AVImageFilter2BlackWhite=20,
   // AVImageFilter2IOS7Blur1=21,
    AVImageFilter2BeautifyFace=22,
};

