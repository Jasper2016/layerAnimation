//
//  FaceDetectManager.h
//  SNYifubaoMerchant
//
//  Created by gemin on 15/4/7.
//  Copyright (c) 2015年 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AVDTOHeader.h"

#import "AVSceneAniEnumType.h"

///*SN_INLINE*/
//#if !defined(SN_INLINE)
//# if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
//#  define SN_INLINE static inline
//# elif defined(__cplusplus)
//#  define SN_INLINE static inline
//# elif defined(__GNUC__)
//#  define SN_INLINE static __inline__
//# else
//#  define SN_INLINE static
//# endif
//#endif
//
////#define kCGRectCenterPoint(endArea)  (CGPointMake(CGRectGetMidX(endArea), CGRectGetMidY(endArea)))
//
struct faceCtoStruct {
    
    CGAffineTransform   transform;
    
    CGRect              contendRect;
    
    AVPhotoGeometry     photoGeometry;
    
};
typedef struct faceCtoStruct FaceCtoType;

SN_INLINE FaceCtoType faceCtoTypeMake(CGAffineTransform transform,  CGRect contendRect, AVPhotoGeometry photoGeometry);

SN_INLINE FaceCtoType faceCtoTypeMake(CGAffineTransform transform,  CGRect contendRect, AVPhotoGeometry photoGeometry)
{
    return (FaceCtoType){transform, contendRect, photoGeometry};
}



@interface FaceDetectManager : NSObject

+ (FaceDetectManager *)sharedFaceDetectManager;

- (FaceDetectDTO *)faceDetect:(UIImage *)aImage windowRect:(CGRect)windowRect;

@end
