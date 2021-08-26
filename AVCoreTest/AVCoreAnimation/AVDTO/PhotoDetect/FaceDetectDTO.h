//
//  FaceDetectDTO.h
//  TestVideoPreViewing
//
//  Created by mac on 15/6/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "AVSceneAniEnumType.h"

@interface FaceDetectDTO : NSObject
{

}

@property(nonatomic, assign) NSInteger         faceCount;

@property(nonatomic, assign) FaceRectMode    faceStruct1;

@property(nonatomic, assign) FaceRectMode    faceStruct2;

@property(nonatomic, assign) FaceRectMode    faceStructEnd;

@property(nonatomic, assign) FaceRectMode    totalFaceStruct;

@property(nonatomic, assign) CGPoint          totalFacePoint;

@property(nonatomic, assign) FaceRectMode     faceAwareStruct;

@property(nonatomic, assign) CGRect            contendRect;    //照片存放rect

@property(nonatomic, assign) AVPhotoGeometry    photoGeometry;  //图片的几何形状


@end
