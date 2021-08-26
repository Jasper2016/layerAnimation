//
//  AVMusicPlayAtTimeView.m
//  TestVideoPreViewing
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVMusicPlayAtTimeView.h"

#import "FVSoundWaveView.h"

//#import "AVConstant.h"

#import "UIView+Geometry.h"

@implementation AVMusicPlayAtTimeView

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.helperScrollView];

        
        self.aniDuration = 0 ;self.audioDuration = 0;
        
    }
    
    return self;
}

- (void)setCompletedBlock:(SNPlayAtTimeCallBackBlock)block
{
    if (block != completedBlock) {
        
        completedBlock = [block copy];
    }
}

-(FVSoundWaveView *)soundWaveView
{
    
    if(!_soundWaveView)
    {
        
        
        _soundWaveView = [[FVSoundWaveView alloc] initWithFrame:CGRectMake(self.frame.size.width/2,(self.frame.size.height-40)/2, self.frame.size.width/2, 40)];
        
        [self.helperScrollView addSubview:_soundWaveView];
    }
    
    return _soundWaveView;
}

-(UIScrollView*)helperScrollView
{
    
    if(!helperScrollView_)
    {
        
        helperScrollView_ = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        helperScrollView_.delegate = self;
    
        
        helperScrollView_.backgroundColor = [UIColor clearColor];
        
        helperScrollView_.showsVerticalScrollIndicator = NO;
        
        helperScrollView_.showsHorizontalScrollIndicator = NO;
        
        helperScrollView_.pagingEnabled = NO;
        
        helperScrollView_.layer.masksToBounds = NO;
        
        helperScrollView_.userInteractionEnabled = YES;
    
    }
    
    return helperScrollView_;	
}

-(void)renderWave:(NSURL *)musicURL aniDuration:(CFTimeInterval)aniDuration audioDuration:(CFTimeInterval)audioDuration
{
    if ((_aniDuration != aniDuration)  || (_audioDuration != audioDuration)) {
        
        _aniDuration = aniDuration;
        
        _audioDuration = audioDuration;
        
        [self updataWaveSize];
    }
    
    if (_musicURL != musicURL) {
        
        _musicURL = musicURL;
        
        self.soundWaveView.soundURL = _musicURL;
        
    }
}

-(void)updataWaveSize
{
    CGFloat aniMusicWidth =  self.frame.size.width/2;
    
    CGFloat waveWidth = ((self.audioDuration *aniMusicWidth)/ self.aniDuration);
    
    self.helperScrollView.contentSize = CGSizeMake(waveWidth+aniMusicWidth, self.soundWaveView.frame.size.height);
    
    self.soundWaveView.width =waveWidth;
    
     [self.soundWaveView layoutSubviews];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        CGFloat aniMusicWidth =  self.frame.size.width/2;
//        
//        CGFloat waveWidth = ((self.audioDuration *aniMusicWidth)/ self.aniDuration);
//        
//        self.helperScrollView.contentSize = CGSizeMake(waveWidth+aniMusicWidth, self.soundWaveView.frame.size.height);
//        
//        self.soundWaveView.width =waveWidth;
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [self.soundWaveView layoutSubviews];
//        });
//    });
}

#pragma mark -
#pragma mark Paging and Refresh image view

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    if (completedBlock) {
        completedBlock(AVMPlayAtTimeBegin, 0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // NSLog(@"scrollViewDidScroll .contentOffset.x =%f", scrollView.contentOffset.x);
    
    CGFloat currentTime = (self.audioDuration*scrollView.contentOffset.x)/self.helperScrollView.contentSize.width;
    
    //NSLog(@"currentTime =%f", currentTime);
    
    if (completedBlock) {
        completedBlock(AVMPlayAtTimeDidScroll, currentTime>0?currentTime:0);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
   // NSLog(@"scrollViewDidEndDecelerating contentOffset.x=%f", scrollView.contentOffset.x);
    
    CGFloat currentTime = (self.audioDuration*scrollView.contentOffset.x)/self.helperScrollView.contentSize.width;
    
    if (completedBlock) {
        completedBlock(AVMPlayAtTimeDidEnd, currentTime>0?currentTime:0);
    }
}


@end
