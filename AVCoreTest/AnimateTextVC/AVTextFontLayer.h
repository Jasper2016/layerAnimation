//
//  AVTextFontLayer.h
//  AVCoreTest
//
//  Created by 姚冬润 on 2018/10/14.
//  Copyright © 2018年 mac. All rights reserved.
//


#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "AVBasicTextLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVTextFontLayer : CALayer
{
    
}

@property(nonatomic,strong) AVBasicTextLayer *textLayer;

- (id)initTextLayerWithFrame:(CGRect)frame
                        text:(id)text
                   textModel:(VCAnimateTextModel *)textModel;


@end

NS_ASSUME_NONNULL_END
