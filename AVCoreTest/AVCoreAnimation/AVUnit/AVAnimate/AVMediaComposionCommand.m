//
//  AVMediaComposionCommand.m
//  CompVideo
//
//  Created by Netease on 15/9/8.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "AVMediaComposionCommand.h"
#import <AssetsLibrary/AssetsLibrary.h>

#import "AVBasicLayer.h"

//#import "AVManagerSandBox.h"

#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

@implementation AVMediaComposionCommand

-(id)initWithURL:(NSURL *)emptyVideoURL videoSize:(CGSize)videoSize
{
    self = [super init];
    if(self != nil) {

        _emptyVideoURL = emptyVideoURL;
        
        _videoSize = videoSize;
        
        AVAsset *asset = [[AVURLAsset alloc] initWithURL:_emptyVideoURL options:nil];
        
        self.inputAsset = asset;
    }
    return self;
}

#pragma mark - Playback

- (void)stopLoadingAnimationAndHandleError:(NSError *)error
{

    if (error) {
        
          NSLog(@"stopLoadingAnimationAndHandleError= %@", [error localizedDescription]);
        
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[error localizedDescription]
//                                                                                 message:[error localizedFailureReason]
//                                                                          preferredStyle:UIAlertControllerStyleAlert];
//        
//        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)setUpPlaybackOfAsset:(AVAsset *)asset withKeys:(NSArray *)keys
{
    // This method is called when AVAsset has completed loading the specified array of keys.
    // playback of the asset is set up here.
    
    // Check whether the values of each of the keys we need has been successfully loaded.
    for (NSString *key in keys) {
        NSError *error = nil;
        
        if ([asset statusOfValueForKey:key error:&error] == AVKeyValueStatusFailed) {
            [self stopLoadingAnimationAndHandleError:error];
            return;
        }
    }
    
    if (![asset isPlayable]) {
        // Asset cannot be played. Display the "Unplayable Asset" label.
        NSLog(@"Unplayable Asset");
        return;
    }
    
    if (![asset isComposable]) {
        // Asset cannot be used to create a composition (e.g. it may have protected content).
         NSLog(@"it may have protected content");
        return;
    }
}

- (void)setCompletedBlock:(AVEngineCompositeBlock)block
{
    if (block != completedBlock) {
        
        completedBlock = [block copy];
    }
}

- (void)loadMusic:(NSURL *)musicURL totalTime:(CFTimeInterval )totalTime
{
    _musicURL = musicURL;
    
    CMTime totalTimeDuration = CMTimeMakeWithSeconds(totalTime+5, 1);
    
    AVAssetTrack *assetVideoTrack = nil;
    AVAssetTrack *assetAudioTrack = nil;
    
    AVAsset *asset = self.inputAsset;
    
    // Check if the asset contains video and audio tracks
    if ([[asset tracksWithMediaType:AVMediaTypeVideo] count] != 0) {
        assetVideoTrack = [asset tracksWithMediaType:AVMediaTypeVideo][0];
    }
//    if ([[asset tracksWithMediaType:AVMediaTypeAudio] count] != 0) {
//        assetAudioTrack = [asset tracksWithMediaType:AVMediaTypeAudio][0];
//    }
    NSError *error = nil;
    
//    NSString *audioURL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"m4a"];
//    AVAsset *audioAsset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:audioURL] options:nil];
//    AVAssetTrack *newAudioTrack = [audioAsset tracksWithMediaType:AVMediaTypeAudio][0];
    
    // Step 1
    // Extract the custom audio track to be added to the composition
    AVAsset *audioAsset = [[AVURLAsset alloc] initWithURL:_musicURL options:nil];
    AVAssetTrack *newAudioTrack = [audioAsset tracksWithMediaType:AVMediaTypeAudio][0];
    
    // Step 2
    // Create a composition with the given asset and insert audio and video tracks into it from the asset
    if (!self.mutableComposition) {
        
        // Check whether a composition has already been created, i.e, some other tool has already been applied.
        // Create a new composition
        self.mutableComposition = [AVMutableComposition composition];
        
        // Add tracks to composition from the input video asset
        if (assetVideoTrack != nil) {
            AVMutableCompositionTrack *compositionVideoTrack = [self.mutableComposition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
            [compositionVideoTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, totalTimeDuration) ofTrack:assetVideoTrack atTime:kCMTimeZero error:&error];
        }
        if (assetAudioTrack != nil) {
            AVMutableCompositionTrack *compositionAudioTrack = [self.mutableComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
            [compositionAudioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, totalTimeDuration) ofTrack:assetAudioTrack atTime:kCMTimeZero error:&error];
        }
        
    }
    
    // Step 3
    // Add custom audio track to the composition
    AVMutableCompositionTrack *customAudioTrack = [self.mutableComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    [customAudioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero,  totalTimeDuration) ofTrack:newAudioTrack atTime:kCMTimeZero error:&error];
    
    
    // Step 4
    // Mix parameters sets a volume ramp for the audio track to be mixed with existing audio track for the duration of the composition
    AVMutableAudioMixInputParameters *mixParameters = [AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:customAudioTrack];
    [mixParameters setVolumeRampFromStartVolume:1 toEndVolume:0 timeRange:CMTimeRangeMake(kCMTimeZero, self.mutableComposition.duration)];
    
    self.mutableAudioMix = [AVMutableAudioMix audioMix];
    self.mutableAudioMix.inputParameters = @[mixParameters];
    
    // Step 5f
    if ([[self.mutableComposition tracksWithMediaType:AVMediaTypeVideo] count] != 0) {
        
        if(!self.mutableVideoComposition) {
            
            // build a pass through video composition
            self.mutableVideoComposition = [AVMutableVideoComposition videoComposition];
            self.mutableVideoComposition.frameDuration = CMTimeMake(1, 30); // 30 fps
            self.mutableVideoComposition.renderSize = _videoSize;
            
            AVMutableVideoCompositionInstruction *passThroughInstruction = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
            passThroughInstruction.timeRange = CMTimeRangeMake(kCMTimeZero, [self.mutableComposition duration]);
            
            AVAssetTrack *videoTrack = [self.mutableComposition tracksWithMediaType:AVMediaTypeVideo][0];
            AVMutableVideoCompositionLayerInstruction *passThroughLayer = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:videoTrack];

            passThroughInstruction.layerInstructions = @[passThroughLayer];
            self.mutableVideoComposition.instructions = @[passThroughInstruction];
            
            
        }
        
    }
    
}

- (void)exportVideo:(CALayer *)aniParentLayer compeleteBlock:(AVEngineCompositeBlock )block outName:(NSString *)outName
{
    
    [self setCompletedBlock:block];
    
    CALayer *parentLayer = [CALayer layer];
    
    parentLayer.frame = CGRectMake(0, 0, self.mutableVideoComposition.renderSize.width, self.mutableVideoComposition.renderSize.height);

    CALayer *videoLayer = [CALayer layer];
    
    videoLayer.frame = CGRectMake(0, 0, self.mutableVideoComposition.renderSize.width, self.mutableVideoComposition.renderSize.height);;
    
    [parentLayer addSublayer:videoLayer];
    
    [parentLayer addSublayer:aniParentLayer];
    
    aniParentLayer.transform = CATransform3DIdentity;
    
    CGRect parentFrame = aniParentLayer.frame;
    
    parentFrame.origin.x = 0;   parentFrame.origin.y = 0;
    
    aniParentLayer.frame = parentFrame;
    
    parentLayer.beginTime -= CACurrentMediaTime();
    
   // parentLayer.beginTime =AVCoreAnimationBeginTimeAtZero;

    if (aniParentLayer.contentsAreFlipped) {
        
        aniParentLayer.geometryFlipped = YES;
    }
    
    self.mutableVideoComposition.animationTool = [AVVideoCompositionCoreAnimationTool videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:videoLayer inLayer:parentLayer];
    
    //NSString *outputURL  = [AVManagerSandBox creatDirectoryAndFileInSandbox:AVUploadDic fileName:outName];
    
//    //export
//    //NSString *outputURL = [AVManagerSandBox creatDirectoryAndGetfullPathForAV:outName];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *outputURL = paths[0];
//    NSFileManager *manager = [NSFileManager defaultManager];
//    [manager createDirectoryAtPath:outputURL withIntermediateDirectories:YES attributes:nil error:nil];
//    outputURL = [outputURL stringByAppendingPathComponent:outName];
//    // Remove Existing File
//    [manager removeItemAtPath:outputURL error:nil];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *outputURL = paths[0];
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager createDirectoryAtPath:outputURL withIntermediateDirectories:YES attributes:nil error:nil];
    outputURL = [outputURL stringByAppendingPathComponent:@"output.mp4"];
    // Remove Existing File
    [manager removeItemAtPath:outputURL error:nil];

    
    // Step 2
    // Create an export session with the composition and write the exported movie to the photo library
    self.exportSession = [[AVAssetExportSession alloc] initWithAsset:[self.mutableComposition copy] presetName:AVAssetExportPresetHighestQuality];
    
    self.exportSession.videoComposition = self.mutableVideoComposition;
    
    self.exportSession.audioMix = self.mutableAudioMix;
    
    self.exportSession.outputURL =  [NSURL fileURLWithPath:outputURL];
    
    self.exportSession.outputFileType = AVFileTypeMPEG4;
    
    [self.exportSession exportAsynchronouslyWithCompletionHandler:^(void){
        switch (self.exportSession.status) {
            case AVAssetExportSessionStatusCompleted:
            {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (completedBlock) {
                        
                        completedBlock(YES,nil, self.exportSession.outputURL);
                    }
                });
                
                break;
            }
            case AVAssetExportSessionStatusFailed:
            {
                NSLog(@"Failed:%@",self.exportSession.error);
                
                if (completedBlock) {
                    
                    completedBlock(NO,[self.exportSession.error domain], nil);
                }
                break;
            }
            case AVAssetExportSessionStatusCancelled:
            {
                NSLog(@"Failed:%@",self.exportSession.error);
                
                if (completedBlock) {
                    
                    completedBlock(NO,[self.exportSession.error domain], nil);
                }
                break;
            }
            default:
                break;
        }
    }];
}



@end
