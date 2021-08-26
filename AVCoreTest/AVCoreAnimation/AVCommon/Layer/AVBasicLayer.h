//
//  AVBasicLayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/1/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
@interface AVBasicLayer : CAEAGLLayer
{
    
}

@property(nonatomic, assign) NSInteger tag;

@property(nonatomic,strong) CALayer *bgLayer;

@property(nonatomic,strong) CALayer *maskLayer;

@property(nonatomic,strong) CALayer *contentLayer;

@property(nonatomic,strong) CALayer *blurLayer;

@property(nonatomic,strong) CALayer *blurMaskLayer;

@property(nonatomic, assign) BOOL isborderHas;

@property(nonatomic, strong) UIColor *exBorderColor;

@property(nonatomic,strong) AVBasicLayer *photoLayer;


- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect withImage:(UIImage *)image;

- (id)initWithFullFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect withImage:(UIImage *)image;

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect origalImage:(UIImage *)origalImage blueImage:(UIImage *)blueImage;

- (id)initWithFrame:(CGRect)vBorderRect vBorderImage:(UIImage *)vBorderImage vContentRect:(CGRect)vContentRect vContentImage:(UIImage *)vContentImage isBorderFront:(BOOL)isBorderFront ;

- (id)initBeforBlueWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect origalImage:(UIImage *)origalImage blueImage:(UIImage *)blueImage;

- (id)initWithFrame:(CGRect)vBorderRect borderColor:(UIColor *)borderColor borderWith:(CGFloat)borderWith withImage:(UIImage *)image;

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef;

- (id)initWithFrame:(CGRect)frame;

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image;

- (void)initImage:(UIImage *)image;


- (id)initWithblueLayerBefore:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect origalImage:(UIImage *)origalImage blueImage:(UIImage *)blueImage;


-(void)disposerRelese;

@end
