//
//  AVTextFontLayer.m
//  AVCoreTest
//
//  Created by 姚冬润 on 2018/10/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AVTextFontLayer.h"

@implementation AVTextFontLayer

- (id)initTextLayerWithFrame:(CGRect)frame
                        text:(id)text
                   textModel:(VCAnimateTextModel *)textModel
{
    self = [self init];
    if (self) {
        self.frame = frame;
        
        self.masksToBounds = NO;
        
        self.textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:self.bounds
                                                                     text:text
                                                                textModel:textModel];
        
        [self addSublayer: self.textLayer];
        
    }
    return self;
}


@end
