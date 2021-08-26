//
//  AVMediaComposionCommand.h
//  CompVideo
//
//  Created by Netease on 15/9/8.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreMedia/CoreMedia.h>
#import <QuartzCore/QuartzCore.h>

typedef void (^AVEngineCompositeBlock)(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL);

@interface AVMediaComposionCommand : NSObject
{
    NSURL *_emptyVideoURL;
    
    NSURL *_musicURL;
    
    CGSize _videoSize;
    
    CFTimeInterval _totalTime;
    
    AVEngineCompositeBlock completedBlock;
}

@property AVMutableComposition *mutableComposition;
@property AVMutableVideoComposition *mutableVideoComposition;
@property AVMutableAudioMix *mutableAudioMix;
@property AVAsset *inputAsset;

@property AVAssetExportSession *exportSession;


- (id)initWithURL:(NSURL *)emptyVideoURL videoSize:(CGSize)videoSize;

- (void)loadMusic:(NSURL *)musicURL totalTime:(CFTimeInterval )totalTime;

- (void)exportVideo:(CALayer *)aniParentLayer  compeleteBlock:(AVEngineCompositeBlock )block outName:(NSString *)outName;

@end
