//
//  AVBasicLayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/1/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVBasicLayer.h"

@implementation AVBasicLayer

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        if (colorRef) {
            
            self.backgroundColor = colorRef;
        }
        
        self.masksToBounds = YES;
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        self.masksToBounds = YES;
        
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
        
        self.contentLayer.frame = self.bounds;
        
        self.contentLayer.contents = (id)image.CGImage;
        
        self.masksToBounds = YES;
        
        
    }
    return self;
}

- (id)initWithblueLayerBefore:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect origalImage:(UIImage *)origalImage blueImage:(UIImage *)blueImage
{
    
    self = [self init];
    if (self) {
        
        self.frame = vBorderRect;
        
        self.contentLayer.frame = vContentRect;
        
        if (origalImage) {
            
            self.contentLayer.contents = (id)origalImage.CGImage;
        }
    
        
        if (blueImage) {
            
            self.photoLayer.frame = vBorderRect;
                
            self.photoLayer.contentLayer.frame  = vContentRect;
            
            self.photoLayer.contentLayer.contents = (id)blueImage.CGImage;
            
            [self addSublayer: self.photoLayer];
        }

        
        self.masksToBounds = YES;
    }
    return self;
}

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect origalImage:(UIImage *)origalImage blueImage:(UIImage *)blueImage
{
    
    self = [self init];
    if (self) {
        
        self.frame = vBorderRect;
        
        self.bgLayer.frame = self.bounds;
        
        self.blurLayer.frame = vContentRect;
        
        if (blueImage) {
            
            self.blurLayer.contents = (id)blueImage.CGImage;
        }
        
        [self.bgLayer addSublayer: self.blurLayer];
        
        self.contentLayer.frame = self.blurLayer.bounds;
        
        if (origalImage) {
            
            self.contentLayer.contents = (id)origalImage.CGImage;
        }
        
        [self.blurLayer addSublayer: self.contentLayer];
        
        self.masksToBounds = YES;
    }
    return self;
}

- (id)initWithFrame:(CGRect)vBorderRect borderColor:(UIColor *)borderColor borderWith:(CGFloat)borderWith withImage:(UIImage *)image
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = vBorderRect;
        
        self.contentLayer.frame = CGRectMake(borderWith, borderWith, self.frame.size.width-(2*borderWith), self.frame.size.height-(2*borderWith));
        
        self.contentLayer.masksToBounds = YES;
        
        self.contentLayer.contents = (id)image.CGImage;
        
        self.backgroundColor = borderColor.CGColor;
        
        self.masksToBounds = YES;
    }
    return self;
}


- (id)initWithFullFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect withImage:(UIImage *)image
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = vBorderRect;
        
        
        self.blurLayer.frame = CGRectMake((vBorderRect.size.width- vContentRect.size.width)/2,
                                           (vBorderRect.size.height- vContentRect.size.height)/2, vContentRect.size.width, vContentRect.size.height);
        
        if (image) {
            
            self.contentLayer.frame = self.blurLayer.bounds;
            
            self.blurLayer.backgroundColor = [UIColor redColor].CGColor;

            self.contentLayer.contents = (id)image.CGImage;
            
            [self.blurLayer addSublayer: self.contentLayer];
            
            self.blurLayer.masksToBounds =YES;
        }
        
        self.backgroundColor= [UIColor blackColor].CGColor;
        
        self.masksToBounds = YES;
        
        self.contentsGravity = kCAGravityResizeAspectFill;
    }
    return self;
}

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect withImage:(UIImage *)image
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = vBorderRect;
        
        
        self.contentLayer.frame = vContentRect;
        
        if (image) {
            
            self.contentLayer.contents = (id)image.CGImage;
        }
        
        self.masksToBounds = YES;
        
        self.contentsGravity = kCAGravityResizeAspectFill;
    }
    return self;
}

- (id)initBeforBlueWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect origalImage:(UIImage *)origalImage blueImage:(UIImage *)blueImage
{
    
    self = [self init];
    if (self) {
        
        self.frame = vBorderRect;
        
        self.contentLayer.frame = vContentRect;
        self.contentLayer.contents = (id)origalImage.CGImage;
        
//        self.blurLayer.frame = self.contentLayer.bounds;
        
        self.photoLayer.frame = vBorderRect;
        self.photoLayer.contentLayer.frame  = vContentRect;
        self.photoLayer.contentLayer.contents = (id)blueImage.CGImage;
        
        [self.contentLayer addSublayer: self.photoLayer];
    
        self.masksToBounds = YES;
    }
    return self;
}


- (id)initWithFrame:(CGRect)vBorderRect vBorderImage:(UIImage *)vBorderImage vContentRect:(CGRect)vContentRect vContentImage:(UIImage *)vContentImage isBorderFront:(BOOL)isBorderFront
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = vBorderRect;
        
        self.photoLayer.frame = vContentRect;
        
        if (vContentImage) {
            
            self.photoLayer.contentLayer.frame  = self.photoLayer.bounds;
            
            self.photoLayer.contentLayer.contents = (id)vContentImage.CGImage;
            
            [self addSublayer: self.photoLayer];
        }
        
        if (vBorderImage) {
            
            self.bgLayer.contents = (id)vBorderImage.CGImage;
            
            if (isBorderFront) {
                [self addSublayer: self.bgLayer];
            }else{
                [self insertSublayer:self.bgLayer below:self.photoLayer];
            }
            
        }
        
        self.masksToBounds = YES;
        
        
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.contentLayer.frame = self.bounds;
}

- (void)initImage:(UIImage *)image
{
    
    self.contentLayer.frame = self.bounds;
    
    self.contentLayer.contents = (id)image.CGImage;
}


-(CALayer *)contentLayer
{
    if (!_contentLayer) {
        
        _contentLayer =[[CALayer alloc] init];
        
        _contentLayer.contentsGravity=kCAGravityResizeAspectFill;
        
        // _contentLayer.anchorPoint = CGPointMake(0.5, 0.5);
        
        [self addSublayer: _contentLayer];
    }
    
    return _contentLayer;
}

-(CALayer *)blurLayer
{
    if (!_blurLayer) {
        
        _blurLayer =[[CALayer alloc] init];
        
        _blurLayer.contentsGravity=kCAGravityResizeAspectFill;
        
        [self addSublayer: _blurLayer];
    }
    
    return _blurLayer;
}

-(CALayer *)bgLayer
{
    if (!_bgLayer) {
        
        _bgLayer =[[CALayer alloc] init];
        
        _bgLayer.frame =self.bounds;
        
        // [self insertSublayer:_bgLayer below:self.contentLayer];
    }
    
    return _bgLayer;
}

-(CALayer *)blurMaskLayer
{
    if (!_blurMaskLayer) {
        
        _blurMaskLayer =[[CALayer alloc] init];
        
        _blurMaskLayer.frame =self.bounds;
        
        _blurMaskLayer.backgroundColor = [UIColor blackColor].CGColor;

    }
    
    return _blurMaskLayer;
}

-(AVBasicLayer *)photoLayer
{
    if (!_photoLayer) {
        
        _photoLayer =[[AVBasicLayer alloc] init];
        
        _photoLayer.masksToBounds = YES;
        
        //  _bgLayer.frame =self.bounds;
        
        // [self insertSublayer:_bgLayer below:self.contentLayer];
    }
    
    return _photoLayer;
}

-(CALayer *)maskLayer
{
    if (!_maskLayer) {
        
        _maskLayer =[[CALayer alloc] init];
        
        _maskLayer.frame =self.bounds;
        
        _maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        
//        [self setMask: _maskLayer];
    }
    
    return _maskLayer;
}


-(void)setExBorderColor:(UIColor *)exBorderColor
{
    if (exBorderColor) {
        
        _exBorderColor = exBorderColor;
        
        self.borderColor = _exBorderColor.CGColor;
        
        self.borderWidth =1.0f;
    }
}

-(void)disposerRelese
{
    [self.contentLayer removeAllAnimations];
    
    //self.contentLayer.contents = nil ;
    
    [self.contentLayer removeFromSuperlayer];
    
    
    [self removeAllAnimations];
    
    //self.contents = nil;
    
    [self removeFromSuperlayer];
}

#pragma mark - NSCopying

//- (id)copyWithZone:(NSZone *)zone {
//    AVBasicLayer *serializer = [[[self class] allocWithZone:zone] init];
//    
//    serializer.tag = self.tag;
//    
//    serializer.bgLayer = self.bgLayer;
//    
//    serializer.maskLayer = self.maskLayer;
//    
//    serializer.contentLayer = self.contentLayer;
//    
//    serializer.isborderHas = self.isborderHas;
//    
//    serializer.exBorderColor = self.exBorderColor;
//    
//    return serializer;
//}

@end
