//
//  AVTimeLineLayer.h
//  AVCoreTest
//
//  Created by Netease on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "AVTimeLineTypedefEnum.h"

@interface AVTimeLineLayer : CALayer
{

}


@property(nonatomic, assign) CGFloat radio;

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect withImage:(UIImage *)image borderDic:(AVBorderRrrowDicType)borderDic;

- (id)initWithCenter:(CGPoint)center
        vContentRect:(CGRect)vContentRect
                size:(CGSize)size
           withImage:(UIImage *)image
           borderDic:(AVBorderRrrowDicType)borderDic;

@end
