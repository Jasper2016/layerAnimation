//
//  AVAniDTO.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVSceneDTO.h"

#import "AVSTransiteDTO.h"

#import "AVAlbumDTO.h"

@interface AVAniDTO : NSObject
{

}

@property(nonatomic, assign)  AVThemeStyle   themeStyle;  //主题

@property(nonatomic, assign)  AVWeddingSeries series; //主题下面的系列

@property(nonatomic, assign)  AVSeriesAniMode seriesAniMode; //每个系列动画模式

@property(nonatomic, strong)  NSDictionary  *seriParameters; //每个系列动画模式参数

@property(nonatomic, assign)  CFTimeInterval seriBeginTime;         //动画开始timer

@property(nonatomic, strong) AVSceneDTO     *sceneDTO; //镜头动画DTO

@property(nonatomic, strong) AVSTransiteDTO *transiteDTO; //过渡到当前镜头的过场动画

@property(nonatomic, strong) AVAlbumDTO    *albumDTO; //图片相关


@end
