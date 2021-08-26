//
//  AVRectUnit.h
//  TestSceneEffect
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AVSceneAniEnumType.h"

@interface AVRectUnit : NSObject
{

}

//此方法不负责 判断 人脸的个数
+(CGRect)rectFromCenterByFaceAwareStruct:(FaceRectMode)faceAwareStruct
                           oneFaceStruct:(FaceRectMode)oneFaceStruct;

+(FaceRectMode)hasOrNotFaceAwareRectMode:(NSDictionary *)aniParameter contendRect:(CGRect)contendRect;

//one Face
+(FaceRectMode)hasOrNotOneFaceAwareRectMode:(NSDictionary *)aniParameter contendRect:(CGRect)contendRect;

+(CGPoint)getScaleEndCenterPoint:(CGVector)startParma startFrame:(CGRect)startArea endFrame:(CGRect)contendRect;

+(ScaleEndCenterRadio)getScaleEndAreaCenter:(CGRect)partArea contendRect:(CGRect)contendRect;

+(FaceRectMode)getFaceRectOnImageAndWindows:(CGRect)transformFaceRect contendRect:(CGRect)contendRect  windowRect:(CGRect)windowRect;

+(CGRect)getSceneCropImageRect:(CGSize)origalImageSize contendLayerSize:(CGSize)contendLayerSize  partRect:(CGRect)partRect;


+(CGRect)rectFromCenterByNoAwareStruct:(CGRect)contendRect;

+(CGRect)getSqureRect:(CGRect)inpuRect;

@end
