//
//  SoundTouchEidtView.m
//  SoundTouchTest
//
//  Created by xwxing on 2018/11/19.
//  Copyright © 2018 x. All rights reserved.
//

#import "SoundTouchEidtView.h"
#import "AudioConvert.h"
#import <AVFoundation/AVFoundation.h>

@implementation SoundTouchEidtView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.scrollView];
    [_scrollView addSubview:self.tempoDesLabel];
    [_scrollView addSubview:self.tempoValueLabel];
    [_scrollView addSubview:self.tmpoSlider];
    [_scrollView addSubview:self.pitchSemiTonesDesLabel];
    [_scrollView addSubview:self.pitchSemiTonesValueLabel];
    [_scrollView addSubview:self.pitchSemiTonesSlider];
    [_scrollView addSubview:self.rateDesLabel];
    [_scrollView addSubview:self.rateValueLabel];
    [_scrollView addSubview:self.rateSlider];
    [_scrollView addSubview:self.playButton];
    [_scrollView addSubview:self.recorderButton];
    [_scrollView addSubview:self.recorderPlayButton];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    }
    return _scrollView;
}

- (UILabel *)tempoDesLabel{
    if (!_tempoDesLabel) {
        _tempoDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, [self screenWidth]-40, 24)];
        _tempoDesLabel.text = @"取值范围：-50~100（变速不变调）";
    }
    return _tempoDesLabel;
}

- (UILabel *)tempoValueLabel{
    if (!_tempoValueLabel) {
        _tempoValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, [self screenWidth]-40, 24)];
        _tempoValueLabel.text = @"TempoChange：0";
    }
    return _tempoValueLabel;
}

- (UISlider *)tmpoSlider{
    if (!_tmpoSlider) {
        _tmpoSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 90, [self screenWidth]-40, 30)];
        _tmpoSlider.minimumValue = -50;
        _tmpoSlider.maximumValue = 100;
        _tmpoSlider.value = 0;
        [_tmpoSlider addTarget:self action:@selector(tempoChangeValue:) forControlEvents:UIControlEventValueChanged];
        [_tmpoSlider sizeToFit];
    }
    return _tmpoSlider;
}

- (UILabel *)pitchSemiTonesDesLabel{
    if (!_pitchSemiTonesDesLabel) {
        _pitchSemiTonesDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, [self screenWidth]-40, 24)];
        _pitchSemiTonesDesLabel.text = @"取值范围：-12~12（音高）";
    }
    return _pitchSemiTonesDesLabel;
}

- (UILabel *)pitchSemiTonesValueLabel{
    if (!_pitchSemiTonesValueLabel) {
        _pitchSemiTonesValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, [self screenWidth]-40, 24)];
        _pitchSemiTonesValueLabel.text = @"PitchSemiTones：0";
    }
    return _pitchSemiTonesValueLabel;
}

- (UISlider *)pitchSemiTonesSlider{
    if (!_pitchSemiTonesSlider) {
        _pitchSemiTonesSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 190, [self screenWidth]-40, 40)];
        _pitchSemiTonesSlider.minimumValue = -12;
        _pitchSemiTonesSlider.maximumValue = 12;
        _pitchSemiTonesSlider.value = 0;
        [_pitchSemiTonesSlider addTarget:self action:@selector(pitchSemitonesValue:) forControlEvents:UIControlEventValueChanged];
        [_pitchSemiTonesSlider sizeToFit];
    }
    return _pitchSemiTonesSlider;
}

- (UILabel *)rateDesLabel{
    if (!_rateDesLabel) {
        _rateDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 230, [self screenWidth]-40, 24)];
        _rateDesLabel.text = @"取值范围：-50~100（声音的速率）";
    }
    return _rateDesLabel;
}

- (UILabel *)rateValueLabel{
    if (!_rateValueLabel) {
        _rateValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, [self screenWidth]-40, 24)];
        _rateValueLabel.text = @"RateChange：0";
    }
    return _rateValueLabel;
}

- (UISlider *)rateSlider{
    if (!_rateSlider) {
        _rateSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 290, [self screenWidth]-40, 40)];
        _rateSlider.minimumValue = -50;
        _rateSlider.maximumValue = 100;
        _rateSlider.value = 0;
        [_rateSlider addTarget:self action:@selector(rateChangeValue:) forControlEvents:UIControlEventValueChanged];
        [_rateSlider sizeToFit];
    }
    return _rateSlider;
}

- (UIButton *)playButton{
    if (!_playButton) {
        _playButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 350, [self screenWidth]-160, 60)];
        [_playButton setBackgroundColor:[UIColor orangeColor]];
        [_playButton setTitle:@"播放" forState:UIControlStateNormal];
        [_playButton addTarget:self action:@selector(playFileAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

- (UIButton *)recorderButton{
    if (!_recorderButton) {
        _recorderButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 430, [self screenWidth]-160, 60)];
        [_recorderButton setBackgroundColor:[UIColor orangeColor]];
        [_recorderButton setTitle:@"开始录音" forState:UIControlStateNormal];
        [_recorderButton setTitle:@"停止录音" forState:UIControlStateSelected];
        [_recorderButton addTarget:self action:@selector(recorderAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recorderButton;
}

- (UIButton *)recorderPlayButton{
    if (!_recorderPlayButton) {
        _recorderPlayButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 500, [self screenWidth]-160, 60)];
        [_recorderPlayButton setBackgroundColor:[UIColor orangeColor]];
        [_recorderPlayButton setTitle:@"播放录音" forState:UIControlStateNormal];
        [_recorderPlayButton addTarget:self action:@selector(recorderPlayAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recorderPlayButton;
}

- (void)tempoChangeValue:(UISlider *)sender{
    int value = (int)sender.value;
    self.tempoValueLabel.text = [NSString stringWithFormat:@"setTempoChange: %d",value];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tempoDidChanged:)]) {
        [self.delegate tempoDidChanged:value];
    }
}

- (void)pitchSemitonesValue:(UISlider *)sender{
    int value = (int)sender.value;
    self.pitchSemiTonesValueLabel.text = [NSString stringWithFormat:@"setPitchSemiTones: %d",value];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pitchDidChanged:)]) {
        [self.delegate pitchDidChanged:value];
    }
}

- (void)rateChangeValue:(UISlider *)sender{
    int value = (int)sender.value;
    self.rateValueLabel.text = [NSString stringWithFormat:@"setRateChange: %d",value];
    if (self.delegate && [self.delegate respondsToSelector:@selector(rateDidChanged:)]) {
        [self.delegate rateDidChanged:value];
    }
}

- (void)playFileAction:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(playButtonDidClicked)]) {
        [self.delegate playButtonDidClicked];
    }
}

- (void)recorderAction:(UIButton *)sender{
    if (sender.selected){
        if (self.delegate && [self.delegate respondsToSelector:@selector(recorderEnd)]) {
            [self.delegate recorderEnd];
        }
        [_recorderButton setBackgroundColor:[UIColor orangeColor]];
    }else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(recorderBegin)]) {
            [self.delegate recorderBegin];
        }
        [_recorderButton setBackgroundColor:[UIColor redColor]];
    }
    sender.selected = !sender.selected;
}

- (void)recorderPlayAction:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recorderPlay)]) {
        [self.delegate recorderPlay];
    }
}

- (CGFloat)screenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)screenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

@end
