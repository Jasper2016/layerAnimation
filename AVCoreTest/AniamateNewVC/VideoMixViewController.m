//
//  VideoMixViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2017/12/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VideoMixViewController.h"
#import "AVConstant.h"
#import "AVBasicRouteAnimate.h"
#import "AVBasicLayer.h"
#import <AVFoundation/AVFoundation.h>
#import "AVMediaComposionCommand.h"
#import "HotBasicAnimate.h"

@interface VideoMixViewController ()

@property (nonatomic, strong)       AVPlayer *player;

@end

@implementation VideoMixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    homeLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    [self mixVideo];//图片与视频混合在一个图层
  // [self testCompVideo];
    [self performSelector:@selector(exportVideo) withObject:nil afterDelay:10];
}

-(AVPlayer*)player{
    
    if(!_player) {
        
        NSString *fullPath = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],@"797.mp4"];
        
        NSURL *videoUrl = [NSURL fileURLWithPath:fullPath];
        
        AVPlayerItem*playerItem=[AVPlayerItem playerItemWithURL:videoUrl];
        
        _player= [AVPlayer playerWithPlayerItem:playerItem];
    }
    
    return _player;
    
}

- (void)mixVideo
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1.2;//开始时间
    CFTimeInterval duration = 10;//动画总时长
    
    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
    self.avPlayer = [[AVPreEnginePlayer alloc] initWithFrame:homeLayer.bounds witchMusic: [NSURL fileURLWithPath:MP3URL]];
    [self.view addSubview : self.avPlayer];

    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight/2.0, kAVWindowWidth, kAVWindowHeight/2.0) withImage:[UIImage imageNamed:@"top.png"]];
    currentLayer.backgroundColor = [UIColor whiteColor].CGColor;
    currentLayer.borderColor = [UIColor whiteColor].CGColor;
    currentLayer.borderWidth = 10;
    currentLayer.cornerRadius = 6.0;
    [self.avPlayer.animateLayer addSublayer: currentLayer];

    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(kAVWindowWidth, kAVWindowHeight/2.0, kAVWindowWidth, kAVWindowHeight/2.0) withImage:[UIImage imageNamed:@"cat.png"]];
    nextLayer.backgroundColor = [UIColor whiteColor].CGColor;
    nextLayer.borderColor = [UIColor whiteColor].CGColor;
    nextLayer.borderWidth = 10;
    nextLayer.cornerRadius = 6.0;
    [self.avPlayer.animateLayer addSublayer: nextLayer];

    CABasicAnimation *positionAni1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue:CGPointMake(-kAVWindowWidth/2.0, kAVWindowHeight*3.0/4.0)];
    CABasicAnimation *positionAni2 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue:CGPointMake(kAVWindowWidth/2.0, kAVWindowHeight*3.0/4.0)];

    [currentLayer addAnimation:positionAni1 forKey:@"position_ani"];
    [nextLayer addAnimation:positionAni2 forKey:@"position_ani"];
    
//
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//    playerLayer.frame = CGRectMake(0, 0, 300, 300);
//    [self.avPlayer.animateLayer addSublayer:playerLayer];
//    [self.player play];
}


-(void) exportVideo
{
    [self.avPlayer pauseActive];
    [self.player pause];
    
    AVEngineCompositeBlock block = ^(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL){
        
        if (isSuccess) {
            
            NSLog(@"exportVideoFileAndPush=%@", videoURL);
            
            AVPlayer *player = [AVPlayer playerWithURL:videoURL];
            
            // Create and configure AVPlayerLayer
            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
            playerLayer.frame= CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width);
            
            [self.view.layer addSublayer:playerLayer];
            
            [player play];
            
        }
    };
    
    NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"emptyVideo" ofType:@"mp4"];
    
    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
    
    AVMediaComposionCommand *composionCommand = [[AVMediaComposionCommand alloc] initWithURL:[NSURL fileURLWithPath:videoURL]videoSize:CGSizeMake(kAVWindowWidth, kAVWindowWidth)];
    
    [composionCommand loadMusic:[NSURL fileURLWithPath:MP3URL] totalTime:6];
    
    [self.avPlayer exportAni];
    
    [composionCommand exportVideo:self.avPlayer.animateLayer compeleteBlock:block outName:@"mac.mp4"];
    
}



-(void)testCompVideo
{
    
    [self testAVMusicPlayAtTimeView];
    
    [self performSelector:@selector(exportVideo) withObject:nil afterDelay:3];
    
    
}

-(void)testAVMusicPlayAtTimeView
{
    //
    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
    //
    self.avPlayer = [[AVPreEnginePlayer alloc] initWithFrame:CGRectMake(0, 60, 1080, 1080) witchMusic: [NSURL fileURLWithPath:MP3URL]];
    
    [self.view addSubview : self.avPlayer];
    
    CGFloat scaleValue = kDeviceWidth/kAVWindowWidth;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
    
    self.avPlayer.transform = transform;
    
    self.avPlayer.center =  CGPointMake(kDeviceWidth/2, kDeviceWidth/2);
    
    
    
    //依次增加照片数量
    
    for (NSInteger index= 0; index < 4; index++) {
        
        CALayer *imageLayer1 = [CALayer layer];
        imageLayer1.frame =CGRectMake(0, 0, 1080, 1080);
        
        [self.avPlayer.animateLayer addSublayer:imageLayer1];
        
        NSString  *imageName = [NSString stringWithFormat:@"%ld.png", index];
        
        imageLayer1.contents = (id)[[UIImage imageNamed:imageName] CGImage];
        
        imageLayer1.contentsGravity=kCAGravityResizeAspectFill;
        
        CFTimeInterval locationTime = [self.avPlayer.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.avPlayer.layer] ;
        
        CABasicAnimation *opacityInAnimation = [HotBasicAnimate moveYAnimation:1.0 withBeginTime:(1.0*(3-index)) + locationTime
                                                                         frome:30 to:600];
        
        [imageLayer1 addAnimation:opacityInAnimation forKey:@"opacityShowAndCloseAni"];
        
        
    }
    
    [self.avPlayer playNewAtTime:0 totalTime:6];
    
}


//-(void) exportVideo
//{
//    [self.avPlayer pauseActive];
//
//    AVEngineCompositeBlock block = ^(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL){
//
//        if (isSuccess) {
//
//            NSLog(@"exportVideoFileAndPush=%@", videoURL);
//
//            AVPlayer *player = [AVPlayer playerWithURL:videoURL];
//
//            // Create and configure AVPlayerLayer
//            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//            playerLayer.frame= CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width);
//
//            [self.view.layer addSublayer:playerLayer];
//
//            [player play];
//
//        }
//    };
//
//    NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"emptyVideo" ofType:@"mp4"];
//
//    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
//
//    AVMediaComposionCommand *composionCommand = [[AVMediaComposionCommand alloc] initWithURL:[NSURL fileURLWithPath:videoURL]videoSize:CGSizeMake(kAVWindowWidth, kAVWindowWidth)];
//
//    [composionCommand loadMusic:[NSURL fileURLWithPath:MP3URL] totalTime:4];
//
//    [self.avPlayer exportAni];
//
//    [composionCommand exportVideo:self.avPlayer.animateLayer compeleteBlock:block outName:@"mac.mp4"];
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
