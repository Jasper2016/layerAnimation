//
//  MCCTextLayer.h
//  AVCoreTest
//
//  Created by gemin on 2018/10/14.
//  Copyright © 2018 robin.wang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AVBasicTextLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface MCCTextLayer : CALayer
@property (nonatomic, strong) AVBasicTextLayer *textLayer;

- (void)configureTextLayer:(VCAnimateTextModel *)textModel;

- (void)textAnimationDuration:(NSTimeInterval)duration
                    beginTime:(NSTimeInterval)beginTime;

@end

NS_ASSUME_NONNULL_END
