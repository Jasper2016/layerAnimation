//
//  AVTimeLineTextLayer.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/3/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AVTimeLineTextLayer.h"
#import "UIBezierPath+BasicShapes.h"
#import "AVShapeBaseLayer.h"
#import "AVBasicTextLayer.h"
#import "AVConstant.h"
#import "AVTimeLineColorConstant.h"
#import "NSString+AVCore.h"

#define kTextRowLenth 8

@implementation AVTimeLineTextLayer

- (instancetype)initWithFrame:(CGRect)borderRect
                     position:(CGPoint)position
                     withText:(NSString *)text
                         font:(UIFont *)font
                     interval:(CGFloat)interval
                    borderDic:(AVBorderRrrowDicType)borderDic{
    self = [super init];
    if (self) {
        
        self.frame = borderRect;
        UIBezierPath *bezierPath = nil;
        CGRect textLayerRect = CGRectZero;
        CGRect textRect = CGRectMake(interval, interval, self.bounds.size.width-(2*interval), self.bounds.size.height-(2*interval));
        
        switch (borderDic) {
            case AVBorderRrrowDicUp:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicUp rowOffset:kTextRowLenth];
                self.anchorPoint = CGPointMake(0.5, 0);
                textLayerRect = CGRectMake(textRect.origin.x-6, textRect.origin.y+12, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x, position.y+kWithPointInterval);
                break;
            }
                
            case AVBorderRrrowDicRight:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicRight rowOffset:kTextRowLenth];
                
                self.anchorPoint = CGPointMake(1, 0.5);
                textLayerRect = CGRectMake(textRect.origin.x-3, textRect.origin.y, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x-kWithPointInterval, position.y);
                break;
            }
                
            case AVBorderRrrowDicBottom:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicBottom rowOffset:kTextRowLenth];
                
                self.anchorPoint = CGPointMake(0.5, 1);
                textLayerRect = CGRectMake(textRect.origin.x-6, textRect.origin.y, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x, position.y-kWithPointInterval);
                break;
            }
                
            case AVBorderRrrowDicLeft:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicLeft rowOffset:kTextRowLenth];
                
                self.anchorPoint = CGPointMake(0, 0.5);
                textLayerRect = CGRectMake(textRect.origin.x+4, textRect.origin.y, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x+kWithPointInterval, position.y);
                break;
            }
            default:
                break;
        }
        
        AVShapeBaseLayer *borderLayer = [[AVShapeBaseLayer  alloc] initWithFrame:self.bounds
                                                                           bezierPath:bezierPath
                                                                            fillColor: [UIColor whiteColor]
                                                                          strokeColor:kPhotoBorderColor
                                                                            lineWidth:1];
        
        [self addSublayer:borderLayer];
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:textLayerRect intText:text textFont:font textColor:kPhotoBorderColor];
        [self addSublayer:textLayer];
        
    }
    return self;
}

- (instancetype)initWithPosition:(CGPoint)position
                            size:(CGSize)size
                        withText:(NSString *)text
                            font:(UIFont *)font
                  isDefluatWidth:(BOOL)isDefluatWidth
                        interval:(CGFloat)interval
                       borderDic:(AVBorderRrrowDicType)borderDic{
    self = [super init];
    if (self) {
        CGSize broadSize = [text textBroadSizeWithFont:font maxSize:size interval:interval isDefluatWidth:isDefluatWidth isDefaultHeight:NO];
        self.frame = CGRectMake(0, 0, broadSize.width, broadSize.height);
        UIBezierPath *bezierPath = nil;
        CGRect textLayerRect = CGRectZero;
        CGRect textRect = CGRectMake(interval, interval, self.bounds.size.width-(2*interval), self.bounds.size.height-(2*interval));
        switch (borderDic) {
            case AVBorderRrrowDicUp:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicUp rowOffset:kTextRowLenth];
                self.anchorPoint = CGPointMake(0.5, 0);
                textLayerRect = CGRectMake(textRect.origin.x-6, textRect.origin.y+8, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x, position.y+kWithPointInterval);
                break;
            }
                
            case AVBorderRrrowDicRight:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicRight rowOffset:kTextRowLenth];
                
                self.anchorPoint = CGPointMake(1, 0.5);
                textLayerRect = CGRectMake(textRect.origin.x-3, textRect.origin.y, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x-kWithPointInterval, position.y);
                break;
            }
                
            case AVBorderRrrowDicBottom:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicBottom rowOffset:kTextRowLenth];
                
                self.anchorPoint = CGPointMake(0.5, 1);
                textLayerRect = CGRectMake(textRect.origin.x-6, textRect.origin.y, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x, position.y-kWithPointInterval);
                break;
            }
                
            case AVBorderRrrowDicLeft:
            {
                bezierPath = [UIBezierPath chatPopoBorderStroke:self.bounds dirMode:AVBorderRrrowDicLeft rowOffset:kTextRowLenth];
                
                self.anchorPoint = CGPointMake(0, 0.5);
                textLayerRect = CGRectMake(textRect.origin.x+4, textRect.origin.y, textRect.size.width, textRect.size.height);
                self.position = CGPointMake(position.x+kWithPointInterval, position.y);
                break;
            }
            default:
                break;
        }
        
        AVShapeBaseLayer *borderLayer = [[AVShapeBaseLayer  alloc] initWithFrame:self.bounds
                                                                      bezierPath:bezierPath
                                                                       fillColor: [UIColor whiteColor]
                                                                     strokeColor:kPhotoBorderColor
                                                                       lineWidth:1];
        
        [self addSublayer:borderLayer];
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:textLayerRect intText:text textFont:font textColor:kPhotoBorderColor];
        //        textLayer.backgroundColor = [UIColor redColor].CGColor;
        [self addSublayer:textLayer];
        
    }
    return self;
}

@end
