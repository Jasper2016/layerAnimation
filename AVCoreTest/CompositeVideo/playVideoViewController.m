//
//  playVideoViewController.m
//  mergeVideo
//
//  Created by mac on 2018/11/5.
//  Copyright © 2018年 com.maybe.ysq. All rights reserved.
//

#import "playVideoViewController.h"
#import <AVFoundation/AVFoundation.h>

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface playVideoViewController (){
    
    BOOL _isPlaying;
    BOOL _isPlayEnd;
}
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayerItem *playItem;
@end

@implementation playVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PlayEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    self.player = nil;
    self.playerLayer = nil;
    self.playItem = nil;

   self.playItem= [[AVPlayerItem alloc] initWithURL:[NSURL fileURLWithPath:self.videoPath]];
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight);
    [self.view.layer insertSublayer:self.playerLayer atIndex:0];
    [self.player play];
    _isPlaying = YES;
}
- (IBAction)backBtnEvent:(id)sender {
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.videoPath]) {
        
        [[NSFileManager defaultManager] removeItemAtPath:self.videoPath error:nil];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)PlayEnd:(NSNotification *)noti{
    
    _isPlayEnd = YES;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (_isPlayEnd) {
        
        _isPlayEnd = NO;
        [self.player seekToTime:kCMTimeZero];
        [self.player play];
        
    }else{

        if (_isPlaying) {
            
            [self.player pause];
            _isPlaying = NO;
        }else{
            [self.player play];
            _isPlaying = YES;
        }
    }
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
