//
//  AVChartColorLayer.h
//  AVCoreTest
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import <UIKit/UIKit.h>

@interface AVChartColorLayer : CAShapeLayer
{
    
}

@property (nonatomic, assign) CGFloat startAngle;

@property (nonatomic, strong) NSArray *colorList;

- (id)initWithFrame:(CGRect)frame colorList:(NSArray *)colorList;
@end
