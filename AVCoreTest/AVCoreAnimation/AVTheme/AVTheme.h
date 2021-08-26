//
//  AVTheme.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//


typedef enum {
    
    AVWedding= 0,
    AVBabyGrouUp,
    AVTraveling,
    
} AVThemeStyle;



typedef enum {
    AVWeddingAndWhite =0,
    AVWeddingAndSFresh,   //小清晰
    AVWeddingAndMagazine,
    AVWeddingAndLawnPhoto,   //草坪相框
    AVWeddingAndNone,
    
} AVWeddingSeries;

typedef enum {
    
   AVSeriesConnecteNomal = 0, // 常规模式切换
   AVSeriesConnecte2DMap,   //地图玩法
   AVSeriesConnecte3DMap,
    
} AVSeriesAniMode;  //每个系列动画模式

// map mode

#define KAVMapRectKey     @"KAVMapRectKey"

#define KAVMapTopRectKey     @"KAVMapTopRectKey"

#define KAVMapStartRectKey     @"KAVMapStartRectKey"

#define KAVMapBGImageKey     @"KAVMapBGImageKey"

#define kSeriesBgImageName     @"seriesBgImageName"

#define kSeriesBgFrame          @"seriesBgFrame"

#define KAVMapIntervalOffset    80

#define kAVMapStartXOffset(X)   ((CGRectGetWidth(kAVRectWindow)/2)+X)

#define kAVMapStartHintRect(x)  CGRectMake(kAVMapStartXOffset(x)+KAVMapIntervalOffset,0,CGRectGetWidth(kAVRectWindow), CGRectGetWidth(kAVRectWindow))    // 上一次 目录结束的位置


#define kAVMapTopHintRect(partArea)  CGRectMake(kAVMapStartXOffset(partArea.origin.x), partArea.origin.y, CGRectGetWidth(partArea), CGRectGetHeight(partArea))

// map themeStyle

#define kSFreshCellImageList     @"SFreshCellImageList"

#define kAVWiddingBrideAndGroomKey   @"BrideGroom"

#define kAVWiddingGroomKey      @"WiddingGroomKey"

#define kAVWiddingBrideKey      @"WiddingBrideKey"

#define kAVWiddingDateKey       @"WiddingDateKey"

#define kAVWiddingThemeKey      @"WiddingWhite"  // 此处 可以 当 title 

#define kAVWiddingdataList      @"dataList"

#define kAVArtTextKey           @"kAVArtTextKey"

#define kSceneFilterKey         @"kSceneFilterKey"

#define kAVVideoTitle           @"Title"

#define KAVArtSceneTextKey      @"ArtSceneText"

#define kStartPointKey          @"startPoint"

#define kEndPointKey            @"endPoint"

#define kStartAnglekey          @"StartAngle"

#define kEndAnglekey            @"EndAngle"

#define kKeppAnglekey           @"KeepAngle"

#define kPhotoBorthName         @"PhotoBorthName"

#define kInnerBorthFrame        @"InnerBorthFrame"

#define kIsBorderFront          @"isBorderFront"

#define kUIFontMainx(sizex)   [UIFont fontWithName:@"SukhumvitSet-Thin" size:sizex]

#define kUIFontSecond(sizex)   [UIFont fontWithName:@"SukhumvitSet-Thin" size:sizex]

#define kUIFontBoldSecond(sizex)   [UIFont fontWithName:@"SukhumvitSet-Bold" size:sizex]


#define IsDicValueNotNil(dic , key) ((dic != nil) && ([dic objectForKey:key] !=nil))

#define IsDicValueNotDufalut(dic , key, inputText) ((IsDicValueNotNil(dic, key))?[dic objectForKey:key]:inputText)


