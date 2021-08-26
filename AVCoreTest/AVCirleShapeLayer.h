//
//  AVCirleShapeLayer.h
//  AVCoreTest
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

@interface AVCirleShapeLayer : CAShapeLayer
{

}

- (id)initWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor;

@property (nonatomic, assign) CGFloat startAngle;
@end
