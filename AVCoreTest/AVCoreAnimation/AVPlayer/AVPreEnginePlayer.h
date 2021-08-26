//
//  AVPreEnginePlayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/5/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef enum {
    kAVPlayerPause=10,
    kAVPlayerResume,
    kAVPlayerPlay,
    kAVPlayerReplay,
    kAVPlayerReMusic,
    
} AVPlayerEvent;

typedef void (^SNOperationCallBackBlock)(BOOL isSuccess, NSString *errorMsg);

@interface AVPreEnginePlayer : UIView
{
    SNOperationCallBackBlock completedBlock;
    
    CFTimeInterval           currentTimeInSuperLayerSystem;
    
    CFTimeInterval           _currentStartPlayTime;
    
    CFTimeInterval           _playbackDuration;
    
    CFTimeInterval           _totalDuration;
}


@property (nonatomic, strong)   CALayer             *animateLayer;

@property (nonatomic, strong)   NSURL               *audioPlayerURL;

@property (nonatomic, strong) AVAudioPlayer         *musicPlayer;

@property (nonatomic , strong) UIButton             *pauseBgBtn;

@property (nonatomic , strong) UIView               *playerCompelteView;

@property (nonatomic , strong) UIView               *playerResumeView;


@property (nonatomic, strong) CADisplayLink         *displayLink;

@property (nonatomic, strong)   NSTimer             *audioOverTimer;


-(id) initWithFrame:(CGRect)frame witchMusic:(NSURL *)musicURL;

-(void) pause;

-(void) resume;

-(void) overMusic;

-(void) stopActive;

-(void) pauseActive;

-(void) replayAgain;

-(void) exportAni;

-(void) cleanActive;

-(void) cleanActive2;

-(void) getSuperTime;

-(void) playAtTime:(CFTimeInterval)startTime;

-(void) playNewAtTime:(CFTimeInterval)startTime totalTime:(CFTimeInterval)totalTime;

-(void) changeMusic:(NSURL *)musicURL;

- (void)setCompletedBlock:(SNOperationCallBackBlock)block;

@end
