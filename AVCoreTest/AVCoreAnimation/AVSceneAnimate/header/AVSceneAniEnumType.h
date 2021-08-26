//
//  AVSceneAniEnumType.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define  kAVNotExist     99

struct ScaleEndCenterRadio {
    CGPoint center;
    CGFloat radio;
};
typedef struct ScaleEndCenterRadio ScaleEndCenterRadio;

CG_INLINE ScaleEndCenterRadio ScaleRadioMake(CGPoint center, CGFloat radio);

CG_INLINE ScaleEndCenterRadio ScaleRadioMake(CGPoint center, CGFloat radio)
{
    return (ScaleEndCenterRadio){center, radio};
}

//
struct FaceRectMode {
    
    CGPoint windowsCenter;
    
    CGFloat windowsRadio;
    
    CGRect  onImageFaceRect;
//    CGRect  faceRectOnWindows;
};
typedef struct FaceRectMode FaceRectMode;

CG_INLINE FaceRectMode FaceRectStructMake(CGPoint windowsCenter, CGFloat windowsRadio, CGRect onImageFaceRect);

CG_INLINE  FaceRectMode FaceRectStructMake(CGPoint windowsCenter, CGFloat windowsRadio, CGRect onImageFaceRect)
{
    return (FaceRectMode){windowsCenter, windowsRadio, onImageFaceRect};
};


#define FaceRectStructZero          FaceRectStructMake(kCGRectWindowCenter, 1, CGRectZero)

typedef enum {
    AVInsertStartScene=0,
    
    AVInsertAlbumImage,
    
    AVInsertBeforeAlbum,  //插入之前的相册
    
    AVInsertEndAlbum =99,
    
    AVInsertNone,
    
} AVInsertSceneType;


typedef enum {
    AVScaleSlowCenterIn=0 ,
    AVScaleSlowCenterInShake=1,
    AVScaleSlowCenterOut=2,
    AVScaleSlowCenterOutShake=3,
    AVSceneAniYScaleCenterIn=4,
    
    AVSceneAniBaseScaleCenterOut=5,
    
    AVSceneAniBaseScaleCenterIn = 6,
    
    AVSceneAniScaleCenterIn = 7,
    
    AVSceneAniScaleCenterOut = 8,
    
    AVScaleSlowHasParam,  //指定确定进行放大 或者缩小
    
    AVScaleSlowHasNone,
    
} AVSceneType;


typedef enum {
    AVPhotoSquare =0,
    AVPhotoHorizontal,
    AVPhotoVertical,
    
} AVPhotoGeometry;  //几何类型

typedef enum {
    AVSceneAniOrienteMove   =0, //四个方向慢速移动
    AVSceneAniScaleZCenter  =1,
    AVSceneAniNoFaceShakeMove=2,  //没有face， 四个方向
    AVSceneAniOneFace       =3,    //一个人脸的动画
    AVSceneAniMoveShakeWhite=4, //  /一个人脸 或者没有人脸
    AVSceneAniYCameraPath   =5,  //两个人脸的动画
    AVSceneAniMaskSharpenFilter =6,  //  将滤镜当作遮罩效果层, 支持不同滤镜层变化
    
    AVSceneAniMustMoveDic   =7, //四个方向 有快 和慢 移动，是一定的移动
    
    AVSceneAniBaseNone      = 98,

    AVSceneAniYNone = kAVNotExist,
    
} AVSceneAniType;

typedef enum {
    
    AVMaskFilterSharpenRestore   =0,   // 从各种锐化效果 恢复到 原始image      //0.4
    
    AVMaskFilterSharpenWhiteShining,  //白色锐化效果 闪烁  3s 
    
    AVMaskFilterNotOriginalToBlur,
    
    AVMaskFilterNotOriginal     = 99,
    
} AVMaskFilterType;

typedef enum {
    
    AVFlashinglights   =0, 
    
} AVFlashinglightsType;

typedef enum {
    
    AVArtAniWeddingStart = 0,
    AVArtAniWeddingEnd=1 ,
    AVArtAniTextShow =2,
    AVArtAniFlashinglights=3,
    AVArtAniOpacityBlackBgText=4,
    AVArtAniNone = kAVNotExist,
    
} AVArtWeddingAniType;

typedef enum {
    AVArtAniBgMaskBgtWhiteText   =0, //下到上

    
} AVArtAniBgMaskBgTextType;

typedef enum {
    AVArtAniTextStandstill =0,//一直不动
    AVArtAniTextFadeInOut,
    AVArtAniTextPlay,
    AVArtAniTextBottomToCenter,
    AVArtAniTextCenterToUpDown,
    AVArtAniTextCenterToLeftRight,
    
} AVArtFactorType;


typedef enum {
    AVSceneAniBaseNoneFaceCenter =0,//一直不动
    AVSceneAniBaseNoneNo,

} AVSceneAniBaseNoneType;

//typedef NS_ENUM(NSUInteger, <#MyEnum#>) {
//    <#MyEnumValueA#>,
//    <#MyEnumValueB#>,
//    <#MyEnumValueC#>,
//};

typedef enum {
    
    AVAniMoveMustRightToLeft=0,  /// 以上四个 必定会移动
    AVAniMoveMustLeftToRight=1,
    AVAniMoveMustTopToBottom =2,
    AVAniMoveMustBottomToTop = 3,
    
    AVAniMoveMustLeftBottomToRightUp = 4,
    
    AVAniMoveMustRightUpToLeftBottom = 5,
    
    AVAniMoveMustRightBottomToLeftUp = 6,
    
    AVAniMoveMustLeftUpToRightBottom = 7,
    
    AVAniMoveColorWhiteTwoKnife

    
} AVAniMustMoveDicype;

typedef enum {
    
    AVAniXYRightToLeft=0,
    
    AVAniXYLeftToRight=1,
    AVAniXYTopToBottom=2,
    AVAniXYBottomToTop=3,
    
    AVAniXYCustom,
    
} AVAniMoveXYType;


typedef enum {
    
    AVAniSlideCenterToRight=0,
    AVAniSlideCenterToLeft,
    AVAniSlideCenterToUp,
    AVAniSlideCenterToBottom,
    
} AVAniSlideDicType;

typedef enum {

    AVAniXYPushCurrentUp =4,
    
    AVAniXYPushRightToLeftEdgeText=5,
    
} AVAniMoveXYPushType;

typedef enum {
    
    AVAniBaseNotAni=0,
    AVAniBaseNextInBack,
    AVAniBaseFadeInOut,

    
} AVAniBaseAniType;

typedef enum {
    AVAniShakeInRightToLeft=0,
    AVAniShakeInLeftToRight,
    AVAniShakeInTopToBottom,
    AVAniShakeInBottomToTop=3,
    
    AVAniShakeWhiteShowFace=4,
    AVAniShakeWhiteTORadio=5,
    
    AVAniShakeWhiteLeftRight=6,  //左右颤抖 变化
    
    AVAniShakeWhitePhotoTo4=7,
    
} AVAniShakMoveType;

#define AVMaskDirType  AVAniMoveXYType

typedef enum {
    
    AVAniCameraTwoContinue=0,
    AVAniCameraTwoNoFadeMove,
    AVAniCameraSwitchFaceFade,  //4s
    AVAniCenterToOneMoveOneFace,   // 5s
    
} AVAniCameraTwoType;

typedef enum {
    
    AVAniCameraOneShakeMoveIn=0,
    AVAniCameraOneShakeMoveOut,
    
} AVAniCameraOneType;
