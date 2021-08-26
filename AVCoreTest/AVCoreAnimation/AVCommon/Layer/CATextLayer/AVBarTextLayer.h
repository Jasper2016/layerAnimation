//
//  AVBarTextLayer.h
//  TestSceneEffect
//
//  Created by mac on 15/4/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBasicLayer.h"

#import "AVBasicTextLayer.h"

@interface AVBarTextLayer : AVBasicLayer
{

}

@property(nonatomic,strong) AVBasicTextLayer *textLayer;

- (id)initWithFrameOlny:(CGRect)frame textFont:(UIFont *)font fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textSting:(NSString *)textSting bgImage:(UIImage *)bgImage;

- (id)initWithFrame:(CGRect)frame textFont:(UIFont *)font fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textSting:(NSString *)textSting
 bgImage:(UIImage *)bgImage;

- (id)initWithFrame:(CGRect)frame textFont:(UIFont *)font fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textSting:(NSString *)textSting
 bgColor:(UIColor *)bgcolor;
@end
