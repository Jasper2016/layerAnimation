//
//  AVAlbumDTO.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBasicDTO.h"

#import "AVAlbum.h"

#import "FaceDetectDTO.h"

#import "AVUnitEnumConstant.h"

#import <AssetsLibrary/AssetsLibrary.h>

#import <Foundation/Foundation.h>

@interface AVAlbumDTO : AVBasicDTO
{

}

@property(nonatomic, assign) AVCompMediaType        mediaType;

@property(nonatomic, strong) FaceDetectDTO      *faceRectDTO;

@property(nonatomic, strong) ALAsset            *asset;

@property(nonatomic, assign) AVImageFilterType  imageFilterType;

@property(nonatomic, strong) UIImage            *contendImage;

@property(nonatomic, assign) CGRect             vBorderRect;

@property(nonatomic, assign) CGRect             vContentRect;


@end
