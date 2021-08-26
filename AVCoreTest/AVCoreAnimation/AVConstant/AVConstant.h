//
//  AVConstant.h
//  TestSceneEffect
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//  1920x1080  Diagonal


#define kHDRectangle  1

#ifdef kHDRectangle

#define kHDScreenWidth  576.0 // 960.0

#define kHDScreenHight  1024.0

//#define kHDScreenWidth  720.0 // 960.0
//
//#define kHDScreenHight  1280.0


//#define kHDScreenWidth  540.0 // 960.0
//
//#define kHDScreenHight  960.0

#else

#define kHDScreenWidth  600

#define kHDScreenHight  600

#endif

#define kBeforScreen  600

#define kAVScreenRadioY  kHDScreenHight/kBeforScreen

#define kAVScreenRadioX  kHDScreenWidth/kBeforScreen

#define isSquareCanvas ((kHDScreenWidth == kHDScreenHight)?YES:NO)

#define kAVDiagonalSlope ((kHDScreenWidth==kHDScreenHight)?1:1.5)    //对角斜率

#define kAVCeilfY(x)    ceilf(x*kAVScreenRadioY)

#define kAVCeilfX(x)    ceilf(x*kAVScreenRadioX)

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

#define kAVGetCanvasSlope   kHDScreenWidth/kHDScreenHight  //获取画布的斜率

#define kAVGetSizeSlope(size)   (size.width/size.height)

#define kAVRectWindow  CGRectMake(0, 0,kHDScreenWidth, kHDScreenHight)

#define kAVWindowWidth  CGRectGetWidth(kAVRectWindow)

#define kAVWindowHeight  CGRectGetHeight(kAVRectWindow)

#define kAVGetHightByWidth(width)      (width*kHDScreenHight)/kHDScreenWidth

#define kAVGetWidthByHight(hight)      (hight*kHDScreenWidth)/kHDScreenHight


#define kAVAlbumSize CGSizeMake(600, 600)

#define kAVRectWindowRD4 CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight/2)

#define kIphone6Pt  375

#define kRandRadioValue  (kAVWindowWidth/kIphone6Pt)

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

#define kAVWindowCenter  (CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)))

#define kCGRectCenterPoint(endArea)  (CGPointMake(CGRectGetMidX(endArea), CGRectGetMidY(endArea)))

#define kCGRectInArea(windowArea, offsetX, offsetY)   CGRectMake(offsetX, offsetY,CGRectGetWidth(windowArea)-(2*offsetX), CGRectGetHeight(windowArea)-(2*offsetY))


#define kCGRectOutArea(partArea, offsetX, offsetY)   CGRectMake(partArea.origin.x-offsetX, partArea.origin.x-offsetY,CGRectGetWidth(partArea)+(2*offsetX), CGRectGetHeight(partArea)+(2*offsetY))

#define kAVCGRectFromCenter(center, size)  CGRectMake(center.x-(size.width/2), center.y-(size.height/2),size.width, size.height)

#define kCGRectFromCenter(center, length)  CGRectMake(center.x-(length/2), center.y-(length/2),length, length)

#define kGetScaleParam(windowArea, partArea)    (windowArea.size.height/partArea.size.height)

#define kAVRectWindow4  CGRectMake(0, 0,200, 200)

#define kCGRectWindowCenter  (CGPointMake(CGRectGetMidX(kAVRectWindow), CGRectGetMidY(kAVRectWindow)))

#define kCGRectModiyAreaWidth(partArea, width)          CGRectMake(partArea.origin.x, partArea.origin.y,width, CGRectGetHeight(partArea))

#define kCGRectModiyAreaHight(partArea, hight)          CGRectMake(partArea.origin.x, partArea.origin.y,CGRectGetWidth(partArea), hight)

#define kCenterModiyY(pCenter, offsetY)          CGPointMake(pCenter.x, pCenter.y+offsetY)

#define kCenterModiyX(pCenter, offsetX)          CGPointMake(pCenter.x+offsetX, pCenter.y)

#define kAVLeftOffset(width)      ((kAVWindowWidth-width)/2)

#define KScaleSlowFullDuration      kAVCeilfY(6)

#define KScaleSlowFullOffset      kAVCeilfY(10)

#define KCameraPathStartArea    @"StartArea"

#define KCameraPathEndArea      @"EndArea"

#define KCameraPathStartAngle   @"StartAngle"

#define KCameraPathEndAngle   @"EndAngle"

#define KAVArtTextRectKey  @"KAVArtTextRectKey"

#define KAVFaceDtoKey  @"KAVFaceDtoKey"

#define isDictionaryRangeError(dic, icount)   (((dic) == nil) || ([dic count] < icount) )

// 37.5fpx ->6s -> 放大 缩小 倍数：0.1倍
#define KScaleSlowFactorOffset                  (CGRectGetWidth(kAVRectWindow)/10)


#define kGetYDistance(startArea, endArea)     fabs(startArea.origin.y-endArea.origin.y)

#define kGetXDistance(startArea, endArea)     fabs(startArea.origin.x-endArea.origin.x)

#define kTranLeftTopToCenter(pointX, pointY)     CGPointMake(pointX+kAVWindowCenter.x, pointY+kAVWindowCenter.y)


#define kGetRandomString  [NSString stringWithFormat:@"%d", arc4random()]

#define kAVWeddingMagazineFont(zx) [UIFont fontWithName:@"TamilSangamMN" size:zx]


//------------------------------ AV Player --------------------
#define kFadeOutDuration  0.37
