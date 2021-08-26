//
//  AVPlayTextLayer.h
//  TestSceneEffect
//
//  Created by mac on 15/4/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBasicTextLayer.h"

@interface AVPlayTextLayer : AVBasicTextLayer
{
    
}

@property(nonatomic,strong) NSString *text;

- (id)initWithFrame:(CGRect)frame attributeStringText:(NSMutableAttributedString *)attributeText;

- (id)initWithFrame:(CGRect)frame attributedText:(NSString *)text;


-(void)addAni:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime aniFactor:(NSInteger)aniFactor;

@end
