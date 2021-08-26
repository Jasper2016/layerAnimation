//
//  ADScaleTransition.h
//  ADTransitionController
//
//  Created by Pierre Felgines on 28/05/13.
//  Copyright (c) 2013 Applidium. All rights reserved.
//

#import "ADDualTransition.h"

@interface ADScaleTransition : ADDualTransition
- (id)initWithDuration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sourceRect:(CGRect)sourceRect;

@end
