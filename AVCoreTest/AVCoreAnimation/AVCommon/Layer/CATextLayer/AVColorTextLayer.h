//
//  AVColorTextLayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//


#import "AVBasicLayer.h"

typedef enum {
    AVColorTextForContend   =0,
    AVColorTextForTitle  =1,
    AVColorTextForCarryTitle,
    
} AVColorTextSizeType;

@interface AVColorTextLayer : CATextLayer
{

}

@property(nonatomic,strong) NSString *text;

@property(nonatomic,strong) CALayer *maskLayer;

- (id)initWithFrame:(CGRect)frame;

- (id)initWithFrame:(CGRect)frame attributedText:(NSString *)text;

- (id)initWithFrame:(CGRect)frame attributedText:(NSString *)text withType:(AVColorTextSizeType)sizeType;


@end
