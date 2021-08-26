//
//  VcoreTest6ViewController.m
//  AVCoreTest
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "VcoreTest6ViewController.h"
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

#define paramSale           2*1.6

#define paramSaleTwo        4*1.6

#define paramSaleThree      4*1.6

#define kArtBlueAlphaColor     [[UIColor greenColor] colorWithAlphaComponent:0.6]


#define kArtBlueColor    [UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5]

@implementation VcoreTest6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  //  [self pushColorInFirstTranstiom];
    
   // [self pushColorInFullTranstiom];
        homeLayer.masksToBounds = YES;
    
   // [self push3DTranstiom];
    
  //   [self pushColorInFirstTranstiom];
    
  //  [self gradientColorAni];
    
  //  [self testGradientColor];
    
  //  [self testGrerfs];
    
   // [self AVArtAniMoreColorStart];
    
    [self barShowMove];
    
    
   // [self AVAniSTMoreColorSidewaysMoveGoNextClose];
    
  //  [self testMusciBlure2];
}


-(void)testMusciBlure2
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 1.7;
    
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

-(void)testMusciBlure
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 1.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:CGPointMake(100, 0) toValue:CGPointMake(300, 0)];
    
    [currentLayer addAnimation: nextRightMoveAni forKey:@"sd"];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *bottomEffectBgView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    bottomEffectBgView.frame = homeLayer.frame;
    
    
    
//    UIView *testView = [[UIView alloc] initWithFrame: ho.bounds];
//    
//   // testView.layer = currentLayer;
//    
//    [currentLayer addSublayer: bottomEffectBgView.layer];
    
    [self.view addSubview: bottomEffectBgView];
    
    
}


-(void)AVAniSTMoreColorSidewaysMoveGoNextClose
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;
    
    CGFloat moveduration = 0.8;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    [nextLayer setMask: nextLayer.maskLayer];
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CGFloat layerWidth = kAVWindowWidth/sqrtl(2);
    CGFloat layerHeight = kAVWindowHeight*sqrtl(2);
    currentLayer.masksToBounds = YES;
    
    AVBottomLayer *lastTopLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-layerWidth)/2, (kAVWindowHeight-layerHeight)/2, layerWidth, layerHeight) bgColor:UIColorFromRGBAlpha(0x8957a1, 0.5).CGColor];
    lastTopLayer.anchorPoint = CGPointMake(0, 0.5);
    lastTopLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    [currentLayer addSublayer:lastTopLayer];
    
    AVBottomLayer *lastBottomLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-layerWidth)/2, (kAVWindowHeight-layerHeight)/2, layerWidth, layerHeight) bgColor:UIColorFromRGBAlpha(0x8957a1, 0.5).CGColor];
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
    
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveduration withBeginTime:beginTime+1 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:lastBoundKeyTime];
    
    [lastTopLayer addAnimation:boundsAni forKey:nil];
    [lastBottomLayer addAnimation:boundsAni forKey:nil];
    NSArray *colorArr = @[
                          (__bridge id)UIColorFromRGBAlpha(0xf39700, 0.5).CGColor,
                          
                          (__bridge id)UIColorFromRGBAlpha(0x7ecef4, 0.5).CGColor,
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
        
        CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.5 withBeginTime:i*0.4 propertyName:kAVBasicAniBounds values:boundCenterValues keyTimes:boundKeyTime];
        
        CAKeyframeAnimation *topCenterMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveduration withBeginTime:0.4+i*0.4 propertyName:kAVBasicAniPosition values:topMoveCenterValues keyTimes:moveKeyTime];
        CAKeyframeAnimation *bottomCenterMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveduration withBeginTime:0.4+i*0.4 propertyName:kAVBasicAniPosition values:bottomMoveCenterValues keyTimes:moveKeyTime];
        
        
        CAAnimationGroup *topGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[boundsAni,topCenterMoveAni]];
        CAAnimationGroup *bottomGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[boundsAni, bottomCenterMoveAni]];
        
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
    
    CABasicAnimation *nextLeftMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                         moveXYCenterTo:0.5 withBeginTime:beginTime+1.5 fromValue:CGPointMake(-(newSize/2), 0)
                                         toValue:CGPointMake(0, 0)];
    
    nextLeftMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(newSize/2, 0, newSize/2,  newSize)
                                                                 bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0);
    [nextLayer.maskLayer addSublayer: nextRightLayer];
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                          moveXYCenterTo:0.5 withBeginTime:beginTime+1.5 fromValue:CGPointMake(newSize, 0)
                                          toValue:CGPointMake(newSize/2, 0)];
    
    nextRightMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];
    
}

-(void)testGrerfs
{
    UIImageView *bgImageView =[[UIImageView alloc] initWithFrame:homeLayer.frame];
    
    bgImageView.image = [UIImage imageNamed:@"0"];
    
    [self.view addSubview: bgImageView];
    
    UIView *maskView =[[UIView alloc] initWithFrame:bgImageView.bounds];
    
    maskView.backgroundColor = [UIColor blackColor];
    
   // bgImageView.layer.mask = maskView.layer.mask;
    
   // bgImageView.layer.masksToBounds = YES;
    
    
    UIFont *font = [UIFont boldSystemFontOfSize:80];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, bgImageView.frame.size.height)
                                                                  intText:@"葛敏"
                                                                 textFont:font
                                                                textColor:UIColorFromRGB(0xf19ec2)];

    bgImageView.layer.mask = textLayer;
    
}

-(void)testGradientColor
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.8;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    // maske effect
    CAGradientLayer  *maskEffectLayer = [CAGradientLayer layer];
    
    maskEffectLayer.frame = currentLayer.bounds;
    
    
    NSArray *startlocationsList  =@[
                           [NSNumber numberWithFloat:0.0f],
                           [NSNumber numberWithFloat:0.5f],
                           
                           [NSNumber numberWithFloat:0.5f],
                           [NSNumber numberWithFloat:0.5f],
                           
                           [NSNumber numberWithFloat:0.5f],
                           [NSNumber numberWithFloat:1.0f],
                           
                           ];
    
    
    NSArray *endLocationsList  =@[
                                  [NSNumber numberWithFloat:0.0f],
                                  [NSNumber numberWithFloat:0.0f],
                                  
                                  [NSNumber numberWithFloat:0.0f],
                                  [NSNumber numberWithFloat:1.0f],
                                  
                                  [NSNumber numberWithFloat:1.0f],
                                  [NSNumber numberWithFloat:1.0f],
                                    
                                    ];
    
    // 设置颜色
    maskEffectLayer.colors = @[
                               (id)[UIColor yellowColor].CGColor,
                               (id)[UIColor yellowColor].CGColor,

                               (id)[UIColor clearColor].CGColor,
                                (id)[UIColor clearColor].CGColor,

                               
                               (id)[UIColor yellowColor].CGColor,
                               (id)[UIColor yellowColor].CGColor,
                               
                               ];;
    
    
    maskEffectLayer.locations = startlocationsList;
    
    [homeLayer addSublayer: maskEffectLayer];
    
    maskEffectLayer.startPoint =CGPointMake(0.0, 0.5);
    
    maskEffectLayer.endPoint =CGPointMake(1, 0.5);
    
    //    
    CABasicAnimation *locationsAni = [[AVBasicRouteAnimate defaultInstance]customBasic:duration withBeginTime:beginTime fromValue:startlocationsList toValue:endLocationsList propertyName:@"locations"];
    
    
    [maskEffectLayer addAnimation:locationsAni forKey:@"locations"];
    
    

}

-(void)barShowMove2
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
    //    CGFloat durationShow = 1;
    
    CGFloat offsetValue = kAVCeilfY(130);
    
    //    CGFloat barWith = 150;
    
    CGFloat moveDuration =0.35;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    
}

-(void)barShowMove
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
    CGFloat offset = kAVCeilfX(kAVDiagonalSlope*130);
    
    CGFloat slopeWidth = kAVWindowWidth+(offset*2);
    
    CGFloat slopeHeight = kAVWindowHeight+(offset*2);
    
    CGFloat moveDuration =0.35;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    AVBottomLayer *colorBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-offset, -offset,slopeWidth, slopeHeight)
                                                                      bgColor:[[UIColor yellowColor] colorWithAlphaComponent:0.5].CGColor];
    
    [currentLayer addSublayer: colorBgLayer];
    
    colorBgLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    [colorBgLayer setMask:colorBgLayer.maskLayer];
    
    colorBgLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    AVBottomLayer *nextLeftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, slopeWidth/2,  slopeHeight)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    nextLeftLayer.anchorPoint = CGPointMake(1, 0.5);
    [colorBgLayer.maskLayer addSublayer: nextLeftLayer];
    
    CABasicAnimation *nextLeftMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                         moveXYCenterTo:0.5 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(slopeWidth/2, slopeHeight/2)
                                         toValue:CGPointMake(0, slopeHeight/2)];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(slopeWidth/2, 0, slopeWidth/2,  slopeHeight)
                                                                 bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0.5);
    [colorBgLayer.maskLayer addSublayer: nextRightLayer];
    
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                          moveXYCenterTo:0.5 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(slopeWidth/2, slopeHeight/2)
                                          toValue:CGPointMake(slopeWidth, slopeHeight/2)];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];

    
    //full ani move
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];

    NSArray *boundsValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  0,  slopeHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, slopeWidth, slopeHeight)],
                              ];

    CAKeyframeAnimation *bounsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.35 withBeginTime:beginTime propertyName:kAVBasicAniBounds values:boundsValues keyTimes:keyTime];

    [colorBgLayer addAnimation:bounsAni forKey:@"bounsAni"];
    
    
    
    
    
    
    
    
//    AVBottomLayer *beforNextColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
//                                                                      bgColor:[[UIColor yellowColor] colorWithAlphaComponent:0.5].CGColor];
//    
//    [currentLayer addSublayer: beforNextColorLayer];
//    
//    
//    [beforNextColorLayer setMask:beforNextColorLayer.maskLayer];
//    
//    beforNextColorLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
//    
//    beforNextColorLayer.maskLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
//    
//    beforNextColorLayer.maskLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    
//    CGFloat newSize = kAVWindowWidth+(offsetValue*2);
//    
//    AVBottomLayer *nextLeftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, barWith,  newSize)
//                                                                bgColor:[UIColor blackColor].CGColor];
//    
//    nextLeftLayer.anchorPoint = CGPointMake(1, 0);
//    [ beforNextColorLayer.maskLayer addSublayer: nextLeftLayer];
//    nextLeftLayer.position =CGPointMake(kAVWindowCenter.x, 0);
//    
//    NSArray *keyTime = @[
//                         [NSNumber numberWithFloat:0],
//                         [NSNumber numberWithFloat:1],
//                         ];
//    
//    NSArray *boundsValues = @[
//                              [NSValue valueWithCGRect:CGRectMake(0, 0,  0, newSize)],
//                              [NSValue valueWithCGRect:CGRectMake(0, 0, barWith,newSize)],
//                              ];
//    
//    CAKeyframeAnimation *bounsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:0 propertyName:kAVBasicAniBounds values:boundsValues keyTimes:keyTime];
//    
//    
//    CABasicAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance]
//                                         moveXYCenterTo:0.6 withBeginTime:0.4 fromValue:CGPointMake(kAVWindowCenter.x, 0)
//                                         toValue:CGPointMake(-(newSize/2), 0)];
//    
//    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:durationShow withBeginTime:beginTime aniArr: @[bounsAni,centerMoveAni]];
//    
//    [nextLeftLayer addAnimation:animationGroup forKey:@"currentAniMove"];
//    
//    
//    
//    
////    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(newSize/2, 0, newSize/2,  newSize)
////                                                                 bgColor:[UIColor blackColor].CGColor];
////    
////    nextRightLayer.anchorPoint = CGPointMake(0, 0);
////    [ beforNextColorLayer.maskLayer addSublayer: nextRightLayer];
////    
////    
////    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance]
////                                          moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:CGPointMake(newSize/2, 0)
////                                          toValue:CGPointMake(newSize, 0)];
////    
////    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];

    
    
}

-(void) AVArtAniMoreColorStart
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.8;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    
    AVBottomLayer *beforNextColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                      bgColor:[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5].CGColor];
    
    [currentLayer addSublayer: beforNextColorLayer];
    
    
    [beforNextColorLayer setMask:beforNextColorLayer.maskLayer];
    
    beforNextColorLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CGFloat offsetValue = 130;
    
    beforNextColorLayer.maskLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
    
    beforNextColorLayer.maskLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    
    CGFloat newSize = kAVWindowWidth+(offsetValue*2);
    
    AVBottomLayer *nextLeftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, newSize/2,  newSize)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    nextLeftLayer.anchorPoint = CGPointMake(0, 0);
    [ beforNextColorLayer.maskLayer addSublayer: nextLeftLayer];
    
    CABasicAnimation *nextLeftMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                         moveXYCenterTo:0.6 withBeginTime:beginTime+0.3 fromValue:CGPointMake(0, 0)
                                         toValue:CGPointMake(-(newSize/2), 0)];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(newSize/2, 0, newSize/2,  newSize)
                                                                 bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0);
    [ beforNextColorLayer.maskLayer addSublayer: nextRightLayer];
    
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                          moveXYCenterTo:0.4 withBeginTime:beginTime+0.3 fromValue:CGPointMake(newSize/2, 0)
                                          toValue:CGPointMake(newSize, 0)];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];
    
    
    // maske effect
    CAGradientLayer  *maskEffectLayer = [CAGradientLayer layer];
    
    maskEffectLayer.frame = CGRectMake(0, 0,500, 100);
    
    
    NSArray *startColorList  =@[
                           
                           (id)[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5].CGColor,
                           (id)[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5].CGColor,
                           
                           (id)[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.9].CGColor,
                           (id)[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.9].CGColor,
                           
                           (id)[UIColor orangeColor].CGColor,
                           (id)[UIColor orangeColor].CGColor,
                           
                           (id)[UIColor cyanColor].CGColor,
                           (id)[UIColor cyanColor].CGColor,
                           ];
    
    NSArray *startlocationLis=  @[
                                  [NSNumber numberWithFloat:0.0f],
                                  [NSNumber numberWithFloat:0.25f],
                                  
                                  [NSNumber numberWithFloat:0.25f],
                                  [NSNumber numberWithFloat:0.50f],
                                  
                                  [NSNumber numberWithFloat:0.50f],
                                  [NSNumber numberWithFloat:0.75f],
                                  
                                  [NSNumber numberWithFloat:0.75f],
                                  [NSNumber numberWithFloat:1.0f],
                                  ];
    
    
    // 设置颜色
    maskEffectLayer.colors = startColorList;
    
    
    
    
    maskEffectLayer.locations = startlocationLis;
    
    [homeLayer addSublayer: maskEffectLayer];
    
    maskEffectLayer.startPoint =CGPointMake(0.0, 0.5);
    
    maskEffectLayer.endPoint =CGPointMake(1, 0.5);
    
    NSArray *endlocationLis=  @[
                                [NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:0.1f],
                                
                                [NSNumber numberWithFloat:0.1f],
                                [NSNumber numberWithFloat:1.0f],
                                
                                [NSNumber numberWithFloat:1.0f],
                                [NSNumber numberWithFloat:1.0f],
                                [NSNumber numberWithFloat:1.0f],
                                [NSNumber numberWithFloat:1.0f],

                             ];


    CABasicAnimation *locations = [[AVBasicRouteAnimate defaultInstance]customBasic:duration withBeginTime:beginTime fromValue:startlocationLis toValue:endlocationLis propertyName:@"locations"];
    
    [maskEffectLayer addAnimation:locations forKey:@"locations"];
    
    maskEffectLayer.anchorPoint = CGPointMake(0, 0);
    
    
    CGPoint startCenter1 = CGPointMake(-10-kAVWindowWidth,450);
    
    CGPoint endCenter1 =CGPointMake(20,  450);
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startCenter1 toValue:endCenter1];
    
    moveCenter1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [maskEffectLayer addAnimation:moveCenter1 forKey:@"startCenter1ds"];
    
//    UIFont *font = [UIFont systemFontOfSize:37];
    
    
    
//    
//    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame: CGRectMake(0, maskEffectLayer.frame.size.height/3,maskEffectLayer.frame.size.width, maskEffectLayer.frame.size.height/2)
//                                                                aniText:@"路径的设置"
//                                                               textFont:font];
//    
//    [maskEffectLayer addSublayer: textLayer];
//    
//
//    [textLayer addAni:0.35 beginTime:beginTime+1.8 aniFactor:AVArtAniTextCenterToUpDown];
    
    
}


-(void) gradientColorChage
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.8;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    // maske effect
    CAGradientLayer  *maskEffectLayer = [CAGradientLayer layer];
    
    maskEffectLayer.frame = CGRectMake(0, 0,400, 100);
    
    
     NSArray *startList  =@[
      
      (id)[UIColor greenColor].CGColor,
      (id)[UIColor greenColor].CGColor,
      
      (id)[UIColor blueColor].CGColor,
      (id)[UIColor blueColor].CGColor,
      
      (id)[UIColor orangeColor].CGColor,
      (id)[UIColor orangeColor].CGColor,
      
      (id)[UIColor cyanColor].CGColor,
      (id)[UIColor cyanColor].CGColor,
      ];

    // 设置颜色
    maskEffectLayer.colors = startList;
    
    
    maskEffectLayer.locations = @[
                                  [NSNumber numberWithFloat:0.0f],
                                  [NSNumber numberWithFloat:0.25f],
                                  
                                  [NSNumber numberWithFloat:0.25f],
                                  [NSNumber numberWithFloat:0.50f],
                                  
                                  [NSNumber numberWithFloat:0.50f],
                                  [NSNumber numberWithFloat:0.75f],
                                  
                                  [NSNumber numberWithFloat:0.75f],
                                  [NSNumber numberWithFloat:1.0f],
                                  ];
    
    [homeLayer addSublayer: maskEffectLayer];
    
    maskEffectLayer.startPoint =CGPointMake(0.0, 0.5);
    
    maskEffectLayer.endPoint =CGPointMake(1, 0.5);
    
    
    NSArray *alphaValues2 = @[
                              (id)[UIColor orangeColor].CGColor,
                              (id)[UIColor orangeColor].CGColor,
                              
                              (id)[UIColor yellowColor].CGColor,
                              (id)[UIColor yellowColor].CGColor,
                              
                              (id)[UIColor orangeColor].CGColor,
                              (id)[UIColor orangeColor].CGColor,
                              
                              (id)[UIColor blueColor].CGColor,
                              (id)[UIColor blueColor].CGColor,
                              ];
    
//    NSArray *keyTime2 = @[
//                          [NSNumber numberWithFloat:0],
//                          [NSNumber numberWithFloat:1],
//                          ];
//
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance]customBasic:duration withBeginTime:beginTime fromValue:startList toValue:alphaValues2 propertyName:@"colors"];
    
    
    [maskEffectLayer addAnimation:opacityAni forKey:@"sdf"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)push3DTranstiom
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.8;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    
    //add
    AVBottomLayer *bgColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-kAVWindowCenter.x, 0, kAVWindowWidth*2, kAVWindowHeight*2)
                                                               bgColor:[UIColor whiteColor].CGColor];
    [homeLayer addSublayer: bgColorLayer];
    
    currentLayer.position =  CGPointMake(kAVWindowWidth, kAVWindowCenter.y);
    
    [bgColorLayer addSublayer: currentLayer];
    
    //up left
    AVBottomLayer *upLeftLayer =  [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight)
                                                           beforeColor:[[UIColor yellowColor] colorWithAlphaComponent:0.8]
                                                               bgColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
    [bgColorLayer addSublayer: upLeftLayer];
    
    CABasicAnimation *upLeftCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4
                                                                            withBeginTime:beginTime+0.35
                                                                                fromValue:CGPointMake(0, kAVWindowCenter.y)
                                                                                  toValue:CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y)];
     upLeftLayer.beforeLayer.anchorPoint = CGPointMake(0.0, 0.5);
    [upLeftLayer.beforeLayer addAnimation:upLeftCenterAni forKey:@"startCenter1ds"];

    
    //up  right
    AVBottomLayer *upRightLayer =  [[AVBottomLayer alloc] initWithFrame:CGRectMake(kAVWindowCenter.x*3, 0, kAVWindowWidth/2, kAVWindowHeight)
                                                           beforeColor:[[UIColor yellowColor] colorWithAlphaComponent:0.8]
                                                               bgColor:[[UIColor  brownColor] colorWithAlphaComponent:0.8]];
    [bgColorLayer addSublayer: upRightLayer];
    
    CABasicAnimation *upRightCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4
                                                                                withBeginTime:beginTime+0.35
                                                                                    fromValue:CGPointMake(0, kAVWindowCenter.y)
                                                                                      toValue:CGPointMake(kAVWindowWidth/2, kAVWindowCenter.y)];
    
    [upRightLayer.beforeLayer addAnimation:upRightCenterAni forKey:@"startCenter1ds"];
    upRightLayer.beforeLayer.anchorPoint = CGPointMake(0.0, 0.5);
    
    //down  left
    AVBottomLayer *downLeftLayer =  [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight, kAVWindowWidth/2, kAVWindowHeight)
                                                            beforeColor:[[UIColor brownColor] colorWithAlphaComponent:0.7]
                                                                bgColor:[[UIColor  yellowColor] colorWithAlphaComponent:0.7]];
    [bgColorLayer addSublayer: downLeftLayer];
    
    CABasicAnimation *downLeftCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4
                                                                                 withBeginTime:beginTime+0.35
                                                                                     fromValue:CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y)
                                                                                       toValue:CGPointMake(0, kAVWindowCenter.y)];
    
    [downLeftLayer.beforeLayer addAnimation:downLeftCenterAni forKey:@"startCenter1ds"];
    downLeftLayer.beforeLayer.anchorPoint = CGPointMake(0.0, 0.5);

    
    //down right
    AVBottomLayer *downRightLayer =  [[AVBottomLayer alloc] initWithFrame:CGRectMake(kAVWindowCenter.x*3, kAVWindowHeight, kAVWindowWidth/2, kAVWindowHeight)
                                                           bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.6].CGColor];
    [bgColorLayer addSublayer: downRightLayer];
    
    [bgColorLayer addSublayer: nextLayer];
    nextLayer.position =  CGPointMake(kAVWindowWidth, kAVWindowCenter.y*3);
    
    //next  ani
    CGPoint startCenter2 = CGPointMake(kAVWindowWidth*2, kAVWindowCenter.y*3);
    
    CGPoint endCenter2 =CGPointMake(kAVWindowWidth, kAVWindowCenter.y*3);
    
    CABasicAnimation *moveCenter2 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime+0.35 fromValue:startCenter2 toValue:endCenter2];
    
    [nextLayer addAnimation:moveCenter2 forKey:@"startCenter1ds"];
    moveCenter2.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    
    AVBottomLayer *currentBeforLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.bounds bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
    [currentLayer addSublayer: currentBeforLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime];
    currentBeforLayer.opacity= 0.0f;
    [currentBeforLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
    AVBottomLayer *nextBeforLayer = [[AVBottomLayer alloc] initWithFrame:nextLayer.bounds bgColor:[[UIColor brownColor] colorWithAlphaComponent:0.4].CGColor];
    [nextLayer addSublayer: nextBeforLayer];
    
    CABasicAnimation *opacityCloseAni = [[AVBasicRouteAnimate alloc] opacityClose:0.4 withBeginTime:beginTime+(duration-0.4)];
    // nextLayer.blurLayer.opacity= 2.0f;
    [nextBeforLayer addAnimation:opacityCloseAni forKey:@"dfs"];

    
    
    //ful ani
    CGRect startArea =  CGRectMake(0,  kAVWindowCenter.y, kAVWindowWidth, kAVWindowHeight);
    
    CGRect secodArea = CGRectMake(-kAVWindowCenter.x, -kAVWindowCenter.y, kAVWindowWidth*2, kAVWindowHeight*2);
    
    CGRect endArea = CGRectMake(0,  -kAVWindowCenter.y, kAVWindowWidth, kAVWindowHeight);
    
    CAAnimationGroup *thressMoreAni = [[AVSceneAnimateCamera defaultInstance] cameraMoveThreePath:duration withBeginTime:beginTime startArea:startArea secondArea:secodArea  endArea:endArea windowArea:kAVRectWindow];
    
    
    [bgColorLayer addAnimation:thressMoreAni forKey:nil];

    
}

-(void)pushColorInFullTranstiom
{
    
//    CGFloat barSize = 50;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 0.8;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.position = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
    
    CGPoint startCenter1 = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
    
    CGPoint endCenter1 =CGPointMake(-kAVWindowCenter.x,  kAVWindowCenter.y);
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startCenter1 toValue:endCenter1];
    
    moveCenter1.fillMode=kCAFillModeForwards;
    
    [currentLayer addAnimation:moveCenter1 forKey:@"startCenter1ds"];
    moveCenter1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CGPoint startCenter2 = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
    
    CGPoint endCenter2 =CGPointMake(kAVWindowCenter.x,  kAVWindowCenter.y);
    
    CABasicAnimation *moveCenter2 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration*0.7 withBeginTime:beginTime fromValue:startCenter2 toValue:endCenter2];
    
    [nextLayer addAnimation:moveCenter2 forKey:@"startCenter1ds"];
    moveCenter2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // filterColorLayer
    AVBottomLayer *filterColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth*2, kAVWindowHeight)
                                                                   bgColor:kArtBlueAlphaColor.CGColor];
    
    
    [homeLayer addSublayer: filterColorLayer];
    
    
    NSArray *alphaValues2 = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:1],
                              [NSNumber numberWithFloat:1],
                              [NSNumber numberWithFloat:0],
                              ];
    
    NSArray *keyTime2 = @[
                          [NSNumber numberWithFloat:0],
                          [NSNumber numberWithFloat:0.4],
                          [NSNumber numberWithFloat:0.7],
                          [NSNumber numberWithFloat:1],
                          ];
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaValues2 keyTimes:keyTime2];
    
    filterColorLayer.opacity= 0.0f;
    [filterColorLayer addAnimation:opacityAni forKey:@"dfs"];
    
    
}

-(void)pushColorInFirstTranstiom
{

//    CGFloat barSize = 50;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 0.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    
    CGPoint  startPoint =  CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
    
    CGPoint endPoint =CGPointMake(kAVWindowCenter.x,  kAVWindowCenter.y) ;
    
    
    nextLayer.position = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
    
    
    AVBottomLayer *filterColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, kAVWindowHeight)
                                                                   bgColor:kArtBlueAlphaColor.CGColor];
    
    [currentLayer addSublayer: filterColorLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:duration withBeginTime:beginTime];
    filterColorLayer.opacity= 0.0f;
    [filterColorLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
//    CGPoint startCenter1 = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
//    
//    CGPoint endCenter1 =CGPointMake(kAVWindowCenter.x,  kAVWindowCenter.y);
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPoint toValue:endPoint];
    
    moveCenter1.timingFunction = [CAMediaTimingFunction easeOutQuart];
    
    [nextLayer addAnimation:moveCenter1 forKey:@"startCenter1ds"];

}

@end
