//
//  MCAudioTextDTO.m
//  MyTest
//
//  Created by xwxing on 2018/9/12.
//  Copyright © 2018年 x. All rights reserved.
//

#import "MCAudioTextDTO.h"

@implementation MCAudioTextDTO

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

- (void)encodeFromDic:(NSDictionary *)dic
{
    [self setValuesForKeysWithDictionary:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
