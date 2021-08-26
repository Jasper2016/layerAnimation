//
//  AVBottomLayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef enum {
    
    AVLayerShadowDicUp   =0,
    
    AVLayerShadowDicLeft,
    
    AVLayerShadowDicRight,
    
    AVLayerShadowDicDown,
    
} AVLayerShadowDicType;

@interface AVBottomLayer : CALayer
{

}

@property (nonatomic, assign) NSInteger tag;

@property(nonatomic,strong) CALayer *beforeLayer;

@property(nonatomic,strong) CALayer *maskLayer;

- (id)initWithFrame:(CGRect)frame;

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image;

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef;

- (id)initWithFrame:(CGRect)frame contendImage:(UIImage *)contendImage beforeColor:(UIColor *)beforeColor;

- (id)initWithFrame:(CGRect)frame beforeColor:(UIColor *)beforeColor bgColor:(UIColor *)bgColor;

-(void)openShadowEffct:(AVLayerShadowDicType)dicType;

@end
