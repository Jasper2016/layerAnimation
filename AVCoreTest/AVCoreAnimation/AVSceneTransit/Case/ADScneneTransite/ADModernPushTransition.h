//
//  ADModernPushTransition.h
//  AppLibrary
//
//  Created by Martin Guillon on 23/09/13.
//
//

#import "ADDualTransition.h"

@interface ADModernPushTransition : ADDualTransition
- (id)initWithDuration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sourceRect:(CGRect)sourceRect;

@end
