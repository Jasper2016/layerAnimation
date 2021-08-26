//
//  ShowManyPhotoLayer.m
//  AVCoreTest
//
//  Created by yinshengqi on 2017/11/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ShowManyPhotoLayer.h"

@implementation ShowManyPhotoLayer

- (instancetype)initWithFrame:(CGRect)frame
                    beginTime:(CFTimeInterval)beginTime
                    ImageList:(NSArray *)imageList
                  moveDirList:(NSArray *)dirList
                beginTimeList:(NSArray *)beginTimeList
                 durationList:(NSArray *)durationList
{
    self = [super init];
    
    if (self) {
        
        self.frame = frame;
        
        self.backgroundColor = [UIColor whiteColor].CGColor;
        
        self.masksToBounds = YES;
        
        for (NSInteger index = 0; index < imageList.count; index++) {
            
            UIImage *photoImage = imageList[index];
            
            AVAniMustMoveDicype dir = [dirList[index] intValue];
            
            CGFloat intervalTime = [beginTimeList[index] floatValue];
            
            CGFloat duration = [durationList[index] floatValue];
            
            CALayer *photoLayer = [CALayer layer];
            photoLayer.frame = CGRectMake(0, 0, frame.size.width-8, frame.size.height-8);
            photoLayer.position = CGPointMake(frame.size.width/2, frame.size.height/2);
            photoLayer.contents = (id)photoImage.CGImage;
            photoLayer.masksToBounds = YES;
            [self addSublayer:photoLayer];
            
            if (index != 0) {
                
                photoLayer.opacity = 0;
                CAAnimationGroup *groupAni = [self movePositionAni:dir beginTime:beginTime+intervalTime duration:duration];
                [photoLayer addAnimation:groupAni forKey:@"groupAni"];
            }
            
        }
    }
    
    return self;
    
}

- (CAAnimationGroup *)movePositionAni:(AVAniMustMoveDicype)dir
                            beginTime:(CGFloat)beginTime
                             duration:(CGFloat)duration{
    
    CGPoint fromPoint = CGPointZero;
    CGPoint toPoint = CGPointZero;
    CGFloat layerWidth = self.frame.size.width;
    CGFloat layerHeight = self.frame.size.height;
    
    switch (dir) {
        case AVAniMoveMustLeftToRight:
        {
            fromPoint = CGPointMake(-layerWidth/2, layerHeight/2);
            toPoint = CGPointMake(layerWidth/2, layerHeight/2);
            break;
        }
        case AVAniMoveMustRightToLeft:
        {
            
            fromPoint = CGPointMake(layerWidth*1.5, layerHeight/2);
            toPoint = CGPointMake(layerWidth/2, layerHeight/2);
            break;
        }
        case AVAniMoveMustTopToBottom:
        {
            fromPoint = CGPointMake(layerWidth/2, -layerHeight/2);
            toPoint = CGPointMake(layerWidth/2, layerHeight/2);
            break;
        }
        case AVAniMoveMustBottomToTop:
        {
            fromPoint = CGPointMake(layerWidth/2, layerHeight*1.5);
            toPoint = CGPointMake(layerWidth/2, layerHeight/2);
            break;
        }
        default:
            break;
    }
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration withBeginTime:0 fromValue:fromPoint toValue:toPoint propertyName:@"position"];
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"opacity" values:@[@(0),@(1),@(1)] keyTimes:@[@(0.0),@(0.3),@(1)]];
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,opacityAni]];
    
    
//    CABasicAnimation *positionAni = [CABasicAnimation animationWithKeyPath:@"position"];
//    positionAni.removedOnCompletion = NO;
//    positionAni.autoreverses = NO;
//    positionAni.fillMode = kCAFillModeBoth;
//    positionAni.fromValue = [NSValue valueWithCGPoint:fromPoint];
//    positionAni.toValue = [NSValue valueWithCGPoint:toPoint];
//    positionAni.beginTime = beginTime;
//    positionAni.duration = duration;
//    positionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    return groupAni;
}


@end
