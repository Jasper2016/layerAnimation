//
//  MergeVideoConstant.h
//  PAlbum
//
//  Created by mac on 8/26/13.
//  Copyright (c) 2013 __PAlbum__. All rights reserved.
//

#import "AVConstant.h"

#define kKeyValue        30

#define kAVVideoFrameWith   kAVWindowWidth

#define kAVVideoFrameHight   kAVWindowHeight
//
//#define kAVVideoFrameWith   500
//
//#define kAVVideoFrameHight   500

#define imageNumOffst(x)    ((kKeyValue+1)*x+30)

#define kFrameAlphaValue    0.5f

#define kTextDuration(x)           ((kDuration*x)-0.3)

#define kAVFrameDuration       CMTimeMake(1, kKeyValue)

#define kAVFrameSize        CGSizeMake(kAVVideoFrameWith, kAVVideoFrameHight)

#define DEBUGAVCOMPOSITE        1

#define kMoveFileFormatType       @"mp4"

#define kCoseUploadProgress     2

#define kAVVideoSize     CGSizeMake(kAVVideoFrameWith, kAVVideoFrameHight)

#define kAVVideoEndTextRect  kCGRectInArea(kAVRectWindow, 16, 210)


