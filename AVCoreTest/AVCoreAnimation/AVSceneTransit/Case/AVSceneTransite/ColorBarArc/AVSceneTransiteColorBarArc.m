//
//  AVSceneTransiteColorBarArc.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransiteColorBarArc.h"

#import "GeometryGradientLayer.h"

#import "AVSceneAniEnumType.h"

#import "AVStaticFunc.h"

#import "AVCommonHeader.h"

#define startXOffset     100

#define twoShaperlength     60

#define threeShaperlength     50

#define colorBarShaperlength     200

#define fourShaperlength     (320+startXOffset+100)

@implementation AVSceneTransiteColorBarArc


+(CGPathRef) geometryStroke:(CALayer *)currentLayer upSlideLength: (CGFloat)slideLength
{
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    
    CGFloat upStartLength = startXOffset;
    
    CGFloat upSlideLength = slideLength;
    
    // Set the starting point of the shape.
    [startPath moveToPoint:CGPointMake(upStartLength, 0)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength ,0)];
    
    [startPath addLineToPoint:CGPointMake(upSlideLength, currentLayer.frame.size.height/2)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength, currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength, currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(0, currentLayer.frame.size.height/2)];
    
    [startPath closePath];
    
    return  startPath.CGPath;
    
}

+(CGPathRef) geometryColorBarStroke:(CALayer *)currentLayer upSlideLength: (CGFloat)slideLength
{
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    
    CGFloat upStartLength = startXOffset;
    
    CGFloat upSlideLength = slideLength;
    
    // Set the starting point of the shape.
    [startPath moveToPoint:CGPointMake(upStartLength, 0)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength ,0)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength , currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength, currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(0, currentLayer.frame.size.height/2)];
    
    [startPath closePath];
    
    return  startPath.CGPath;
    
}

+(void)ColorBarArc:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    switch (transiteFactor) {
        case AVAniXYRightToLeft:  //1.6s
        {
            [rootLayer addSublayer: nextLayer];
            
            CALayer *maskLayer = [CALayer layer];
            
            maskLayer.frame = currentLayer.bounds;
            
            maskLayer.anchorPoint = CGPointMake(0.0f, 0.5f);
            
            maskLayer.position=CGPointMake(currentLayer.frame.size.width, currentLayer.frame.size.height/2);
            
            maskLayer.backgroundColor  =[UIColor clearColor].CGColor;
            
            [nextLayer setMask: maskLayer];
            
            
            CAShapeLayer *geometryLayer1 = [CAShapeLayer layer];
            
            geometryLayer1.frame = CGRectMake(0, 0, startXOffset+twoShaperlength, currentLayer.frame.size.height);
            
            geometryLayer1.path = [self geometryStroke:currentLayer upSlideLength:twoShaperlength];
            
            geometryLayer1.fillColor = [[UIColor brownColor] colorWithAlphaComponent:0.5].CGColor;
            
            [rootLayer addSublayer: geometryLayer1];
            
            geometryLayer1.anchorPoint = CGPointMake(0.0f, 0.5f);
            
            geometryLayer1.position = maskLayer.position;
            
            
            CAShapeLayer *geometryLayer2 = [CAShapeLayer layer];
            
            geometryLayer2.frame =  CGRectMake(0, 0, startXOffset+twoShaperlength, currentLayer.frame.size.height);
            
            geometryLayer2.path = [self geometryStroke:currentLayer upSlideLength:twoShaperlength];
            
            geometryLayer2.fillColor = [UIColor whiteColor].CGColor;
            
            [maskLayer addSublayer: geometryLayer2];
            
            geometryLayer2.anchorPoint = CGPointMake(0.0f, 0.5f);
            
            geometryLayer2.position = CGPointMake(twoShaperlength, currentLayer.frame.size.height/2);
            
            
            GeometryGradientLayer *geometryLayer3 = [[GeometryGradientLayer alloc] initWithFrame: CGRectMake(0, 0, startXOffset+colorBarShaperlength, currentLayer.frame.size.height)];
            
            geometryLayer3.shapeLayer.path = [self geometryColorBarStroke:currentLayer upSlideLength:colorBarShaperlength];
            
            geometryLayer3.colorBarDirection = radientColorBarLeftToRight;
            
            geometryLayer3.colors = @[ (id)UIColorFromRGBAlpha(0xb45921, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xb31921, 0.8f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xb31921, 0.8f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xd67a51, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xd67a51, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                                       
                                       (id)UIColorFromRGBAlpha(0x4f8c91, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4f8c91, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xdc642f, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xdc642f, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4b6a7e, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4b6a7e, 1.0f).CGColor,
                                       
                                       (id)[[UIColor brownColor] colorWithAlphaComponent:1.0].CGColor,
                                       (id)[[UIColor brownColor] colorWithAlphaComponent:1.0].CGColor,
                                       (id)UIColorFromRGBAlpha(0x4b6a4e, 0.9f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4b6a4e, 0.9f).CGColor,
                                       (id)[[UIColor grayColor] colorWithAlphaComponent:0.9].CGColor,
                                       (id)[[UIColor grayColor] colorWithAlphaComponent:0.9].CGColor,
                                       
                                       (id)UIColorFromRGBAlpha(0x4f8c91, 0.8f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4f8c91, 0.9f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xdc642f, 0.9f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xdc642f, 0.8f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4b6a7e, 0.87f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x4b6a7e, 0.87f).CGColor,
                                       
                                       (id)UIColorFromRGBAlpha(0xb31921, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xb31921, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xd67a51, 0.9f).CGColor,
                                       (id)UIColorFromRGBAlpha(0xd67a51, 0.9f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                                       (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                                       
                                       ];
            
            NSMutableArray *locations =[[NSMutableArray alloc] init];
            for (NSInteger index = 1; index < 17; index++) {
                
                NSNumber *item1 = [NSNumber numberWithFloat:0.01f*5*index];
                
                NSNumber *item2 = [NSNumber numberWithFloat:0.01f*5*index];
                
                [locations addObject: item1]; [locations addObject:item2];
            }
            
            geometryLayer3.locations = locations;
            
            [geometryLayer1 addSublayer: geometryLayer3];
            
            geometryLayer3.anchorPoint = CGPointMake(0.0f, 0.5);
            
            geometryLayer3.position = CGPointMake(2*twoShaperlength, currentLayer.position.y);
            
            
            // continute color bar
            NSArray *colorList = @[
                                   (id)[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor,
                                   (id)[[UIColor orangeColor] colorWithAlphaComponent:0.3].CGColor,
                                   (id)[[UIColor redColor] colorWithAlphaComponent:0.2].CGColor,
                                   (id)[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor,
                                   (id)[[UIColor redColor] colorWithAlphaComponent:0.4].CGColor,
                                   ];
            
            
            for (NSInteger index=0; index< 3; index++) {
                
                CAShapeLayer *geometrySubLayer = [CAShapeLayer layer];
                
                geometrySubLayer.frame = CGRectMake(0, 0, startXOffset+threeShaperlength, currentLayer.frame.size.height);
                
                CGFloat length = threeShaperlength;
                
                if (index==2) {
                    length = threeShaperlength+30;
                }
                
                geometrySubLayer.path = [self geometryStroke:currentLayer upSlideLength:length];
                
                geometrySubLayer.fillColor =(__bridge CGColorRef)([colorList objectAtIndex:index]);
                
                [geometryLayer1 addSublayer: geometrySubLayer];
                
                geometrySubLayer.anchorPoint = CGPointMake(0.0f, 0.5);
                
                geometrySubLayer.position =CGPointMake(geometryLayer3.position.x+120+(index*threeShaperlength), geometryLayer3.position.y);
            }
            
            
            CAShapeLayer *geometryLayer5 = [CAShapeLayer layer];
            
            geometryLayer5.frame = currentLayer.bounds;
            
            geometryLayer5.path = [self geometryColorBarStroke:currentLayer upSlideLength:fourShaperlength];
            
            geometryLayer5.fillColor = [UIColor whiteColor].CGColor;
            
            [maskLayer addSublayer: geometryLayer5];
            
            geometryLayer5.anchorPoint = CGPointMake(0.0f, 0.5);
            
            geometryLayer5.position =CGPointMake(geometryLayer3.position.x+150+(3*threeShaperlength), geometryLayer3.position.y);
            
            
            for (NSInteger index=3; index< 5; index++) {
                
                CAShapeLayer *geometrySubLayer = [CAShapeLayer layer];
                
                geometrySubLayer.frame = CGRectMake(0, 0, startXOffset+threeShaperlength, currentLayer.frame.size.height);
                
                CGFloat length = twoShaperlength;
                
                if (index ==4) {
                    length = 90;
                }
                
                geometrySubLayer.path = [self geometryStroke:currentLayer upSlideLength:length];
                
                geometrySubLayer.fillColor =(__bridge CGColorRef)([colorList objectAtIndex:index]);
                
                [geometryLayer1 addSublayer: geometrySubLayer];
                
                geometrySubLayer.anchorPoint = CGPointMake(0.0f, 0.5);
                
                //geometrySubLayer.position =CGPointMake(0, geometryLayer3.position.y);
                
                geometrySubLayer.position =CGPointMake(geometryLayer3.position.x+150+((index)*threeShaperlength), geometryLayer3.position.y);
            }
            
            CGPoint nextPosition = CGPointMake(-660, currentLayer.frame.size.height/2);

                
            CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue: nextPosition];
            
            [geometryLayer1 addAnimation: moveAni forKey:@"moveAni"];
            
            [maskLayer addAnimation: moveAni forKey:@"moveAni"];

            break;
        }
            
        case AVAniXYLeftToRight:
        {
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            break;
        }
        default:
            break;
    }
}

@end
