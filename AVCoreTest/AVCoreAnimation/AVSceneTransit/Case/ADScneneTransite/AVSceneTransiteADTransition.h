//
//  AVSceneTransiteADTransition.h
//  RadialGradientLayerSample
//
//  Created by mac on 15/2/4.
//  Copyright (c) 2015年 Cocoapps. All rights reserved.
//

#import "AVCommonHeader.h"

#import "ADTransition.h"

@interface AVSceneTransiteADTransition : NSObject
{

}

+ (void)transitionfromView:(CALayer *)layerOut toView:(CALayer *)layerIn withTransition:(ADTransition *)transition;

@end
