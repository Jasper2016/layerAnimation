//
//  FVSoundWaveView.h
//
//  Created by Marat Alekperov on 27.06.14.
//  Copyright (c) 2014 Favio Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FVSoundWaveView : UIView

@property (nonatomic, strong) NSURL* soundURL;

@property (nonatomic, assign) float progress;

@property (nonatomic, strong) UIColor* waveColor;

@property (nonatomic, strong) UIColor* progressColor;

@property (nonatomic, assign) BOOL drawSpaces;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
