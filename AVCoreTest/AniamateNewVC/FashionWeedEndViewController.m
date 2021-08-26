//
//  FashionWeedEndViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/8/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FashionWeedEndViewController.h"

#import "AVBasicLayer.h"

#import "AVBasicTextLayer.h"

#import "AVTimeLineTextLayer.h"

#import "AVPlayTextLayer.h"

#import "AVShapeBaseLayer.h"

#import "AVTimeLineLayer.h"

#import "AVTimeLineColorConstant.h"

#import "AVBasicGradientLayer.h"

#import "AVFilterPhoto.h"

#import "LineMaskLayer.h"

#import "FaceDetectManager.h"

#import "AVRectUnit.h"

#import "AVSceneTransitEnumType.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

#import "ThrindLibHeader.h"

#import "UIBezierPath+BasicShapes.h"

#import "AVStaticFunc.h"

#import "AVRectUnit.h"

#import "CAMediaTimingFunction+AdditionalEquations.h"

#import "CAMultiColorLayer.h"

#import "AVAniScaleSlowBasic.h"

#define kMaskHeight     (kAVWindowHeight/2)*3

#define kMoveOffset     200

#define klineMoveOffset 100

//typedef NS_ENUM(NSUInteger, AVSTDirection) {
//    AVTransitionRightToLeft=0,
//    AVTransitionLeftToRight,
//    AVTransitionTopToBottom,
//    AVTransitionBottomToTop,
//};

#define kLineWidth 1*([UIScreen mainScreen].scale)

@interface FashionWeedEndViewController ()

@end

@implementation FashionWeedEndViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self AVTransiteFashionWeedEndWaveLeftToRight];
//    [self AVTransiteFashionWeedEndWaveRightToLeft];
//    [self AVTransiteFashionWeedEndWaveTopToBottom];
//    [self AVTransiteFashionWeedEndWaveBottomToTop];
    [self AVTransiteFashionWeedEndHorcalCloseCenterToBoth2];
 //   [self AVTransiteFashionWeedEndVerticalCloseCenterToBoth2];
}

- (void)AVTransiteFashionWeedEndWaveRightToLeft{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    //
    //    CGFloat duration = 4;//整个动画时间
    //
    CGFloat moveDuration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"bg2.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    UIImage *originalImage = [UIImage imageNamed:@"1.png"];
    
    UIImage *blurImage = [[AVFilterPhoto alloc] filterGPUImage:originalImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:blurImage];
    
    [homeLayer addSublayer:nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    //场景动画
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.2 fromScaleValue:1];
        [nextLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    //转场动画
    {
        
        [self transLineLeftToRightWithLayer:nextLayer
                                    moveDir:AVTransitionRightToLeft
                                   duration:moveDuration
                                  beginTime:beginTime];
    }
    
}

- (void)AVTransiteFashionWeedEndWaveTopToBottom{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    //
    //    CGFloat duration = 4;//整个动画时间
    //
    CGFloat moveDuration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"bg2.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    UIImage *originalImage = [UIImage imageNamed:@"1.png"];
    
    UIImage *blurImage = [[AVFilterPhoto alloc] filterGPUImage:originalImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:blurImage];
    
    [homeLayer addSublayer:nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    //场景动画
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.2 fromScaleValue:1];
        [nextLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    //转场动画
    {
        
        [self transLineLeftToRightWithLayer:nextLayer
                                    moveDir:AVTransitionTopToBottom
                                   duration:moveDuration
                                  beginTime:beginTime];
    }
    
    

}

- (void)AVTransiteFashionWeedEndWaveBottomToTop{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    //
    //    CGFloat duration = 4;//整个动画时间
    //
    CGFloat moveDuration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"bg2.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    UIImage *originalImage = [UIImage imageNamed:@"1.png"];
    
    UIImage *blurImage = [[AVFilterPhoto alloc] filterGPUImage:originalImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:blurImage];
    
    [homeLayer addSublayer:nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    //场景动画
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.2 fromScaleValue:1];
        [nextLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    //转场动画
    {
        
        [self transLineLeftToRightWithLayer:nextLayer
                                    moveDir:AVTransitionBottomToTop
                                   duration:moveDuration
                                  beginTime:beginTime];
    }
    

}



//线从左边到右边（过程有旋转）

- (void)AVTransiteFashionWeedEndWaveLeftToRight{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
//
    CGFloat duration = 2;//整个动画时间
//    
    CGFloat moveDuration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"bg2.png"]];
    
    [homeLayer addSublayer: currentLayer];

    
    UIImage *originalImage = [UIImage imageNamed:@"1.png"];
    
    UIImage *blurImage = [[AVFilterPhoto alloc] filterGPUImage:originalImage
                                                           filterType:AVImageFilterBlackWhite
                                                           blurRadius:20];
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:blurImage];

    [homeLayer addSublayer:nextLayer];
    
    
    nextLayer.mask = nextLayer.maskLayer;
    
    //动画
    {
        
        nextLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth+2*klineMoveOffset, kAVWindowHeight+2*klineMoveOffset);
        nextLayer.maskLayer.anchorPoint = CGPointMake(1, 0.5);
        
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(0, 0, kAVWindowWidth+2*klineMoveOffset, kAVWindowHeight+2*klineMoveOffset);
        lineLayer.anchorPoint = CGPointMake(1, 0.5);
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.shouldRasterize = YES;
        [nextLayer addSublayer:lineLayer];
        
        CAAnimationGroup *groupAni = [self lineFourDirctionAniWithMoveDir:AVTransitionLeftToRight
                                                                 duration:duration
                                                                beginTime:beginTime];
        [nextLayer.maskLayer addAnimation:groupAni forKey:@"groupAni"];
        [lineLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    
}

//线的四个方向动画
- (CAAnimationGroup *)lineFourDirctionAniWithMoveDir:(NSInteger)dir
                                            duration:(NSTimeInterval)duration
                                           beginTime:(NSTimeInterval)beginTime{
    
    CGPoint onePoint = CGPointZero;
    CGPoint twoPoint = CGPointZero;
    CGPoint threePoint = CGPointZero;
    CGPoint xPoint = CGPointZero;
    CGPoint fourPoint = CGPointZero;
    CGFloat oneTrans = 0.0;
    CGFloat twoTrans = 0.0;
    CGFloat threeTrans = 0.0;
    CGFloat fiveTrans = 0.0;
    switch (dir) {
        case AVTransitionRightToLeft:
        {
            onePoint = CGPointMake(kAVWindowWidth+20, kAVWindowHeight/2);
            twoPoint = CGPointMake(260, kAVWindowHeight/2);
            xPoint = CGPointMake(220, kAVWindowHeight/2);
            threePoint = CGPointMake(80, kAVWindowHeight/2);
            fourPoint = CGPointMake(-20, kAVWindowHeight/2);
            oneTrans = DEGREES_TO_RADIANS(0);
            twoTrans = DEGREES_TO_RADIANS(-6);
            threeTrans = DEGREES_TO_RADIANS(5);
            fiveTrans = DEGREES_TO_RADIANS(-10);
            break;
        }
        case AVTransitionLeftToRight:
        {
            onePoint = CGPointMake(-20, kAVWindowHeight/2);
            twoPoint = CGPointMake(340, kAVWindowHeight/2);
            xPoint = CGPointMake(380, kAVWindowHeight/2);
            threePoint = CGPointMake(520, kAVWindowHeight/2);
            fourPoint = CGPointMake(kAVWindowWidth+20, kAVWindowHeight/2);
            oneTrans = DEGREES_TO_RADIANS(0);
            twoTrans = DEGREES_TO_RADIANS(6);
            threeTrans = DEGREES_TO_RADIANS(-5);
            fiveTrans = DEGREES_TO_RADIANS(10);
            break;
        }
        case AVTransitionTopToBottom:
        {
            onePoint = CGPointMake(kAVWindowWidth/2, -20);
            twoPoint = CGPointMake(kAVWindowWidth/2, 340);
            xPoint = CGPointMake(kAVWindowWidth/2, 380);
            threePoint = CGPointMake(kAVWindowWidth/2, 520);
            fourPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+20);
            oneTrans = DEGREES_TO_RADIANS(0);
            twoTrans = DEGREES_TO_RADIANS(-6);
            threeTrans = DEGREES_TO_RADIANS(5);
            fiveTrans = DEGREES_TO_RADIANS(-10);
            break;
        }
        case AVTransitionBottomToTop:
        {
            onePoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+20);
            twoPoint = CGPointMake(kAVWindowWidth/2, 260);
            xPoint = CGPointMake(kAVWindowWidth/2, 220);
            threePoint = CGPointMake(kAVWindowWidth/2, 80);
            fourPoint = CGPointMake(kAVWindowWidth/2, -20);
            oneTrans = DEGREES_TO_RADIANS(0);
            twoTrans = DEGREES_TO_RADIANS(6);
            threeTrans = DEGREES_TO_RADIANS(-5);
            fiveTrans = DEGREES_TO_RADIANS(10);
            break;
        }
        default:
            break;
    }
    
    NSArray *transValues = @[
                             [NSNumber numberWithFloat:oneTrans],
                             [NSNumber numberWithFloat:twoTrans],
                             [NSNumber numberWithFloat:threeTrans],
                             [NSNumber numberWithFloat:twoTrans],
                             [NSNumber numberWithFloat:fiveTrans],
                             [NSNumber numberWithFloat:oneTrans]
                             ];
    
    NSArray *times = @[@(0.0),@(0.1),@(0.4),@(0.75),@(0.9),@(1.0)];
    
    NSArray *positionValues = @[[NSValue valueWithCGPoint:onePoint],
                                [NSValue valueWithCGPoint:twoPoint],
                                [NSValue valueWithCGPoint:xPoint],
                                [NSValue valueWithCGPoint:threePoint],
                                [NSValue valueWithCGPoint:fourPoint],
                                ];
    
    NSArray *positionTimes = @[@(0.0),@(0.4),@(0.75),@(0.9),@(1.0)];;
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniRotationZ values:transValues keyTimes:times];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:positionValues keyTimes:positionTimes];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];
    
    return groupAni;
    
}



- (void)transLineLeftToRightWithLayer:(AVBasicLayer *)currentLayer
                              moveDir:(NSInteger)moveDir
                             duration:(NSTimeInterval)duration
                            beginTime:(NSTimeInterval)beginTime{

    CGFloat offset = 50;
    
    
    AVBasicLayer *moveMaskLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight+2*offset) bgColor:[UIColor blackColor].CGColor];
    [currentLayer.maskLayer addSublayer:moveMaskLayer];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight+2*offset);
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = kLineWidth;
    [currentLayer addSublayer:lineLayer];

    CATransform3D oneTrans = CATransform3DMakeRotation(M_PI/60, 0, 0, 1);
    CATransform3D twoTrans = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D threeTrans = CATransform3DMakeRotation(-M_PI/60, 0, 0, 1);
    CATransform3D fiveTrans = CATransform3DMakeRotation(M_PI/40, 0, 0, 1);
        
    NSArray *transValues = @[[NSValue valueWithCATransform3D:oneTrans],
                             [NSValue valueWithCATransform3D:twoTrans],
                             [NSValue valueWithCATransform3D:threeTrans],
                             [NSValue valueWithCATransform3D:threeTrans],
                             [NSValue valueWithCATransform3D:twoTrans],
                             [NSValue valueWithCATransform3D:oneTrans],
                             [NSValue valueWithCATransform3D:oneTrans],
                             [NSValue valueWithCATransform3D:fiveTrans],
                             [NSValue valueWithCATransform3D:oneTrans],
                             [NSValue valueWithCATransform3D:twoTrans],
                                 ];
        
    NSArray *times = @[@(0.0),@(0.2),@(0.3),@(0.5),@(0.6),@(0.7),@(0.8),@(0.9),@(1.0)];
    
    NSArray *positionValues = [self getDifferencePositionWithDirection:moveDir];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:times];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:positionValues keyTimes:times];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];
    
    [moveMaskLayer addAnimation:groupAni forKey:@"groupAni"];
    [lineLayer addAnimation:groupAni forKey:@"groupAni"];

}

- (NSArray *)getDifferencePositionWithDirection:(NSInteger)dir{

    CGFloat offset = 50;
    
    CGPoint onePoint = CGPointZero;
    CGPoint twoPoint = CGPointZero;
    CGPoint threePoint = CGPointZero;
    CGPoint xPoint = CGPointZero;
    CGPoint fourPoint = CGPointZero;
    CGPoint fivePoint = CGPointZero;
    CGPoint sixPoint = CGPointZero;
    CGPoint sevenPoint = CGPointZero;
    CGPoint eightPoint = CGPointZero;

    
    switch (dir) {
        case AVTransitionRightToLeft:
        {
            onePoint = CGPointMake(kAVWindowWidth*1.5+offset, kAVWindowHeight/2);
            twoPoint = CGPointMake(kAVWindowWidth+2*offset, kAVWindowHeight/2);
            threePoint = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
            xPoint = CGPointMake(kAVWindowWidth-offset, kAVWindowHeight/2);
            fourPoint = CGPointMake(kAVWindowWidth-2*offset, kAVWindowHeight/2);
            fivePoint = CGPointMake(kAVWindowWidth-4*offset, kAVWindowHeight/2);
            sixPoint = CGPointMake(kAVWindowWidth/2+offset, kAVWindowHeight/2);
            sevenPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            eightPoint = CGPointMake(kAVWindowWidth/2-offset*0.4, kAVWindowHeight/2);
            
            break;
        }
        case AVTransitionLeftToRight:
        {
            onePoint = CGPointMake(-kAVWindowWidth/2-offset, kAVWindowHeight/2);
            twoPoint = CGPointMake(-2*offset, kAVWindowHeight/2);
            threePoint = CGPointMake(0, kAVWindowHeight/2);
            xPoint = CGPointMake(offset, kAVWindowHeight/2);
            fourPoint = CGPointMake(2*offset, kAVWindowHeight/2);
            fivePoint = CGPointMake(4*offset, kAVWindowHeight/2);
            sixPoint = CGPointMake(kAVWindowWidth/2-offset, kAVWindowHeight/2);
            sevenPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            eightPoint = CGPointMake(kAVWindowWidth/2+offset*0.4, kAVWindowHeight/2);
            
            break;
        }
        case AVTransitionTopToBottom:
        {
            onePoint = CGPointMake(kAVWindowWidth/2, -kAVWindowHeight/2-offset);
            twoPoint = CGPointMake(kAVWindowWidth/2, -2*offset);
            threePoint = CGPointMake(kAVWindowWidth/2, 0);
            xPoint = CGPointMake(kAVWindowWidth/2, offset);
            fourPoint = CGPointMake(kAVWindowWidth/2, 2*offset);
            fivePoint = CGPointMake(kAVWindowWidth/2, 4*offset);
            sixPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2-offset);
            sevenPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            eightPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2+offset*0.4);
            
            break;
        }
        case AVTransitionBottomToTop:
        {
            onePoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.5+offset);
            twoPoint = CGPointMake(kAVWindowWidth/2,kAVWindowHeight+2*offset);
            threePoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight);
            xPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-offset);
            fourPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2+4*offset);
            fivePoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2+2*offset);
            sixPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2+offset);
            sevenPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            eightPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2-offset*0.4);
            break;
        }
        default:
            break;
    }
    
    NSArray *positionValues = @[[NSValue valueWithCGPoint:onePoint],
                                [NSValue valueWithCGPoint:twoPoint],
                                [NSValue valueWithCGPoint:threePoint],
                                [NSValue valueWithCGPoint:xPoint],
                                [NSValue valueWithCGPoint:fourPoint],
                                [NSValue valueWithCGPoint:fivePoint],
                                [NSValue valueWithCGPoint:sixPoint],
                                [NSValue valueWithCGPoint:sevenPoint],
                                [NSValue valueWithCGPoint:eightPoint],
                                ];

    return positionValues;
}

-(CAAnimationGroup *)rightToCenterToRightAnimation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CGFloat offset = 30;

    CATransform3D trans1 = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D trans2 = CATransform3DMakeRotation(-M_PI/50, 0, 0, 1);
    CATransform3D trans3 = CATransform3DMakeRotation(-M_PI/25, 0, 0, 1);
    
    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans2],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans1]
                             ];
    
    NSArray *transTimes = @[@(0.0),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    
    CGPoint point1 = CGPointMake(kAVWindowWidth+offset, kAVWindowHeight/2);
    CGPoint point3 = CGPointMake(350, kAVWindowHeight/2);
    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    CGPoint point5 = CGPointMake(400, kAVWindowHeight/2);
    CGPoint point6 = CGPointMake(kAVWindowWidth+2*offset, kAVWindowHeight/2);
    
    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point5],
                             [NSValue valueWithCGPoint:point6],
                             ];
    
    
    NSArray *times = @[@(0.0),@(0.35),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:transTimes];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];

    return groupAni;
}

//-(CAAnimationGroup *)rightToCenterToRightAnimation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
//{
//    CGFloat offset = 30;
//    
//    CATransform3D trans1 = CATransform3DMakeRotation(0, 0, 0, 1);
//    CATransform3D trans2 = CATransform3DMakeRotation(-M_PI/50, 0, 0, 1);
//    CATransform3D trans3 = CATransform3DMakeRotation(-M_PI/25, 0, 0, 1);
//    
//    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
//                             [NSValue valueWithCATransform3D:trans1],
//                             [NSValue valueWithCATransform3D:trans2],
//                             [NSValue valueWithCATransform3D:trans3],
//                             [NSValue valueWithCATransform3D:trans1]
//                             ];
//    
//    NSArray *transTimes = @[@(0.0),@(0.65),@(0.75),@(0.85),@(1.0)];
//    
//    
//    CGPoint point1 = CGPointMake(kAVWindowWidth+offset, kAVWindowHeight/2);
//    CGPoint point3 = CGPointMake(350, kAVWindowHeight/2);
//    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
//    CGPoint point5 = CGPointMake(400, kAVWindowHeight/2);
//    CGPoint point6 = CGPointMake(kAVWindowWidth+2*offset, kAVWindowHeight/2);
//    
//    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
//                             [NSValue valueWithCGPoint:point3],
//                             [NSValue valueWithCGPoint:point4],
//                             [NSValue valueWithCGPoint:point4],
//                             [NSValue valueWithCGPoint:point3],
//                             [NSValue valueWithCGPoint:point5],
//                             [NSValue valueWithCGPoint:point6],
//                             ];
//    
//    
//    NSArray *times = @[@(0.0),@(0.35),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
//    
//    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
//    
//    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:transTimes];
//    
//    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];
//    
//    return groupAni;
//}
//

-(CAAnimationGroup *)bottomToCenterToBottomAnimation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CGFloat offset = 30;
    
    CGPoint point1 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+20);
    CGPoint point2 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-120);
    CGPoint point3 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-250);
    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    CGPoint point5 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-200);
    CGPoint point6 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+2*offset);
    
    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                             [NSValue valueWithCGPoint:point2],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point5],
                             [NSValue valueWithCGPoint:point6]
                             ];
    
    NSArray *times = @[@(0.0),@(0.15),@(0.4),@(0.5),@(0.65),@(0.75),@(0.8),@(1.0)];
    
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
    
    CATransform3D trans1 = CATransform3DMakeRotation(-M_PI/60, 0, 0, 1);
    CATransform3D trans2 = CATransform3DMakeRotation(-M_PI/30, 0, 0, 1);
    CATransform3D trans3 = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D trans4 = CATransform3DMakeRotation(M_PI/50, 0, 0, 1);
    CATransform3D trans5 = CATransform3DMakeRotation(M_PI/25, 0, 0, 1);
    
    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans2],
                             [NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans4],
                             [NSValue valueWithCATransform3D:trans5],
                             [NSValue valueWithCATransform3D:trans3]
                             ];
    NSArray *timeValues = @[@(0.0),@(0.3),@(0.4),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:timeValues];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[transAni,positionAni]];
    
    return groupAni;
}

-(CAAnimationGroup *)topToCenterToTopAnimation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CGFloat offset = 30;
    
    CATransform3D trans1 = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D trans2 = CATransform3DMakeRotation(M_PI/50, 0, 0, 1);
    CATransform3D trans3 = CATransform3DMakeRotation(M_PI/25, 0, 0, 1);
    
    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans2],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans1]
                             ];
    
    NSArray *transTimes = @[@(0.0),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    
    CGPoint point1 = CGPointMake(kAVWindowWidth/2, -offset);
    CGPoint point3 = CGPointMake(kAVWindowWidth/2, 250);
    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    CGPoint point5 = CGPointMake(kAVWindowWidth/2, 200);
    CGPoint point6 = CGPointMake(kAVWindowWidth/2, -2*offset);
    
    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point5],
                             [NSValue valueWithCGPoint:point6],
                             ];
    
    
    NSArray *times = @[@(0.0),@(0.35),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:transTimes];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];
    
    return groupAni;
}

-(CAAnimationGroup *)leftToCenterToLeftAnimation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CGFloat offset = 30;
    
    CGPoint point1 = CGPointMake(-20, kAVWindowHeight/2);
    CGPoint point2 = CGPointMake(120, kAVWindowHeight/2);
    CGPoint point3 = CGPointMake(250, kAVWindowHeight/2);
    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    CGPoint point5 = CGPointMake(200, kAVWindowHeight/2);
    CGPoint point6 = CGPointMake(-2*offset, kAVWindowHeight/2);
    
    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                             [NSValue valueWithCGPoint:point2],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point5],
                             [NSValue valueWithCGPoint:point6]
                             ];
    
    NSArray *times = @[@(0.0),@(0.15),@(0.4),@(0.5),@(0.65),@(0.75),@(0.8),@(1.0)];
    
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
    
    CATransform3D trans1 = CATransform3DMakeRotation(M_PI/60, 0, 0, 1);
    CATransform3D trans2 = CATransform3DMakeRotation(M_PI/30, 0, 0, 1);
    CATransform3D trans3 = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D trans4 = CATransform3DMakeRotation(-M_PI/50, 0, 0, 1);
    CATransform3D trans5 = CATransform3DMakeRotation(-M_PI/25, 0, 0, 1);
    
    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans2],
                             [NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans4],
                             [NSValue valueWithCATransform3D:trans5],
                             [NSValue valueWithCATransform3D:trans3]
                             ];
    NSArray *timeValues = @[@(0.0),@(0.3),@(0.4),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:timeValues];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[transAni,positionAni]];
    
    return groupAni;
}

- (void)AVTransiteFashionWeedEndVerticalCloseCenterToBoth2
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 2.5;//整个动画时间
    
    CGFloat offset = 30;
    
    UIImage *firstImage = [UIImage imageNamed:@"1.png"];
    UIImage *firstBlurImage = [[AVFilterPhoto alloc] filterGPUImage:firstImage
                                                         filterType:AVImageFilterBlackWhite
                                                         blurRadius:20];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                      vContentRect:kAVRectWindow
                                                         withImage:firstBlurImage];
    [homeLayer addSublayer: firstLayer];
    
    {
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
        [firstLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }

    UIImage *secendImage = [UIImage imageNamed:@"yoona.png"];
    AVBasicLayer *secondLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                       vContentRect:kAVRectWindow
                                                          withImage:secendImage];
    
    //    AVBasicLayer *secondLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
    //                                                                 vContentRect:kAVRectWindow
    //                                                                  origalImage:secendImage
    //                                                                    blueImage:secendImage];
    
    [homeLayer addSublayer: secondLayer];
    
    // secondLayer 设置
    {
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
        [secondLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        
        secondLayer.maskLayer.frame = secondLayer.bounds;
        secondLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    }
    
    
    //up mask
    CAAnimationGroup *topToCenterToTopAnimation = [self topToCenterToTopAnimation:duration withBeginTime:beginTime];
    {
        AVBottomLayer *upMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kMaskHeight)
                                                               bgColor:[UIColor blackColor].CGColor];
        upMask.anchorPoint = CGPointMake(0.5, 1.0);
        [secondLayer.maskLayer addSublayer:upMask];
        [upMask addAnimation:topToCenterToTopAnimation forKey:@"maskGroupAni"];
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kLineWidth);
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0.5, 1.0);
        lineLayer.shouldRasterize = YES;
        [secondLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:topToCenterToTopAnimation forKey:@"maskGroupAni"];
    }
    
    //bottom mask
    CAAnimationGroup *bottomToCenterToBottomAnimation = [self bottomToCenterToBottomAnimation:duration withBeginTime:beginTime];
    {
        AVBottomLayer *rightMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-kMoveOffset, kAVWindowHeight, kAVWindowWidth+(2*kMoveOffset), kMaskHeight)
                                                                bgColor:[UIColor blackColor].CGColor];
        rightMask.anchorPoint = CGPointMake(0.5, 0);
        [secondLayer.maskLayer addSublayer:rightMask];
        [rightMask addAnimation:bottomToCenterToBottomAnimation forKey:@"maskGroupAni"];
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(-kMoveOffset, kAVWindowHeight, kAVWindowWidth+(2*kMoveOffset), kLineWidth);
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0.5, 0);
        lineLayer.shouldRasterize = YES;
        [secondLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:bottomToCenterToBottomAnimation forKey:@"maskGroupAni"];
    }
    
    {
        UIImage *secend3Image = [UIImage imageNamed:@"3"];
        UIImage *thirdBlurImage = [[AVFilterPhoto alloc] filterGPUImage:secend3Image
                                                             filterType:AVImageFilterBlackWhite
                                                             blurRadius:20];
        
        AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                          vContentRect:kAVRectWindow
                                                             withImage:thirdBlurImage];
        [firstLayer addSublayer: thirdLayer];
        thirdLayer.contentLayer.opacity =0.0f;
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:beginTime+duration*0.6];
        [thirdLayer.contentLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+duration*0.2 fromScaleValue:1];
        [thirdLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
}

//先关闭到中间，然后打开
- (void)AVTransiteFashionWeedEndHorcalCloseCenterToBoth2
{
    CFTimeInterval beginTime = 0;//[homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 2.5;//整个动画时间
    
        CGFloat offset = 30;
    
    UIImage *firstImage = [UIImage imageNamed:@"1.png"];
    UIImage *firstBlurImage = [[AVFilterPhoto alloc] filterGPUImage:firstImage
                                                         filterType:AVImageFilterBlackWhite
                                                         blurRadius:20];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                      vContentRect:kAVRectWindow
                                                         withImage:firstBlurImage];
    [homeLayer addSublayer: firstLayer];
    
    {
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
        [firstLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    

    UIImage *secendImage = [UIImage imageNamed:@"yoona.png"];
    
    AVBasicLayer *secondLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                      vContentRect:kAVRectWindow
                                                         withImage:secendImage];
    
//    AVBasicLayer *secondLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
//                                                                 vContentRect:kAVRectWindow
//                                                                  origalImage:secendImage
//                                                                    blueImage:secendImage];

    [homeLayer addSublayer: secondLayer];
    
    // secondLayer 设置
    {
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
        [secondLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        
        secondLayer.maskLayer.frame = secondLayer.bounds;
        secondLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    }
    

    //up mask
    CAAnimationGroup *leftToCenterToLeftAnimation = [self leftToCenterToLeftAnimation:duration withBeginTime:beginTime];
    {
        AVBottomLayer *leftMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, -kMoveOffset, kMaskHeight,  kAVWindowWidth+(2*kMoveOffset))
                                                               bgColor:[UIColor blackColor].CGColor];
        leftMask.anchorPoint = CGPointMake(1, 0.5);
        [secondLayer.maskLayer addSublayer:leftMask];
        [leftMask addAnimation:leftToCenterToLeftAnimation forKey:@"maskGroupAni"];
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(0,-kMoveOffset, kLineWidth, kAVWindowWidth+(2*kMoveOffset));
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(1, 0.5);
        lineLayer.shouldRasterize = YES;
        [secondLayer addSublayer:lineLayer];
    
        [lineLayer addAnimation:leftToCenterToLeftAnimation forKey:@"maskGroupAni"];
    }
    
    //rightMask
    CAAnimationGroup *rightToCenterToRightAnimation = [self rightToCenterToRightAnimation:duration withBeginTime:beginTime];
    {
        AVBottomLayer *rightMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(kAVWindowWidth, -kMoveOffset, kMaskHeight,  kAVWindowWidth+(2*kMoveOffset))
                                                               bgColor:[UIColor blackColor].CGColor];
        rightMask.anchorPoint = CGPointMake(0, 0.5);
        [secondLayer.maskLayer addSublayer:rightMask];
        [rightMask addAnimation:rightToCenterToRightAnimation forKey:@"maskGroupAni"];
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(kAVWindowWidth,-kMoveOffset, kLineWidth, kAVWindowWidth+(2*kMoveOffset));
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0, 0.5);
        lineLayer.shouldRasterize = YES;
        [secondLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:rightToCenterToRightAnimation forKey:@"maskGroupAni"];
    }
    
     //第三个
    {
        UIImage *secend3Image = [UIImage imageNamed:@"3"];
        UIImage *thirdBlurImage = [[AVFilterPhoto alloc] filterGPUImage:secend3Image
                                                             filterType:AVImageFilterBlackWhite
                                                             blurRadius:20];
        
        AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                           vContentRect:kAVRectWindow
                                                              withImage:thirdBlurImage];
        [firstLayer addSublayer: thirdLayer];
        thirdLayer.contentLayer.opacity =0.0f;
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:beginTime+duration*0.6];
        [thirdLayer.contentLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+duration*0.2 fromScaleValue:1];
        [thirdLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    CGFloat total = beginTime+duration*0.6;
    
    NSLog(@"total =%f", total);
}

- (void)AVTransiteFashionWeedEndHorcalCloseCenterToBoth{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 4;//整个动画时间
    
    //第一个layer
    UIImage *firstImage = [UIImage imageNamed:@"1.png"];
    UIImage *firstBlurImage = [[AVFilterPhoto alloc] filterGPUImage:firstImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:firstBlurImage];
    [homeLayer addSublayer: firstLayer];
    
    //第二个layer
    UIImage *secendImage = [UIImage imageNamed:@"yoona.png"];
    AVBasicLayer *secendLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                 vContentRect:kAVRectWindow
                                                                  origalImage:secendImage
                                                                    blueImage:secendImage];
    
    [homeLayer addSublayer:secendLayer];
    
    secendLayer.photoLayer.mask = secendLayer.blurMaskLayer;

    secendLayer.mask = secendLayer.maskLayer;
    
    //第三个layer
    UIImage *threeImage = [UIImage imageNamed:@"bg2.png"];
    UIImage *threeBlurImage = [[AVFilterPhoto alloc] filterGPUImage:threeImage
                                                         filterType:AVImageFilterBlackWhite
                                                         blurRadius:20];
    AVBasicLayer *threeLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                   vContentRect:kAVRectWindow
                    origalImage:threeImage
                      blueImage:threeBlurImage];
    
    [homeLayer insertSublayer:threeLayer below:secendLayer];
    
    threeLayer.mask = threeLayer.maskLayer;
    threeLayer.maskLayer.opacity = 0.0;
    threeLayer.photoLayer.mask = threeLayer.blurMaskLayer;
    threeLayer.photoLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    //第二个layer动画
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+1 fromScaleValue:1];
        [secendLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+1 fromScaleValue:1];
        [secendLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }

    //第一个转场动画
    {
        //left
        [self leftMaskAndLineAniWithLayer:secendLayer
                                      duration:duration
                                     beginTime:beginTime];
        
        //right
        [self rightMaskAndLineAniWithLayer:secendLayer
                                       duration:duration
                                 beginTime:beginTime];
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:beginTime+duration*0.6];
        [threeLayer.maskLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
        
    }

}

//左边mask和线的动画
-(void)leftMaskAndLineAniWithLayer:(AVBasicLayer *)currentLayer
                                  duration:(NSTimeInterval)duration
                                 beginTime:(NSTimeInterval)beginTime{

    CGFloat offset = 30;
    
    AVBottomLayer *leftMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2+offset, kAVWindowHeight+2*offset) bgColor:[UIColor blackColor].CGColor];
    leftMask.anchorPoint = CGPointMake(1, 0.5);
    [currentLayer.maskLayer addSublayer:leftMask];
    
    CALayer *leftLineLayer = [CALayer layer];
    leftLineLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2+offset, kAVWindowHeight+2*offset);
    leftLineLayer.anchorPoint = CGPointMake(1, 0.5);
    leftLineLayer.borderColor = [UIColor whiteColor].CGColor;
    leftLineLayer.borderWidth = kLineWidth;
    [currentLayer addSublayer:leftLineLayer];

    
    CGPoint point1 = CGPointMake(-20, kAVWindowHeight/2);
    CGPoint point2 = CGPointMake(120, kAVWindowHeight/2);
    CGPoint point3 = CGPointMake(250, kAVWindowHeight/2);
    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    CGPoint point5 = CGPointMake(200, kAVWindowHeight/2);
    CGPoint point6 = CGPointMake(-2*offset, kAVWindowHeight/2);
    
    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                             [NSValue valueWithCGPoint:point2],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point5],
                             [NSValue valueWithCGPoint:point6]
                             ];
    
    NSArray *times = @[@(0.0),@(0.15),@(0.4),@(0.5),@(0.65),@(0.75),@(0.8),@(1.0)];

    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
    
    CATransform3D trans1 = CATransform3DMakeRotation(M_PI/60, 0, 0, 1);
    CATransform3D trans2 = CATransform3DMakeRotation(M_PI/30, 0, 0, 1);
    CATransform3D trans3 = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D trans4 = CATransform3DMakeRotation(-M_PI/50, 0, 0, 1);
    CATransform3D trans5 = CATransform3DMakeRotation(-M_PI/25, 0, 0, 1);
    
    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans2],
                             [NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans4],
                             [NSValue valueWithCATransform3D:trans5],
                             [NSValue valueWithCATransform3D:trans3]
                             ];
    NSArray *timeValues = @[@(0.0),@(0.3),@(0.4),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:timeValues];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[transAni,positionAni]];
    
    [leftMask addAnimation:groupAni forKey:@"groupAni"];
    
    [leftLineLayer addAnimation:groupAni forKey:@"groupAni"];
}

//右边mask和线的动画
- (void)rightMaskAndLineAniWithLayer:(AVBasicLayer *)currentLayer
                                 duration:(NSTimeInterval)duration
                                beginTime:(NSTimeInterval)beginTime{

    CGFloat offset = 30;
    
    AVBottomLayer *rightMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2+offset, kAVWindowHeight+2*offset) bgColor:[UIColor blackColor].CGColor];
    rightMask.anchorPoint = CGPointMake(0, 0.5);
    [currentLayer.maskLayer addSublayer:rightMask];
    
    AVBottomLayer *rightBlurMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2+offset, kAVWindowHeight+2*offset) bgColor:[UIColor blackColor].CGColor];
    rightBlurMask.anchorPoint = CGPointMake(0, 0.5);
    [currentLayer.blurMaskLayer addSublayer:rightBlurMask];
    
    CALayer *rightLineLayer = [CALayer layer];
    rightLineLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2+offset, kAVWindowHeight+2*offset);
    rightLineLayer.anchorPoint = CGPointMake(0, 0.5);
    rightLineLayer.borderWidth = kLineWidth;
    rightLineLayer.borderColor = [UIColor whiteColor].CGColor;
    [currentLayer addSublayer:rightLineLayer];
    
    {
        CATransform3D trans1 = CATransform3DMakeRotation(0, 0, 0, 1);
        CATransform3D trans2 = CATransform3DMakeRotation(-M_PI/50, 0, 0, 1);
        CATransform3D trans3 = CATransform3DMakeRotation(-M_PI/25, 0, 0, 1);
        
        NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                                 [NSValue valueWithCATransform3D:trans1],
                                 [NSValue valueWithCATransform3D:trans2],
                                 [NSValue valueWithCATransform3D:trans3],
                                 [NSValue valueWithCATransform3D:trans1]
                                 ];
        
        NSArray *transTimes = @[@(0.0),@(0.65),@(0.75),@(0.85),@(1.0)];

        
        CGPoint point1 = CGPointMake(kAVWindowWidth+offset, kAVWindowHeight/2);
        CGPoint point3 = CGPointMake(350, kAVWindowHeight/2);
        CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
        CGPoint point5 = CGPointMake(400, kAVWindowHeight/2);
        CGPoint point6 = CGPointMake(kAVWindowWidth+2*offset, kAVWindowHeight/2);
        
        NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                                 [NSValue valueWithCGPoint:point3],
                                 [NSValue valueWithCGPoint:point4],
                                 [NSValue valueWithCGPoint:point4],
                                 [NSValue valueWithCGPoint:point3],
                                 [NSValue valueWithCGPoint:point5],
                                 [NSValue valueWithCGPoint:point6],
                                 ];
        
        
        NSArray *times = @[@(0.0),@(0.35),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
        
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
        
        CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:transTimes];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];
        
        [rightMask addAnimation:groupAni forKey:@"groupAni"];
        [rightLineLayer addAnimation:groupAni forKey:@"groupAni"];
        [rightBlurMask addAnimation:groupAni forKey:@"groupAni"];
        
    }
}


- (void)AVTransiteFashionWeedEndVerticalCloseCenterToBoth{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 4;//整个动画时间
    
    //第一个layer
    UIImage *firstImage = [UIImage imageNamed:@"1.png"];
    UIImage *firstBlurImage = [[AVFilterPhoto alloc] filterGPUImage:firstImage
                                                         filterType:AVImageFilterBlackWhite
                                                         blurRadius:20];
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                      vContentRect:kAVRectWindow
                                                         withImage:firstBlurImage];
    [homeLayer addSublayer: firstLayer];
    
    //第二个layer
    UIImage *secendImage = [UIImage imageNamed:@"yoona.png"];
    AVBasicLayer *secendLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                 vContentRect:kAVRectWindow
                                                                  origalImage:secendImage
                                                                    blueImage:secendImage];
    
    [homeLayer addSublayer:secendLayer];
    
    secendLayer.photoLayer.mask = secendLayer.blurMaskLayer;
    secendLayer.photoLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    secendLayer.mask = secendLayer.maskLayer;
    secendLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    //第三个layer
    UIImage *threeImage = [UIImage imageNamed:@"bg2.png"];
    UIImage *threeBlurImage = [[AVFilterPhoto alloc] filterGPUImage:threeImage
                                                         filterType:AVImageFilterBlackWhite
                                                         blurRadius:20];
    AVBasicLayer *threeLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:threeImage
                                                                   blueImage:threeBlurImage];
    
    [homeLayer insertSublayer:threeLayer below:secendLayer];
    
    threeLayer.mask = threeLayer.maskLayer;
    threeLayer.maskLayer.opacity = 0.0;
    threeLayer.photoLayer.mask = threeLayer.blurMaskLayer;
    threeLayer.photoLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    //第二个layer动画
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+1 fromScaleValue:1];
        [secendLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+1 fromScaleValue:1];
        [secendLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    //第一个转场动画
    {
        //left
        [self topMaskAndLineAniWithLayer:secendLayer
                                 duration:duration
                                beginTime:beginTime];
        
        //right
        [self bottomMaskAndLineAniWithLayer:secendLayer
                                  duration:duration
                                 beginTime:beginTime];
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:beginTime+duration*0.6];
        [threeLayer.maskLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    }

}

//底部mask和线的动画
-(void)bottomMaskAndLineAniWithLayer:(AVBasicLayer *)currentLayer
                          duration:(NSTimeInterval)duration
                         beginTime:(NSTimeInterval)beginTime{
    
    CGFloat offset = 30;
    
    AVBottomLayer *leftMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight/2+offset) bgColor:[UIColor blackColor].CGColor];
    leftMask.anchorPoint = CGPointMake(0.5, 0);
    [currentLayer.maskLayer addSublayer:leftMask];
    
    CALayer *leftLineLayer = [CALayer layer];
    leftLineLayer.frame = CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight/2+offset);
    leftLineLayer.anchorPoint = CGPointMake(0.5, 0);
    leftLineLayer.borderColor = [UIColor whiteColor].CGColor;
    leftLineLayer.borderWidth = kLineWidth;
    [currentLayer addSublayer:leftLineLayer];
    
    
    CGPoint point1 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+20);
    CGPoint point2 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-120);
    CGPoint point3 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-250);
    CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    CGPoint point5 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-200);
    CGPoint point6 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+2*offset);
    
    NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                             [NSValue valueWithCGPoint:point2],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point4],
                             [NSValue valueWithCGPoint:point3],
                             [NSValue valueWithCGPoint:point5],
                             [NSValue valueWithCGPoint:point6]
                             ];
    
    NSArray *times = @[@(0.0),@(0.15),@(0.4),@(0.5),@(0.65),@(0.75),@(0.8),@(1.0)];
    
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
    
    CATransform3D trans1 = CATransform3DMakeRotation(-M_PI/60, 0, 0, 1);
    CATransform3D trans2 = CATransform3DMakeRotation(-M_PI/30, 0, 0, 1);
    CATransform3D trans3 = CATransform3DMakeRotation(0, 0, 0, 1);
    CATransform3D trans4 = CATransform3DMakeRotation(M_PI/50, 0, 0, 1);
    CATransform3D trans5 = CATransform3DMakeRotation(M_PI/25, 0, 0, 1);
    
    NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans2],
                             [NSValue valueWithCATransform3D:trans1],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans3],
                             [NSValue valueWithCATransform3D:trans4],
                             [NSValue valueWithCATransform3D:trans5],
                             [NSValue valueWithCATransform3D:trans3]
                             ];
    NSArray *timeValues = @[@(0.0),@(0.3),@(0.4),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:timeValues];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[transAni,positionAni]];
    
    [leftMask addAnimation:groupAni forKey:@"groupAni"];
    
    [leftLineLayer addAnimation:groupAni forKey:@"groupAni"];
}

//上面mask和线的动画
- (void)topMaskAndLineAniWithLayer:(AVBasicLayer *)currentLayer
                            duration:(NSTimeInterval)duration
                           beginTime:(NSTimeInterval)beginTime{
    
    CGFloat offset = 30;
    
    AVBottomLayer *rightMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight/2+offset) bgColor:[UIColor blackColor].CGColor];
    rightMask.anchorPoint = CGPointMake(0.5, 1);
    [currentLayer.maskLayer addSublayer:rightMask];
    
    AVBottomLayer *rightBlurMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight/2+offset) bgColor:[UIColor blackColor].CGColor];
    rightBlurMask.anchorPoint = CGPointMake(0.5, 1);
    [currentLayer.blurMaskLayer addSublayer:rightBlurMask];
    
    CALayer *rightLineLayer = [CALayer layer];
    rightLineLayer.frame = CGRectMake(0, 0, kAVWindowWidth+2*offset, kAVWindowHeight/2+offset);
    rightLineLayer.anchorPoint = CGPointMake(0.5, 1);
    rightLineLayer.borderWidth = kLineWidth;
    rightLineLayer.borderColor = [UIColor whiteColor].CGColor;
    [currentLayer addSublayer:rightLineLayer];
    
    {
        CATransform3D trans1 = CATransform3DMakeRotation(0, 0, 0, 1);
        CATransform3D trans2 = CATransform3DMakeRotation(M_PI/50, 0, 0, 1);
        CATransform3D trans3 = CATransform3DMakeRotation(M_PI/25, 0, 0, 1);
        
        NSArray *transValues = @[[NSValue valueWithCATransform3D:trans1],
                                 [NSValue valueWithCATransform3D:trans1],
                                 [NSValue valueWithCATransform3D:trans2],
                                 [NSValue valueWithCATransform3D:trans3],
                                 [NSValue valueWithCATransform3D:trans1]
                                 ];
        
        NSArray *transTimes = @[@(0.0),@(0.65),@(0.75),@(0.85),@(1.0)];
        
        
        CGPoint point1 = CGPointMake(kAVWindowWidth/2, -offset);
        CGPoint point3 = CGPointMake(kAVWindowWidth/2, 250);
        CGPoint point4 = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
        CGPoint point5 = CGPointMake(kAVWindowWidth/2, 200);
        CGPoint point6 = CGPointMake(kAVWindowWidth/2, -2*offset);
        
        NSArray *pointValues = @[[NSValue valueWithCGPoint:point1],
                                 [NSValue valueWithCGPoint:point3],
                                 [NSValue valueWithCGPoint:point4],
                                 [NSValue valueWithCGPoint:point4],
                                 [NSValue valueWithCGPoint:point3],
                                 [NSValue valueWithCGPoint:point5],
                                 [NSValue valueWithCGPoint:point6],
                                 ];
        
        
        NSArray *times = @[@(0.0),@(0.35),@(0.5),@(0.65),@(0.75),@(0.85),@(1.0)];
        
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:pointValues keyTimes:times];
        
        CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"transform" values:transValues keyTimes:transTimes];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,transAni]];
        
        [rightMask addAnimation:groupAni forKey:@"groupAni"];
        [rightLineLayer addAnimation:groupAni forKey:@"groupAni"];
        [rightBlurMask addAnimation:groupAni forKey:@"groupAni"];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
