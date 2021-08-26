//
//  ADFlipTransition.h
//  AppLibrary
//
//  Created by Patrick Nollet on 14/03/11.
//  Copyright 2011 Applidium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADDualTransition.h"

@interface ADFlipTransition : ADDualTransition

- (id)initWithDuration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor sourceRect:(CGRect)sourceRect;

@end
