//
//  AVMusicPlayAtTimeView.h
//  TestVideoPreViewing
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
   AVMPlayAtTimeBegin=0,
   AVMPlayAtTimeDidScroll,
   AVMPlayAtTimeDidEnd,
    
} AVMPlayAtTimeEvent;

typedef void (^SNPlayAtTimeCallBackBlock)(AVMPlayAtTimeEvent eventType, CGFloat currentTime);

@class FVSoundWaveView;

@interface AVMusicPlayAtTimeView : UIView<UIScrollViewDelegate>
{
        UIScrollView       *helperScrollView_;
    
        SNPlayAtTimeCallBackBlock completedBlock;
}

@property (nonatomic, strong) UIScrollView       *helperScrollView;

@property (nonatomic, strong) FVSoundWaveView       *soundWaveView;

@property (nonatomic, strong) NSURL                 *musicURL;

@property (nonatomic, assign) CFTimeInterval         aniDuration;

@property (nonatomic, assign) CFTimeInterval         audioDuration;

- (void)setCompletedBlock:(SNPlayAtTimeCallBackBlock)block;

-(void)renderWave:(NSURL *)musicURL aniDuration:(CFTimeInterval)aniDuration audioDuration:(CFTimeInterval)audioDuration;

@end
