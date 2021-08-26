//
//  AVSTransiteDTO.h
//  TestVideoPreViewing
//
//  Created by mac on 15/2/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVSceneTransitEnumType.h"

@interface AVSTransiteDTO : NSObject
{

}

@property(nonatomic, assign)  AVSceneTransiteAniType STAniType;


@property(nonatomic, assign)  NSInteger              STFactor;

@property(nonatomic, assign)  CFTimeInterval         STFullDuration;

@property(nonatomic, assign)  CFTimeInterval         STAniDuration;

@property(nonatomic, assign)  CFTimeInterval         beginTime;         //动画开始timer

@property(nonatomic, strong)  NSDictionary          *STParameters;


@end
