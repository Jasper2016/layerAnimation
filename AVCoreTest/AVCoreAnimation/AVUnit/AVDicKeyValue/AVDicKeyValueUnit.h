//
//  AVDicKeyValueUnit.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface AVDicKeyValueUnit : NSObject

+(CGFloat)dicNSFloatValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(CGFloat)defaultValue;

+(NSInteger)dicNSIntegerValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSInteger)defaultValue;

+(NSString *)dicNSStringValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSString *)defaultValue;

+(BOOL)IsDicKeyEqualToValue :(NSDictionary *)dic key:(NSString *)key inputValue:(NSString *)inputValue;

+(NSInteger )dicIntegerSeparatedValue:(NSDictionary *)dic key:(NSString *)key defaultValue:(NSInteger )defaultValue;

+(CGPoint )dicCGPointSeparatedValue:(NSDictionary *)dic key:(NSString *)key;

+(CGRect  )dicCGRectSeparatedValue:(NSDictionary *)dic key:(NSString *)key separate:(NSString *)separate;

@end
