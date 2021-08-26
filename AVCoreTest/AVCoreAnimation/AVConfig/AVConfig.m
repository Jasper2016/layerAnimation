//
//  AVConfig.m
//
//  Created by 邢雪威 on 15-1-21.
//  Copyright (c) 2015年 ___My_Company___. All rights reserved.
//

#import "AVConfig.h"
#import <objc/runtime.h>

//arc 支持performSelector:
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation AVConfig

- (void)registerDefaultSettings
{
    //记录默认设置的值
    self.videoHight = [NSNumber numberWithFloat:360];
    self.videoWidth = [NSNumber numberWithFloat:640];
    self.sceneLayerDuration = [NSNumber numberWithFloat:3.0];
    self.sceneTransitDuration = [NSNumber numberWithFloat:0.8];
}

- (void)dealloc
{
    [self unRegisterObserverForSettings];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self registerDefaultSettings];
        [self initSettingFromUserDefaults];
        [self registerObserverForSettings];
    }
    return self;
}


+ (void)addObserver:(id)observer selector:(SEL)sel forSetting:(NSString *)settingName
{
    [[NSNotificationCenter defaultCenter] addObserver:observer
                                             selector:sel
                                                 name:[self notificationForProperty:settingName]
                                               object:nil];
}

+ (void)removeObserver:(id)observer forSetting:(NSString *)settingName
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                    name:[self notificationForProperty:settingName]
                                                  object:nil];
}

+ (AVConfig *)currentConfig
{
    static dispatch_once_t once;
    static AVConfig * __singleton__ = nil;
    dispatch_once( &once, ^{ __singleton__ = [[AVConfig alloc] init]; } );
    return __singleton__;
}

#pragma mark -
#pragma mark engine

//初始化
- (void)initSettingFromUserDefaults
{
    NSArray *propertyNameArr = [self getPropertiesNameList];
    
    for (NSString *propertyName in propertyNameArr)
    {
        NSString *key = [[self class] keyForProperty:propertyName];
        id value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (value)
        {
            NSString *selStr = [self getterToSetter:propertyName];
            SEL sel = NSSelectorFromString(selStr);
            if ([self respondsToSelector:sel])
            {
                SuppressPerformSelectorLeakWarning
                ([self performSelector:sel withObject:value]);
            }
        }
    }
}

- (NSArray *)getPropertiesNameList
{
    NSMutableArray *nameArr = [[NSMutableArray alloc] init];
    
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i< outCount; i++)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc]
                                  initWithCString:property_getName(property)
                                  encoding:NSUTF8StringEncoding];
        if ([propertyName length]) [nameArr addObject:propertyName];
    }
    free(properties);
    
    return nameArr;
}

//注册监听者
- (void)registerObserverForSettings
{
    NSArray *propertyNameArr = [self getPropertiesNameList];
    
    for (NSString *propertyName in propertyNameArr)
    {
        [self addObserver:self
               forKeyPath:propertyName
                  options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                  context:NULL];
    }
}

//注销监听者
- (void)unRegisterObserverForSettings
{
    NSArray *propertyNameArr = [self getPropertiesNameList];
    for (NSString *properName in propertyNameArr)
    {
        [self removeObserver:self forKeyPath:properName];
    }
}

//key
+ (NSString *)keyForProperty:(NSString *)propertyName
{
    return [NSString stringWithFormat:@"config.%@",propertyName];
}

//notificationName
+ (NSString *)notificationForProperty:(NSString *)propertyName
{
    return [NSString stringWithFormat:@"SETTING_KEY_%@_CHANGE_MESSAGE",propertyName];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    id _oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    id _newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    if (![_newValue isEqual:_oldValue])
    {
        //有变动
        NSString *cacheKey = [AVConfig keyForProperty:keyPath];
        NSString *notifiKey = [AVConfig notificationForProperty:keyPath];
        
        if (_newValue && ![_newValue isKindOfClass:[NSNull class]])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_newValue
                                                      forKey:cacheKey];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:cacheKey];
        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:notifiKey
                                                            object:nil];
    }
}

- (NSString *)getterToSetter:(NSString *)param {
    
    NSRange firstChar, rest;
    firstChar.location  = 0;
    firstChar.length    = 1;
    rest.location       = 1;
    rest.length         = param.length - 1;
    
    return [NSString stringWithFormat:@"set%@%@:",
            [[param substringWithRange:firstChar] uppercaseString],
            [param substringWithRange:rest]];
}

@end
