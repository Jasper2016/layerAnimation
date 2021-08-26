//
//  ShowManyPhotoLayer.h
//  AVCoreTest
//
//  Created by yinshengqi on 2017/11/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "AVSceneAniEnumType.h"
#import "AVBasicRouteAnimate.h"

@interface ShowManyPhotoLayer : CALayer

- (instancetype)initWithFrame:(CGRect)frame
                    beginTime:(CFTimeInterval)beginTime
                    ImageList:(NSArray *)imageList
                  moveDirList:(NSArray *)dirList
                beginTimeList:(NSArray *)beginTimeList
                 durationList:(NSArray *)durationList;

@property (nonatomic, strong) CALayer *maskLayer;

@end
