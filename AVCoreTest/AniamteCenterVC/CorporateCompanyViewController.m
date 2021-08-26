//
//  CorporateCompanyViewController.m
//  AVCoreTest
//
//  Created by mac on 2017/5/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CorporateCompanyViewController.h"
#import "AVFundation.h"
#import "GifAnimationLayer.h"

#import "HotBasicAnimate.h"

#import "AVMediaComposionCommand.h"

#import "JNWSpringAnimation.h"

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

#import "AVPlayTextLayer.h"

#import "AVShapeBaseLayer.h"

#import "AVTimeLineLayer.h"

#import "AVTimeLineColorConstant.h"

#import "AVBasicGradientLayer.h"

#import "UIImage+BoxBlur.h"

#import "UIImage+ImageEffects.h"

#import "AVBasicTextLayer.h"

#import "AVTimeLineTextLayer.h"

#import "NSString+Additions.h"

#import "NSString+AVCore.h"

#define kMoreColorWidth     150

#define kMoreColor4Width     120

#define kDescTextOffsetX    40
#define kDefalutLineHeight  3
#define kDefalutInterval  10
#define kDefultFontValue    27
#define kDefalutTextFont  [UIFont systemFontOfSize:kDefultFontValue]

@implementation CorporateCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    homeLayer.masksToBounds = YES;
    
//    [self showBegineimageBlackWhite];
//    [self testMusciBlure2];
//    [self AVAniSTMoreColorSidewaysMoveGoNextClose];
    
 //  [self showMoreColorRalor];

    
//    [self showBegineCenterMoreColor];
    
   //[self showTwoColorDoubleParallelMove];
    
  //  [self showMoreColorRalor];
    
   // [self showMoreColorOpenCenterToUpDwon];
    
  //  [self showMoreColorOpenCenterToRightLeft];
    
  //  [self togetherParallelMoveSceneSwitch];

   // [self testLine];

//    [self testLine];
    
  //  [self FourPhtoInOneSenece];
    
    [self AVSceneAniThreeBothSlideWhiteFilter];
    
 //   [self AVSceneAniLeftNormalRightWhiteFilter];
    
  //  [self moveMaskLayer];
    
    
}

-(void)moveMaskLayer
{
    CGFloat duration = 1.5;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;

    
    AVBasicLayer *currentLayer1 = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer1];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"0"]];
    [homeLayer addSublayer:currentLayer];
    
    {
        
        CGPoint startNextPoint =  CGPointMake(-150,kAVWindowCenter.y);
        
        CGPoint endNextPoint = CGPointMake(150,kAVWindowCenter.y);

        AVBottomLayer *leftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,300, 800) bgColor:[UIColor blackColor].CGColor];
       
        currentLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        [currentLayer.maskLayer addSublayer: leftLayer];
        
        CABasicAnimation *moveNextCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startNextPoint toValue:endNextPoint];

        [leftLayer addAnimation:moveNextCenterAni forKey:@"moveNextCenterAni"];
        
    }
    
    
    {
        
        CGPoint startNextPoint =  CGPointMake(kAVWindowWidth+150,kAVWindowCenter.y);
        
        CGPoint endNextPoint = CGPointMake(kAVWindowWidth-150,kAVWindowCenter.y);
        
        AVBottomLayer *rightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,300, 600) bgColor:[UIColor blackColor].CGColor];
        
        currentLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        [currentLayer.maskLayer addSublayer: rightLayer];
        
        CABasicAnimation *moveNextCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startNextPoint toValue:endNextPoint];
        
        [rightLayer addAnimation:moveNextCenterAni forKey:@"moveNextCenterAni"];
        
    }
    
    
}

#define kTotalMoveWidth  840

- (void)AVSceneAniThreeBothSlideWhiteFilter
{
    CGFloat duration = 4.5;
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    
    UIImage *origImage = [UIImage imageNamed:@"shu2.jpeg"];
    
    CGFloat subWidth = origImage.size.width*kAVWindowWidth/origImage.size.height;
    
    CGRect subRect = CGRectMake(0, 0, subWidth, kAVWindowHeight);
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0, subWidth*3, kAVWindowHeight)];
    bgLayer.position = kAVWindowCenter;
    bgLayer.anchorPoint = CGPointMake(0, 0.5);
    bgLayer.backgroundColor = [UIColor redColor].CGColor;

    [homeLayer addSublayer:bgLayer];
    
    CABasicAnimation *saleToOne = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
    
    
    UIImage *blurImage = [[AVFilterPhoto alloc] filterGPUImage:origImage
                                                           filterType:AVImageFilterBlackWhite
                                                           blurRadius:20];
    
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:subRect
                                                     vContentRect:subRect
                                                        withImage:blurImage];
    leftLayer.position =  CGPointMake(subWidth/2, kAVWindowCenter.y);

    [bgLayer addSublayer: leftLayer];
    
    
    [leftLayer.contentLayer addAnimation:saleToOne forKey:@"saleToOne"];
    
    AVBottomLayer *maskLeftLayer = [[AVBottomLayer alloc] initWithFrame:leftLayer.bounds bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor];
    [leftLayer addSublayer: maskLeftLayer];
    
    AVBasicLayer *centerLayer = [[AVBasicLayer alloc] initWithFrame:subRect
                                                     vContentRect:subRect
                                                        withImage:origImage];
    centerLayer.position =  CGPointMake(bgLayer.width/2, kAVWindowCenter.y);
    [bgLayer addSublayer: centerLayer];
    [centerLayer.contentLayer addAnimation:saleToOne forKey:@"saleToOne"];
    
    AVBasicLayer *rightLayer = [[AVBasicLayer alloc] initWithFrame:subRect
                                                       vContentRect:subRect
                                                          withImage:blurImage];
    [bgLayer addSublayer: rightLayer];
    [rightLayer.contentLayer addAnimation:saleToOne forKey:@"saleToOne"];
    rightLayer.position = CGPointMake(bgLayer.width-(subWidth/2), kAVWindowCenter.y);
    
    AVBottomLayer *maskRightLayer = [[AVBottomLayer alloc] initWithFrame:leftLayer.bounds bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor];
    [rightLayer addSublayer: maskRightLayer];
    
    CABasicAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration
                                                                          withBeginTime:beginTime
                                                                              fromValue:CGPointMake(0, kAVWindowCenter.y)
                                                                                toValue:CGPointMake(-(subWidth*3 - kAVWindowWidth), kAVWindowCenter.y)];
    
    [bgLayer addAnimation:centerMoveAni forKey:@"thressMoreAni"];
}

- (void)AVSceneAniLeftNormalRightWhiteFilter
{
    
    CGFloat duration = 6.0;
    
    CGFloat subWidth = kAVWindowWidth / 3;
    
    CGRect subRect = CGRectMake(0, 0, subWidth, kAVWindowHeight);
    
    CGRect leftRect = CGRectMake(0, 0, subWidth*2, kAVWindowHeight);
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    UIImage *origImage = [UIImage imageNamed:@"shu2.png"];
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight)];
    bgLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:bgLayer];
    
    CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:1 toValue:1.06];
    
    CABasicAnimation *saleTIn =  [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:1.06 toValue:1];
    
    
    UIImage *blurImage = [[AVFilterPhoto alloc] filterGPUImage:origImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:leftRect
                                                     vContentRect:leftRect
                                                        withImage:origImage];
    [bgLayer addSublayer: leftLayer];
    [leftLayer.contentLayer addAnimation:saleToOne forKey:@"saleToOne"];
    
    
    AVBasicLayer *rightLayer = [[AVBasicLayer alloc] initWithFrame:subRect
                                                      vContentRect:subRect
                                                         withImage:blurImage];
    [bgLayer addSublayer: rightLayer];
    [rightLayer.contentLayer addAnimation:saleTIn forKey:@"saleToOne"];
    rightLayer.position = CGPointMake(kAVWindowWidth-(subWidth/2), kAVWindowCenter.y);
    
    AVBottomLayer *maskRightLayer = [[AVBottomLayer alloc] initWithFrame:leftLayer.bounds bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor];
    [rightLayer addSublayer: maskRightLayer];
    
    
    
    
    
    
}

-(void)testLine
{
    
    CGFloat duration = 3.0f;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    

    CGFloat offsetX = 200.0f;
    CGFloat offsetY = 200.0f;
    
    UIBezierPath *leftUpPath = [UIBezierPath bezierPath];
    [leftUpPath moveToPoint:CGPointMake(offsetX, offsetY)];
    [leftUpPath addLineToPoint:CGPointMake(offsetX, 2*offsetY)];

    
    CAShapeLayer *leftUpPathLayer = [CAShapeLayer layer];
    leftUpPathLayer.path = leftUpPath.CGPath;
    leftUpPathLayer.fillColor = [UIColor clearColor].CGColor;
    leftUpPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    leftUpPathLayer.lineWidth = 3;
    [homeLayer addSublayer:leftUpPathLayer];
    
    NSArray *nextBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:1],
                                  ];
    NSArray *nextBoundCenterValues = @[@0, @(1), @(1),@(0.0)];
    CAKeyframeAnimation *boundsNextAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:@"strokeEnd" values:nextBoundCenterValues keyTimes:nextBoundKeyTime];
    
    [leftUpPathLayer addAnimation:boundsNextAni forKey:@"boundsNextAni"];

}



-(void)FourPhtoInOneSenece
{
    CGFloat duration = 1.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CABasicAnimation *saleToOne = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
    

    
    AVBasicLayer *upLeftLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindowRD4
                                                        vContentRect:kAVRectWindowRD4
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    upLeftLayer.position = CGPointMake(kAVWindowWidth/4, kAVWindowHeight/4);
    
    [upLeftLayer.contentLayer addAnimation: saleToOne forKey:@"saleToOne"];
    
    [homeLayer addSublayer:upLeftLayer];
    
    
    UIImage *upRightBlurImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"0.png"]
                                                            filterType:AVImageFilterBlackWhite
                                                            blurRadius:20];
    
    AVBasicLayer *upRightLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindowRD4
                                                    vContentRect:kAVRectWindowRD4
                                                       withImage:upRightBlurImage];
    upRightLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/4);
    [upRightLayer.contentLayer addAnimation: saleToOne forKey:@"saleToOne"];
    
    [homeLayer addSublayer:upRightLayer];
    
    
    UIImage *downLeftImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                              filterType:AVImageFilterBlackWhite
                                                              blurRadius:20];
    AVBasicLayer *downLeftLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindowRD4
                                                    vContentRect:kAVRectWindowRD4
                                                       withImage:downLeftImage];
    downLeftLayer.position = CGPointMake(kAVWindowWidth/4, kAVWindowHeight*0.75);
    [downLeftLayer.contentLayer addAnimation: saleToOne forKey:@"saleToOne"];
    
    [homeLayer addSublayer:downLeftLayer];
    
    
    AVBasicLayer *downRightLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindowRD4
                                                    vContentRect:kAVRectWindowRD4
                                                       withImage:[UIImage imageNamed:@"1.png"]];
    downRightLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight*0.75);
    [downRightLayer.contentLayer addAnimation: saleToOne forKey:@"saleToOne"];
    
    [homeLayer addSublayer:downRightLayer];
    
    
    AVBottomLayer *verticalLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0,kAVWindowWidth, kDefalutLineHeight*1.5) bgColor:[UIColor whiteColor].CGColor];
    verticalLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:verticalLayer];
    
    AVBottomLayer *horizontalLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0,kDefalutLineHeight*1.5, kAVWindowHeight) bgColor:[UIColor whiteColor].CGColor];
    horizontalLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:horizontalLayer];
}

-(void)togetherParallelMoveSceneSwitch
{
    CGFloat duration = 3.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    //next Layer
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: nextLayer];
    
    
    
    CGPoint nextStartCenter =  kAVWindowCenter;

    CGPoint currentEndCenter =  kAVWindowCenter;
    
    NSInteger transiteFactor = AVAniMoveMustTopToBottom;
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
         
            nextStartCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            nextStartCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            nextStartCenter = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustBottomToTop:
        {
            nextStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowCenter.x,-kAVWindowCenter.y);
            break;
        }
            
        default:
            break;
            
    }
    
    
    CABasicAnimation *nextMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                    fromValue:nextStartCenter
                                                                      toValue:kAVWindowCenter];
    nextMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    nextMoveAni.fillMode=kCAFillModeBackwards;
    [nextLayer addAnimation:nextMoveAni forKey:@"nextMoveAni"];
    

    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                      fromValue:kAVWindowCenter
                                                                        toValue:currentEndCenter];
    currentMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    currentLayer.fillMode=kCAFillModeForwards;
    [currentLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
}

-(void)showMoreColorOpenCenterToRightLeft
{
    CGFloat duration = 1.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];

    [homeLayer addSublayer: currentLayer];
    
    //next Layer
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: nextLayer];
    
    NSArray *nextBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:1],
                                  ];
    NSArray *nextBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  currentLayer.height)],
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, currentLayer.width,kAVWindowHeight)],
                                       ];
    CAKeyframeAnimation *boundsNextAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:nextBoundCenterValues keyTimes:nextBoundKeyTime];
    
    [nextLayer.maskLayer addAnimation:boundsNextAni forKey:@"boundsNextAni"];
    
    
    // CGFloat v = kAVWindowCenter.y / duration;
    
    NSArray *lastBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  currentLayer.height)],
                                       [NSValue valueWithCGRect:CGRectMake(0, 0,kMoreColor4Width, currentLayer.height)],
                                       ];
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration*0.2 withBeginTime:0 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:nextBoundKeyTime];
    
    //downBlackWhiteLayer
    {
        AVBottomLayer *downBlackWhiteLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, kMoreColor4Width,nextLayer.height) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor];
        downBlackWhiteLayer.anchorPoint =CGPointMake(0,0.5);
        [currentLayer addSublayer: downBlackWhiteLayer];
        
        CABasicAnimation *downMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:0 fromValue:kAVWindowCenter
                                                                            toValue:CGPointMake(kAVWindowWidth, kAVWindowCenter.y)];
        
        CAAnimationGroup *dwonGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[boundsAni,downMoveAni]];
        
        [downBlackWhiteLayer addAnimation:dwonGroupAni forKey:@"dwonGroupAni"];
        
    }
    
    //upBlackWhiteLayer
    {
        AVBottomLayer *upBlackWhiteLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0,kMoreColor4Width, nextLayer.height) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor];
        upBlackWhiteLayer.anchorPoint =CGPointMake(1, 0.5);
        [currentLayer addSublayer: upBlackWhiteLayer];
        
        CABasicAnimation *upMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:0 fromValue:kAVWindowCenter
                                                                          toValue:CGPointMake(0, kAVWindowCenter.y)];
        
        CAAnimationGroup *upGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[boundsAni,upMoveAni]];
        
        [upBlackWhiteLayer addAnimation:upGroupAni forKey:@"downMoveAni"];
    }
    
    
    CFTimeInterval barDuration = (1+0.17)*duration;
    
    CAKeyframeAnimation *boundBarAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration*0.36 withBeginTime:0 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:nextBoundKeyTime];
    //barColorDownLayer
    {
        AVBottomLayer *barColorDownLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(kAVWindowCenter.x,0, kMoreColor4Width,nextLayer.height) bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
        barColorDownLayer.anchorPoint =CGPointMake(1,0.5);
        [nextLayer addSublayer: barColorDownLayer];
        
        CABasicAnimation *downbarMoveAni = [[AVBasicRouteAnimate alloc]
                                            moveXYCenterTo:barDuration withBeginTime:0 fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)
                                            toValue:CGPointMake( kAVWindowWidth+kMoreColor4Width,kAVWindowCenter.y)];
        
        CAAnimationGroup *downbarGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:barDuration withBeginTime:beginTime aniArr:@[boundBarAni,downbarMoveAni]];
        
        [barColorDownLayer addAnimation:downbarGroupAni forKey:@"dwonGroupAni"];
    }
    
    //barColorUpLayer
    {
        AVBottomLayer *barColorUpLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(kAVWindowCenter.x, 0, kMoreColor4Width, nextLayer.height) bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
        barColorUpLayer.anchorPoint =CGPointMake(0, 0.5);
        [nextLayer addSublayer: barColorUpLayer];
        
        
        CABasicAnimation *upbarMoveAni = [[AVBasicRouteAnimate alloc]
                                          moveXYCenterTo:barDuration withBeginTime:0 fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)
                                          toValue:CGPointMake(-kMoreColor4Width, kAVWindowCenter.y)];
        
        CAAnimationGroup *upbarGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:barDuration withBeginTime:beginTime aniArr:@[boundBarAni,upbarMoveAni]];
        [barColorUpLayer addAnimation:upbarGroupAni forKey:@"dwonGroupAni"];
    }
}

-(void)showMoreColorOpenCenterToUpDwon
{
    
    CGFloat duration = 10;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
//    UIImage *imageBlackWhite = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"0.png"]
//                                                           filterType:AVImageFilterBlackWhite
//                                                          blurRadius:20];
//    
//    currentLayer.blurLayer.frame = currentLayer.bounds;
//    currentLayer.blurLayer.contents = (id)imageBlackWhite.CGImage;
    [homeLayer addSublayer: currentLayer];
    
    //next Layer
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: nextLayer];
    
    NSArray *nextBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:1],
                                  ];
    NSArray *nextBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, currentLayer.width,  0)],
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, currentLayer.width,kAVWindowHeight)],
                                       ];
    CAKeyframeAnimation *boundsNextAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:nextBoundCenterValues keyTimes:nextBoundKeyTime];
    
    [nextLayer.maskLayer addAnimation:boundsNextAni forKey:@"boundsNextAni"];
    
    
  // CGFloat v = kAVWindowCenter.y / duration;
    
    NSArray *lastBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, currentLayer.width,  0)],
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, currentLayer.width,kMoreColor4Width)],
                                       ];
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration*0.2 withBeginTime:0 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:nextBoundKeyTime];
    
    //downBlackWhiteLayer
    {
        AVBottomLayer *downBlackWhiteLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, nextLayer.width, kMoreColor4Width) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor];
        downBlackWhiteLayer.anchorPoint =CGPointMake(0.5, 0);
        [currentLayer addSublayer: downBlackWhiteLayer];
    
        CABasicAnimation *downMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:0 fromValue:kAVWindowCenter
                                             toValue:CGPointMake(kAVWindowCenter.x, kAVWindowHeight)];
        
        CAAnimationGroup *dwonGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[boundsAni,downMoveAni]];
        
        [downBlackWhiteLayer addAnimation:dwonGroupAni forKey:@"dwonGroupAni"];
        
    }
    
    //upBlackWhiteLayer
    {
        AVBottomLayer *upBlackWhiteLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, nextLayer.width, kMoreColor4Width) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor];
        upBlackWhiteLayer.anchorPoint =CGPointMake(0.5, 1);
        [currentLayer addSublayer: upBlackWhiteLayer];
        
        CABasicAnimation *upMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:0 fromValue:kAVWindowCenter
                                         toValue:CGPointMake(kAVWindowCenter.x, 0)];
        
        CAAnimationGroup *upGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[boundsAni,upMoveAni]];
        
        [upBlackWhiteLayer addAnimation:upGroupAni forKey:@"downMoveAni"];
    }
    
    
    CFTimeInterval barDuration = (1+0.17)*duration;
    
    CAKeyframeAnimation *boundBarAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration*0.36 withBeginTime:0 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:nextBoundKeyTime];
    //barColorDownLayer
    {
        AVBottomLayer *barColorDownLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,kAVWindowCenter.y, nextLayer.width, kMoreColor4Width) bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
        barColorDownLayer.anchorPoint =CGPointMake(0.5, 1);
        [nextLayer addSublayer: barColorDownLayer];
        
        CABasicAnimation *downbarMoveAni = [[AVBasicRouteAnimate alloc]
                                         moveXYCenterTo:barDuration withBeginTime:0 fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)
                                         toValue:CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kMoreColor4Width)];
        
        CAAnimationGroup *downbarGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:barDuration withBeginTime:beginTime aniArr:@[boundBarAni,downbarMoveAni]];
        
        [barColorDownLayer addAnimation:downbarGroupAni forKey:@"dwonGroupAni"];
    }
    
    //barColorUpLayer
    {
        AVBottomLayer *barColorUpLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,kAVWindowCenter.y, nextLayer.width, kMoreColor4Width) bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
        barColorUpLayer.anchorPoint =CGPointMake(0.5, 0 );
        [nextLayer addSublayer: barColorUpLayer];

        
        CABasicAnimation *upbarMoveAni = [[AVBasicRouteAnimate alloc]
                                            moveXYCenterTo:barDuration withBeginTime:0 fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)
                                            toValue:CGPointMake(kAVWindowCenter.x, -kMoreColor4Width)];
        
        CAAnimationGroup *upbarGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:barDuration withBeginTime:beginTime aniArr:@[boundBarAni,upbarMoveAni]];
        [barColorUpLayer addAnimation:upbarGroupAni forKey:@"dwonGroupAni"];
    }
}

-(void)showBegineimageBlackWhite
{
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    UIImage *imageBlackWhite = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"0.png"]
                                                          filterType:AVImageFilterBlackWhite
                                                          blurRadius:20];
    
    currentLayer.blurLayer.frame = currentLayer.bounds;
    currentLayer.blurLayer.contents = (id)imageBlackWhite.CGImage;
    [homeLayer addSublayer: currentLayer];
    
    
    
    AVBottomLayer *barColorBeforeLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, currentLayer.width, kMoreColorWidth) bgColor:[UIColor blackColor].CGColor];
    
    [currentLayer.blurLayer setMask:barColorBeforeLayer];
}

-(void)showTwoColorDoubleParallelMove  // 两个颜色平行移动
{
    CGFloat duration = 1.2;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    UIImage *imageBlackWhite = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"0.png"]
                                                          filterType:AVImageFilterBlackWhite
                                                          blurRadius:20];
    currentLayer.blurLayer.frame = currentLayer.bounds;
    currentLayer.blurLayer.contents = (id)imageBlackWhite.CGImage;
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: nextLayer];
    
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    AVBottomLayer *barColorBeforeLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, currentLayer.width, kMoreColorWidth) bgColor:[UIColor blackColor].CGColor];
    [currentLayer.blurLayer setMask:barColorBeforeLayer];
    
    AVBottomLayer *barColorEndLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, nextLayer.width, kMoreColorWidth) bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
    
    [nextLayer addSublayer: barColorEndLayer];
    
    
    CGPoint startPoint = CGPointZero;
    
    CGPoint endPoint =  kAVWindowCenter;
    
    CGPoint barColorBeforeStartCenter =  kAVWindowCenter;
    
    CGPoint barColorBeforeEndCenter =  kAVWindowCenter;
    
    CGPoint barColorAnchorPoint = CGPointMake(0.5, 0);
    
    CGPoint barColorNextStartCenter =  kAVWindowCenter;
    
    CGPoint barColorNextEndCenter =  kAVWindowCenter;
    
    NSInteger transiteFactor= AVAniMoveMustRightToLeft;
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            barColorBeforeLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            barColorEndLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            
            startPoint = CGPointMake(kAVWindowWidth+kAVWindowCenter.x+kMoreColorWidth, kAVWindowCenter.y);
            
            barColorBeforeStartCenter = CGPointMake(kAVWindowWidth, kAVWindowCenter.y);
            
            barColorBeforeEndCenter  =  CGPointMake(-kMoreColorWidth,kAVWindowCenter.y);
            
            barColorAnchorPoint = CGPointMake(0, 0.5);
            
            barColorNextStartCenter = CGPointMake(kAVWindowWidth+kMoreColorWidth, kAVWindowCenter.y);
            
            barColorNextEndCenter  =  CGPointMake(-(1*kMoreColorWidth), kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            barColorBeforeLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            barColorEndLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            
            startPoint = CGPointMake(-kAVWindowCenter.x-kMoreColorWidth, kAVWindowCenter.y);
            
            barColorBeforeStartCenter = CGPointMake(0, kAVWindowCenter.y);
            
            barColorBeforeEndCenter  =  CGPointMake(kAVWindowWidth+kMoreColorWidth,kAVWindowCenter.y);
            
            barColorAnchorPoint = CGPointMake(1, 0.5);
            
            barColorNextStartCenter = CGPointMake(-kMoreColorWidth, kAVWindowCenter.y);
            
            barColorNextEndCenter  =  CGPointMake(kAVWindowWidth+kMoreColorWidth, kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            startPoint = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y-kMoreColorWidth);
            
            barColorBeforeStartCenter = CGPointMake(kAVWindowCenter.x, -kMoreColorWidth);
            
            barColorBeforeEndCenter  =  CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
            
            barColorAnchorPoint = CGPointMake(0.5, 0);
            
            barColorNextStartCenter = CGPointMake(kAVWindowCenter.x, -(2*kMoreColorWidth));
            
            barColorNextEndCenter  =  CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
        }
            
        case AVAniMoveMustBottomToTop:
        {
            startPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y+kMoreColorWidth);
            
            barColorBeforeStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kMoreColorWidth);
            
            barColorBeforeEndCenter  =  CGPointMake(kAVWindowCenter.x, 0);
            
            barColorAnchorPoint = CGPointMake(0.5, 1);
            
            barColorNextStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+(2*kMoreColorWidth));
            
            barColorNextEndCenter  =  CGPointMake(kAVWindowCenter.x, 0);
        }
            
        default:
            break;
            
    }
    
    barColorBeforeLayer.position = barColorBeforeStartCenter;
    barColorBeforeLayer.anchorPoint = barColorAnchorPoint;
    
    barColorEndLayer.position = barColorNextStartCenter;
    barColorEndLayer.anchorPoint = barColorAnchorPoint;
    
    CABasicAnimation *barColorBeforeAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:barColorBeforeStartCenter toValue:barColorBeforeEndCenter];
    [barColorBeforeLayer addAnimation:barColorBeforeAni forKey:@"moveCenterAni"];
    
    CABasicAnimation *barColorEndAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:(1+0.14)*duration withBeginTime:beginTime fromValue:barColorNextStartCenter toValue:barColorNextEndCenter];
    [barColorEndLayer addAnimation:barColorEndAni forKey:@"moveCenterAni"];
    
    
    CABasicAnimation *moveNextCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPoint toValue:endPoint];
    [nextLayer.maskLayer addAnimation:moveNextCenterAni forKey:@"moveCenterAni"];
}

-(void)showMoreColorRalor // 两个颜色平行移动
{
    CGFloat duration = 1.4;
    
    CGFloat moveduration = 0.8;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];

    
    [nextLayer setMask: nextLayer.maskLayer];
    
    AVBottomLayer *barColorBeforeLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, nextLayer.width, kMoreColorWidth) bgColor:[[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor];
    
    [currentLayer addSublayer: barColorBeforeLayer];
    
    AVBottomLayer *barColorEndLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0,0, nextLayer.width, kMoreColorWidth) bgColor:[[UIColor brownColor]colorWithAlphaComponent:0.4].CGColor];
    
    [nextLayer addSublayer: barColorEndLayer];

    
    CGPoint startPoint = CGPointZero;
    
    CGPoint endPoint =  kAVWindowCenter;
    
    CGPoint barColorBeforeStartCenter =  kAVWindowCenter;
    
    CGPoint barColorBeforeEndCenter =  kAVWindowCenter;
    
    CGPoint barColorAnchorPoint = CGPointMake(0.5, 0);
    
    CGPoint barColorNextStartCenter =  kAVWindowCenter;
    
    CGPoint barColorNextEndCenter =  kAVWindowCenter;
    
    NSInteger transiteFactor= AVAniMoveMustRightToLeft;
    
//    CGFloat v = currentLayer.width / duration;
//    
//    CGFloat offsetTime = kMoreColorWidth/v;
    
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            barColorBeforeLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            barColorEndLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            
            startPoint = CGPointMake(kAVWindowWidth+kAVWindowCenter.x+kMoreColorWidth, kAVWindowCenter.y);
            
            barColorBeforeStartCenter = CGPointMake(kAVWindowWidth, kAVWindowCenter.y);
            
            barColorBeforeEndCenter  =  CGPointMake(-kMoreColorWidth,kAVWindowCenter.y);
            
            barColorAnchorPoint = CGPointMake(0, 0.5);
            
            barColorNextStartCenter = CGPointMake(kAVWindowWidth+kMoreColorWidth, kAVWindowCenter.y);
            
            barColorNextEndCenter  =  CGPointMake(-(1*kMoreColorWidth), kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            barColorBeforeLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            barColorEndLayer.size = CGSizeMake(kMoreColorWidth, kAVWindowHeight);
            
            startPoint = CGPointMake(-kAVWindowCenter.x-kMoreColorWidth, kAVWindowCenter.y);
            
            barColorBeforeStartCenter = CGPointMake(0, kAVWindowCenter.y);
            
            barColorBeforeEndCenter  =  CGPointMake(kAVWindowWidth+kMoreColorWidth,kAVWindowCenter.y);
            
            barColorAnchorPoint = CGPointMake(1, 0.5);
            
            barColorNextStartCenter = CGPointMake(-kMoreColorWidth, kAVWindowCenter.y);
            
            barColorNextEndCenter  =  CGPointMake(kAVWindowWidth+kMoreColorWidth, kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            startPoint = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y-kMoreColorWidth);
            
            barColorBeforeStartCenter = CGPointMake(kAVWindowCenter.x, -kMoreColorWidth);
            
            barColorBeforeEndCenter  =  CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
            
            barColorAnchorPoint = CGPointMake(0.5, 0);
            
            barColorNextStartCenter = CGPointMake(kAVWindowCenter.x, -(2*kMoreColorWidth));
            
            barColorNextEndCenter  =  CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
        }
            
         case AVAniMoveMustBottomToTop:
        {
            startPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y+kMoreColorWidth);
            
            barColorBeforeStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kMoreColorWidth);
            
            barColorBeforeEndCenter  =  CGPointMake(kAVWindowCenter.x, 0);
            
            barColorAnchorPoint = CGPointMake(0.5, 1);
            
            barColorNextStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+(2*kMoreColorWidth));
            
            barColorNextEndCenter  =  CGPointMake(kAVWindowCenter.x, 0);
        }
            
        default:
            break;

    }
    
    barColorBeforeLayer.position = barColorBeforeStartCenter;
    barColorBeforeLayer.anchorPoint = barColorAnchorPoint;
    
    barColorEndLayer.position = barColorNextStartCenter;
    barColorEndLayer.anchorPoint = barColorAnchorPoint;
    
    CABasicAnimation *barColorBeforeAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:barColorBeforeStartCenter toValue:barColorBeforeEndCenter];
    [barColorBeforeLayer addAnimation:barColorBeforeAni forKey:@"moveCenterAni"];
    
    CABasicAnimation *barColorEndAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:(1+0.14)*duration withBeginTime:beginTime fromValue:barColorNextStartCenter toValue:barColorNextEndCenter];
    [barColorEndLayer addAnimation:barColorEndAni forKey:@"moveCenterAni"];
    
    
    CABasicAnimation *moveNextCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPoint toValue:endPoint];
    [nextLayer.maskLayer addAnimation:moveNextCenterAni forKey:@"moveCenterAni"];
}

-(void)AVAniSTMoreColorSidewaysMoveGoNextClose
{
    CGFloat BgDuration = 1.7;
    
    CGFloat moveduration = 0.8;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    [homeLayer addSublayer: nextLayer];
    
    [nextLayer setMask: nextLayer.maskLayer];
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CGFloat layerWidth = kAVWindowWidth/sqrtl(2);
    CGFloat layerHeight = kAVWindowHeight*sqrtl(2);
    currentLayer.masksToBounds = YES;
    
    AVBottomLayer *lastTopLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-layerWidth)/2, (kAVWindowHeight-layerHeight)/2, layerWidth, layerHeight) bgColor:UIColorFromRGBAlpha(0x8957a1, 0.8).CGColor];
    lastTopLayer.anchorPoint = CGPointMake(0, 0.5);
    lastTopLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    [currentLayer addSublayer:lastTopLayer];
    
    AVBottomLayer *lastBottomLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-layerWidth)/2, (kAVWindowHeight-layerHeight)/2, layerWidth, layerHeight) bgColor:UIColorFromRGBAlpha(0x8957a1, 0.8).CGColor];
    lastBottomLayer.anchorPoint = CGPointMake(1, 0.5);
    lastBottomLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    [currentLayer addSublayer:lastBottomLayer];
    NSArray *lastBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  
                                  [NSNumber numberWithFloat:1],
                                  ];
    
    NSArray *lastBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  layerHeight)],
                                       
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, layerWidth,layerHeight)],
                                       ];
    
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveduration withBeginTime:beginTime+1 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:lastBoundKeyTime];
    
    [lastTopLayer addAnimation:boundsAni forKey:nil];
    [lastBottomLayer addAnimation:boundsAni forKey:nil];
    NSArray *colorArr = @[
                          (__bridge id)UIColorFromRGBAlpha(0xf39700, 0.9).CGColor,
                          
                          (__bridge id)UIColorFromRGBAlpha(0x7ecef4, 0.9).CGColor,
                          ];
    
    for (int i = 0; i < colorArr.count; i++) {
        
        AVBottomLayer *topLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-layerWidth)/2, (kAVWindowHeight-layerHeight)/2, layerWidth/3, layerHeight) bgColor:(__bridge CGColorRef)(colorArr[i])];
        topLayer.anchorPoint = CGPointMake(0, 0.5);
        topLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        [currentLayer addSublayer:topLayer];
        
        AVBottomLayer *bottomLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-layerWidth)/2, (kAVWindowHeight-layerHeight)/2, layerWidth/3, layerHeight) bgColor:(__bridge CGColorRef)(colorArr[i])];
        bottomLayer.anchorPoint = CGPointMake(1, 0.5);
        bottomLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        [currentLayer addSublayer:bottomLayer];
        NSArray *boundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  
                                  [NSNumber numberWithFloat:1],
                                  ];
        
        NSArray *boundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  layerHeight)],
                                       
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, layerWidth/3,layerHeight)],
                                       ];
        
        NSArray *moveKeyTime = @[
                                 [NSNumber numberWithFloat:0],
                                 
                                 [NSNumber numberWithFloat:1],
                                 ];
        
        NSArray *topMoveCenterValues = @[
                                         [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y )],
                                         
                                         [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth, 0)],
                                         ];
        NSArray *bottomMoveCenterValues = @[
                                            [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y )],
                                            
                                            [NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight)],
                                            ];
        
        CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:0.5 withBeginTime:i*0.4 propertyName:kAVBasicAniBounds values:boundCenterValues keyTimes:boundKeyTime];
        
        CAKeyframeAnimation *topCenterMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveduration withBeginTime:0.4+i*0.4 propertyName:kAVBasicAniPosition values:topMoveCenterValues keyTimes:moveKeyTime];
        CAKeyframeAnimation *bottomCenterMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveduration withBeginTime:0.4+i*0.4 propertyName:kAVBasicAniPosition values:bottomMoveCenterValues keyTimes:moveKeyTime];
        
        
        CAAnimationGroup *topGroupAni = [[AVBasicRouteAnimate alloc] groupAni:BgDuration withBeginTime:beginTime aniArr:@[boundsAni,topCenterMoveAni]];
        CAAnimationGroup *bottomGroupAni = [[AVBasicRouteAnimate alloc] groupAni:BgDuration withBeginTime:beginTime aniArr:@[boundsAni, bottomCenterMoveAni]];
        
        [topLayer addAnimation:topGroupAni forKey:nil];
        [bottomLayer addAnimation:bottomGroupAni forKey:nil];
        
    }
    
    //colse
    CGFloat offsetValue = 130;
    
    nextLayer.maskLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
    
    nextLayer.maskLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    
    CGFloat newSize = kAVWindowWidth+(offsetValue*2);
    
    AVBottomLayer *nextLeftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, newSize/2,  newSize)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    nextLeftLayer.anchorPoint = CGPointMake(0, 0);
    [nextLayer.maskLayer addSublayer: nextLeftLayer];
    
    CABasicAnimation *nextLeftMoveAni = [[AVBasicRouteAnimate alloc]
                                         moveXYCenterTo:0.5 withBeginTime:beginTime+1.5 fromValue:CGPointMake(-(newSize/2), 0)
                                         toValue:CGPointMake(0, 0)];
    
    nextLeftMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(newSize/2, 0, newSize/2,  newSize)
                                                                 bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0);
    [nextLayer.maskLayer addSublayer: nextRightLayer];
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate alloc]
                                          moveXYCenterTo:0.5 withBeginTime:beginTime+1.5 fromValue:CGPointMake(newSize, 0)
                                          toValue:CGPointMake(newSize/2, 0)];
    
    nextRightMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];
}

-(void)testMusciBlure3
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:CGPointMake(100, 0) toValue:CGPointMake(300, 0)];
    
    [currentLayer addAnimation: nextRightMoveAni forKey:@"sd"];
    
    
    UIToolbar *bgToooBar = [[UIToolbar alloc] initWithFrame: currentLayer.bounds];
    
    bgToooBar.barStyle = UIBarStyleDefault;
    
    [self.view addSubview: bgToooBar];
}

-(void)testMusciBlure2
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:CGPointMake(100, 0) toValue:CGPointMake(300, 0)];
    
    [currentLayer addAnimation: nextRightMoveAni forKey:@"sd"];
    
    
    UIToolbar *bgToooBar = [[UIToolbar alloc] initWithFrame: currentLayer.bounds];
    
    bgToooBar.barStyle = UIBarStyleDefault;
    
    [self.view addSubview: bgToooBar];
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
