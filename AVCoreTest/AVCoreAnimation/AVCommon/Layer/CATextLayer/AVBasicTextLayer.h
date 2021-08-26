//
//  AVBasicTextLayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "VCAnimateTextModel.h"
#import "VCEditTextManager.h"

@interface AVBasicTextLayer : CATextLayer
{

}

@property(nonatomic,strong) CALayer *maskLayer;

- (id)initTextLayerWithFrame:(CGRect)frame
                        text:(id)text
                   textModel:(VCAnimateTextModel *)textModel;

- (id)initWithFrame:(CGRect)frame intText:(NSString *)intText textFont:(UIFont *)textFont textColor:(UIColor *)textColor;

- (void)configShadowColor:(UIColor *)color shadowOpacity:(float)opacity shadowOffset:(CGSize)offset;

-(void)openTextDefultShadow;
@end
