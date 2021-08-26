//
//  AVDicKeyValueUnit.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVDicKeyValueUnit.h"

@implementation AVDicKeyValueUnit

#define IsEqualToKey(input, value)   (((input) == nil) || ([(input) isEqual:value]))

+(CGFloat)dicNSFloatValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(CGFloat)defaultValue
{
    if (dic && [dic objectForKey:key]) {
        
        NSString *value = [dic objectForKey:key];
        
        return [value floatValue];
    }else{
        return defaultValue;
    }
}

+(NSInteger)dicNSIntegerValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    if (dic && [dic objectForKey:key]) {
        
        NSString *value = [dic objectForKey:key];
        
        return [value integerValue];
    }else{
        return defaultValue;
    }
}

+(BOOL)IsDicKeyEqualToValue :(NSDictionary *)dic key:(NSString *)key inputValue:(NSString *)inputValue
{
    if (dic && [dic objectForKey:key]) {
        
        NSString *value = [dic objectForKey:key];
        
        return IsEqualToKey(value, inputValue);
    }else{
        return NO;
    }
}

+(NSInteger)isdicNSIntegerValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    if (dic && [dic objectForKey:key]) {
        
        NSString *value = [dic objectForKey:key];
        
        return [value integerValue];
    }else{
        return defaultValue;
    }
}


+(NSString *)dicNSStringValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSString *)defaultValue
{
    if (dic && [dic objectForKey:key]) {
        
        NSString *value = [dic objectForKey:key];
        
        return value;
    }else{
        return defaultValue;
    }
}

+(NSInteger )dicIntegerSeparatedValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSInteger )defaultValue
{
    if (dic && [dic objectForKey:key]) {
        
        return [[[[dic objectForKey:key] componentsSeparatedByString:@"|"] lastObject]integerValue];
    }else{
        return defaultValue;
    }
}

+(CGPoint )dicCGPointSeparatedValue:(NSDictionary *)dic key:(NSString *)key
{
    if (dic && [dic objectForKey:key]) {
        
        NSArray *itemlist = [[dic objectForKey:key] componentsSeparatedByString:@","];
        
        return CGPointMake([[itemlist objectAtIndex:0] floatValue], [[itemlist lastObject] floatValue]);
        
    }else{
        return CGPointMake(20, 20);
    }
}

+(CGRect)dicCGRectSeparatedValue:(NSDictionary *)dic key:(NSString *)key separate:(NSString *)separate
{
    NSArray * textArray= [[dic objectForKey:key] componentsSeparatedByString:separate];
    
    return CGRectMake([[textArray objectAtIndex:0] floatValue], [[textArray objectAtIndex:1] floatValue], [[textArray objectAtIndex:2] floatValue],  [[textArray objectAtIndex:3] floatValue]);
}

@end
