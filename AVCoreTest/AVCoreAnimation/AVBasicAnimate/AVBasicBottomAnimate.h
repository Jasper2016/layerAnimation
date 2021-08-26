//
//  AVBasicBottomAnimate.h
//  LTStackView
//
//  Created by mac on 15/1/14.
//  Copyright (c) 2015年 ltebean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "AVBasicAnimate.h"

@interface AVBasicBottomAnimate : NSObject
{
    
}

+ (AVBasicBottomAnimate *)defaultInstance; 

-(CABasicAnimation *)opacityUnit:(AVSetBasciMode)mode duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CFTimeInterval)fromValue   toValue:(CFTimeInterval)toValue;

-(CABasicAnimation *)scaleXYUnit:(AVSetBasciMode)mode duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CFTimeInterval)fromValue toValue:(CFTimeInterval)toValue;

-(CABasicAnimation *)moveXYCenterUnit:(AVSetBasciMode)mode duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue;

-(CABasicAnimation *)rotationUnit:(AVSetBasciMode)mode duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CATransform3D)fromValue toValue:(CATransform3D)toValue;

-(CABasicAnimation *)transformUnit:(AVSetBasciMode)mode duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CATransform3D)fromValue toValue:(CATransform3D)toValue;

/*********      custom       ********/
-(CABasicAnimation *)customCGFloatUnit:(AVSetBasciMode)mode  duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue propertyName:(NSString *)propertyName;

-(CABasicAnimation *)customBasicUnit:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(id)fromValue toValue:(id)toValue propertyName:(NSString *)propertyName;

-(CABasicAnimation *)customCGPointUnit:(AVSetBasciMode)mode  duration:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime fromValue:(CGPoint)fromValue toValue:(CGPoint)toValue propertyName:(NSString *)propertyName;

-(CAKeyframeAnimation *)customKeyframeUnit:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime propertyName:(NSString *)propertyName path:(CGMutablePathRef)path;

-(CAKeyframeAnimation *)customKeyframeUnit:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime propertyName:(NSString *)propertyName values:(NSArray *)values keyTimes:(NSArray *)keyTimes;


@end
