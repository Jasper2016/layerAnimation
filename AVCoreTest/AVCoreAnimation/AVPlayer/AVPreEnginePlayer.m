//
//  AVPreEnginePlayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/5/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVPreEnginePlayer.h"
#import "AVConstant.h"

#import "AVBasicLayer.h"

#define kAudioFallOutDration   4

#define kPlayBtnSize        60

@implementation AVPreEnginePlayer

-(id) initWithFrame:(CGRect)frame witchMusic:(NSURL *)musicURL
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.layer.masksToBounds = YES;
        
        [self.layer addSublayer: self.animateLayer];
        
        [self addSubview: self.pauseBgBtn];
        
        self.audioPlayerURL = musicURL;
        
        [self pause];
        
        [self getSuperTime];
        
        [self startDisplayLink];
        
    }
    
    return self;
}

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.layer.masksToBounds = YES;
        
        [self.layer addSublayer: self.animateLayer];
        
        [self addSubview: self.pauseBgBtn];
        
        [self pause];
        
        [self getSuperTime];
        
        [self startDisplayLink];
        
    }
    
    return self;
}

-(CALayer *)animateLayer
{
    if (!_animateLayer) {
        
        _animateLayer = [[CALayer alloc] init];
        
        _animateLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight);
    }
    
    return _animateLayer;
}

-(UIButton *)pauseBgBtn
{
    if (!_pauseBgBtn) {
        
        _pauseBgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _pauseBgBtn.frame = self.bounds;
        
        [_pauseBgBtn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        _pauseBgBtn.tag= kAVPlayerPause;
    }
    return _pauseBgBtn;
}

-(UIView *)playerCompelteView
{
    if (!_playerCompelteView) {
        
        _playerCompelteView = [[UIView alloc] initWithFrame:kAVRectWindow];
        
        _playerCompelteView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        UIImage *image1 = [UIImage imageNamed:@"replayer-icon.png"];
        
        UIButton *relayerClickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        relayerClickBtn.frame = kCGRectInArea(self.bounds, kPlayBtnSize, kPlayBtnSize);
        
        [relayerClickBtn setImage:image1 forState:UIControlStateNormal];
        
        [relayerClickBtn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchDown];
        relayerClickBtn.tag= kAVPlayerReplay;
        
        [_playerCompelteView addSubview: relayerClickBtn];
    }
    
    return _playerCompelteView;
}

-(UIView *)playerResumeView
{
    if (!_playerResumeView) {
        
        _playerResumeView = [[UIView alloc] initWithFrame:kAVRectWindow];
        
        _playerResumeView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        UIImage *image1 = [UIImage imageNamed:@"player-icon.png"];
        
        UIButton *relayerClickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        relayerClickBtn.frame = kCGRectInArea(self.bounds, kPlayBtnSize, kPlayBtnSize);
        
        [relayerClickBtn setImage:image1 forState:UIControlStateNormal];
        
        [relayerClickBtn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        relayerClickBtn.tag= kAVPlayerResume;
        
        [_playerResumeView addSubview: relayerClickBtn];
        
        
    }
    
    return _playerResumeView;
}

-(void) getSuperTime
{
    
    currentTimeInSuperLayerSystem = [self.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.layer];

    
}

- (void)setCompletedBlock:(SNOperationCallBackBlock)block
{
    if (block != completedBlock) {
        
        completedBlock = [block copy];
    }
}

-(void)setAudioPlayerURL:(NSURL *)audioPlayerURL
{
    if (_audioPlayerURL != audioPlayerURL) {
        
        _audioPlayerURL = audioPlayerURL;
        
        if ((_musicPlayer)  || [_musicPlayer isPlaying]) {
            [_musicPlayer stop];
            _musicPlayer = nil;
        }
        
        _musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:_audioPlayerURL error:nil];
        [_musicPlayer prepareToPlay];
        [_musicPlayer setVolume:1];   //设置音量大小
        _musicPlayer.numberOfLoops = 1;//设置音乐播放次数  -1为一直循环
        
    }
}

-(void) replayAgain
{
    [self playAtTime:0 ];
}

-(void) exportAni
{
    if (self.playerResumeView.superview) {
        
        [self.playerResumeView removeFromSuperview];
    }
    
    if (self.playerCompelteView.superview) {
        
        [self.playerCompelteView removeFromSuperview];
    }
    
    [self.musicPlayer pause];
    
    self.animateLayer.speed = 1.0;
    self.animateLayer.timeOffset = 0.0;
    self.animateLayer.beginTime = 0.0;

    CFTimeInterval timeSincePause = [self.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.layer]-currentTimeInSuperLayerSystem+2;
    self.animateLayer.beginTime = timeSincePause;
    
    [[self displayLink] setPaused:YES];
}

-(void) playAtTime:(CFTimeInterval)startTime
{
    if (self.playerResumeView.superview) {
        
        [self.playerResumeView removeFromSuperview];
    }
    
    if (self.playerCompelteView.superview) {
        
        [self.playerCompelteView removeFromSuperview];
    }
    
    _currentStartPlayTime  = startTime;
    
    _playbackDuration = _totalDuration + _currentStartPlayTime;
    
    [self playAni];
    
    [self playMusic:_currentStartPlayTime];
    
    [[self displayLink] setPaused:NO];
}

-(void) playNewAtTime:(CFTimeInterval)startTime totalTime:(CFTimeInterval)totalTime;
{
    
   // [self getSuperTime];  //复位时间
    
    _currentStartPlayTime =startTime;
    
    _totalDuration = totalTime;
    
   _playbackDuration = _totalDuration +_currentStartPlayTime;
    
    [self playAni];
    
    // 因 声音 会 提前播放
    [self performSelector:@selector(delayPlayMusic) withObject:nil afterDelay:0.5];
    
    if (self.playerResumeView.superview) {
        
        [self.playerResumeView removeFromSuperview];
    }
    
    if (self.playerCompelteView.superview) {
        
        [self.playerCompelteView removeFromSuperview];
    }
    
    
    [[self displayLink] setPaused:NO];
}


-(void)delayPlayMusic
{
     [self playMusic:_currentStartPlayTime];
}

-(void) pause
{
    CFTimeInterval pausedTime =  [self.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.layer];
    
    // CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    self.animateLayer.speed = 0.0;
    self.animateLayer.timeOffset = pausedTime;
    
    [self.musicPlayer pause];
    
    [[self displayLink] setPaused:YES];
    
}

-(void) resume
{
    CFTimeInterval pausedTime =  [self.animateLayer timeOffset];
    
    self.animateLayer.speed = 1.0;
    self.animateLayer.timeOffset = 0.0;
    self.animateLayer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.layer] - pausedTime;
    
    self.animateLayer.beginTime = timeSincePause;
    
    [self.musicPlayer play];
    
    [[self displayLink] setPaused:NO];
}

-(void) playAni
{
    self.animateLayer.speed = 1;
    self.animateLayer.timeOffset = 0;
    self.animateLayer.beginTime = 0.0;
    
    CFTimeInterval subLayerOffsetTimer  =[self.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.layer] -currentTimeInSuperLayerSystem;
    
    self.animateLayer.beginTime  = subLayerOffsetTimer;
    
}

-(void)playMusic:(CFTimeInterval)startTime
{
    
    [self.musicPlayer setCurrentTime:startTime];
    [self.musicPlayer play];
}

-(void) changeMusic:(NSURL *)musicURL
{
    self.audioPlayerURL = musicURL;
}

-(void) overMusic
{
    if (_audioOverTimer) [_audioOverTimer invalidate];
    
    _audioOverTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(moveInMoveOutForAudio) userInfo:nil repeats:YES];
    
}

-(void)moveInMoveOutForAudio
{
    
    if ( self.musicPlayer.volume >0) {
        
        float volume = self.musicPlayer.volume-0.05;
        [self.musicPlayer setVolume:volume];   //设置音量大小
    }else{
        
        if (_audioOverTimer) [_audioOverTimer invalidate];
        _audioOverTimer = nil;
        
        [self pause];
        
        self.musicPlayer.volume = 1.0f;
        
        if (self.playerResumeView.superview) {
            
            [self.playerResumeView removeFromSuperview];
        }
        
        if (!self.playerCompelteView.superview) {
            
            self.playerCompelteView.alpha = 0.0f;
            
            [self addSubview: self.playerCompelteView];
            
            [CATransaction begin];
            
                self.playerCompelteView.alpha= 1.0f;
            
            [CATransaction commit];
            
        }
    }
    
}

-(void) stopActive
{
    if (self.playerCompelteView.superview) {
        [self.playerCompelteView removeFromSuperview];
    }
    
    if (!self.playerResumeView.superview) {
        
        [self addSubview: self.playerResumeView];
        
        self.playerResumeView.hidden = YES;
        
        [self pause];
        
        [[self displayLink] setPaused:YES];
    }
    
}


-(void) pauseActive
{
    
    if (self.playerCompelteView.superview) {
        [self.playerCompelteView removeFromSuperview];
    }
    
     self.playerResumeView.hidden = NO;
    if (!self.playerResumeView.superview) {
        
        [self addSubview: self.playerResumeView];
        
        
        [self pause];
        
        [[self displayLink] setPaused:YES];
    }
    
}

-(void) cleanActive2
{
    NSArray *animateSubList = [self.animateLayer.sublayers copy];
    
    [animateSubList enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        
        CALayer *subLayer = (CALayer *)obj;
        
        [subLayer removeAllAnimations];
        
        [subLayer removeFromSuperlayer];
        
    } ];

    [self.animateLayer removeFromSuperlayer];
    
    self.animateLayer = [[CALayer alloc] init];
    
    self.animateLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight);
    
    [self.layer addSublayer: self.animateLayer];
    
}

-(void) cleanActive
{
    NSArray *animateSubList = [self.animateLayer.sublayers copy];
    
    [animateSubList enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
    
        CALayer *subLayer = (CALayer *)obj;
        
        if ([subLayer isKindOfClass:[AVBasicLayer class]]) {
            
            AVBasicLayer *subParLayer = (AVBasicLayer *)subLayer;
            
            [subParLayer disposerRelese];
           
            
        }else{
            
            if (subLayer) {
                
                NSArray *animateSubList = [subLayer.sublayers copy];
                
                [animateSubList enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
                    
                    CALayer *subLayer = (CALayer *)obj;
                    
                    if ([subLayer isKindOfClass:[AVBasicLayer class]]) {
                        
                        AVBasicLayer *subParLayer = (AVBasicLayer *)subLayer;
                        
                        [subParLayer disposerRelese];
                        
                    }
                }];
                
            }
        
        }
        
        //subLayer.contents = nil;
        
        [subLayer removeAllAnimations];
        
        [subLayer removeFromSuperlayer];
    
    } ];

}

-(void)clickEvent:(UIButton *)sender
{
    switch (sender.tag) {
        case kAVPlayerPause:
        {
            
            [self pauseActive];
            
            break;
        }
        case kAVPlayerResume:
        {
            [sender.superview removeFromSuperview];
            
            [self resume];
            
            [[self displayLink] setPaused:NO];
            break;
        }
            
        case kAVPlayerReplay:
        {
            
            [self.playerCompelteView removeFromSuperview];
            
            //  self.musicPlayer.currentTime = 0;
            
            [self playAni];
            
            [self playMusic:_currentStartPlayTime];
            
            [[self displayLink] setPaused:NO];
            
            break;
        }
            
        case kAVPlayerReMusic:
        {
            
            break;
        }
        default:
            break;
    }
    
}

#pragma mark -
#pragma mark CADisplayLink

- (void)startDisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(displayLinkCallback:)];
    
    self.displayLink.frameInterval = 6;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    
    [self.displayLink setPaused:YES];
}

- (void)displayLinkCallback:(CADisplayLink *)sender
{
    //do something
   // NSLog(@"displayLinkCallback");
    if (self.musicPlayer.currentTime >_playbackDuration) {
        
        [self.displayLink setPaused:YES];
        
        [self overMusic];
        
    }

    
}

- (void)stopDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}



@end
