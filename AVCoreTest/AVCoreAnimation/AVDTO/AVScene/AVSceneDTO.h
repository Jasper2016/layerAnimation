//
//  AVSceneDTO.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/1.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

#import "AVSceneAniEnumType.h"

#import "AVTheme.h"

@interface AVSceneDTO : NSObject
{

}

@property(nonatomic, assign)  AVSceneAniType aniType;           //镜头动画类型

@property(nonatomic, assign)  CFTimeInterval fullDuration;      //动画持续时间

@property(nonatomic, assign)  CFTimeInterval aniDuration;       //可视动画持续时间

@property(nonatomic, assign)  CFTimeInterval beginTime;         //动画开始timer

@property(nonatomic, assign)  NSInteger      factor;            // 动画 因数

@property(nonatomic, strong)  NSDictionary   *parameters;       //动画 参数


// add art layer
@property(nonatomic, assign)  BOOL            isHasArt;  // 是否在此镜头有素材层

@property(nonatomic, assign)  NSInteger       artAniType;  //素材的东西类型

@property(nonatomic, assign)  NSInteger      artFactor;   //素材动画的因数

@property(nonatomic, strong)  NSDictionary   *artParameters;  //素材动画参数

@property(nonatomic, assign)  CFTimeInterval  artBeginTime; // 默认情况下 art 到动画 和 镜头动画同时触发, 当前 镜头开始时间的偏移值

@property(nonatomic, assign)  CFTimeInterval artDuration;


@end
