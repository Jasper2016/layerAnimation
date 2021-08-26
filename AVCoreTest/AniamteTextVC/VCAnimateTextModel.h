//
//  VCAnimateTextModel.h
//  VCore
//
//  Created by gemin on 2017/8/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VCAnimateTextModel : NSObject

@property (nonatomic, copy) NSString *textContent; //字幕内容（包含标题）

@property (nonatomic, copy) NSString *textFontName;//字幕的字体名字

@property (nonatomic, strong) UIColor *textFontColor;//字幕颜色

@property (nonatomic, assign) CGFloat textFontSize;//字幕大小

@end
