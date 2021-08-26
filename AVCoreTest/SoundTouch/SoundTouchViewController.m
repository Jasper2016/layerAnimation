//
//  SoundTouchViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2018/11/19.
//  Copyright © 2018 mac. All rights reserved.
//

#import "SoundTouchViewController.h"
#import "AudioConvert.h"
#import <AVFoundation/AVFoundation.h>
#import "Recorder.h"
#import "SoundTouchEidtView.h"

@interface SoundTouchViewController ()<AudioConvertDelegate,SoundTouchEidtViewDelegate,AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPalyer;
    float tempoChangeNum;
    float pitchSemiTonesNum;
    float rateChangeNum;
}

@end

@implementation SoundTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tempoChangeNum = 0;
    pitchSemiTonesNum = 0;
    rateChangeNum = 0;
    SoundTouchEidtView *editView = [[SoundTouchEidtView alloc] initWithFrame:self.view.bounds];
    editView.delegate = self;
    [self.view addSubview:editView];
}

#pragma mark -
#pragma mark - SoundTouchEidtViewDelegate
- (void)tempoDidChanged:(float)tempoValue{
    tempoChangeNum = tempoValue;
}

- (void)pitchDidChanged:(float)pitchValue{
    pitchSemiTonesNum = pitchValue;
}

- (void)rateDidChanged:(float)rateValue{
    rateChangeNum = rateValue;
}

- (void)playButtonDidClicked{
    NSString *p =  [[NSBundle mainBundle] pathForResource:@"Twinbed-Trouble-sub" ofType:@"mp3"];
    [self setAudioConfigWithPath:p];
}

- (void)recorderPlay{
    [self recorderPlayAction];
}

//开始录音
- (void)recorderBegin
{
    //录音
    [self stopAudio];
    [[Recorder shareRecorder] startRecord];
}

//录音结束
- (void)recorderEnd
{
    [[Recorder shareRecorder] stopRecord];
}

//播放录音
- (void)recorderPlayAction
{
    [self stopAudio];
    
    NSString *p =  [Recorder shareRecorder].filePath;
    [self setAudioConfigWithPath:p];
}

- (void)setAudioConfigWithPath:(NSString *)path{
    AudioConvertConfig dconfig;
    dconfig.sourceAuioPath = [path UTF8String];
    dconfig.outputFormat = AudioConvertOutputFormat_WAV;
    dconfig.outputChannelsPerFrame = 1;
    dconfig.outputSampleRate = 22050;
    dconfig.soundTouchPitch = pitchSemiTonesNum;//音调  范围 -12 ~ 12
    dconfig.soundTouchRate = rateChangeNum;//声音速率 范围 -50 ~ 100
    dconfig.soundTouchTempoChange = tempoChangeNum;//速度 <变速不变调> 范围 -50 ~ 100
    [[AudioConvert shareAudioConvert] audioConvertBegin:dconfig withCallBackDelegate:self];
}

//停止播放
- (void)stopAudio {
    if (audioPalyer) {
        [audioPalyer stop];
        audioPalyer = nil;
    }
}
//播放
- (void)playAudio:(NSString *)path {
    
    NSString *audioName = [path lastPathComponent];
    
    if ([audioName rangeOfString:@"amr"].location != NSNotFound) {
        UIAlertView *aler = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"输出音频: %@ \n iOS 设备不能直接播放amr 格式音频",audioName] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
        //        [SVProgressHUD dismiss];
        [self stopAudio];
        return;
    }else {
        //        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"文件名: %@",audioName ]];
    }
    
    
    //    if (!isPlayRecoder) {
    //        [self.playButton setTitle:@"播放文件中..." forState:UIControlStateNormal];
    //    }else {
    //        [self.recorderPlayButton setTitle:@"播放效果中..." forState:UIControlStateNormal];
    //    }
    NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSError *err = nil;
    if (audioPalyer) {
        [audioPalyer stop];
        audioPalyer = nil;
    }
    audioPalyer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    audioPalyer.delegate = self;
    [audioPalyer play];
}

#pragma mak - 播放回调代理
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"恢复音效按钮");
}


#pragma mark -
#pragma mark - AudioConvertDelegate
- (BOOL)audioConvertOnlyDecode
{
    return  NO;
}
- (BOOL)audioConvertHasEnecode
{
    return YES;
}

/**
 * 对音频解码动作的回调
 **/
- (void)audioConvertDecodeSuccess:(NSString *)audioPath {
    //解码成功
    [self playAudio:audioPath];
}
- (void)audioConvertDecodeFaild
{
    //解码失败
    //    [SVProgressHUD showErrorWithStatus:@"解码失败"];
    [self stopAudio];
}


/**
 * 对音频变声动作的回调
 **/
- (void)audioConvertSoundTouchSuccess:(NSString *)audioPath
{
    //变声成功
    [self playAudio:audioPath];
}


- (void)audioConvertSoundTouchFail
{
    //变声失败
    //    [SVProgressHUD showErrorWithStatus:@"变声失败"];
    [self stopAudio];
}




/**
 * 对音频编码动作的回调
 **/

- (void)audioConvertEncodeSuccess:(NSString *)audioPath
{
    //编码完成
    [self playAudio:audioPath];
}

- (void)audioConvertEncodeFaild
{
    //编码失败
    //    [SVProgressHUD showErrorWithStatus:@"编码失败"];
    [self stopAudio];
}


@end
