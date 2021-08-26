//
//  SoundTouchEidtView.h
//  SoundTouchTest
//
//  Created by xwxing on 2018/11/19.
//  Copyright © 2018 x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SoundTouchEidtViewDelegate <NSObject>

- (void)playButtonDidClicked;

- (void)tempoDidChanged:(float)tempoValue;
- (void)pitchDidChanged:(float)pitchValue;
- (void)rateDidChanged:(float)rateValue;
- (void)recorderBegin;
- (void)recorderEnd;
- (void)recorderPlay;

@end

@interface SoundTouchEidtView : UIView

@property (strong, nonatomic) UIScrollView *scrollView;
//@property (strong, nonatomic) UIView *scrollViewContanierView;
@property (strong, nonatomic) UILabel *tempoDesLabel;
@property (strong, nonatomic) UILabel *tempoValueLabel;
@property (strong, nonatomic) UISlider *tmpoSlider;
@property (strong, nonatomic) UILabel *pitchSemiTonesDesLabel;
@property (strong, nonatomic) UILabel *pitchSemiTonesValueLabel;
@property (strong, nonatomic) UISlider *pitchSemiTonesSlider;
@property (strong, nonatomic) UILabel *rateDesLabel;
@property (strong, nonatomic) UILabel *rateValueLabel;
@property (strong, nonatomic) UISlider *rateSlider;
//@property (strong, nonatomic) UILabel *outFileFormatLabel;
//@property (strong, nonatomic) UISegmentedControl *outFormatSegment;
//@property (strong, nonatomic) UISegmentedControl *effectSegment;
//@property (strong, nonatomic) UILabel *resourceChooseLabel;
//@property (strong, nonatomic) UISegmentedControl *resourceSegment;
//@property (strong, nonatomic) UILabel *countDowntimeLabel;
//@property (strong, nonatomic) UILabel *msgLabel;

@property (strong, nonatomic) UIButton *playButton;
//@property (strong, nonatomic) UIButton *recorderEndButton;
@property (strong, nonatomic) UIButton *recorderPlayButton;
@property (strong, nonatomic) UIButton *recorderButton;
//@property (strong, nonatomic) UIButton *stopButton;


@property (nonatomic,weak) id<SoundTouchEidtViewDelegate> delegate;

- (void)playFileAction:(UIButton *)sender;
//- (void)recorderBeginAction:(UIButton *)sender;
//- (void)recorderEndAction:(UIButton *)sender;
//- (void)recorderPlayAction:(UIButton *)sender;
//- (void)stopAction:(UIButton *)sender;
//- (void)segChanged:(UISegmentedControl *)sender;
//- (void)effectSegChanged:(UISegmentedControl *)sender;
//- (void)resourceChanged:(UISegmentedControl *)sender;
- (void)tempoChangeValue:(UISlider *)sender;
- (void)pitchSemitonesValue:(UISlider *)sender;
- (void)rateChangeValue:(UISlider *)sender;

@end

NS_ASSUME_NONNULL_END
