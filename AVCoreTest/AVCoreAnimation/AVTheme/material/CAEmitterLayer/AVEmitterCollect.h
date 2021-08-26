//
//  AVEmitterCollect.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVBasicLayer.h"

@interface AVEmitterCollect : NSObject

-(CAEmitterLayer *)petalEmitter:(CGRect)frame cellContents:(NSString *)contents;

-(CAEmitterLayer *)petalEmitter:(CGRect)frame cellImagePathList:(NSArray *)cellImagePathList;

@end
