//
//  AVTimeLineLayer.m
//  AVCoreTest
//
//  Created by Netease on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AVTimeLineLayer.h"

#import "AVShapeBaseLayer.h"

#import "AVConstant.h"

#import "UIBezierPath+BasicShapes.h"

#import "AVTimeLineColorConstant.h"

#import "AVBasicLayer.h"

#define kPhotoRowLenth 15

@implementation AVTimeLineLayer

- (id)initWithCenter:(CGPoint)center
        vContentRect:(CGRect)vContentRect
                size:(CGSize)size
           withImage:(UIImage *)image
           borderDic:(AVBorderRrrowDicType)borderDic
{
    self = [self init];
    if (self) {
        
        self.frame =kPotoFullBoundRect;
        
        UIBezierPath *bezierPath = nil;
        
        CGRect phtoRect = CGRectZero;
        
        switch (borderDic) {
            case AVBorderRrrowDicUp:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicUp rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(18, 33,600, 600);
                
                self.anchorPoint = CGPointMake(0.5, 0);
                
                self.position = CGPointMake(center.x, center.y+kWithPointInterval);
                
                
                break;
            }
                
            case AVBorderRrrowDicRight:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicRight rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(18, 18,600, 600);
                
                self.anchorPoint = CGPointMake(1, 0.5);
                
                self.position = CGPointMake(center.x-kWithPointInterval, center.y);
                
                break;
            }
                
            case AVBorderRrrowDicBottom:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicBottom rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(18, 18,600, 600);
                
                self.anchorPoint = CGPointMake(0.5, 1);
                
                self.position = CGPointMake(center.x, center.y-kWithPointInterval);
                
                break;
            }
                
            case AVBorderRrrowDicLeft:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicLeft rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(33, 18,600, 600);
                
                self.anchorPoint = CGPointMake(0, 0.5);
                
                self.position = CGPointMake(center.x+kWithPointInterval, center.y);
                
                break;
            }
            case AVBorderRrrowDicNone:
            {
                bezierPath = [UIBezierPath squareShape:self.bounds];
                
                phtoRect = CGRectMake(24, 24,600, 600);
                
                self.anchorPoint = CGPointMake(0.5, 0.5);
                
                self.position = CGPointMake(center.x, center.y);
                break;
            }
            default:
                break;
        }
        
        
        AVShapeBaseLayer *photoBorderLayer = [[AVShapeBaseLayer  alloc] initWithFrame:self.bounds
                                                                           bezierPath:bezierPath
                                                                            fillColor: [UIColor whiteColor]
                                                                          strokeColor:kPhotoBorderColor
                                                                            lineWidth:3];
        
        
        [self addSublayer: photoBorderLayer];
        
        
        AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:phtoRect
                                                            vContentRect:vContentRect
                                                               withImage:image];
        
        
        [self addSublayer: currentLayer];
        
        
        self.radio = size.width/kPotoFullBoundRect.size.width;
        [self setValue:[NSNumber numberWithFloat:self.radio] forKeyPath:@"transform.scale"];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect withImage:(UIImage *)image borderDic:(AVBorderRrrowDicType)borderDic
{
    self = [self init];
    if (self) {
        
        self.frame =kPotoFullBoundRect;
        
        UIBezierPath *bezierPath = nil;
       
        CGRect phtoRect = CGRectZero;
        
        switch (borderDic) {
            case AVBorderRrrowDicUp:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicUp rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(18, 33,600, 600);
                
                self.anchorPoint = CGPointMake(0.5, 0);
                
                
                break;
            }
                
            case AVBorderRrrowDicRight:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicRight rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(18, 18,600, 600);
                
                self.anchorPoint = CGPointMake(1, 0.5);
                
                break;
            }
                
            case AVBorderRrrowDicBottom:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicBottom rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(18, 18,600, 600);
                
                self.anchorPoint = CGPointMake(0.5, 1);
                
                break;
            }
                
            case AVBorderRrrowDicLeft:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicLeft rowOffset:kPhotoRowLenth];
                
                phtoRect = CGRectMake(33, 18,600, 600);
                
                self.anchorPoint = CGPointMake(0, 0.5);
                
                break;
            }
            case AVBorderRrrowDicNone:
            {
                bezierPath = [UIBezierPath squareShape:self.bounds];
                
                phtoRect = CGRectMake(24, 24,600, 600);
                
                self.anchorPoint = CGPointMake(0.5, 0.5);
                break;
            }
            default:
                break;
        }
        
        
        AVShapeBaseLayer *photoBorderLayer = [[AVShapeBaseLayer  alloc] initWithFrame:self.bounds
                                                                           bezierPath:bezierPath
                                                                            fillColor: [UIColor whiteColor]
                                                                          strokeColor:kPhotoBorderColor
                                                                            lineWidth:3];
        
        
        [self addSublayer: photoBorderLayer];
        
        
        AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:phtoRect
                                                            vContentRect:vContentRect
                                                               withImage:image];
        
        
        [self addSublayer: currentLayer];
        
        
       self.radio =vBorderRect.size.width/kPotoFullBoundRect.size.width;
        
        [self setValue:[NSNumber numberWithFloat:self.radio] forKeyPath:@"transform.scale"];
        
    }
    return self;
}

@end
