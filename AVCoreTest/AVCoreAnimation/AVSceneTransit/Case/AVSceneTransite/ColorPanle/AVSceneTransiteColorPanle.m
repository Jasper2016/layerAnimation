//
//  AVSceneColorPale.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//  duration 2.0f

#import "AVSceneTransiteColorPanle.h"

#import "UIImage+Extensions.h"

#import "AVCommonCaseHeader.h"

#define bridColorCount       4

#define birdTag     10

@implementation AVSceneTransiteColorPanle

+(void)sceneColorPale:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor  currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer
{
    [currentLayer.superlayer insertSublayer:nextLayer below:currentLayer];
    
    CGFloat birdLayerWith = currentLayer.frame.size.width/bridColorCount;
    
    CGRect bridLayerFrame = currentLayer.bounds;
    bridLayerFrame.size.width = birdLayerWith;
    
    NSArray *birdColors = @[
                            (id)[[UIColor blueColor] colorWithAlphaComponent:0.5].CGColor,
                            (id)[[UIColor cyanColor] colorWithAlphaComponent:0.5].CGColor,
                            (id)[[UIColor brownColor] colorWithAlphaComponent:0.5].CGColor,
                            (id)[[UIColor purpleColor] colorWithAlphaComponent:0.5].CGColor
                            ];
    
    CGImageRef iamge =  (__bridge CGImageRef)currentLayer.contentLayer.contents;
    
    if (!iamge) {
        NSLog(@"getCroppedImage fail image =nil");
        
    }
    
    UIImage *oriImage = [UIImage imageWithCGImage: iamge];
    
    CGFloat factorX = oriImage.size.width/currentLayer.frame.size.width;
    
    CGFloat cropwidth = birdLayerWith*factorX;
    
    CGFloat factorY = oriImage.size.height/currentLayer.frame.size.height;
    
    CGFloat cropheight = currentLayer.frame.size.height*factorY;
    
    CGFloat birdSlideDuration = 0.25;
    
    int homelayerIndwx = (int)[currentLayer.sublayers count];
    
    for (int index = 0; index<bridColorCount; index++) {
        
        AVBasicLayer *birdLayer =[AVBasicLayer layer];
        
        CGRect bridFrame = bridLayerFrame;
        
        bridFrame.origin.x +=index*birdLayerWith;
        
        birdLayer.frame = bridFrame;
        
        birdLayer.contentLayer.backgroundColor = (__bridge CGColorRef)([birdColors objectAtIndex:index]);
        
        [currentLayer.superlayer insertSublayer: birdLayer atIndex:(bridColorCount-index + homelayerIndwx)];
        
        birdLayer.tag = index+birdTag;
        
        //set crop frame
        CGFloat origx = index*cropwidth;
        
        CGRect cropFrame = CGRectMake(origx, 0, cropwidth, cropheight);
        
        NSValue *cropFrameValue = [NSValue valueWithCGRect: cropFrame];
        
        CGFloat offsetY = ((index)%2==0)?birdLayer.position.y+birdLayer.frame.size.height:birdLayer.position.y-birdLayer.frame.size.height;
        
        CGPoint beforeCenter = CGPointMake(birdLayer.position.x, offsetY);
        
        CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.25 withBeginTime:kBTimeOffset(beginTime,0.15*index) fromValue:beforeCenter toValue:birdLayer.position];
        moveCenter1.delegate = self;
        
        [moveCenter1 setValue:cropFrameValue forKey:@"cropFrameValue"];
        
        [moveCenter1 setValue:birdLayer forKey:@"birdLayer"];
        
        [moveCenter1 setValue:oriImage forKey:@"currentLayerImage"];
        
        [birdLayer addAnimation:moveCenter1 forKey:@"moveCenter1"];
        
        NSArray *keyTime ;  NSArray *keyValues;
        
        keyTime = @[[NSNumber numberWithFloat:birdSlideDuration*0],
                    [NSNumber numberWithFloat:birdSlideDuration*1],
                    [NSNumber numberWithFloat:birdSlideDuration*2],
                    [NSNumber numberWithFloat:birdSlideDuration*3],
                    [NSNumber numberWithFloat:birdSlideDuration*4],
                    ];
        CGFloat birdBTOffest ;
        
        switch (transiteFactor) {
            case AVSceneTransiteColorPanleOverRightToLeft:
            {
                
                keyValues = @[[NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x-(0*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x-(1*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x-(2*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x-(3*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x-(4*birdLayerWith), birdLayer.position.y)],
                              ];
                
                birdBTOffest = birdSlideDuration*(bridColorCount-index-1)+duration/2;
                
                break;
            }
                
            case AVSceneTransiteColorPanleOverLeftToRight:
            {
                
                keyValues = @[[NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x+(0*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x+(1*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x+(2*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x+(3*birdLayerWith), birdLayer.position.y)],
                              [NSValue valueWithCGPoint: CGPointMake(birdLayer.position.x+(4*birdLayerWith), birdLayer.position.y)],
                              ];
                birdBTOffest = birdSlideDuration*(index)+duration/2;
                
                break;
            }
                
            case AVSceneTransiteColorPanleOverxxxx:
            {
                break;
            }
            default:
                break;
        }
        
        CAKeyframeAnimation *slideMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration/2 withBeginTime:kBTimeOffset(beginTime,birdBTOffest) propertyName:kAVBasicAniPosition values:keyValues keyTimes:keyTime];
        slideMoveAni.fillMode=kCAFillModeForwards;
        slideMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        [birdLayer addAnimation:slideMoveAni forKey:@"slideMoveAni"];
        
    }
    
    CABasicAnimation *curentLayeropacityAni = [[AVBasicRouteAnimate defaultInstance] opacityClose:0.1 withBeginTime:kBTimeOffset(beginTime, duration/2)];
    
    [currentLayer.contentLayer addAnimation:curentLayeropacityAni forKey:@"curentLayeropacityAni"];
    
}

+ (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    if (anim) {
        //可以判断词组动画是否结束
        if([anim valueForKey:@"cropFrameValue"] !=nil) {
            
            NSLog(@"animationDidStart");
            
            NSValue *corp = [anim valueForKey:@"cropFrameValue"];
            
            CGRect cropFrame = [corp CGRectValue];
            
            ///AVBasicLayer *nextLayer = [anim valueForKey:@"nextLayer"] ;
            
            AVBasicLayer *birdLayer = [anim valueForKey:@"birdLayer"] ;
            
            UIImage *oriImage = [anim valueForKey:@"currentLayerImage"] ;
            
            birdLayer.contents = (id)[oriImage imageAtRefRect:cropFrame];
            
 
        }
    }
    
}

@end
