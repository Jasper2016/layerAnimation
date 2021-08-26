//
//  AVEngineCompositeCALayer.h
//  Oye!!
//
//  Created by robin on 9/12/13.
//  Copyright (c) 2013 __PAlbum__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "AVVideoConstant.h"

//#import "SNBase.h"

typedef void (^AVEngineCompositeBlock)(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL);


@interface AVEngineCompositeCALayer : NSObject
{
    AVEngineCompositeBlock completedBlock;
    
    CALayer *_parentLayer;

    
    CALayer *_videoLayer;

}

@property (nonatomic, strong) CALayer                        *parentLayer;

@property (nonatomic,strong) CALayer                        *animateLayer;

@property (nonatomic,strong) AVAsset                        *inputAsset;

@property (nonatomic,strong) AVMutableComposition           *mutableComposition;
@property (nonatomic,strong) AVMutableVideoComposition      *mutableVideoComposition;
@property (nonatomic,strong) AVMutableAudioMix              *mutableAudioMix;

@property (nonatomic,strong) AVAsset                        *audioAsset;

@property (nonatomic,strong) AVAssetExportSession           *exportSession;

@property (nonatomic,strong) NSURL                          *emptyVideoURL;

@property (nonatomic , strong) NSMutableArray               *itemList;

@property (nonatomic , strong) NSURL                        *exportVideoURL;

@property (nonatomic , copy) NSString                       *videoName;

-(void)addParentLayer:(CALayer *)parentLayer withAnimateLayer:(CALayer *)animateLayer;

-(id)initWihInpuURL:(NSURL *)inputURL exportVideoName:(NSString *)videoName;

-(void)performCompositeMixMedie:(AVEngineCompositeBlock )block withMusicURL:(NSURL *)musicURL;

-(void)replaceAudio:(AVEngineCompositeBlock )block withMusicURL:(NSURL *)musicURL;

@end
