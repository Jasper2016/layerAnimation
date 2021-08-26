//
//  MergeViewController.m
//  AVCoreTest
//
//  Created by mac on 2018/11/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "MergeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import "SDAVAssetExportSession.h"
#import "SVProgressHUD/SVProgressHUD.h"
#import "playVideoViewController.h"

@interface MergeViewController ()
@property (nonatomic, strong) SDAVAssetExportSession *exportSession;
@property (nonatomic, strong) NSTimer *pressceTimer;
@property (nonatomic, strong) UIButton *eventBtn;
@property (nonatomic, copy) NSString *filePath;
@end

@implementation MergeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)compositeEvent:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4",@"ceshi"]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    
    [self cutOutVideo];
    
}

- (void)cutOutVideo{
    
    [self startTimer];
    
    CGFloat videoWidth = 640.f;
    CGFloat videoHeight = 1136.f;
    
    AVMutableComposition *mixComposition = [AVMutableComposition composition];
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"MP4"];
    
    AVURLAsset *videoAsset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:videoPath]];
    
    CMTime startTime = CMTimeMake(0, 1);
    CMTime endTime = CMTimeMake(15, 1);
    //h获取视频时间
    //    if (endTime == 0) {
    //        endCropTime = CMTimeMakeWithSeconds(videoAsset.duration.value/videoAsset.duration.timescale-startTime, videoAsset.duration.timescale);
    //    }
    
    //音频采集
    if ([[videoAsset tracksWithMediaType:AVMediaTypeAudio] count] > 0) {
        
        AVMutableCompositionTrack *audioCompositionTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
        
        AVAssetTrack *audioTrack = [[videoAsset tracksWithMediaType:AVMediaTypeAudio] lastObject];
        
        [audioCompositionTrack insertTimeRange:CMTimeRangeFromTimeToTime(startTime, endTime) ofTrack:audioTrack atTime:kCMTimeZero error:nil];
    }
    //视频轨道
    AVMutableCompositionTrack *videoCompositionTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    AVAssetTrack *videoTrack = [[videoAsset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
    NSError *error;
    [videoCompositionTrack insertTimeRange:CMTimeRangeFromTimeToTime(startTime, endTime) ofTrack:videoTrack atTime:kCMTimeZero error:&error];
    
    //3.1 AVMutableVideoCompositionInstruction 视频轨道中的一个视频，可以缩放、旋转
    
    AVMutableVideoCompositionInstruction *mainInstruction = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
    mainInstruction.timeRange = CMTimeRangeFromTimeToTime(kCMTimeZero, [mixComposition duration]);
    // 3.2 AVMutableVideoCompositionLayerInstruction 一个视频轨道，包含了这个轨道上的所有视频素材
    AVMutableVideoCompositionLayerInstruction *videolayerInstruction = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:videoCompositionTrack];
    
    CGAffineTransform videoTransform = videoTrack.preferredTransform;
    
    if (videoTransform.a == 0 && videoTransform.b == 1.0 && videoTransform.c == -1.0 && videoTransform.d == 0) {
        
        
        
    }
    if (videoTransform.a == 0 && videoTransform.b == -1.0 && videoTransform.c == 1.0 && videoTransform.d == 0) {
        
    }
    if (videoTransform.a == 1.0 && videoTransform.b == 0 && videoTransform.c == 0 && videoTransform.d == 1.0) {
        
        
        
    }
    if (videoTransform.a == -1.0 && videoTransform.b == 0 && videoTransform.c == 0 && videoTransform.d == -1.0) {
    }
    
    CGSize originVideoSize = CGSizeMake(videoTrack.naturalSize.width, videoTrack.naturalSize.height);
    
    CGFloat scaleValue = 0.0;
    
    if (videoWidth > videoHeight) {
        
        if (originVideoSize.width > originVideoSize.height) {
            
            scaleValue = videoHeight/originVideoSize.height;
            
        }else{
            
            scaleValue = videoWidth/originVideoSize.width;
        }
        
    }else{
        
        if (originVideoSize.width > originVideoSize.height) {
            
            scaleValue = videoHeight/originVideoSize.height;
            
        }else{
            
            scaleValue = videoWidth/originVideoSize.width;
        }
    }
    
    CGAffineTransform trans = CGAffineTransformMakeScale(scaleValue, scaleValue);
    //    CGAffineTransform positionTrans = CGAffineTransformTranslate(trans, 0, videoHeight/2);
    
    //    [videolayerInstruction setCropRectangle:CGRectMake(0, 0, originVideoSize.width, originVideoSize.height/2) atTime:kCMTimeZero];
    [videolayerInstruction setTransform:trans atTime:kCMTimeZero];
    mainInstruction.layerInstructions = @[videolayerInstruction];
    
    AVMutableVideoComposition *videoComposition = [AVMutableVideoComposition videoComposition];
    
    videoComposition.instructions = @[mainInstruction];
    videoComposition.frameDuration = CMTimeMake(1, 30);//30fps
    videoComposition.renderSize = CGSizeMake(videoWidth, videoHeight);
    
    CALayer *parentLayer = [CALayer layer];
    parentLayer.frame = CGRectMake(0, 0, videoWidth, videoHeight);
    parentLayer.backgroundColor = UIColor.redColor.CGColor;
    
    CALayer *videoLayer= [CALayer layer];
    videoLayer.frame = parentLayer.frame;
    videoLayer.backgroundColor = UIColor.redColor.CGColor;
    
    CALayer *animateLayer = [CALayer layer];
    animateLayer.frame = parentLayer.frame;
    animateLayer.backgroundColor = UIColor.clearColor.CGColor;
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(0, 0, videoWidth, 10);
    lineLayer.position = CGPointMake(videoWidth/2, videoHeight/2);
    lineLayer.backgroundColor = UIColor.redColor.CGColor;
    [animateLayer addSublayer:lineLayer];
    
    [parentLayer addSublayer:videoLayer];
    [parentLayer addSublayer:animateLayer];
    
    if (animateLayer.contentsAreFlipped) {
        animateLayer.geometryFlipped = YES;
    }
    
    videoComposition.animationTool = [AVVideoCompositionCoreAnimationTool videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:videoLayer inLayer:parentLayer];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.filePath =  [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4",@"ceshi"]];
    NSURL* videoUrl = [NSURL fileURLWithPath:self.filePath];
    
    self.exportSession = [[SDAVAssetExportSession alloc] initWithAsset:[mixComposition copy]];
    
    if (@available(iOS 11.0, *)) {
        self.exportSession.videoSettings = @{
                                             AVVideoCodecKey: AVVideoCodecTypeH264,
                                             AVVideoWidthKey: @(videoWidth),
                                             AVVideoHeightKey: @(videoHeight),
                                             AVVideoCompressionPropertiesKey: @
                                             {
                                             AVVideoPixelAspectRatioKey:
                                                 @{
                                                   AVVideoPixelAspectRatioHorizontalSpacingKey: @(1),
                                                   AVVideoPixelAspectRatioVerticalSpacingKey: @(1)
                                                   },
                                             AVVideoAverageBitRateKey: @(videoWidth*videoHeight*6),
                                             AVVideoProfileLevelKey: AVVideoProfileLevelH264Main41,
                                             AVVideoMaxKeyFrameIntervalKey: @(18),
                                             },
                                             };
    } else {
        // Fallback on earlier versions
    }
    
    self.exportSession.audioSettings = @
    {
    AVFormatIDKey: @(kAudioFormatMPEG4AAC),
    AVNumberOfChannelsKey: @2,
    AVSampleRateKey: @44100,
    AVEncoderBitRateKey: @128000,
    };
    
    self.exportSession.shouldOptimizeForNetworkUse = YES;
    self.exportSession.videoComposition = videoComposition;
    //    self.exportSession.audioMix = audioMix;
    self.exportSession.outputURL =  videoUrl;
    self.exportSession.outputFileType = AVFileTypeMPEG4;
    __weak typeof(self)weakSelf = self;
    [self.exportSession exportAsynchronouslyWithCompletionHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            __strong typeof(weakSelf)strongSelf = weakSelf;
            if (strongSelf.exportSession.status == AVAssetExportSessionStatusCompleted) {
                
                [strongSelf gotoVideoplay];
            }else{
                
                [SVProgressHUD showWithStatus:@"合成失败"];
                
            }
            
        });
    }];
}

- (void)gotoVideoplay{
    
    [self endTimer];
    [SVProgressHUD dismiss];
    playVideoViewController *nextVC = [[playVideoViewController alloc] initWithNibName:@"playVideoViewController" bundle:nil];
    nextVC.videoPath = self.filePath;
    [self presentViewController:nextVC animated:YES completion:nil];
    
}

- (void)startTimer{
    
    if (!_pressceTimer || ![_pressceTimer isValid])
    {
        self.pressceTimer = [NSTimer scheduledTimerWithTimeInterval:0.3f
                                                             target:self
                                                           selector:@selector(loopProgressValue)
                                                           userInfo:nil
                                                            repeats:YES];
        NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
        [currentRunLoop addTimer:_pressceTimer forMode: NSRunLoopCommonModes];
    }
}

- (void)loopProgressValue{
    
    [SVProgressHUD showProgress:self.exportSession.progress status:@"视频合成中"];
    
}

- (void)endTimer{
    
    [_pressceTimer invalidate];
    _pressceTimer = nil;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
