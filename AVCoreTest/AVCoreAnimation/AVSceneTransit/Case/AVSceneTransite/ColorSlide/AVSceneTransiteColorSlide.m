//
//  AVSceneTransiteColorSlide.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransiteColorSlide.h"

#import "AVSceneTransitEnumType.h"

#import "AVCommonHeader.h"

#import "AVStaticFunc.h"

@implementation AVSceneTransiteColorSlide


+(void)ColorSlide:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    
   // Fixmac
    switch (transiteFactor) {
//        case AVSTColorSlideTriangleLeftToRight:
//        {
//            break;
//        }
//            
//        case AVSTColorSlideTriangleBottomToTop:
//        {
//            break;
//        }
            
        case AVSTColorSlideColorClothRightTopToLeftBottom:  //duration : 1.4
        case AVSTColorSlideTriangleLeftToRight:
            case AVSTColorSlideTriangleBottomToTop:
        {
            CAShapeLayer  *maskLayer = [CAShapeLayer layer];
            
            //maskLayer.backgroundColor = [UIColor redColor].CGColor;
            
            CGFloat arcSidelength = currentLayer.frame.size.width*2;
            
            // arcSidelength = 100;
            
            maskLayer.frame = CGRectMake(0, 0, arcSidelength, arcSidelength);
            
            maskLayer.fillColor = [UIColor whiteColor].CGColor;
            
            UIBezierPath *arcPath = [UIBezierPath bezierPath];
            // Set the starting point of the shape.
            [arcPath moveToPoint:CGPointMake(0, 0)];
            // Draw the lines
            [arcPath addLineToPoint:CGPointMake(arcSidelength ,0)];
            [arcPath addLineToPoint:CGPointMake(arcSidelength, arcSidelength)];
            [arcPath addLineToPoint:CGPointMake(0,0)];
            [arcPath closePath];
            
            maskLayer.path = arcPath.CGPath;
            
            maskLayer.position = CGPointMake(currentLayer.frame.size.width, 0);
            
            CGPoint arcToCenter = CGPointMake(0, currentLayer.frame.size.height);
            
            CABasicAnimation *moveMaskAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration-0.2 withBeginTime:beginTime toValue: arcToCenter];
            
            // maske effect
            CAGradientLayer  *maskEffectLayer = [CAGradientLayer layer];
            
            CGFloat colorSidelength = currentLayer.frame.size.width*1.7;

            maskEffectLayer.frame =CGRectMake(0, 0,colorSidelength,  currentLayer.frame.size.height*1.7);
            
            // 设置颜色
            maskEffectLayer.colors = @[(id)[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor,
                                       (id)UIColorFromRGB(0xb31921).CGColor,
                                       (id)UIColorFromRGB(0xb31921).CGColor,
                                       (id)UIColorFromRGB(0xd67a51).CGColor,
                                       (id)UIColorFromRGB(0xd67a51).CGColor,
                                       (id)UIColorFromRGB(0x664e66).CGColor,
                                       (id)UIColorFromRGB(0x664e66).CGColor,
                                       ];
            
            maskEffectLayer.locations = @[[NSNumber numberWithFloat:0.30f],
                                          [NSNumber numberWithFloat:0.31f],
                                          
                                          [NSNumber numberWithFloat:0.54f],
                                          [NSNumber numberWithFloat:0.55f],
                                          
                                          [NSNumber numberWithFloat:0.85f],
                                          [NSNumber numberWithFloat:0.86f],
                                          
                                          ];
            
            maskEffectLayer.anchorPoint = CGPointMake(0.5, 1.0);
            
            CATransform3D rotate1 = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);  // Rotate 45.z
            
            maskEffectLayer.transform = rotate1;
            
            maskEffectLayer.position = CGPointMake(currentLayer.frame.size.width, 0);
            
            CGPoint nextPosition = CGPointMake(-(maskEffectLayer.frame.size.width/2), currentLayer.frame.size.height+(maskEffectLayer.frame.size.height/3));
            
            CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue: nextPosition];
    
          //  dispatch_async_main_after(kCATransactionBTime(beginTime), ^{
                [rootLayer addSublayer: nextLayer];
                
                [maskLayer addAnimation: moveMaskAni forKey:@"moveAni"];
                
                //[rootLayer addSublayer: maskLayer];
                [nextLayer setMask:maskLayer];
                
                [maskEffectLayer addAnimation: moveAni forKey:@"moveAni"];
                [rootLayer addSublayer: maskEffectLayer];
         //   });
            
            break;
        }
            
        case AVSTColorSlideColorClothLeftTopToRightBottom:  //duration : 0.8
        {
            CAShapeLayer  *maskLayer = [CAShapeLayer layer];
            
            //maskLayer.backgroundColor = [UIColor redColor].CGColor;
            
            CGFloat arcSidelength = currentLayer.frame.size.width*2;
            
            // arcSidelength = 100;
            
            maskLayer.frame = CGRectMake(0, 0, arcSidelength, arcSidelength);
            
            maskLayer.fillColor = [UIColor whiteColor].CGColor;
            
            UIBezierPath *arcPath = [UIBezierPath bezierPath];
            // Set the starting point of the shape.
            [arcPath moveToPoint:CGPointMake(0, 0)];
            // Draw the lines
            [arcPath addLineToPoint:CGPointMake(arcSidelength ,0)];
            [arcPath addLineToPoint:CGPointMake(arcSidelength, arcSidelength)];
            [arcPath addLineToPoint:CGPointMake(0,0)];
            [arcPath closePath];
            
            maskLayer.path = arcPath.CGPath;
            
            maskLayer.position = CGPointMake(currentLayer.frame.size.width, 0);
            
            CGPoint arcToCenter = CGPointMake(0, currentLayer.frame.size.height);
            
            CABasicAnimation *moveMaskAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration-0.2 withBeginTime:beginTime toValue: arcToCenter];
            
            // maske effect
            CAGradientLayer  *maskEffectLayer = [CAGradientLayer layer];
            
            CGFloat colorSidelength = currentLayer.frame.size.width*1.6;
            
            maskEffectLayer.frame =CGRectMake(0, 0,colorSidelength,  currentLayer.frame.size.height*1.7);
            
            // 设置颜色
            maskEffectLayer.colors = @[(id)[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor,
                                       (id)UIColorFromRGB(0xb31921).CGColor,
                                       (id)UIColorFromRGB(0xb31921).CGColor,
                                       (id)UIColorFromRGB(0xd67a51).CGColor,
                                       (id)UIColorFromRGB(0xd67a51).CGColor,
                                       (id)UIColorFromRGB(0x664e66).CGColor,
                                       (id)UIColorFromRGB(0x664e66).CGColor,
                                       ];
            
            maskEffectLayer.locations = @[[NSNumber numberWithFloat:0.30f],
                                          [NSNumber numberWithFloat:0.31f],
                                          
                                          [NSNumber numberWithFloat:0.54f],
                                          [NSNumber numberWithFloat:0.55f],
                                          
                                          [NSNumber numberWithFloat:0.85f],
                                          [NSNumber numberWithFloat:0.86f],
                                          
                                          ];
            
            maskEffectLayer.anchorPoint = CGPointMake(0.5, 1.0);
            
            CATransform3D rotate1 = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);  // Rotate 45.z
            
            maskEffectLayer.transform = rotate1;
            
            maskEffectLayer.position = CGPointMake(currentLayer.frame.size.width, 0);
            
            CGPoint nextPosition = CGPointMake(-(maskEffectLayer.frame.size.height/2), currentLayer.frame.size.height+30);
            
            CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue: nextPosition];
            
            //  dispatch_async_main_after(kCATransactionBTime(beginTime), ^{
            [rootLayer addSublayer: nextLayer];
            
            [maskLayer addAnimation: moveMaskAni forKey:@"moveAni"];
            
            //[rootLayer addSublayer: maskLayer];
            [nextLayer setMask:maskLayer];
            
            [maskEffectLayer addAnimation: moveAni forKey:@"moveAni"];
            [rootLayer addSublayer: maskEffectLayer];
            //   });
            
            break;
        }

        default:
            break;
    }
}

@end
