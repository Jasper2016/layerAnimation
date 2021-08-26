//
//  MCCTextLayer.m
//  AVCoreTest
//
//  Created by gemin on 2018/10/14.
//  Copyright © 2018 robin.wang. All rights reserved.
//

#import "MCCTextLayer.h"
#import "VCAnimateTextModel.h"

@implementation MCCTextLayer
- (void)configureTextLayer:(VCAnimateTextModel *)textModel
{
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:self.bounds
                                                                              text:textModel.textContent
                                                                         textModel:textModel];
    self.textLayer = textLayer;
    
    [self addSublayer:self.textLayer];
}

- (void)textAnimationDuration:(NSTimeInterval)duration beginTime:(NSTimeInterval)beginTime
{
//    CABasicAnimation *apacityAni = [[AVBasicRouteAnimate alloc] scaleTo:duration
//                                                          withBeginTime:beginTime
//                                                              fromValue:0.0f
//                                                                toValue:1.0f];
//
//    [self.textLayer addAnimation:apacityAni forKey:nil];
    
}
@end
