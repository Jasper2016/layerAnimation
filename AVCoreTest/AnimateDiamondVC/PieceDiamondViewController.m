//
//  PieceDiamondViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 2017/10/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "PieceDiamondViewController.h"

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

#import "AVBasicGradientLayer.h"

#import "AVTextAttributedHelper.h"
#import "UIImage+BoxBlur.h"
#import "AVLineLayer.h"

#import "JNWSpringAnimation.h"

#define kAVBorderWidth 5
#define kAVBorderColor [UIColor blackColor].CGColor

#define kAVLayerDisplayWidth (kAVWindowWidth +2*kAVBorderWidth)
#define kAVLayerDisplayHeight (kAVWindowHeight + 40)

@interface PieceDiamondViewController ()

@end

@implementation PieceDiamondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self fourDirectionTrans];
//    [self pieceDiamondTitleTextAni];

//    [self twoPhotoWithRightSacleMoveAni];
//    [self threePhotoWithLeftAniRightScaleAni];
//    [self twoPhotoWithLeftSacleMoveAni];
//    [self AVSceneTransiteRomanticFogEffect];
//    [self fourDirectionTrans];


//   [self pieceDiamondDescTextAni];
//    [self newTextGradientLayer];
    
//    [self pieceDiamondEndAni];
//    [self AVSceneTransiteAniBlurImageEffect];


//    [self AVSceneTransiteBothBlureMaskMove];
    
   // [self testRealBlurImageEffect];
    
//    [self startTitleAinmate];

//    [self testImage];
    
//    [self testDownToUpSlider];
    
//    [self testSlider];
//    [self testConnect];
    
    
//    [self fourDirectionMove];
    
    [self testDirMove];
}

#define kMoveLayerInterval 40

- (void)testDirMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.6;
    
    AVAniMustMoveDicype dir = AVAniMoveMustTopToBottom;
    
    AVBasicLayer *rootLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor clearColor].CGColor];
    [homeLayer addSublayer:rootLayer];
    [self manyPhotoSliderTransite:moveDuration beginTime:beginTime dir:dir currentLayer:rootLayer];
}

- (void)fourDirectionMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;

    CGFloat nextLayerWidth = 0;
    CGFloat nextLayerHeight = 0;
    CGFloat shadowLayerWidth = 0;
    CGFloat shadowLayerHeight = 0;
    CGPoint shadowLayerOnePosition = CGPointZero;
    CGPoint shadowLayerTwoPosition = CGPointZero;
    
    AVAniMustMoveDicype dir = AVAniMoveMustBottomToTop;

    switch (dir) {
        case AVAniMoveMustRightToLeft:
        {
            nextLayerWidth = (kAVWindowWidth+kMoveLayerInterval);
            nextLayerHeight = kAVWindowHeight;
            shadowLayerWidth = kMoveLayerInterval/2;
            shadowLayerHeight = kAVWindowHeight;
            shadowLayerOnePosition = CGPointMake(shadowLayerWidth/2, kAVWindowHeight/2);
            shadowLayerTwoPosition = CGPointMake(nextLayerWidth-shadowLayerWidth/2, kAVWindowHeight/2);
            break;
            
        }
        case AVAniMoveMustLeftToRight:
        {
            
            nextLayerWidth = (kAVWindowWidth+kMoveLayerInterval);
            nextLayerHeight = kAVWindowHeight;
            shadowLayerWidth = kMoveLayerInterval/2;
            shadowLayerHeight = kAVWindowHeight;
            shadowLayerOnePosition = CGPointMake(shadowLayerWidth/2, kAVWindowHeight/2);
            shadowLayerTwoPosition = CGPointMake(nextLayerWidth-shadowLayerWidth/2, kAVWindowHeight/2);
            break;
            
        }
        case AVAniMoveMustTopToBottom:
        {
            nextLayerWidth = kAVWindowWidth;
            nextLayerHeight = (kAVWindowHeight+kMoveLayerInterval);
            shadowLayerWidth = kAVWindowWidth;
            shadowLayerHeight = kMoveLayerInterval/2;
            shadowLayerOnePosition = CGPointMake(kAVWindowWidth/2, shadowLayerHeight/2);
            shadowLayerTwoPosition = CGPointMake(kAVWindowWidth/2, nextLayerHeight-shadowLayerHeight/2);
            
            break;
        }
        case AVAniMoveMustBottomToTop:
        {
            nextLayerWidth = kAVWindowWidth;
            nextLayerHeight = (kAVWindowHeight+kMoveLayerInterval);
            shadowLayerWidth = kAVWindowWidth;
            shadowLayerHeight = kMoveLayerInterval/2;
            shadowLayerOnePosition = CGPointMake(kAVWindowWidth/2, shadowLayerHeight/2);
            shadowLayerTwoPosition = CGPointMake(kAVWindowWidth/2, nextLayerHeight-shadowLayerHeight/2);
            break;
        }
        default:
            break;
    }
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
              bgColor:[UIColor clearColor].CGColor];
    [homeLayer addSublayer:currentLayer];
    
    CFTimeInterval sceneBeginTime = beginTime+1;
    CFTimeInterval sceneMoveDuration = 2.5;
    
    //场景
    [self manyPhotoSliderTransite:sceneMoveDuration
                        beginTime:sceneBeginTime
                              dir:AVAniMoveMustRightToLeft
                     currentLayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, nextLayerWidth, nextLayerHeight)
                  withImage:[UIImage imageNamed:@"heng4.png"]];
    
    AVBottomLayer *oneShadowLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, shadowLayerWidth, shadowLayerHeight)
                                                                 bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor];
    oneShadowLayer.position = shadowLayerOnePosition;
    [nextLayer addSublayer:oneShadowLayer];

    AVBottomLayer *twoShadowLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, shadowLayerWidth, shadowLayerHeight) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor];
    twoShadowLayer.position = shadowLayerTwoPosition;
    [nextLayer addSublayer:twoShadowLayer];
    
    //转场
    [self sceneManyTransite:moveDuration
              withBeginTime:beginTime
        sceneTransiteFactor:dir
            extraMoveOffset:kMoveLayerInterval/2
               aniParameter:nil
               currentLayer:currentLayer
                  nextLayer:nextLayer
               aniRootLayer:homeLayer];
    
    
}

- (void)testConnect{
    
    CFTimeInterval firstBeginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval firstMoveDuration = 1;
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer:firstLayer];
    
    CFTimeInterval sceneBeginTime = firstBeginTime+1;
    CFTimeInterval sceneDuration  = 2.5;
    
    AVBasicLayer *secendLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor clearColor].CGColor];
    
    CABasicAnimation *secendOpacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:firstBeginTime];
    [secendLayer addAnimation:secendOpacityAni forKey:@"secendOpacityAni"];

    
    [self manyPhotoSliderTransite:sceneDuration beginTime:sceneBeginTime dir:AVAniMoveMustTopToBottom currentLayer:secendLayer];
    
//    [self sceneManyTransite:firstMoveDuration withBeginTime:firstBeginTime sceneTransiteFactor:AVAniMoveMustLeftToRight aniParameter:nil currentLayer:firstLayer nextLayer:secendLayer aniRootLayer:homeLayer];
    
    CFTimeInterval secendBeginTime = sceneBeginTime+3;
    CFTimeInterval secendDuration  = 1;

    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"0.png"]];

    CABasicAnimation *thirdOpacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:secendBeginTime];
    [thirdLayer addAnimation:thirdOpacityAni forKey:@"thirdOpacityAni"];

//    [self sceneManyTransite:secendDuration withBeginTime:secendBeginTime sceneTransiteFactor:AVAniMoveMustLeftToRight aniParameter:nil currentLayer:secendLayer nextLayer:thirdLayer aniRootLayer:homeLayer];
}

- (void)manyPhotoSliderTransite:(CFTimeInterval)duration
                      beginTime:(CFTimeInterval)beginTime
                            dir:(AVAniMustMoveDicype)dir
                   currentLayer:(AVBasicLayer *)rootLayer{
    

    CFTimeInterval moveDuration = duration;
    
    NSInteger transiteFactor  = dir;//这个值会传递过来
    
    CGFloat offset = 60;
    CGPoint onePoint = CGPointZero;
    CGPoint twoPoint = CGPointZero;
    CGPoint threePoint = CGPointZero;
    CGPoint fourPoint = CGPointZero;
    CGFloat bgLayerWidth = 0;
    CGFloat bgLayerHeight = 0;
    CGPoint bgLayerAnchor = CGPointZero;
    CGPoint bgLayerPosition = CGPointZero;
    CGFloat photoLayerWidth = 0;
    CGFloat photoLayerHeigth = 0;
    CGFloat gradiendWidth = 0;
    CGFloat gradiendHeight = 0;
    CGPoint oneGradiendPoint = CGPointZero;
    CGPoint twoGradiendPoint = CGPointZero;
    CGPoint gradiendStartPoint = CGPointZero;
    CGPoint gradiendEndPoint = CGPointZero;
    BOOL isVertical = NO;//是否垂直
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            photoLayerWidth = (kAVWindowWidth+kMoveLayerInterval);
            photoLayerHeigth = kAVWindowHeight;
            bgLayerWidth = 8*photoLayerWidth;
            bgLayerHeight = kAVWindowHeight;
            bgLayerAnchor = CGPointMake(0, 0.5);
            bgLayerPosition = CGPointMake(0, kAVWindowHeight/2);
            isVertical = NO;
            gradiendWidth = (kMoveLayerInterval/2);
            gradiendHeight = kAVWindowHeight;
            gradiendStartPoint = CGPointMake(0, 0.5);
            gradiendEndPoint = CGPointMake(1, 0.5);
            oneGradiendPoint = CGPointMake(gradiendWidth/2, kAVWindowHeight/2);
            twoGradiendPoint = CGPointMake(photoLayerWidth-gradiendWidth/2, kAVWindowHeight/2);
            
            onePoint = CGPointMake(-offset/6, kAVWindowHeight/2);
            twoPoint = CGPointMake(-(6*photoLayerWidth)-offset,kAVWindowHeight/2);
            threePoint = CGPointMake(-(photoLayerWidth*6)+offset, kAVWindowHeight/2);
            fourPoint = CGPointMake(-(photoLayerWidth*6)-offset/6, kAVWindowHeight/2);
            
            
            break;
        }
        case AVAniMoveMustLeftToRight:
        {
            photoLayerWidth = (kAVWindowWidth+kMoveLayerInterval);
            photoLayerHeigth = kAVWindowHeight;
            bgLayerWidth = 8*photoLayerWidth;
            bgLayerHeight = kAVWindowHeight;
            bgLayerAnchor = CGPointMake(1, 0.5);
            bgLayerPosition = CGPointMake(photoLayerWidth, kAVWindowHeight/2);
            isVertical = NO;
            gradiendWidth = (kMoveLayerInterval/2);
            gradiendHeight = kAVWindowHeight;
            gradiendStartPoint = CGPointMake(0, 0.5);
            gradiendEndPoint = CGPointMake(1, 0.5);
            oneGradiendPoint = CGPointMake(gradiendWidth/2, kAVWindowHeight/2);
            twoGradiendPoint = CGPointMake(photoLayerWidth-gradiendWidth/2, kAVWindowHeight/2);
            
            onePoint = CGPointMake(photoLayerWidth, kAVWindowHeight/2);
            twoPoint = CGPointMake((6*photoLayerWidth)+offset,kAVWindowHeight/2);
            threePoint = CGPointMake((photoLayerWidth*6)-offset, kAVWindowHeight/2);
            fourPoint = CGPointMake((photoLayerWidth*6)-offset/6, kAVWindowHeight/2);
            
            
            break;
        }
        case AVAniMoveMustBottomToTop:
        {
            photoLayerWidth = kAVWindowWidth;
            photoLayerHeigth = (kAVWindowHeight+kMoveLayerInterval);
            bgLayerWidth = kAVWindowWidth;
            bgLayerHeight = (photoLayerHeigth*8);
            bgLayerAnchor = CGPointMake(0.5, 1);
            bgLayerPosition = CGPointMake(kAVWindowWidth/2, photoLayerHeigth);
            isVertical = YES;
            gradiendWidth = kAVWindowWidth;
            gradiendHeight = (kMoveLayerInterval/2);
            gradiendStartPoint = CGPointMake(0.5, 0);
            gradiendEndPoint = CGPointMake(0.5, 1);
            oneGradiendPoint = CGPointMake(kAVWindowWidth/2, gradiendHeight/2);
            twoGradiendPoint = CGPointMake(kAVWindowWidth/2, photoLayerHeigth-gradiendHeight/2);
            
            onePoint = CGPointMake(kAVWindowWidth/2, photoLayerHeigth-
                                   offset/5);
            twoPoint = CGPointMake(kAVWindowWidth/2, (6*photoLayerHeigth)+offset);
            threePoint = CGPointMake(kAVWindowWidth/2, (photoLayerHeigth*6)-offset);
            fourPoint = CGPointMake(kAVWindowWidth/2, (photoLayerHeigth*6)-offset/5);
            
            break;
        }
        case AVAniMoveMustTopToBottom:
        {
            photoLayerWidth = kAVWindowWidth;
            photoLayerHeigth = (kAVWindowHeight+kMoveLayerInterval);
            bgLayerWidth = kAVWindowWidth;
            bgLayerHeight = (photoLayerHeigth*8);
            bgLayerAnchor = CGPointMake(0.5, 0);
            bgLayerPosition = CGPointMake(kAVWindowWidth/2, 0);
            isVertical = YES;
            gradiendWidth = kAVWindowWidth;
            gradiendHeight = (kMoveLayerInterval/2);
            gradiendStartPoint = CGPointMake(0.5, 0);
            gradiendEndPoint = CGPointMake(0.5, 1);
            oneGradiendPoint = CGPointMake(kAVWindowWidth/2, gradiendHeight/2);
            twoGradiendPoint = CGPointMake(kAVWindowWidth/2, photoLayerHeigth-gradiendHeight/2);
            
            onePoint = CGPointMake(kAVWindowWidth/2, -offset/6);
            twoPoint = CGPointMake(kAVWindowWidth/2, -(6*photoLayerHeigth)-offset);
            threePoint = CGPointMake(kAVWindowWidth/2, -(photoLayerHeigth*6)+offset);
            fourPoint = CGPointMake(kAVWindowWidth/2, -(photoLayerHeigth*6)-offset/6);
            break;
        }
        default:
            break;
    }
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, bgLayerWidth, bgLayerHeight) bgColor:[UIColor clearColor].CGColor];
    bgLayer.anchorPoint = bgLayerAnchor;
    bgLayer.position = bgLayerPosition;
    [rootLayer addSublayer:bgLayer];
    
    for (NSInteger index = 0; index < 8; index++) {
        
        if (index < 4) {
            
            AVBottomLayer *currentLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, photoLayerWidth, photoLayerHeigth)
                    withImage:[UIImage imageNamed:@"yoona2.png"]];
            CGFloat positionX = isVertical == YES ? (photoLayerWidth/2):(photoLayerWidth/2+(index*photoLayerWidth));
            CGFloat positionY = isVertical == YES ? (photoLayerHeigth/2+(index*photoLayerHeigth)):(photoLayerHeigth/2);
            currentLayer.position = CGPointMake(positionX, positionY);
            [bgLayer addSublayer:currentLayer];
    
            CAGradientLayer *oneGradiendLayer = [self creatTopGradiendLayer:gradiendWidth
                               height:gradiendHeight
                           startPoint:gradiendStartPoint
                             endPoint:gradiendEndPoint
                             position:oneGradiendPoint];
            [currentLayer addSublayer:oneGradiendLayer];
            
            CAGradientLayer *twoGradiendLayer = [self creatBottomGradiendLayer:gradiendWidth
                                  height:gradiendHeight
                              startPoint:gradiendStartPoint
                                endPoint:gradiendEndPoint
                                position:twoGradiendPoint];
            [currentLayer addSublayer:twoGradiendLayer];
            
        }else{
            
            AVBottomLayer *nextLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, photoLayerWidth, photoLayerHeigth)
                    withImage:[UIImage imageNamed:@"heng4.png"]];
            CGFloat positionX = isVertical == YES ? (photoLayerWidth/2):(photoLayerWidth/2+(index*photoLayerWidth));
            CGFloat positionY = isVertical == YES ? (photoLayerHeigth/2+(index*photoLayerHeigth)):(photoLayerHeigth/2);
            nextLayer.position = CGPointMake(positionX, positionY);
            [bgLayer addSublayer:nextLayer];

            CAGradientLayer *oneGradiendLayer = [self creatTopGradiendLayer:gradiendWidth
                               height:gradiendHeight
                           startPoint:gradiendStartPoint
                             endPoint:gradiendEndPoint
                             position:oneGradiendPoint];
            [nextLayer addSublayer:oneGradiendLayer];
            
            CAGradientLayer *twoGradiendLayer = [self creatBottomGradiendLayer:gradiendWidth
                                  height:gradiendHeight
                              startPoint:gradiendStartPoint
                                endPoint:gradiendEndPoint
                                position:twoGradiendPoint];
            [nextLayer addSublayer:twoGradiendLayer];
        }
        
    }
    
    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration
                                                                     withBeginTime:beginTime
                                                                         fromValue:onePoint
                                                                           toValue:fourPoint];
    currentMoveAni.timingFunction =  [CAMediaTimingFunction easeInOutSmallBack];
    
    [bgLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
//    JNWSpringAnimation *moveCenter1 = [[AVBasicRouteAnimate alloc]springCenterAni:moveDuration
//                                                                               withBeginTime:beginTime
//                                                                                   fromValue:onePoint
//                                                                                     toValue:fourPoint
//                                                                                        mass:10];
//     moveCenter1.damping = 30;
//    moveCenter1.stiffness = 300;
//    moveCenter1.mass = 2.38;
//    [bgLayer addAnimation:moveCenter1 forKey:nil];
    
    
    NSArray *locations = @[[NSValue valueWithCGPoint:onePoint],
                           [NSValue valueWithCGPoint:twoPoint],
                           [NSValue valueWithCGPoint:threePoint],
                           [NSValue valueWithCGPoint:fourPoint]];
//    NSArray *times = @[@(0.0),@(0.7),@(0.9),@(1.0)];
//
//    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveDuration
//         withBeginTime:beginTime
//          propertyName:@"position"
//                values:locations
//              keyTimes:times];
//    positionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    [bgLayer addAnimation:positionAni forKey:@"positionAni"];
    
}



- (CAGradientLayer *)creatTopGradiendLayer:(CGFloat)width
                                     height:(CGFloat)height
                                 startPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint
                                   position:(CGPoint)position{
    
    CAGradientLayer *lineLayer = [CAGradientLayer layer];
    lineLayer.frame = CGRectMake(0, 0, width, height);
    lineLayer.locations = @[@(0.0),@(1.0)];
    UIColor *oneColor = [UIColor clearColor];
    UIColor *twoColor = [UIColor blackColor];
    lineLayer.colors = @[(id)twoColor.CGColor,(id)oneColor.CGColor];
    lineLayer.startPoint = startPoint;
    lineLayer.endPoint = endPoint;
    lineLayer.position = position;
    
    return lineLayer;
}

- (CAGradientLayer *)creatBottomGradiendLayer:(CGFloat)width
                                    height:(CGFloat)height
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint
                                  position:(CGPoint)position{
    
    CAGradientLayer *lineLayer = [CAGradientLayer layer];
    lineLayer.frame = CGRectMake(0, 0, width, height);
    lineLayer.locations = @[@(0.0),@(1.0)];
    UIColor *oneColor = [UIColor clearColor];
    UIColor *twoColor = [UIColor blackColor];
    lineLayer.colors = @[(id)oneColor.CGColor,(id)twoColor.CGColor];
    lineLayer.startPoint = startPoint;
    lineLayer.endPoint = endPoint;
    lineLayer.position = position;
    
    return lineLayer;
}



-(void)sceneManyTransite:(CFTimeInterval)duration
           withBeginTime:(CFTimeInterval)beginTime
     sceneTransiteFactor:(NSInteger)transiteFactor
             extraMoveOffset:(CGFloat)extraOffset
            aniParameter:(NSDictionary *)aniParameter
            currentLayer:(AVBasicLayer *)currentLayer
               nextLayer:(AVBasicLayer *)nextLayer
            aniRootLayer:(CALayer *)rootLayer
{
    CGPoint nextStartCenter =  kAVWindowCenter;
    
    CGPoint currentEndCenter =  kAVWindowCenter;
//[CAMediaTimingFunction functionWithControlPoints: 0.645 : 0.045 : 0.355 : 1.0]
    CAMediaTimingFunction *timingFunction =  [CAMediaTimingFunction easeInOutCubic]; // [aniParameter objectForKey:@"timingFunction"];
    if (!timingFunction){
        
        timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }
    
    
    
    [rootLayer addSublayer: nextLayer];
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            
            nextStartCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x+extraOffset, kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            nextStartCenter = CGPointMake(-kAVWindowCenter.x-extraOffset, kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            nextStartCenter = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y-extraOffset);
            
            currentEndCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustBottomToTop:
        {
            nextStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y+extraOffset);
            
            currentEndCenter = CGPointMake(kAVWindowCenter.x,-kAVWindowCenter.y);
            break;
        }
            
        default:
            break;
            
    }
    
    nextLayer.position = nextStartCenter;
    // currentLayer.position = kAVWindowCenter;
    
    //    CAKeyframeAnimation *currentMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
    //                                                                               withBeginTime:beginTime
    //                                                                                   fromValue:kAVWindowCenter
    //                                                                                     toValue:currentEndCenter
    //                                                                                        mass:4];
    
    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                         fromValue:kAVWindowCenter
                                                                           toValue:currentEndCenter];
    currentMoveAni.timingFunction = timingFunction;
    currentMoveAni.fillMode=  kCAFillModeForwards;
    [currentLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
    //    CAKeyframeAnimation *nextMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
    //                                                                                  withBeginTime:beginTime
    //                                                                                      fromValue:nextStartCenter
    //                                                                                        toValue:kAVWindowCenter
    //                                                                                           mass:4];
    
    CABasicAnimation *nextMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                      fromValue:nextStartCenter
                                                                        toValue:kAVWindowCenter];
    nextMoveAni.timingFunction = timingFunction;
    nextMoveAni.fillMode= kCAFillModeForwards;
    [nextLayer addAnimation:nextMoveAni forKey:@"nextMoveAni"];
}


-(void)startTitleAinmate
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+3;
    CFTimeInterval moveDuration = 4;

    CGFloat shapeLineOffsetY = (kAVWindowHeight/4)*3;
    CGFloat diamondLayerBgWidth = kAVCeilfX(70);
    CGFloat diamondLayerBgHeight = kAVCeilfY(16);
    CGFloat diamondLayerWidth = kAVCeilfX(12);
    CGFloat diamondMoveOffsetX = kAVCeilfX(20);
    
    UIImage *originalImage = [UIImage imageNamed:@"1227x.png"];
    
    UIImage *blurImage = [originalImage drn_boxblurImageWithBlur:0.4];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:originalImage];
    
    CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1.2];
    [currentLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    

    [homeLayer addSublayer:currentLayer];
    
    
    AVBasicLayer *currentBlurLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds
                                                            vContentRect:currentLayer.contentLayer.bounds
                                                               withImage:blurImage];
    
    [currentBlurLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    
    [currentLayer addSublayer:currentBlurLayer];
    currentBlurLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    {
        
        AVBottomLayer *upMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, shapeLineOffsetY) bgColor:[UIColor redColor].CGColor];
        upMaskLayer.position = CGPointMake(kAVWindowWidth/2, shapeLineOffsetY/2);
        [currentBlurLayer.maskLayer addSublayer:upMaskLayer];
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customBasic:1.8 withBeginTime:beginTime+0.3 fromValue:@(1) toValue:@(0) propertyName:kAVBasicAniOpacity];
        
        [upMaskLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    }
    
    
    {
        
        AVBottomLayer *downMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, shapeLineOffsetY/3) bgColor:[UIColor redColor].CGColor];
        downMaskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-shapeLineOffsetY/6);
        [currentBlurLayer.maskLayer addSublayer: downMaskLayer];
        
        NSArray *opactiyValues = @[@(1),@(0.75),@(0)];
        NSArray *opactiyTimes = @[@(0.0),@(0.5),@(1.0)];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:opactiyValues keyTimes:opactiyTimes];
        [downMaskLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
    }
    
    {
        CAShapeLayer *leftShape = [self createLineWithFromPoint:CGPointMake((kAVWindowWidth-diamondLayerBgWidth)/2, shapeLineOffsetY) toPoint:CGPointMake(0, shapeLineOffsetY)];
        [currentLayer addSublayer:leftShape];
        
        CABasicAnimation *leftShapeStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:0 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *leftShapeStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:moveDuration/2 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *leftShapeLineAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[leftShapeStrokeStar,leftShapeStrokeEnd]];
        [leftShape addAnimation:leftShapeLineAni forKey:@"leftShapeLineAni"];
    }
    
    {
        CAShapeLayer *rightShape = [self createLineWithFromPoint:CGPointMake((kAVWindowWidth+diamondLayerBgWidth)/2, shapeLineOffsetY) toPoint:CGPointMake(kAVWindowWidth, shapeLineOffsetY)];
        [currentLayer addSublayer:rightShape];
        
        CABasicAnimation *rightShapeStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:0 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *rightShapeStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:moveDuration/2 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *rightShapeLineAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[rightShapeStrokeStar,rightShapeStrokeEnd]];
        [rightShape addAnimation:rightShapeLineAni forKey:@"rightShapeLineAni"];
    }
    
    
    AVBottomLayer *diamondBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerBgWidth, diamondLayerBgHeight) bgColor:[UIColor clearColor].CGColor];
    diamondBgLayer.masksToBounds = YES;
    diamondBgLayer.position = CGPointMake(kAVWindowWidth/2, shapeLineOffsetY);
    [currentLayer addSublayer:diamondBgLayer];
    //菱形背景layer ani
    {
        NSArray *valuse = @[[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)],
                            [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)],
                            [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)],
                            [NSNumber numberWithFloat:DEGREES_TO_RADIANS(360)]];
        NSArray *times = @[@(0.0),@(0.45),@(0.65),@(0.8)];
        CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniRotationZ values:valuse keyTimes:times];
        
        NSArray *opactiyValues = @[@(0),@(1),@(1),@(0)];
        NSArray *opactiyTimes = @[@(0.0),@(0.05),@(0.95),@(1)];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:opactiyValues keyTimes:opactiyTimes];
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[opacityAni,transAni]];
        
        [diamondBgLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    {
        AVBottomLayer *oneDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        oneDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        [diamondBgLayer addSublayer:oneDiamondLayer];
        
        CGPoint onePoint = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        CGPoint twoPoint = CGPointMake(diamondLayerBgWidth/2-diamondMoveOffsetX, diamondLayerBgHeight/2);
        NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:onePoint]];
        NSArray *times = @[@(0.0),@(0.4),@(0.9),@(1.0)];
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        CAKeyframeAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:@[@(1),@(1),@(0)] keyTimes:@[@(0.0),@(0.9),@(1.0)]];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,opactiyAni]];
        
        [oneDiamondLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    AVBottomLayer *twoDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
    twoDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
    [diamondBgLayer addSublayer:twoDiamondLayer];
    
    {
        AVBottomLayer *threeDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        threeDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        [diamondBgLayer addSublayer:threeDiamondLayer];
        
        CGPoint onePoint = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        CGPoint twoPoint = CGPointMake(diamondLayerBgWidth/2+diamondMoveOffsetX, diamondLayerBgHeight/2);
        NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:onePoint]];
        
        NSArray *times = @[@(0.0),@(0.4),@(0.9),@(1.0)];
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        CAKeyframeAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:@[@(1),@(1),@(0)] keyTimes:@[@(0.0),@(0.9),@(1.0)]];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,opactiyAni]];
        
        [threeDiamondLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    //文字Ani
    {
        CGFloat textLayerOffsetX = 160;
        NSString *textDesc = @"低价位欧飞飞机佛诶积分欧文见覅欧文欧迪芬欧尼";
        VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
        textModel.textFontName = @"Helvetica-Bold";
        textModel.textFontColor = [UIColor whiteColor];
        textModel.textFontSize = kAVCeilfX(37);
        textModel.textContent = textDesc;
        AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
        CGSize textSize =  [helper boundingRectTextModel:textModel photoDesc:textDesc areaSize:CGSizeMake(kAVWindowWidth-textLayerOffsetX, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        CGFloat textHeight = MAX(textSize.height, shapeLineOffsetY/6);
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textHeight) text:helper.attributedString textModel:textModel];
        [currentLayer addSublayer:textLayer];
        
        CGPoint fromPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-diamondMoveOffsetX);
        CGPoint toPoint = CGPointMake(kAVWindowWidth/2, shapeLineOffsetY+textSize.height*0.7);
        
        NSArray *values = @[[NSValue valueWithCGPoint:fromPoint],
                            [NSValue valueWithCGPoint:toPoint],
                            [NSValue valueWithCGPoint:toPoint],
                            [NSValue valueWithCGPoint:fromPoint]
                            ];
        NSArray *times =@[@(0.4),@(0.55),@(0.85),@(0.9)];
        
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        NSArray *opacityValues = @[@(0),@(1),@(1),@(0)];
        NSArray *opacityTimes =@[@(0.4),@(0.55),@(0.85),@(0.9)];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:opacityValues keyTimes:opacityTimes];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,opacityAni]];
        
        [textLayer addAnimation:groupAni forKey:@"groupAni"];
        
    }
}

-(void)testRealBlurImageEffect
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    
    CGFloat duration = 1.0;//整个动画时间
    
    UIImage *currentImage = [UIImage imageNamed:@"3.png"];
    
    UIImage *currentBlurImage = [[AVFilterPhoto alloc] filterGPUImage:currentImage
                                                       filterType:AVImageFilterGaussianBlur
                                                       blurRadius:14];
    
    //UIImage *currentBlurImage = [currentImage drn_boxblurImageWithBlur:0.4];

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:currentImage];
    
    [homeLayer addSublayer: currentLayer];
    
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:AVScaleSlowDuration withBeginTime:beginTime fromValue:1.0f toValue:1.4f];
    [currentLayer.contentLayer addAnimation:saleToAni forKey:@"saleOutAni"];
    
    CABasicAnimation *saleToAni2 = (CABasicAnimation *)[currentLayer.contentLayer animationForKey:@"saleOutAni"];
    
    //实时模糊
    {
        AVBasicLayer *currentBlurLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                            vContentRect:kAVRectWindow
                                                               withImage:currentBlurImage];
        [homeLayer addSublayer: currentBlurLayer];
        currentBlurLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        [currentBlurLayer.contentLayer addAnimation:saleToAni2 forKey:@"saleOutAni"];
        
        AVBottomLayer *partBlureLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 100,kHDScreenWidth, 200)
                                                                     bgColor:[UIColor blackColor].CGColor];
        
        [currentBlurLayer.maskLayer addSublayer: partBlureLayer];
    }
}

-(void)AVSceneTransiteBothBlureMaskMove
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    
    CGFloat duration = 2.0;//整个动画时间


    CGFloat kLineWidth = kAVCeilfY(1);
    CGFloat extarOffset = kAVCeilfX(80);
    CGPoint fromPoint   = CGPointZero;
    CGPoint toPoint     = CGPointZero;
    CGFloat transAngal  = 0;
    CGFloat maskLayerWidth = 0;
    CGFloat maskLayerHeight = 0;
    CGPoint anchorPoint = CGPointZero;
    CGFloat lineWidth = 0;
    CGFloat lineHeight = 0;
    
    AVSTDirection modDir = AVTransitionTopToBottom;
    
    switch (modDir) {
        case AVTransitionLeftToRight:
        {
            fromPoint = CGPointMake(-2*extarOffset, kAVWindowCenter.y);
            toPoint   = CGPointMake(kAVWindowWidth+extarOffset, kAVWindowCenter.y);
            transAngal =7;
            maskLayerWidth = kAVWindowWidth+2*extarOffset;
            maskLayerHeight = kAVWindowHeight+2*extarOffset;
            anchorPoint = CGPointMake(1, 0.5);
            lineWidth = kLineWidth;
            lineHeight = maskLayerHeight;
            break;
        }
        case AVTransitionRightToLeft:
        {
            fromPoint = CGPointMake(kAVWindowWidth+2*extarOffset, kAVWindowCenter.y);
            toPoint   = CGPointMake(-extarOffset, kAVWindowCenter.y);
            transAngal = -7;
            maskLayerWidth = kAVWindowWidth+2*extarOffset;
            maskLayerHeight = kAVWindowHeight+2*extarOffset;
            anchorPoint = CGPointMake(0, 0.5);
            lineWidth = kLineWidth;
            lineHeight = maskLayerHeight;
            break;
        }
        case AVTransitionTopToBottom:
        {
            fromPoint = CGPointMake(kAVWindowCenter.x, -kAVCeilfY(10));
            toPoint   = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVCeilfY(10));
            transAngal = 0;
            maskLayerWidth = kAVWindowWidth+2*kAVCeilfY(10);
            maskLayerHeight = kAVWindowHeight+2*kAVCeilfY(10);
            anchorPoint = CGPointMake(0.5, 1);
            lineWidth = maskLayerWidth;
            lineHeight = kLineWidth;
            break;
        }
        case AVTransitionBottomToTop:
        {
            fromPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVCeilfY(10));
            toPoint   = CGPointMake(kAVWindowCenter.x, -kAVCeilfY(10));
            transAngal = 0;
            maskLayerWidth = kAVWindowWidth+2*kAVCeilfY(10);
            maskLayerHeight = kAVWindowHeight+2*kAVCeilfY(10);
            anchorPoint = CGPointMake(0.5, 0);
            lineWidth = maskLayerWidth;
            lineHeight = kLineWidth;
            break;
        }
        default:
            break;
    }
    
    UIImage *currentImage = [UIImage imageNamed:@"3.png"];
    
    UIImage *currentBlurImage =  [[AVFilterPhoto alloc] simpleFilter:currentImage filterType:AVImageFilterGaussianBlur blurRadius:8];
 //   UIImage *currentBlurImage = [currentImage drn_boxblurImageWithBlur:0.4];

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:currentImage];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBottomLayer *currentBlurLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.contentLayer.bounds withImage:currentBlurImage];
    [currentLayer.contentLayer addSublayer: currentBlurLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityFromTo:duration*0.5 withBeginTime:beginTime fromValue:0.0 toValue:0.65];
    opacityOpenAni.fillMode=kCAFillModeForwards;
    currentBlurLayer.opacity = 0.0f;
    [currentBlurLayer addAnimation:opacityOpenAni forKey:@"openAni"];
    
    //next layer
    
    UIImage *nextImage = [UIImage imageNamed:@"1.png"];
    
   // UIImage *nextBlurImage = [nextImage drn_boxblurImageWithBlur:0.4];
        UIImage *nextBlurImage =  [[AVFilterPhoto alloc] simpleFilter:nextImage filterType:AVImageFilterGaussianBlur blurRadius:5];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:nextImage];

    [homeLayer addSublayer:nextLayer];

    AVBottomLayer *nextMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, maskLayerWidth, maskLayerHeight) bgColor:[UIColor redColor].CGColor];
    nextMaskLayer.anchorPoint = anchorPoint;
    nextLayer.mask = nextMaskLayer;
    nextMaskLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(transAngal), 0, 0, 1);
    
    AVLineLayer *borderLayer = [[AVLineLayer alloc] initWithFrame:CGRectMake(0, 0, lineWidth, lineHeight) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
    borderLayer.anchorPoint = anchorPoint;
    borderLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(transAngal), 0, 0, 1);
    [nextLayer addSublayer:borderLayer];
    
    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration*0.6
                                                                     withBeginTime:beginTime +duration*0.1

                                                                         fromValue:fromPoint
                                                                           toValue:toPoint];

    [nextMaskLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    [borderLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
    
    AVBottomLayer *nextBlurLayer = [[AVBottomLayer alloc] initWithFrame:nextLayer.contentLayer.bounds withImage:nextBlurImage];
    
    [nextLayer.contentLayer addSublayer: nextBlurLayer];
    
    CABasicAnimation *opacityCloseAni = [[AVBasicRouteAnimate alloc] opacityFromTo:duration*0.45 withBeginTime:beginTime+duration*0.55 fromValue:0.65 toValue:0];
    opacityCloseAni.fillMode=kCAFillModeForwards;
    [currentBlurLayer addAnimation:opacityOpenAni forKey:@"openAni"];
    
    [nextBlurLayer addAnimation:opacityCloseAni forKey:@"opacityCloseAni"];
    
}


-(void)AVSceneTransiteAniBlurImageEffect
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;

    CGFloat duration = 2.0;//整个动画时间
    
    UIImage *currentImage = [UIImage imageNamed:@"3.png"];
    
    UIImage *currentBlurImage = [currentImage drn_boxblurImageWithBlur:0.5];
   // UIImage *currentBlurImage = [[AVFilterPhoto alloc] filterGPUImage:currentImage   \
                                                           filterType:AVImageFilterGaussianBlur];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:currentImage];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBottomLayer *currentBlurLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.contentLayer.bounds withImage:currentBlurImage];
    [currentLayer.contentLayer addSublayer: currentBlurLayer];
    
    currentBlurLayer.opacity = 0.f;
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:duration*0.4 withBeginTime:beginTime];
    opacityOpenAni.fillMode=kCAFillModeForwards;
    [currentBlurLayer addAnimation:opacityOpenAni forKey:@"openAni"];

    //next layer
    
    UIImage *nextImage = [UIImage imageNamed:@"1.png"];
    
    //UIImage *nextBlurImage = [nextImage drn_boxblurImageWithBlur:0.4];
    UIImage *nextBlurImage = [nextImage drn_boxblurImageWithBlur:0.5];
//    UIImage *nextBlurImage = [[AVFilterPhoto alloc] filterGPUImage:nextImage
//                                                           filterType:AVImageFilterGaussianBlur];
//
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:nextImage];
    
    [homeLayer addSublayer:nextLayer];
    nextLayer.opacity = 0;
    
    CABasicAnimation *opacityFullOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:duration*0.6 withBeginTime:beginTime +duration*0.3];
    [nextLayer addAnimation:opacityFullOpenAni forKey:@"opacityFullOpenAni"];
    
    AVBottomLayer *nextBlurLayer = [[AVBottomLayer alloc] initWithFrame:nextLayer.contentLayer.bounds withImage:nextBlurImage];
    
    [nextLayer.contentLayer addSublayer: nextBlurLayer];

    CABasicAnimation *opacityCloseAni = [[AVBasicRouteAnimate alloc] opacityClose:duration*0.5 withBeginTime:beginTime+duration*0.6];
    [currentBlurLayer addAnimation:opacityOpenAni forKey:@"openAni"];
    
    [nextBlurLayer addAnimation:opacityCloseAni forKey:@"opacityCloseAni"];
    
}

-(void)threePhotoWithLeftAniRightScaleAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
//    CFTimeInterval moveDuration = 2.5;
    //leftLayer
    {
        AVBottomLayer *leftLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
        leftLayer.position = CGPointMake(150, kAVWindowHeight/2);
        [homeLayer addSublayer:leftLayer];
        leftLayer.mask = leftLayer.maskLayer;
        leftLayer.mask.backgroundColor = [UIColor clearColor].CGColor;

        CAShapeLayer *leftMaskLayer = [self drawMaskShapeLayer:CGPointMake(50, 0) twoPoint:CGPointMake(400, 0) threePoint:CGPointMake(250, kAVWindowHeight) fourPoint:CGPointMake(50, kAVWindowHeight)];
        [leftLayer.maskLayer addSublayer:leftMaskLayer];
        
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
        [leftLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    //rigthLayer
    {
        AVBottomLayer *rightLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
        rightLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
        [homeLayer addSublayer:rightLayer];
        rightLayer.mask = rightLayer.maskLayer;
        rightLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
        
        CAShapeLayer *rightMaskLayer = [self drawMaskShapeLayer:CGPointMake(200, 0) twoPoint:CGPointMake(kAVWindowWidth, 0) threePoint:CGPointMake(kAVWindowWidth, kAVWindowHeight) fourPoint:CGPointMake(50, kAVWindowHeight)];
        [rightLayer.maskLayer addSublayer: rightMaskLayer];
        
        
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
        [rightLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    
    //centerLayer
    {
        AVBottomLayer *centerLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
        centerLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
        [homeLayer addSublayer:centerLayer];
        centerLayer.mask = centerLayer.maskLayer;
        centerLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
        
        CAShapeLayer *centerMaskLayer = [self drawMaskShapeLayer:CGPointMake(250, 0) twoPoint:CGPointMake(500, 0) threePoint:CGPointMake(350, kAVWindowHeight) fourPoint:CGPointMake(100, kAVWindowHeight)];
//        centerLayer
        [centerLayer.maskLayer addSublayer:centerMaskLayer];
    }
    
}

- (void)twoPhotoWithLeftSacleMoveAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+4;
//    CFTimeInterval moveDuration = 2.5;
    
    AVBottomLayer *rightLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    rightLayer.position = CGPointMake(450, kAVWindowHeight/2);
    [homeLayer addSublayer:rightLayer];
    
    UIImage *leftImage = [UIImage imageNamed:@"heng4"];
    UIImage *leftBlurImage = [[AVFilterPhoto alloc] filterGPUImage:leftImage filterType:AVImageFilterGaussianBlur];
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:kAVRectWindow vContentRect:kAVRectWindow origalImage:leftImage blueImage:leftBlurImage];
    [homeLayer addSublayer:leftLayer];
    leftLayer.mask = leftLayer.maskLayer;
    leftLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *leftMaskLayer = [self drawMaskShapeLayer:CGPointMake(0, 0) twoPoint:CGPointMake(450, 0) threePoint:CGPointMake(350, kAVWindowHeight) fourPoint:CGPointMake(0, kAVWindowHeight)];
    [leftLayer.maskLayer addSublayer:leftMaskLayer];
    

    CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.2 fromScaleValue:1];
    [leftLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    
    CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customBasic:1 withBeginTime:beginTime fromValue:@(1) toValue:@(0) propertyName:kAVBasicAniOpacity];
    [leftLayer.photoLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    
}

- (void)twoPhotoWithRightSacleMoveAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+4;
    //    CFTimeInterval moveDuration = 2.5;
    
    AVBottomLayer *leftLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    leftLayer.position = CGPointMake(150, kAVWindowHeight/2);
    [homeLayer addSublayer:leftLayer];
    
    UIImage *rightImage = [UIImage imageNamed:@"heng4"];
    UIImage *rightBlurImage = [[AVFilterPhoto alloc] filterGPUImage:rightImage filterType:AVImageFilterGaussianBlur];
    AVBasicLayer *rightLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:kAVRectWindow vContentRect:kAVRectWindow origalImage:rightImage blueImage:rightBlurImage];
    [homeLayer addSublayer:rightLayer];
    rightLayer.mask = rightLayer.maskLayer;
    rightLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *rightMaskLayer = [self drawMaskShapeLayer:CGPointMake(250, 0) twoPoint:CGPointMake(kAVWindowWidth, 0) threePoint:CGPointMake(kAVWindowWidth, kAVWindowHeight) fourPoint:CGPointMake(150, kAVWindowHeight)];
    [rightLayer.maskLayer addSublayer:rightMaskLayer];
    
    
    CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.2 fromScaleValue:1];
    [rightLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    
    CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customBasic:1 withBeginTime:beginTime fromValue:@(1) toValue:@(0) propertyName:kAVBasicAniOpacity];
    [rightLayer.photoLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    
}


- (CAShapeLayer *)drawMaskShapeLayer:(CGPoint)onePoint
                            twoPoint:(CGPoint)twoPoint
                          threePoint:(CGPoint)threePoint
                           fourPoint:(CGPoint)fourPoint{
    
    UIBezierPath *rightPath = [UIBezierPath bezierPath];
    [rightPath moveToPoint:onePoint];
    [rightPath addLineToPoint:twoPoint];
    [rightPath addLineToPoint:threePoint];
    [rightPath addLineToPoint:fourPoint];
    [rightPath closePath];
    CAShapeLayer *rightMaskLayer = [CAShapeLayer layer];
    rightMaskLayer.path = rightPath.CGPath;
    rightMaskLayer.strokeColor = [UIColor clearColor].CGColor;
    rightMaskLayer.fillColor = [UIColor blackColor].CGColor;
    
    return rightMaskLayer;
}


- (void)pieceDiamondEndAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2.5;
    
    CGFloat shapeLineOffsetY = kAVWindowHeight/2;
    CGFloat diamondLayerBgWidth = 70;
    CGFloat diamondLayerBgHeight = 60;
    CGFloat diamondLayerWidth = 12;
    CGFloat diamondMoveOffsetX = 20;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor whiteColor] colorWithAlphaComponent:1].CGColor];
    [currentLayer addSublayer:blurLayer];
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime+0.3 propertyName:kAVBasicAniOpacity values:@[@(0.0),@(0.8),@(1.0)] keyTimes:@[@(0.0),@(0.5),@(1.0)]];
    [blurLayer addAnimation:opacityAni forKey:@"opacityAni"];

    
    {
        AVBottomLayer *fogEndLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight) withImage:[UIImage imageNamed:@"fogEndImage3.png"]];
        [currentLayer addSublayer:fogEndLayer];
        
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration*1.5 withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:@[@(0.0),@(0.8),@(1.0),@(0.0)] keyTimes:@[@(0.0),@(0.3),@(0.7),@(1.0)]];
        
        [fogEndLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
    }
    
    {
        CAShapeLayer *leftShape = [self createLineWithFromPoint:CGPointMake((kAVWindowWidth-diamondLayerBgWidth)/2, shapeLineOffsetY) toPoint:CGPointMake(0, shapeLineOffsetY)];
        [currentLayer addSublayer:leftShape];
        
        CABasicAnimation *leftShapeStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:0 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *leftShapeStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:moveDuration/2 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *leftShapeLineAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[leftShapeStrokeStar,leftShapeStrokeEnd]];
        [leftShape addAnimation:leftShapeLineAni forKey:@"leftShapeLineAni"];
    }
    
    {
        CAShapeLayer *rightShape = [self createLineWithFromPoint:CGPointMake((kAVWindowWidth+diamondLayerBgWidth)/2, shapeLineOffsetY) toPoint:CGPointMake(kAVWindowWidth, shapeLineOffsetY)];
        [currentLayer addSublayer:rightShape];
        
        CABasicAnimation *rightShapeStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:0 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *rightShapeStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:moveDuration/2 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *rightShapeLineAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[rightShapeStrokeStar,rightShapeStrokeEnd]];
        [rightShape addAnimation:rightShapeLineAni forKey:@"rightShapeLineAni"];
    }
    
    
    AVBottomLayer *diamondBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerBgWidth, diamondLayerBgHeight) bgColor:[UIColor clearColor].CGColor];
    diamondBgLayer.masksToBounds = YES;
    diamondBgLayer.position = CGPointMake(kAVWindowWidth/2, shapeLineOffsetY);
    [currentLayer addSublayer:diamondBgLayer];
    //菱形背景layer ani
    {
        NSArray *valuse = @[[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)],
                            [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)],
                            [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)],
                            ];
        NSArray *times = @[@(0.0),@(0.4),@(1.0)];
        CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniRotationZ values:valuse keyTimes:times];
        
        NSArray *opactiyValues = @[@(0),@(1),@(1),@(0)];
        NSArray *opactiyTimes = @[@(0.0),@(0.05),@(0.8),@(1)];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:opactiyValues keyTimes:opactiyTimes];
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[opacityAni,transAni]];
        
        [diamondBgLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    {
        AVBottomLayer *oneDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        oneDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        [diamondBgLayer addSublayer:oneDiamondLayer];
        
        CGPoint onePoint = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        CGPoint twoPoint = CGPointMake(diamondLayerBgWidth/2-diamondMoveOffsetX, diamondLayerBgHeight/2);
        NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:onePoint]];
        NSArray *times = @[@(0.0),@(0.4),@(0.6),@(1.0)];
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        [oneDiamondLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    {
    AVBottomLayer *twoDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
    twoDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
    [diamondBgLayer addSublayer:twoDiamondLayer];
        
    CGPoint onePoint = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
    CGPoint twoPoint = CGPointMake(diamondLayerBgWidth/2+diamondMoveOffsetX, diamondLayerBgHeight/2);
    NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                        [NSValue valueWithCGPoint:twoPoint],
                        [NSValue valueWithCGPoint:twoPoint],
                        [NSValue valueWithCGPoint:onePoint]];
    
    NSArray *times = @[@(0.0),@(0.4),@(0.6),@(1.0)];
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:values keyTimes:times];
    
    [twoDiamondLayer addAnimation:positionAni forKey:@"positionAni"];
        
    }
    
    {
        AVBottomLayer *threeDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 12, 12) withImage:[UIImage imageNamed:@"bigDiamondIcon"]];
        threeDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        [diamondBgLayer addSublayer:threeDiamondLayer];
       
        CABasicAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime+moveDuration*0.4 fromValue:@(1) toValue:@(4) propertyName:kAVBasicAniTransformScale];
        [threeDiamondLayer addAnimation:sacleAni forKey:@"sacleAni"];
       
    }
    
}



- (void)fourDirectionTrans{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2.5;
    
    AVSTDirection ModDir = AVTransitionLeftToRight;
    CGFloat kLineWidth = 4;
    CGFloat extraOffset = 20;
    CGRect  fromRect = CGRectZero;
    CGRect  toRect = CGRectZero;
    CGPoint position = CGPointZero;
    CGPoint anchorPoint = CGPointZero;
    CGFloat transAngal = 0;
    CGFloat moveLayerWidth = 0;
    CGFloat moveLayerHeight = 0;
    
    switch (ModDir) {
        case AVTransitionRightToLeft:
        {
            position = CGPointMake(kAVWindowWidth*1.2+extraOffset, kAVWindowHeight/2);
            anchorPoint = CGPointMake(1, 0.5);
            moveLayerWidth = kAVWindowWidth*1.5;
            moveLayerHeight = kAVWindowHeight*3;
            fromRect = CGRectMake(0, 0, 0, moveLayerHeight);
            toRect = CGRectMake(0, 0, moveLayerWidth, moveLayerHeight);
            transAngal = -15;
            break;
            
        }
        case AVTransitionLeftToRight:
        {
            position = CGPointMake(-kAVWindowWidth/3-extraOffset, kAVWindowHeight/2);
            anchorPoint = CGPointMake(0, 0.5);
            moveLayerWidth = kAVWindowWidth*1.5;
            moveLayerHeight = kAVWindowHeight*3;
            fromRect = CGRectMake(0, 0, 0, moveLayerHeight);
            toRect = CGRectMake(0, 0, moveLayerWidth, moveLayerHeight);
            transAngal = 15;
            break;
        }
        case AVTransitionTopToBottom:
        {
            position = CGPointMake(kAVWindowWidth/2, -extraOffset);
            anchorPoint = CGPointMake(0.5, 0);
            moveLayerWidth = kAVWindowWidth*2;
            moveLayerHeight = kAVWindowHeight*2;
            fromRect = CGRectMake(0, 0,moveLayerWidth, 0);
            toRect = CGRectMake(0, 0, moveLayerWidth, moveLayerHeight);
            transAngal = 0;
            break;
        }
        case AVTransitionBottomToTop:
        {
            position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+extraOffset);
            anchorPoint = CGPointMake(0.5, 1);
            moveLayerWidth = kAVWindowWidth*2;
            moveLayerHeight = kAVWindowHeight*2;
            fromRect = CGRectMake(0, 0, moveLayerWidth, 0);
            toRect = CGRectMake(0, 0, moveLayerWidth, moveLayerHeight);
            transAngal = 0;
            break;
        }
        default:
            break;
    }
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor];
    [currentLayer addSublayer:blurLayer];
    
    UIImage *nextImage = [UIImage imageNamed:@"desktop.png"];
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:nextImage filterType:AVImageFilterGaussianBlur];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:kAVRectWindow vContentRect:kAVRectWindow origalImage:nextImage blueImage:filterImage];

    [homeLayer addSublayer:nextLayer];

    AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, moveLayerWidth, moveLayerHeight) bgColor:[UIColor blackColor].CGColor];
    maskLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(transAngal), 0, 0, 1);
    maskLayer.position = position;
    maskLayer.anchorPoint = anchorPoint;
    nextLayer.mask = maskLayer;
    
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(0, 0, moveLayerWidth, moveLayerHeight);
    borderLayer.borderColor = [UIColor whiteColor].CGColor;
    borderLayer.borderWidth = kLineWidth;
    borderLayer.position = position;
    borderLayer.anchorPoint = anchorPoint;
    borderLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(transAngal), 0, 0, 1);
    [nextLayer addSublayer:borderLayer];
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:kAVBasicAniBounds];
    [maskLayer addAnimation:positionAni forKey:@"positionAni"];
    [borderLayer addAnimation:positionAni forKey:@"positionAni"];
    
    //nextLayer的blurImageAni
    {
        NSArray *values = @[@(1),@(1),@(0)];
        NSArray *times = @[@(0),@(0.6),@(1)];
        
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:values keyTimes:times];
        [nextLayer.photoLayer addAnimation:opacityAni forKey:@"opacityAni"];
    }
    
    //currentLayer的blurLayerAni
    {
        NSArray *values = @[@(0),@(0),@(1)];
        NSArray *times = @[@(0),@(0.3),@(1)];
        
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:values keyTimes:times];
        [blurLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
    }
    
}

- (void)AVSceneTransiteRomanticFogEffect{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval duration = 3;
    
    AVSTDirection ModDir = AVTransitionRightToLeft;
    
    CGPoint gradiendStartPoint = CGPointZero;
    CGPoint gradiendEndPoint   = CGPointZero;
    CGPoint gradiendFromPoint  = CGPointZero;
    CGPoint gradiendToPoint    = CGPointZero;
    CGRect  gradiendRect       = CGRectZero;
    CGPoint fogFromPoint       = CGPointZero;
    CGPoint fogToPoint         = CGPointZero;
    NSString *fogImageName     = @"";
    
    switch (ModDir) {
        case AVTransitionRightToLeft:
        {
            gradiendStartPoint = CGPointMake(1, 0);
            gradiendEndPoint   = CGPointMake(0, 0);
            gradiendFromPoint  = CGPointMake(kAVWindowWidth*2, kAVWindowHeight/2);
            gradiendToPoint    = CGPointMake(0, kAVWindowHeight/2);
            fogFromPoint       = CGPointMake(kAVWindowWidth*2, kAVWindowHeight/2);
            fogToPoint         = CGPointMake(kAVWindowWidth*0.2, kAVWindowHeight/2);
            fogImageName = @"fogMaskImageLeft";
            gradiendRect = CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight);
            break;
        }
        case AVTransitionLeftToRight:
        {
            gradiendStartPoint = CGPointMake(0, 0);
            gradiendEndPoint   = CGPointMake(1, 0);
            gradiendFromPoint  = CGPointMake(-kAVWindowWidth*2, kAVWindowHeight/2);
            gradiendToPoint    = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
            fogFromPoint       = CGPointMake(-kAVWindowWidth*2, kAVWindowHeight/2);
            fogToPoint         = CGPointMake(kAVWindowWidth*0.8, kAVWindowHeight/2);
            fogImageName = @"fogMaskImageRight";
            gradiendRect = CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight);
            break;
        }
        case AVTransitionTopToBottom:
        {
            gradiendStartPoint = CGPointMake(0, 0);
            gradiendEndPoint   = CGPointMake(0, 1);
            gradiendFromPoint  = CGPointMake(kAVWindowWidth/2, -2*kAVWindowHeight);
            gradiendToPoint    = CGPointMake(kAVWindowWidth/2, kAVWindowHeight);
            fogFromPoint       = CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*2);
            fogToPoint         = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.8);
            fogImageName = @"fogMaskImageDown";
            gradiendRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*2);
            break;
        }
        case AVTransitionBottomToTop:
        {
            gradiendStartPoint = CGPointMake(0, 1);
            gradiendEndPoint   = CGPointMake(0, 0);
            gradiendFromPoint  = CGPointMake(kAVWindowWidth/2, 2*kAVWindowHeight);
            gradiendToPoint    = CGPointMake(kAVWindowWidth/2, 0);
            fogFromPoint       = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*2);
            fogToPoint         = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.2);
            fogImageName = @"fogMaskImageUp";
            gradiendRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*2);
            break;
        }
        default:
            break;
    }
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *fogLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) withImage:[UIImage imageNamed:fogImageName]];
    fogLayer.position = kAVWindowCenter;
    [currentLayer addSublayer:fogLayer];

    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer:nextLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = gradiendRect;
    gradientLayer.colors = [self gradientColors];
    gradientLayer.startPoint = gradiendStartPoint;
    gradientLayer.endPoint = gradiendEndPoint;
    nextLayer.mask = gradientLayer;
    
    //gradientLayer ani
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:duration withBeginTime:beginTime+0.6 fromValue:[NSValue valueWithCGPoint:gradiendFromPoint] toValue:[NSValue valueWithCGPoint:gradiendToPoint] propertyName:kAVBasicAniPosition];
        [gradientLayer addAnimation:positionAni forKey:@"positionAni"];

    }
    //foglayer ani
    {
        CABasicAnimation *posationAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration withBeginTime:0 fromValue:fogFromPoint toValue:fogToPoint propertyName:kAVBasicAniPosition];
        
        CAKeyframeAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniOpacity values:@[@(0),@(1),@(0)] keyTimes:@[@(0.0),@(0.2),@(1.0)]];

        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[opactiyAni,posationAni]];

        [fogLayer addAnimation:groupAni forKey:@"opacityAni"];
    }
    
}

- (void)testBlur{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 4;
    
    UIImage *originalImage = [UIImage imageNamed:@"heng4.png"];
    
    CGFloat shapeLineOffsetY = (kAVWindowHeight/4)*3;
    
    UIImage *leftBlurImage = [[AVFilterPhoto alloc] filterGPUImage:originalImage filterType:AVImageFilterGaussianBlur];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:kAVRectWindow vContentRect:kAVRectWindow origalImage:originalImage blueImage:leftBlurImage];
    
    AVBottomLayer *topMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, shapeLineOffsetY) bgColor:[UIColor redColor].CGColor];
//    maskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-shapeLineOffsetY/6);
    [currentLayer.photoLayer.mask addSublayer:topMaskLayer];
    
    AVBottomLayer *bottomMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, shapeLineOffsetY/3) bgColor:[UIColor redColor].CGColor];
    bottomMaskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-shapeLineOffsetY/6);
    currentLayer.photoLayer.mask = bottomMaskLayer;
    
    
//    NSArray *opactiyValues = @[@(0),@(1),@(1),@(0)];
//    NSArray *opactiyTimes = @[@(0.0),@(0.4),@(0.6),@(1)];
//    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:opactiyValues keyTimes:opactiyTimes];
//    [maskLayer addAnimation:opacityAni forKey:@"opacityAni"];
    
    [homeLayer addSublayer:currentLayer];
}

#define kLineWidth kAVCeilfY(2)

- (void)pieceDiamondTitleTextAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+3;
    CFTimeInterval moveDuration = 4;
    
    CGFloat shapeLineOffsetY = (kAVWindowHeight/4)*3;
    CGFloat diamondLayerBgWidth =  70;
    CGFloat diamondLayerBgHeight = 16;
    CGFloat diamondLayerWidth = 12;
    CGFloat diamondMoveOffsetX = 20;
    CGFloat contentHeight = 800;
    
    UIImage *originalImage = [UIImage imageNamed:@"heng4.png"];
    
    UIImage *blurImage = [originalImage drn_boxblurImageWithBlur:0.3];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:CGRectMake(0, 0, kAVWindowWidth, contentHeight) withImage:originalImage];
    [homeLayer addSublayer:currentLayer];
    
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:AVScaleSlowDuration withBeginTime:beginTime fromValue:1.0f toValue:1.4f];
    [currentLayer.contentLayer addAnimation:saleToAni forKey:@"saleOutAni"];
    
    AVBottomLayer *currentBlurLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.contentLayer.bounds withImage:blurImage];
    [currentLayer.contentLayer addSublayer:currentBlurLayer];
    currentBlurLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    {
        AVBottomLayer *upMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, shapeLineOffsetY) bgColor:[UIColor redColor].CGColor];
        upMaskLayer.position = CGPointMake(kAVWindowWidth/2,  shapeLineOffsetY/2);
        [currentBlurLayer.maskLayer addSublayer:upMaskLayer];
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customBasic:1.5 withBeginTime:beginTime+0.5 fromValue:@(1) toValue:@(0) propertyName:kAVBasicAniOpacity];
        
        [upMaskLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    }
    
    
    {
        AVBottomLayer *downMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, shapeLineOffsetY/3) bgColor:[UIColor redColor].CGColor];
        downMaskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-shapeLineOffsetY/6);
        [currentBlurLayer.maskLayer addSublayer: downMaskLayer];
        
            [downMaskLayer addAnimation:saleToAni forKey:@"saleOutAni"];
        
        NSArray *opactiyValues = @[@(1),@(1),@(0)];
        NSArray *opactiyTimes = @[@(0.0),@(0.9),@(1.0)];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:opactiyValues keyTimes:opactiyTimes];
        [downMaskLayer addAnimation:opacityAni forKey:@"opacityAni"];
   
    }
    
    {
        CAShapeLayer *leftShape = [self createLineWithFromPoint:CGPointMake((kAVWindowWidth-diamondLayerBgWidth)/2, shapeLineOffsetY) toPoint:CGPointMake(0, shapeLineOffsetY)];
        [currentLayer addSublayer:leftShape];
    
        CABasicAnimation *leftShapeStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:0 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *leftShapeStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:moveDuration/2 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *leftShapeLineAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[leftShapeStrokeStar,leftShapeStrokeEnd]];
        [leftShape addAnimation:leftShapeLineAni forKey:@"leftShapeLineAni"];
    }
    
    {
        CAShapeLayer *rightShape = [self createLineWithFromPoint:CGPointMake((kAVWindowWidth+diamondLayerBgWidth)/2, shapeLineOffsetY) toPoint:CGPointMake(kAVWindowWidth, shapeLineOffsetY)];
        [currentLayer addSublayer:rightShape];
        
        CABasicAnimation *rightShapeStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:0 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *rightShapeStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:moveDuration/2 withBeginTime:moveDuration/2 fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *rightShapeLineAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[rightShapeStrokeStar,rightShapeStrokeEnd]];
        [rightShape addAnimation:rightShapeLineAni forKey:@"rightShapeLineAni"];
    }
    
    
    AVBottomLayer *diamondBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerBgWidth, diamondLayerBgHeight) bgColor:[UIColor clearColor].CGColor];
    diamondBgLayer.masksToBounds = YES;
    diamondBgLayer.position = CGPointMake(kAVWindowWidth/2, shapeLineOffsetY);
    [currentLayer addSublayer:diamondBgLayer];
    //菱形背景layer ani
    {
    NSArray *valuse = @[[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(360)]];
    NSArray *times = @[@(0.0),@(0.5),@(0.65),@(0.8)];
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniRotationZ values:valuse keyTimes:times];
    
    NSArray *opactiyValues = @[@(0),@(1),@(1),@(0)];
    NSArray *opactiyTimes = @[@(0.0),@(0.05),@(0.95),@(1)];
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:opactiyValues keyTimes:opactiyTimes];
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[opacityAni,transAni]];

    [diamondBgLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    {
        AVBottomLayer *oneDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        oneDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        [diamondBgLayer addSublayer:oneDiamondLayer];
        
        CGPoint onePoint = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        CGPoint twoPoint = CGPointMake(diamondLayerBgWidth/2-diamondMoveOffsetX, diamondLayerBgHeight/2);
        NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:onePoint]];
        NSArray *times = @[@(0.0),@(0.4),@(0.9),@(1.0)];
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        CAKeyframeAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:@[@(1),@(1),@(0)] keyTimes:@[@(0.0),@(0.9),@(1.0)]];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,opactiyAni]];

        [oneDiamondLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
    AVBottomLayer *twoDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
    twoDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
    [diamondBgLayer addSublayer:twoDiamondLayer];
    
    {
        AVBottomLayer *threeDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        threeDiamondLayer.position = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        [diamondBgLayer addSublayer:threeDiamondLayer];
        
        CGPoint onePoint = CGPointMake(diamondLayerBgWidth/2, diamondLayerBgHeight/2);
        CGPoint twoPoint = CGPointMake(diamondLayerBgWidth/2+diamondMoveOffsetX, diamondLayerBgHeight/2);
        NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:twoPoint],
                            [NSValue valueWithCGPoint:onePoint]];
        
        NSArray *times = @[@(0.0),@(0.4),@(0.9),@(1.0)];
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        CAKeyframeAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:@[@(1),@(1),@(0)] keyTimes:@[@(0.0),@(0.9),@(1.0)]];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,opactiyAni]];
        
        [threeDiamondLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    //文字Ani
    {
        CGFloat textLayerOffsetX = 160;
        NSString *textDesc = @"There is a little boy";
        VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
        textModel.textFontName = @"Helvetica-Bold";
        textModel.textFontColor = [UIColor whiteColor];
        textModel.textFontSize = 40;
        textModel.textContent = textDesc;
        AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
        CGSize textSize =  [helper boundingRectTextModel:textModel photoDesc:textDesc areaSize:CGSizeMake(kAVWindowWidth-textLayerOffsetX, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        CGFloat textHeight = MAX(textSize.height, shapeLineOffsetY/6);
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textHeight) text:helper.attributedString textModel:textModel];
        
        [currentLayer addSublayer:textLayer];
        
        CGPoint fromPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-diamondMoveOffsetX);
        CGPoint toPoint = CGPointMake(kAVWindowWidth/2, shapeLineOffsetY+textSize.height);
        
        NSArray *values = @[[NSValue valueWithCGPoint:fromPoint],
                            [NSValue valueWithCGPoint:toPoint],
                            [NSValue valueWithCGPoint:toPoint],
                            [NSValue valueWithCGPoint:fromPoint]
                            ];
        NSArray *times = @[@(0.4),@(0.55),@(0.9),@(1.0)];
        
        CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
        NSArray *opacityValues = @[@(0),@(1),@(1),@(0)];
        NSArray *opacityTimes = @[@(0.4),@(0.55),@(0.95),@(1.0)];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniOpacity values:opacityValues keyTimes:opacityTimes];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,opacityAni]];
        
        [textLayer addAnimation:groupAni forKey:@"groupAni"];
    
    }
}

- (CAShapeLayer *)createLineWithFromPoint:(CGPoint)fromPoint
                                  toPoint:(CGPoint)toPoint{
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:fromPoint];
    [linePath addLineToPoint:toPoint];
    CAShapeLayer *linelayer = [CAShapeLayer layer];
    linelayer.path = linePath.CGPath;
    linelayer.lineWidth = kLineWidth;
    linelayer.fillColor = [UIColor clearColor].CGColor;
    linelayer.strokeColor = [UIColor whiteColor].CGColor;
    return linelayer;
}

#define kDiamondTextDefaultHeight 70

- (void)pieceDiamondDescTextAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1;
    
    CGFloat offsetY = kAVCeilfY(70);
    CGFloat offsetX = kAVCeilfX(50);
    CGFloat diamondLayerWidth = kAVCeilfX(12);
    CGFloat diamondLayerMoveOffsetY = kAVCeilfY(35);
    CGFloat diamondLayerOffsetX = kAVCeilfX(15);
    CGFloat borderWidth = kAVCeilfX(4);
    CGFloat textDafluatHeight = kAVCeilfX(58);
    CGFloat intervalWidth = kAVCeilfX(10);
    CGFloat intervalHeight = kAVCeilfY(6);
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *textDesc = @"额哦IE见覅金佛IE剿匪记哈哈哈哈哈哈哈哈哈";
    VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
    textModel.textFontName = @"Helvetica-Bold";
    textModel.textFontColor = [UIColor whiteColor];
    textModel.textFontSize = kAVCeilfX(26);
    textModel.textContent = textDesc;
    AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
    CGSize textSize =  [helper boundingRectTextModel:textModel photoDesc:textDesc areaSize:CGSizeMake(kAVWindowWidth*0.75, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
    
    CGFloat borderHeight = MAX(textDafluatHeight, textSize.height);

    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, textSize.width+(2*intervalWidth), borderHeight) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
    bgLayer.position = CGPointMake(offsetX+textSize.width/2, kAVWindowHeight-offsetY-borderHeight/2);
    bgLayer.masksToBounds = YES;
    [currentLayer addSublayer:bgLayer];
    
    
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(0, 0, textSize.width+(borderWidth+intervalWidth)*2, borderHeight+borderWidth*2);
    borderLayer.borderColor = [UIColor whiteColor].CGColor;
    borderLayer.cornerRadius = 4;
    borderLayer.masksToBounds = YES;
    borderLayer.borderWidth = borderWidth;
    borderLayer.position = CGPointMake(offsetX+textSize.width/2, kAVWindowHeight-offsetY-borderHeight/2);
    [currentLayer addSublayer:borderLayer];
    
    {
        AVBottomLayer *oneDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        oneDiamondLayer.position = CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2);
        [currentLayer addSublayer:oneDiamondLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2) toValue:CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2-diamondLayerMoveOffsetY) propertyName:kAVBasicAniPosition];
        [oneDiamondLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    AVBottomLayer *twoDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
    twoDiamondLayer.position = CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2);
    [currentLayer addSublayer:twoDiamondLayer];
    
    {
        AVBottomLayer *threeDiamondLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, diamondLayerWidth, diamondLayerWidth) withImage:[UIImage imageNamed:@"diamondIcon"]];
        threeDiamondLayer.position = CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2);
        [currentLayer addSublayer:threeDiamondLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2) toValue:CGPointMake(offsetX-diamondLayerOffsetX, kAVWindowHeight-offsetY-borderHeight/2+diamondLayerMoveOffsetY) propertyName:kAVBasicAniPosition];
        [threeDiamondLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:textModel];
    textLayer.position = CGPointMake(textSize.width/2+5, borderHeight/2);
    textLayer.alignmentMode = kCAAlignmentLeft;
    [bgLayer addSublayer:textLayer];
    

    {
        CGRect fromRect = CGRectMake(0, 0, textSize.width+2*intervalWidth, 0);
        CGRect toRect = CGRectMake(0, 0, textSize.width+2*intervalWidth, borderHeight);
        CABasicAnimation *openAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:kAVBasicAniBounds];
        [bgLayer addAnimation:openAni forKey:@"openAni"];
        [borderLayer addAnimation:openAni forKey:@"openAni"];
    }

}


- (NSArray *)gradientColors{
    
    NSArray *colors = @[
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                            (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.99) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.95) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.9) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.8) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.7) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.6) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.5) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.4) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.3) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.2) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.1) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.05) CGColor],
                        (__bridge id)[UIColorFromRGBAlpha(0xffffff, 0.01) CGColor]];
    return colors;
}

- (void)newTextGradientLayer{
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:currentLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(kAVWindowWidth/2, 0)];
    [path addLineToPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight)];
    [path closePath];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = path.CGPath;
    lineLayer.lineWidth = 2;
    lineLayer.fillColor = [UIColor whiteColor].CGColor;
    lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    lineLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(7), 0, 0, 1);
    [currentLayer addSublayer:lineLayer];
    
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
//    CFTimeInterval moveDuration = 2;
//
//    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
//    [homeLayer addSublayer:currentLayer];
//
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(0,kAVWindowHeight, kAVWindowWidth, kAVWindowHeight*2);
//    gradientLayer.colors = [self gradientColors];
//    //0,1  0,0
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(0, 1);
//    [currentLayer addSublayer:gradientLayer];
//
//    CGPoint current = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*2);
////    [[gradientLayer valueForKey:@"position"]CGPointValue];
//
//    CGPoint newPoint = CGPointMake(current.x,current.y-3*kAVWindowHeight);
//    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:current] toValue:[NSValue valueWithCGPoint:newPoint] propertyName:kAVBasicAniPosition];
//    [gradientLayer addAnimation:positionAni forKey:@"positionAni"];
    
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
