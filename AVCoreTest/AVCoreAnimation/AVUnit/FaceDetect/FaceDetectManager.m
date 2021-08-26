//
//  FaceDetectManager.m
//  SNYifubaoMerchant
//
//  Created by gemin on 15/4/7.
//  Copyright (c) 2015年 Suning. All rights reserved.
//

#import "FaceDetectManager.h"
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

#import "AVRectUnit.h"

#import "AVConstant.h"

#define kCGRectCenterPoint(endArea)  (CGPointMake(CGRectGetMidX(endArea), CGRectGetMidY(endArea)))

#define kStandardFaceZise       kAVCeilfX(isSquareCanvas?300:500)

#define kScaleEndFaceXValue     kAVCeilfX(isSquareCanvas?180:460)

#define kStandardFaceOffset    kAVCeilfX(64)

#define kFaceMinZiseY     kAVCeilfY(24)

#define scaleOffset  kAVCeilfY(6)  //放大边界

#define kFaceMoveOffset  kAVCeilfY(70)  //人脸的上移动

#define kRectOffsetRadio(faceWith)  ((kStandardFaceOffset*faceWith)/kStandardFaceZise)

@implementation FaceDetectManager

+ (FaceDetectManager *)sharedFaceDetectManager
{
    static FaceDetectManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[FaceDetectManager alloc] init];
        
        
    });
    
    return _sharedInstance;
}

//校正
-(CGRect)scaleCGRectInset:(CGRect)rect
{
    
    if (rect.size.width >kScaleEndFaceXValue) {
        
        // CGRect newRect = rect;
        
        NSLog(@"kStandardFaceZise >>");
        
        CGPoint center = kCGRectCenterPoint(rect);
        
        CGSize newSize = CGSizeZero;
        
        newSize.width =   rect.size.width*1.2;
        
        newSize.height =  (newSize.width * kAVWindowHeight) / kAVWindowWidth;
        
        CGRect newRect = CGRectMake(center.x-(newSize.width/2), center.y-(newSize.height/2),newSize.width, newSize.height);
        
        newRect.origin.y -= rect.size.width*0.23; //(rect.size.width*kFaceMoveOffset)/kStandardFaceZise;
        
        if (newRect.origin.y < kFaceMinZiseY) {
            newRect.origin.y = kFaceMinZiseY;
        }
        
        
        if (newRect.origin.x < kFaceMinZiseY) {
            newRect.origin.x = kFaceMinZiseY;
        }
        
        return newRect;
    }else{
        //不够最小阀值，就给一个最小的：：
        NSLog(@"scaleCGRectInset <<");
        
        CGPoint center = kCGRectCenterPoint(rect);
        
        CGSize newSize = CGSizeZero;
        
        newSize.width =   kStandardFaceZise;
        
        newSize.height =  (newSize.width * kAVWindowHeight) / kAVWindowWidth;
        
        CGRect newRect = CGRectMake(center.x-(newSize.width/2), center.y-(newSize.height/2),newSize.width, newSize.height);
        
        
        newRect.origin.y -= (rect.size.height*kFaceMoveOffset)/kStandardFaceZise;
        
        if (newRect.origin.y < kFaceMinZiseY) {
            newRect.origin.y = kFaceMinZiseY;
        }
        
        if (newRect.origin.x < kFaceMinZiseY) {
            newRect.origin.x = kFaceMinZiseY;
        }
        
        return newRect;
        
    }
}

- (CGRect) getFocusingCenterOnRect:(CGRect) facesRect windowRect:(CGRect)windowRect contendRect:(CGRect)contendRect
{
    
    CGPoint totalPoint = CGPointZero;
    
    if (contendRect.size.width > contendRect.size.height) {
        //横图
        
        CGFloat centerX = CGRectGetMidX(kAVRectWindow)+scaleOffset > CGRectGetMidX(facesRect)? CGRectGetMidX(kAVRectWindow)+scaleOffset:
        (contendRect.size.width-CGRectGetMidX(windowRect)> CGRectGetMidX(facesRect)? CGRectGetMidX(facesRect): contendRect.size.width-CGRectGetMidX(windowRect)-scaleOffset) ;
        
        totalPoint = CGPointMake(centerX, CGRectGetMidY(windowRect));
        
    }else{
        //竖图
        
        CGFloat centerY =  0;
        
        if (CGRectGetMidY(kAVRectWindow)+scaleOffset > CGRectGetMidY(facesRect))
        {
            
            centerY =  CGRectGetMidY(kAVRectWindow)+scaleOffset;
        }else{
            
            if (contendRect.size.height-CGRectGetMidY(windowRect)> CGRectGetMidY(facesRect))
            {
                centerY = CGRectGetMidY(facesRect);
            }else{
                centerY = contendRect.size.height-CGRectGetMidY(windowRect)-scaleOffset;
            }
            
        }
        //
        totalPoint = CGPointMake(CGRectGetMidX(windowRect), centerY);
    }
    
    return kAVCGRectFromCenter(totalPoint, windowRect.size);
}

//计算缩放比例 和 imageRect
- (FaceCtoType) transformRect:(UIImage *)origImage windowRect:(CGRect)windowRect
{
    float sacleRadio = 0; //放大倍数
    
    CGRect tempRect =  windowRect;
    
    AVPhotoGeometry photoGeometryType = AVPhotoSquare;
    
    FaceCtoType faceFactory =  faceCtoTypeMake(CGAffineTransformIdentity, CGRectZero, AVPhotoSquare);
//
    
    if (kAVGetCanvasSlope > kAVGetSizeSlope(origImage.size)){
        
        tempRect.size.height = origImage.size.height*tempRect.size.width/origImage.size.width;
    }else{
        tempRect.size.width = origImage.size.width*tempRect.size.height/origImage.size.height;
    }

     sacleRadio = windowRect.size.height/origImage.size.height;
    
    if (origImage.size.width > origImage.size.height) {
        //横图
        
        photoGeometryType = AVPhotoHorizontal;
        
    }else{
        //竖图
        
        photoGeometryType = AVPhotoVertical;
    }
    
    CGAffineTransform transform = CGAffineTransformMakeScale(sacleRadio, -sacleRadio);
    transform = CGAffineTransformTranslate(transform, 0, -origImage.size.height);
    
    faceFactory = faceCtoTypeMake(transform, tempRect, photoGeometryType);
    
    return faceFactory;
}


////计算缩放比例 和 imageRect
//- (FaceCtoType) transformRect:(UIImage *)origImage windowRect:(CGRect)windowRect
//{
//    float sacleRadio = 0; //放大倍数
//
//    CGRect tempRect =  windowRect;
//
//    AVPhotoGeometry photoGeometryType = AVPhotoSquare;
//
//    FaceCtoType faceFactory =  faceCtoTypeMake(CGAffineTransformIdentity, CGRectZero, AVPhotoSquare);
//
//    if (origImage.size.width > origImage.size.height) {
//        //横图
//        //Fix mac
//        if (kAVGetCanvasSlope > kAVGetSizeSlope(origImage.size))
//        {
//            tempRect.size.height = origImage.size.height*tempRect.size.width/origImage.size.width;
//
//            sacleRadio = windowRect.size.height/origImage.size.height;
//
//      ///      tempRect.origin.y = (windowRect.size.height - tempRect.size.height)/2;  //full scrren
//
//        }else{
//            tempRect.size.width = origImage.size.width*tempRect.size.height/origImage.size.height;
//
//            sacleRadio = windowRect.size.height/origImage.size.height;
//        }
//
//        photoGeometryType = AVPhotoHorizontal;
//
//    }else{
//        //竖图
//        tempRect.size.height = origImage.size.height*tempRect.size.width/origImage.size.width;
//
//        sacleRadio = windowRect.size.width/origImage.size.width;
//
//      //  tempRect.origin.y = (windowRect.size.height - tempRect.size.height)/2;  //full scrren
//
//        photoGeometryType = AVPhotoVertical;
//    }
//
//    CGAffineTransform transform = CGAffineTransformMakeScale(sacleRadio, -sacleRadio);
//    transform = CGAffineTransformTranslate(transform, 0, -origImage.size.height);
//
//    faceFactory = faceCtoTypeMake(transform, tempRect, photoGeometryType);
//
//    return faceFactory;
//}


- (FaceDetectDTO *)faceDetect:(UIImage *)aImage windowRect:(CGRect)windowRect
{
    CIImage *image = [CIImage imageWithCGImage:aImage.CGImage];
    
    NSDictionary *optsDic = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:optsDic];
    
    NSArray *featuresList = [detector featuresInImage:image];
    
    FaceDetectDTO *faceDetectDto = [[FaceDetectDTO alloc] init];
    
    NSInteger faceCount = [featuresList count];
    
    if (faceCount == 0) {
        
        faceDetectDto.faceCount = 0;
        
        FaceCtoType factCto = [self transformRect:aImage windowRect:windowRect];
        
        faceDetectDto.contendRect = factCto.contendRect;
        
        faceDetectDto.photoGeometry = factCto.photoGeometry;
        
        FaceRectMode faceRectMode1= FaceRectStructMake(kAVWindowCenter, 1, kAVRectWindow);
        
        faceDetectDto.totalFaceStruct = faceRectMode1;
        
        
    }else if (faceCount == 1) {
        
        //基于窗口和image size 计算出缩放比例 和 imageRect
        FaceCtoType factCto = [self transformRect:aImage windowRect:windowRect];
        
        CGRect faceRectY1 = ((CIFaceFeature*)[featuresList objectAtIndex:0]).bounds;
        
        //用计算出来的imageRect，得出对应的人脸对应的faceRectT1
        CGRect faceRectT1 = CGRectApplyAffineTransform(faceRectY1, factCto.transform);
        
        // 人脸坐标 映射 画布比例 以及过滤 坐标 [画布的比例]
        CGRect faceRect1 =  [self scaleCGRectInset:faceRectT1];
        
        // 把face坐标系缩放大后算出：中心点坐标，缩放比例， face rect
        FaceRectMode faceRectMode1=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect1 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect faceAwareRect = [self getFocusingCenterOnRect:faceRect1 windowRect:windowRect contendRect:factCto.contendRect ];
        
        FaceRectMode faceAwareMode=  [AVRectUnit getFaceRectOnImageAndWindows:faceAwareRect contendRect:factCto.contendRect  windowRect:windowRect];
        
        faceDetectDto.faceCount = 1;
        faceDetectDto.faceStruct1 = faceRectMode1;
        faceDetectDto.faceAwareStruct = faceAwareMode;
        
        faceDetectDto.contendRect = factCto.contendRect;
        
        faceDetectDto.photoGeometry = factCto.photoGeometry;
        
        faceDetectDto.totalFaceStruct = faceAwareMode;
        
    }else if (faceCount == 2) {
        
        FaceCtoType factCto= [self transformRect:aImage windowRect:windowRect];
        
        CGRect faceRectY1 = ((CIFaceFeature*)[featuresList objectAtIndex:0]).bounds;
        
        CGRect faceRectT1 = CGRectApplyAffineTransform(faceRectY1, factCto.transform);
        
        CGRect faceRect1 =  [self scaleCGRectInset:faceRectT1];
        
        FaceRectMode faceRectMode1=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect1 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect faceRectY2 = ((CIFaceFeature*)[featuresList objectAtIndex:1]).bounds;
        
        CGRect faceRectT2 = CGRectApplyAffineTransform(faceRectY2, factCto.transform);
        
        CGRect faceRect2 =  [self scaleCGRectInset:faceRectT2];
        
        FaceRectMode faceRectMode2=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect2 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect totalFaceRects =CGRectUnion(faceRect1, faceRect2);
        
        CGRect endTotalFaceRects = [AVRectUnit getSqureRect:totalFaceRects];
        
        CGRect faceAwareRect = [self getFocusingCenterOnRect:totalFaceRects windowRect:windowRect contendRect:factCto.contendRect];
        
        FaceRectMode faceAwareMode=  [AVRectUnit getFaceRectOnImageAndWindows:faceAwareRect contendRect:factCto.contendRect  windowRect:windowRect];
        
        //DLog(@"totalFaceRects = %f", totalFaceRects.size.width);
        
        faceDetectDto.faceCount = 2;
        faceDetectDto.faceStruct1 = faceRectMode1;
        faceDetectDto.faceStruct2 = faceRectMode2;
        
        faceDetectDto.faceAwareStruct = faceAwareMode;
        
        faceDetectDto.contendRect = factCto.contendRect;
        
        faceDetectDto.photoGeometry = factCto.photoGeometry;
        
        faceDetectDto.totalFaceStruct = [AVRectUnit getFaceRectOnImageAndWindows:endTotalFaceRects contendRect:factCto.contendRect  windowRect:windowRect];;
        
    }else if (faceCount == 3) {
        
        FaceCtoType factCto= [self transformRect:aImage windowRect:windowRect];
        
        CGRect faceRectY1 = ((CIFaceFeature*)[featuresList objectAtIndex:0]).bounds;
        
        CGRect faceRectT1 = CGRectApplyAffineTransform(faceRectY1, factCto.transform);
        
        CGRect faceRect1 =  [self scaleCGRectInset:faceRectT1];
        
        FaceRectMode faceRectMode1=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect1 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect faceRectY2 = ((CIFaceFeature*)[featuresList objectAtIndex:1]).bounds;
        
        CGRect faceRectT2 = CGRectApplyAffineTransform(faceRectY2, factCto.transform);
        
        CGRect faceRect2 =  [self scaleCGRectInset:faceRectT2];
        
        FaceRectMode faceRectMode2=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect2 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect faceRectY3 = ((CIFaceFeature*)[featuresList objectAtIndex:2]).bounds;
        
        CGRect faceRectT3 = CGRectApplyAffineTransform(faceRectY3, factCto.transform);
        
        CGRect faceRect3 =  [self scaleCGRectInset:faceRectT3];
        
        FaceRectMode faceRectMode3=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect3 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect totalFaceRects =CGRectUnion(faceRectY1, faceRectY3);
        
        CGRect faceAwareRect = [self getFocusingCenterOnRect:totalFaceRects windowRect:windowRect contendRect:factCto.contendRect];
        
        FaceRectMode faceAwareMode=  [AVRectUnit getFaceRectOnImageAndWindows:faceAwareRect contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect endTotalFaceRects = [AVRectUnit getSqureRect:totalFaceRects];
        
        faceDetectDto.faceCount = 3;
        faceDetectDto.faceStruct1 = faceRectMode1;
        faceDetectDto.faceStruct2 = faceRectMode2;
        faceDetectDto.faceStructEnd = faceRectMode3;
        
        faceDetectDto.faceAwareStruct = faceAwareMode;
        
        faceDetectDto.contendRect = factCto.contendRect;
        
        faceDetectDto.photoGeometry = factCto.photoGeometry;
        
        faceDetectDto.totalFaceStruct = [AVRectUnit getFaceRectOnImageAndWindows:endTotalFaceRects contendRect:factCto.contendRect  windowRect:windowRect];;
        
    }else{
        
        FaceCtoType factCto = [self transformRect:aImage windowRect:windowRect];
        
        CGRect faceRectY1 = ((CIFaceFeature*)[featuresList objectAtIndex:0]).bounds;
        
        CGRect faceRectT1 = CGRectApplyAffineTransform(faceRectY1, factCto.transform);
        
        CGRect faceRect1 =  [self scaleCGRectInset:faceRectT1];
        
        FaceRectMode faceRectMode1=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect1 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect faceRectY2 = ((CIFaceFeature*)[featuresList objectAtIndex:1]).bounds;
        
        CGRect faceRectT2 = CGRectApplyAffineTransform(faceRectY2, factCto.transform);
        
        CGRect faceRect2 =  [self scaleCGRectInset:faceRectT2];
        
        FaceRectMode faceRectMode2=  [AVRectUnit getFaceRectOnImageAndWindows:faceRect2 contendRect:factCto.contendRect  windowRect:windowRect];
        
        
        CGRect faceRectYEnd = ((CIFaceFeature*)[featuresList lastObject]).bounds;
        
        CGRect faceRectTEnd = CGRectApplyAffineTransform(faceRectYEnd, factCto.transform);
        
        CGRect faceRectEnd =  [self scaleCGRectInset:faceRectTEnd];
        
        FaceRectMode faceStructEnd=  [AVRectUnit getFaceRectOnImageAndWindows:faceRectEnd contendRect:factCto.contendRect  windowRect:windowRect];
        
        CGRect totalFaceRects =CGRectUnion(faceRectY1, faceRectYEnd);
        
        CGRect faceAwareRect = [self getFocusingCenterOnRect:totalFaceRects windowRect:windowRect contendRect:factCto.contendRect];
        
        FaceRectMode faceAwareMode=  [AVRectUnit getFaceRectOnImageAndWindows:faceAwareRect contendRect:factCto.contendRect  windowRect:windowRect];
        
        CGRect endTotalFaceRects = [AVRectUnit getSqureRect:totalFaceRects];
        
        faceDetectDto.faceCount = 4;
        faceDetectDto.faceStruct1 = faceRectMode1;
        faceDetectDto.faceStruct2 = faceRectMode2;
        faceDetectDto.faceStructEnd = faceStructEnd;
        
        faceDetectDto.faceAwareStruct = faceAwareMode;
        
        faceDetectDto.contendRect = factCto.contendRect;
        
        faceDetectDto.photoGeometry = factCto.photoGeometry;
        
        faceDetectDto.totalFaceStruct = [AVRectUnit getFaceRectOnImageAndWindows:endTotalFaceRects contendRect:factCto.contendRect  windowRect:windowRect];;
    }
    
    // NSLog(@"faceDetectDto radio =%d", faceDetectDto.);
    
    return faceDetectDto;
}

-(FaceDetectDTO *)getDefultFace
{
    FaceDetectDTO *faceDetectDto = [[FaceDetectDTO alloc] init];
    
    faceDetectDto.faceCount = 0;
    
    faceDetectDto.contendRect = kAVRectWindow;
    
    faceDetectDto.photoGeometry = AVPhotoSquare;
    
    FaceRectMode faceRectMode1= FaceRectStructMake(kAVWindowCenter, 1, kAVRectWindow);
    
    faceDetectDto.totalFaceStruct = faceRectMode1;
    
    return faceDetectDto;
}

@end

