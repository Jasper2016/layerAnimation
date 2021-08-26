//
//  AVFilterPhoto.h
//  TestVideoPreViewing
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "AVAlbum.h"

@interface AVFilterPhoto : NSObject
{

}

-(UIImage *)simpleFilter:(UIImage *)origalImage filterType:(AVImageFilterType)filterType blurRadius:(CGFloat)blurRadius;

-(UIImage *)filterGPUImage:(UIImage *)origalImage filterType:(AVImageFilterType)filterType blurRadius:(CGFloat)blurRadius;


-(UIImage *)filterGPUImage:(UIImage *)origalImage filterType:(AVImageFilterType)filterType;

@end
