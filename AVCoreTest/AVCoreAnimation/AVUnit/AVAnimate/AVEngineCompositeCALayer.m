//
//  AVEngineCompositeCALayer.m
//  Oye!!
//
//  Created by robin on 9/12/13.
//  Copyright (c) 2013 __PAlbum__. All rights reserved.
//

#import "AVEngineCompositeCALayer.h"

//#import "AVManagerSandBox.h"

@implementation AVEngineCompositeCALayer

@synthesize inputAsset  = _inputAsset;

@synthesize mutableAudioMix = _mutableAudioMix;
@synthesize mutableComposition = _mutableComposition;
@synthesize mutableVideoComposition = _mutableVideoComposition;

@synthesize audioAsset = _audioAsset;

@synthesize exportSession = _exportSession;
@synthesize emptyVideoURL  = _emptyVideoURL;
@synthesize itemList= _itemList;
@synthesize exportVideoURL = _exportVideoURL;

@synthesize videoName = _videoName;


-(id)initWihInpuURL:(NSURL *)inputURL exportVideoName:(NSString *)videoName
{
    self = [super init];
	if(self != nil) {
        
        self.emptyVideoURL = inputURL;
        
        self.videoName = videoName;
        
	}
	return self;
}

-(void)addParentLayer:(CALayer *)parentLayer withAnimateLayer:(CALayer *)animateLayer
{
    
    [self insertAudioAndVideoTracksToasset];
    
    _parentLayer = [[CALayer alloc] init];
    
    _parentLayer.frame = CGRectMake(0, 0, self.mutableVideoComposition.renderSize.width, self.mutableVideoComposition.renderSize.height);
    
    
    _videoLayer = [CALayer layer];
    
    _videoLayer.frame = _parentLayer.bounds;
    
    [_parentLayer addSublayer: _videoLayer];
    
    parentLayer.transform = CATransform3DIdentity;
    
    CGRect parentFrame = parentLayer.frame;
    
    parentFrame.origin.x = 0;   parentFrame.origin.y = 0;
    
    parentLayer.frame = parentFrame;
    
    [_parentLayer addSublayer: parentLayer];

}

-(void)setVideoName:(NSString *)videoName
{
    if (_videoName != videoName) {
        
      //  TT_RELEASE_SAFELY(_videoName);
        
        _videoName = videoName;
        
       // [AVManagerSandBox removeAVFilePartString:_videoName];
    }
}

-(void)setExportVideoURL:(NSURL *)exportVideoURL
{
    if (_exportVideoURL != exportVideoURL) {
        
       // TT_RELEASE_SAFELY(_exportVideoURL);
        
        _exportVideoURL = exportVideoURL;
        
       // [AVManagerSandBox removeAVFileURL:_exportVideoURL];
    }
}

-(void)performCompositeMixMedie:(AVEngineCompositeBlock )block withMusicURL:(NSURL *)musicURL
{
//    DLog(@"musicURL %@", musicURL);
    
    [self setLocationCompletedBlock:block];
    
    [self addAudioMix:musicURL];
    
    [self compositeMedieByCALayer];
    
    [self exportToMovie];
    //[self performSelector:@selector(exportToMovie) withObject:nil afterDelay:60];

}

-(void)replaceAudio:(AVEngineCompositeBlock )block withMusicURL:(NSURL *)musicURL
{
    
    [self setLocationCompletedBlock:block];
    
    [self insertAudioAndVideoTracksToasset];
    
    [self addAudioMix:musicURL];
    
    [self exportToMovie];
}

-(void)insertAudioAndVideoTracksToasset
{
    AVAssetTrack *assetVideoTrack = nil;
	AVAssetTrack *assetAudioTrack = nil;
    
    if (!_inputAsset) {
        
        _inputAsset = [[AVURLAsset alloc] initWithURL:self.emptyVideoURL options:nil];
        
        // Check if the asset contains video and audio tracks
        if ([[_inputAsset tracksWithMediaType:AVMediaTypeVideo] count] != 0) {
            assetVideoTrack = [_inputAsset tracksWithMediaType:AVMediaTypeVideo][0];
        }
//        if ([[_inputAsset tracksWithMediaType:AVMediaTypeAudio] count] != 0) {
//            assetAudioTrack = [_inputAsset tracksWithMediaType:AVMediaTypeAudio][0];
//        }
    }
	
	CMTime insertionPoint = kCMTimeZero;
	NSError *error = nil;
	
	// Step 1
	// Create a composition with the given asset and insert audio and video tracks into it from the asset
	if(!_mutableComposition) {
		
		// Check if a composition already exists, else create a composition using the input asset
		self.mutableComposition = [AVMutableComposition composition];
		
		// Insert the video and audio tracks from AVAsset
		if (assetVideoTrack != nil) {
			AVMutableCompositionTrack *compositionVideoTrack = [self.mutableComposition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
			[compositionVideoTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, [_inputAsset duration]) ofTrack:assetVideoTrack atTime:insertionPoint error:&error];
		}
		if (assetAudioTrack != nil) {
			AVMutableCompositionTrack *compositionAudioTrack = [self.mutableComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
			[compositionAudioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, [_inputAsset duration]) ofTrack:assetAudioTrack atTime:insertionPoint error:&error];
		}
		
	}
    
    // Step 2
	// Create a water mark layer of the same size as that of a video frame from the asset
	if ([[self.mutableComposition tracksWithMediaType:AVMediaTypeVideo] count] != 0) {
		
		if(!_mutableVideoComposition) {
			
			// build a pass through video composition
			self.mutableVideoComposition = [AVMutableVideoComposition videoComposition];
			self.mutableVideoComposition.frameDuration = kAVFrameDuration;//CMTimeMake(1, 30); // 30 fps
			self.mutableVideoComposition.renderSize = assetVideoTrack.naturalSize;
			
			AVMutableVideoCompositionInstruction *passThroughInstruction = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
			passThroughInstruction.timeRange = CMTimeRangeMake(kCMTimeZero, [self.mutableComposition duration]);
			
			AVAssetTrack *videoTrack = [self.mutableComposition tracksWithMediaType:AVMediaTypeVideo][0];
            
			AVMutableVideoCompositionLayerInstruction *passThroughLayer = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:videoTrack];
            
//            CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
//            CGAffineTransform rotateTranslate = CGAffineTransformTranslate(rotationTransform,320,0);
//            [passThroughLayer setTransform:rotateTranslate atTime:kCMTimeZero];
			
			passThroughInstruction.layerInstructions = @[passThroughLayer];
			self.mutableVideoComposition.instructions = @[passThroughInstruction];
			
		}
	}

}

-(void)addAudioMix:(NSURL *)audioURL
{
    NSError *error = nil;
    
    _audioAsset = [[AVURLAsset alloc] initWithURL:audioURL options:nil];

    AVAssetTrack *newAudioTrack = [_audioAsset tracksWithMediaType:AVMediaTypeAudio][0];
    
    AVMutableCompositionTrack *customAudioTrack = [self.mutableComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    [customAudioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, [self.mutableComposition duration]) ofTrack:newAudioTrack atTime:kCMTimeZero error:&error];

    AVMutableAudioMixInputParameters *mixParameters = [AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:customAudioTrack];
    
//    Float64 duration = CMTimeGetSeconds(self.mutableComposition.duration);
//    NSLog(@"time = %f",duration);
//    //淡入开始时间
//    CMTime startFadeInTime = CMTimeMake(duration - 1, self.mutableComposition.duration.timescale);
//    //淡入结束时间
//    CMTime endFadeInTime = CMTimeMake(duration, self.mutableComposition.duration.timescale);
//    //淡入时间范围
//    CMTimeRange fadeOutTimeRange = CMTimeRangeFromTimeToTime(startFadeInTime, endFadeInTime);
//    
//    //CMTimeRange fadeInTimeRange = CMTimeRangeFromTimeToTime(kCMTimeZero, endFadeInTime);
//    [mixParameters setVolumeRampFromStartVolume:1 toEndVolume:0.3 timeRange:CMTimeRangeMake(kCMTimeZero, startFadeInTime)];
//    //[mixParameters setVolumeRampFromStartVolume:1 toEndVolume:0 timeRange:fadeOutTimeRange];
//    
//    //[mixParameters setVolume:0.1 atTime:];
    
//    CMTime startTrimTime = CMTimeMakeWithSeconds(0, 1);
//    CMTime endTrimTime = CMTimeMakeWithSeconds(self.mutableComposition.duration.timescale, 1);
//    
//    CMTime startFadeInTime = startTrimTime;
//    CMTime endFadeInTime = CMTimeMakeWithSeconds(start + 4.0, 1);
//    CMTimeRange fadeInTimeRange = CMTimeRangeFromTimeToTime(startFadeInTime, endFadeInTime);
//    CMTime startFadeOutTime = CMTimeMakeWithSeconds(start+length – 4.0, 1);
//    CMTime endFadeOutTime = endTrimTime;
//    CMTimeRange fadeOutTimeRange = CMTimeRangeFromTimeToTime(startFadeOutTime, endFadeOutTime);
    
    [mixParameters setVolumeRampFromStartVolume:1.0 toEndVolume:0.3 timeRange:CMTimeRangeMake(kCMTimeZero, [self.mutableComposition duration])];
    
    //[mixParameters setVolumeRampFromStartVolume:1.0 toEndVolume:0.0 timeRange:fadeOutTimeRange];
    
//    self.mutableAudioMix = [AVMutableAudioMix audioMix];
//    self.mutableAudioMix.inputParameters = @[mixParameters];
}


-(void)compositeMedieByCALayer
{
    
    
 //   [parentLayer addSublayer:self.animateLayer];
    
    _parentLayer.beginTime -= CACurrentMediaTime();
    
    self.mutableVideoComposition.animationTool = [AVVideoCompositionCoreAnimationTool videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:_videoLayer inLayer:_parentLayer];


}

-(AVAssetExportSession *)exportSession
{
    if (!_exportSession) {
        
        _exportSession = [[AVAssetExportSession alloc] initWithAsset:self.mutableComposition presetName:AVAssetExportPresetHighestQuality];
        
        _exportSession.videoComposition = self.mutableVideoComposition;
        _exportSession.audioMix = self.mutableAudioMix;
        _exportSession.outputFileType=[kMoveFileFormatType isEqualToString:@"mp4"]?AVFileTypeMPEG4:AVFileTypeQuickTimeMovie;
        
    }
    
    return _exportSession;
}

-(void)exportToMovie
{
    
	//self.exportSession.outputURL = _exportVideoURL;
    
    NSString *pullPath = [AVManagerSandBox creatDirectoryAndGetfullPathForAV:_videoName];

    self.exportSession.outputURL = [NSURL fileURLWithPath:pullPath];
    
//#ifdef DEBUGAVCOMPOSITE
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
//    //[dateFormatter setDateFormat:@"hh:mm:ss"]
//    [dateFormatter setDateFormat:@"HH:mm:ss"];
//    NSLog(@"start composite layer: %@", [dateFormatter stringFromDate:[NSDate date]]);
//    [dateFormatter release];
//#endif
    
	[self.exportSession exportAsynchronouslyWithCompletionHandler:^(void){
		switch (self.exportSession.status) {
			case AVAssetExportSessionStatusCompleted:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if (completedBlock) {
                        
                        completedBlock(YES,nil, self.exportSession.outputURL);
                    }
                });
                
                [self releaseLayer];
                
				break;
            }
            case AVAssetExportSessionStatusFailed:
            {
                if (completedBlock) {
                    
                    completedBlock(NO,[self.exportSession.error domain], nil);
                }
                
			//	DLog(@"Failed:%@",self.exportSession.error);
				break;

            }
            case AVAssetExportSessionStatusCancelled:
            {
                if (completedBlock) {
                    
                    completedBlock(NO,[self.exportSession.error domain], nil);
                }
                
			//	DLog(@"Canceled:%@",self.exportSession.error);
				break;
            }
                
			default:
				break;
		}
        
	}];
}

-(void)releaseLayer
{
//    TT_RELEASE_SAFELY(_animateLayer);
//    
//    TT_RELEASE_SAFELY(_watermarkLayer);
}

- (void)setLocationCompletedBlock:(AVEngineCompositeBlock)block
{
    if (block != completedBlock) {
        
        completedBlock = [block copy];
    }
}


@end
