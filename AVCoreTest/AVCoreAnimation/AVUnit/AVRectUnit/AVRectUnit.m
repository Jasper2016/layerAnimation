//
//  AVRectUnit.m
//  TestSceneEffect
//
//  Created by mac on 15/4/3.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVRectUnit.h"

#import "AVConstant.h"

#import "FaceDetectDTO.h"

#define kDistanceWith        kAVCeilfX(70)

#define kWindowInAwareWith        (kAVWindowWidth -2*kDistanceWith)  ///关键

#define kWindowInAwareHight        kAVGetHightByWidth(kWindowInAwareWith)

@implementation AVRectUnit

+(CGRect)rectFromCenterByNoAwareStruct:(CGRect)contendRect
{
        CGRect endArt = CGRectZero;
    
    if (contendRect.size.width> contendRect.size.height) {
        
        endArt =  CGRectMake((contendRect.size.width-kWindowInAwareWith)/2,
                          (contendRect.size.height-kWindowInAwareHight)/2,kWindowInAwareWith, kWindowInAwareHight);
    }else{
       // CGFloat inWith = kWindowInAwareWith;
        endArt =  CGRectMake((contendRect.size.width-kWindowInAwareWith)/2-kAVWindowCenter.x,
                          (contendRect.size.height-kWindowInAwareHight)/4,kWindowInAwareWith, kWindowInAwareHight);
    }
    
    return endArt;
}




+(CGRect)rectFromCenterByFaceAwareStruct:(FaceRectMode)faceAwareStruct
                           oneFaceStruct:(FaceRectMode)oneFaceStruct
{
    
//    if (kAVWindowHeight > kAVWindowWidth){
//
//        CGFloat distanceHeight = oneFaceStruct.onImageFaceRect.size.height;
//
//        CGFloat x = faceAwareStruct.windowsCenter.x-(kWindowInAwareWith/2);
//
//        CGFloat y = faceAwareStruct.windowsCenter.y-(kWindowInAwareHight/2)+kAVCeilfY(30);
//
//
//        return  CGRectMake(0, 0,kWindowInAwareWith, kWindowInAwareHight);
//    }else{
    
        CGFloat distanceHeight = oneFaceStruct.onImageFaceRect.size.height;
        
        if (kWindowInAwareHight > distanceHeight)
        {
            distanceHeight = kWindowInAwareHight;
        }
        
        CGFloat x = faceAwareStruct.windowsCenter.x-(kAVGetWidthByHight(distanceHeight)/2);
        
        
        if (x < 0) {
            
            x= 0;
        }
        
        CGFloat y = faceAwareStruct.windowsCenter.y-(distanceHeight/2)+kAVCeilfY(30);
        
        return  CGRectMake(x, y,kAVGetWidthByHight(distanceHeight), distanceHeight);
  //  }
    
}


+(FaceRectMode)hasOrNotFaceAwareRectMode:(NSDictionary *)aniParameter contendRect:(CGRect)contendRect
{
    
    if (aniParameter && [aniParameter objectForKey:KAVFaceDtoKey]) {
        
        FaceDetectDTO *faceRectDto = [aniParameter objectForKey:KAVFaceDtoKey];
        
        return  faceRectDto.faceAwareStruct;
    }else{
        CGPoint newCenter = kAVWindowCenter;
        
        if (contendRect.size.width> contendRect.size.height) {
            
            newCenter.x = CGRectGetMidX(contendRect);
            
            return FaceRectStructMake(newCenter, 1, CGRectZero);
        }else{
            
            return FaceRectStructMake(newCenter, 1, CGRectZero);
            
        }
        
    }
}

+(FaceRectMode)hasOrNotOneFaceAwareRectMode:(NSDictionary *)aniParameter contendRect:(CGRect)contendRect
{
    if (aniParameter && [aniParameter objectForKey:KAVFaceDtoKey]) {
        
        FaceDetectDTO *faceRectDto = [aniParameter objectForKey:KAVFaceDtoKey];
        
        return faceRectDto.faceStruct1;
    }else{
        CGPoint newCenter = kAVWindowCenter;
        
        if (contendRect.size.width> contendRect.size.height) {
            
            newCenter.x = CGRectGetMidX(contendRect);
            
            return FaceRectStructMake(newCenter, 1.4, CGRectZero);
        }else{
            
            return FaceRectStructMake(newCenter, 1.4, CGRectZero);
            
        }
        
    }
}

+(CGPoint)getScaleEndCenterPoint:(CGVector)startParma startFrame:(CGRect)startArea endFrame:(CGRect)contendRect
{
    
    CGFloat rectRadio = (contendRect.size.width > contendRect.size.height)?startParma.dy:startParma.dx;
    
    CGFloat scaleEndOriginX = CGRectGetMidX(contendRect)- (CGRectGetMidX(contendRect)*rectRadio);
    
    CGFloat scaleEndOriginY = CGRectGetMidY(contendRect)- (CGRectGetMidY(contendRect)*rectRadio);
    
    CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
    
    CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(startArea)*rectRadio)+scaleEndOrigin.x, (CGRectGetMidY(startArea)*rectRadio)+scaleEndOrigin.y);
    
    return scaleEndAreaCenter;
}

+(ScaleEndCenterRadio)getScaleEndAreaCenter:(CGRect)partArea contendRect:(CGRect)contendRect
{
    if (contendRect.size.width > contendRect.size.height){
        // 横图
        CGFloat rectRadio =  kAVRectWindow.size.height/partArea.size.height;
        
        CGFloat scaleEndOriginX = CGRectGetMidX(kAVRectWindow)- (CGRectGetMidX(contendRect)*rectRadio);
        
        CGFloat scaleEndOriginY = CGRectGetMidY(contendRect)- (CGRectGetMidY(contendRect)*rectRadio);
        
        CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
        
        CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(partArea)*rectRadio)-scaleEndOrigin.x-(partArea.origin.x*2*rectRadio),
                                                 (CGRectGetMidY(partArea)*rectRadio)-scaleEndOrigin.y-(partArea.origin.y*2*rectRadio));
        
        
        return ScaleRadioMake(scaleEndAreaCenter, rectRadio);
        
    }else{
        
        //竖图
        CGFloat rectRadio =  kAVRectWindow.size.width/partArea.size.width;
        
        CGFloat scaleEndOriginX = CGRectGetMidX(contendRect)- (CGRectGetMidX(contendRect)*rectRadio);
        
        CGFloat scaleEndOriginY = CGRectGetMidY(kAVRectWindow)- (CGRectGetMidY(contendRect)*rectRadio);
        
        CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
        
        CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(partArea)*rectRadio)-scaleEndOrigin.x-(partArea.origin.x*2*rectRadio),
                                                 (CGRectGetMidY(partArea)*rectRadio)-scaleEndOrigin.y-(partArea.origin.y*2*rectRadio));
        
        return ScaleRadioMake(scaleEndAreaCenter, rectRadio);
        
        
    }
}

+(FaceRectMode)getFaceRectOnImageAndWindows:(CGRect)transformFaceRect contendRect:(CGRect)contendRect  windowRect:(CGRect)windowRect
{
    if (contendRect.size.width > contendRect.size.height){
        // 横图
        CGFloat faceBywindowRadio =  windowRect.size.height/transformFaceRect.size.height;
        
        CGFloat scaleEndOriginX = CGRectGetMidX(windowRect)- (CGRectGetMidX(contendRect)*faceBywindowRadio);
        
        CGFloat scaleEndOriginY = CGRectGetMidY(contendRect)- (CGRectGetMidY(contendRect)*faceBywindowRadio);
        
        CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
        
        CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(transformFaceRect)*faceBywindowRadio)-scaleEndOrigin.x-(transformFaceRect.origin.x*2*faceBywindowRadio),
                                                 (CGRectGetMidY(transformFaceRect)*faceBywindowRadio)-scaleEndOrigin.y-(transformFaceRect.origin.y*2*faceBywindowRadio));
        
        return FaceRectStructMake(scaleEndAreaCenter,faceBywindowRadio, transformFaceRect);
        
    }else{
        
        //竖图
        CGFloat faceBywindowRadio =  windowRect.size.height/transformFaceRect.size.height;
        
        CGFloat scaleEndOriginX = CGRectGetMidX(contendRect)- (CGRectGetMidX(contendRect)*faceBywindowRadio);
        
        //mac fix
        CGFloat scaleEndOriginY = CGRectGetMidY(windowRect)- (CGRectGetMidY(contendRect)*faceBywindowRadio);
        
        CGPoint scaleEndOrigin= CGPointMake(scaleEndOriginX, scaleEndOriginY);
        
        CGPoint scaleEndAreaCenter = CGPointMake((CGRectGetMidX(transformFaceRect)*faceBywindowRadio)-scaleEndOrigin.x-(transformFaceRect.origin.x*2*faceBywindowRadio),
                                                 (CGRectGetMidY(transformFaceRect)*faceBywindowRadio)-scaleEndOrigin.y-(transformFaceRect.origin.y*2*faceBywindowRadio));
        
        return FaceRectStructMake(scaleEndAreaCenter,faceBywindowRadio, transformFaceRect);
    }
}


+(CGRect)getSceneCropImageRect:(CGSize)origalImageSize contendLayerSize:(CGSize)contendLayerSize partRect:(CGRect)partRect
{
    CGFloat radio = 0;
    
    CGFloat imageWith = 0;
    
    if (origalImageSize.width > origalImageSize.height) {
        
        radio = origalImageSize.height/contendLayerSize.height;
        
        imageWith = radio*partRect.size.height;
    }else{
        radio = origalImageSize.width/contendLayerSize.width;
        
        imageWith = radio*partRect.size.width;
    }
    
    CGRect endPartRect =  CGRectMake(partRect.origin.x*radio, partRect.origin.y*radio, imageWith,  kAVGetHightByWidth(imageWith));
    
    return endPartRect;
}

+(CGRect)getSqureRect:(CGRect)inpuRect
{
    
    
    CGFloat x = inpuRect.origin.x;    CGFloat y = inpuRect.origin.y;
    
    CGPoint center = kCGRectCenterPoint(inpuRect);
    
    if (inpuRect.size.width > inpuRect.size.height) {
        
        y = center.y-(inpuRect.size.width/2);
        
        if (y<0) {
            y=0;
        }
        
        return  CGRectMake(x, y, inpuRect.size.width, inpuRect.size.height);
    }else{
        
        x = center.x-(inpuRect.size.height/2);
        
        if (x<0) {
            x=0;
        }
        
        return  CGRectMake(x, y, inpuRect.size.width, inpuRect.size.height);
        
    }
    
}
@end

