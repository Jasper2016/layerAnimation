//
//  VCoreTransformFadeLayer.h
//  AVCoreTest
//
//  Created by gemin on 2017/7/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface VCoreTransformFadeLayer : CALayer


@property (nonatomic, strong) UIColor  *fillColor;


@property (nonatomic, strong) UIColor  *areaColor;


@property (nonatomic, strong) NSArray  <UIBezierPath *>  *paths;



@end
