//
//  ADSlideTransition.h
//  ADTransitionController
//
//  Created by Pierre Felgines on 30/05/13.
//  Copyright (c) 2013 Applidium. All rights reserved.
//

#import "ADDualTransition.h"

@interface ADSlideTransition : ADDualTransition

- (id)initWithDuration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sourceRect:(CGRect)sourceRect;
@end
