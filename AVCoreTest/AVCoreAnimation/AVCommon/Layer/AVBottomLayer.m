//
//  AVBottomLayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/7/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBottomLayer.h"

@implementation AVBottomLayer

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        if (colorRef) {
            
            self.backgroundColor = colorRef;
        }
    
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.anchorPoint = CGPointMake(0.5, 0.5);
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        self.contents = (id)image.CGImage;
        
        self.masksToBounds = YES;
        
        self.contentsGravity = kCAGravityResizeAspectFill;
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame contendImage:(UIImage *)contendImage beforeColor:(UIColor *)beforeColor
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        self.contents = (id)contendImage.CGImage;
        
        self.beforeLayer.backgroundColor = beforeColor.CGColor;
        
        [self addSublayer: self.beforeLayer];
        
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame beforeColor:(UIColor *)beforeColor bgColor:(UIColor *)bgColor
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        self.backgroundColor = bgColor.CGColor;
        
        self.beforeLayer.backgroundColor = beforeColor.CGColor;
        
        [self addSublayer: self.beforeLayer];
        
        
    }
    return self;
}

-(CALayer *)beforeLayer
{
    if (!_beforeLayer) {
        
        _beforeLayer =[[CALayer alloc] init];
        
        _beforeLayer.frame =self.bounds;
        
        [self addSublayer: _beforeLayer];

    }
    
    return _beforeLayer;
}

-(CALayer *)maskLayer
{
    if (!_maskLayer) {
        
        _maskLayer =[[CALayer alloc] init];
        
        _maskLayer.frame =self.bounds;
        
        _maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        
        [self setMask: _maskLayer];
    }
    
    return _maskLayer;
}


-(void)openShadowEffct:(AVLayerShadowDicType)dicType
{
    self.masksToBounds = NO;
    
    self.shadowColor = [UIColor blackColor].CGColor;
    
    switch (dicType) {
        case AVLayerShadowDicUp:
        {
            self.shadowOffset = CGSizeMake(0.0f, -16.0f);
            
            break;
        }
            
        case AVLayerShadowDicLeft:
        {
             self.shadowOffset = CGSizeMake(-16.0f, 0.0f);
            break;
        }
            
        case AVLayerShadowDicRight:
        {
              self.shadowOffset = CGSizeMake(16.0f, 0.0f);
            break;
        }
            
        case AVLayerShadowDicDown:
        {
            self.shadowOffset = CGSizeMake(0.0f, 16.0f);
            
            break;
        }
            
        default:
            break;
    }
    
    
    self.shadowOpacity = 0.4f;
}

@end
