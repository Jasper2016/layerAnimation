//
//  AVConfig.h
//
//  Created by 邢雪威 on 15-1-21.
//  Copyright (c) 2015年 ___My_Company___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVConfig : NSObject

+(AVConfig *)            currentConfig;

@property (strong) NSUserDefaults             *defaults;

@property (strong) NSNumber    *videoHight;

@property (strong) NSNumber    *videoWidth;

@property (strong) NSNumber    *sceneLayerDuration;  //每个场景持续时间

@property (strong) NSNumber    *sceneTransitDuration;  //每个转场持续时间

+ (void)addObserver:(id)observer selector:(SEL)sel forSetting:(NSString *)settingName;

+ (void)removeObserver:(id)observer forSetting:(NSString *)settingName;

@end
