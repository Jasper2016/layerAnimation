//
//  FashionWeedEnd2ViewController.m
//  AVCoreTest
//
//  Created by mac on 2017/8/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FashionWeedEnd3ViewController.h"

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

#import "AVTextFontConstant.h"

#define kLineWidth      4

#define kMaskHeight     (kAVWindowHeight/2)*3

#define kMoveOffset     200

#define kMoveRADIANS(angle)  [NSNumber numberWithFloat:DEGREES_TO_RADIANS(angle)]

#define kDefultTitleFontValue   (37)
#define kDefalutTitleTextFont       [UIFont systemFontOfSize:kDefultTitleFontValue]

@interface FashionWeedEnd3ViewController ()

@end

@implementation FashionWeedEnd3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // homeLayer.transform = [self simpleToTransform3DZ:90];

 //   [self AVSceneAniBottomLinnToCenterThanRotationP_MI2];
    
//    [self tranionAniCenterToBottomToTopToBottom];
    
//    [self ScenceAniCenterToLeftToRight];
    
//    [self testcenterToBottomToTopToBottom];
    
//    [self testCenterTopToBottomToCenter];

//    [self testLeftMoveOffsetToRight];
    
 //   [self AVSceneAniLeftLineAndTopLineToCrossEnd];
    
    [self startSceneAniLeftLine];
}

-(CAAnimationGroup *)startLeftAndRightAnmiation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation *centerAni = [[AVBasicRouteAnimate defaultInstance] customCGPoint:duration
                                                                         withBeginTime:0
                                                                             fromValue:CGPointMake(-50, kAVWindowHeight/2)
                                                                               toValue:CGPointMake(kAVWindowWidth-120, kAVWindowHeight/2)
                                                                          propertyName:@"position"];
    
    NSArray *values = @[[NSNumber numberWithFloat:DEGREES_TO_RADIANS(3)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(-3)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(5)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)],
                        ];
    NSArray *locations = @[@(0.0),@(0.3),@(0.6),@(1.0)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                  withBeginTime:0
                                                                   propertyName:kAVBasicAniRotationZ
                                                                         values:values
                                                                       keyTimes:locations];
    CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[centerAni,transAni]];
    
    return maskGroupAni;
}

-(void)startSceneAniLeftLine
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;
    
    UIImage *origalImage = [UIImage imageNamed:@"1.png"];
    
    CGFloat moveDurtion = 2.0f;
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:3];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage
                                                                   blueImage:imageBlur];
    
    [homeLayer addSublayer: firstLayer];
    
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
        [firstLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];

        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
        [firstLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    
     CAAnimationGroup *startLeftAndRightAnmiation = [self startLeftAndRightAnmiation:moveDurtion withBeginTime:beginTime];
    
    {
        
        firstLayer.blurMaskLayer.frame = CGRectMake(0, -kMoveOffset, kMaskHeight,  kAVWindowWidth+(2*kMoveOffset));
        firstLayer.photoLayer.mask = firstLayer.blurMaskLayer;
        firstLayer.blurMaskLayer.anchorPoint = CGPointMake(1, 0.5);
        [firstLayer.blurMaskLayer addAnimation:startLeftAndRightAnmiation forKey:@"maskGroupAni"];
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(0,-kMoveOffset, kLineWidth, kAVWindowWidth+(2*kMoveOffset));
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(1, 0.5);
        [firstLayer addSublayer:lineLayer];
        [lineLayer addAnimation:startLeftAndRightAnmiation forKey:@"maskGroupAni"];
    }
    
    
    NSString *sceneDescString = @"视频已经生成但没上传完，还能找到吗 13998581530";
    
    
    CGSize broadSize = [sceneDescString textBroadSizeWithFont:kDefalutTitleTextFont
                                                      maxSize:CGSizeMake(kAVWindowWidth-100-kDescTextOffsetX*2, MAXFLOAT)
                                                     interval:kDefalutInterval
                                               isDefluatWidth:YES];
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width-(2*kDefalutInterval), broadSize.height-(kDefalutInterval*2))
                                                                intText:sceneDescString textFont:kDefalutTitleTextFont
                                                              textColor:[UIColor whiteColor]];
    
    textLayer.position = CGPointMake(broadSize.width/2+25, firstLayer.height/2);
    
    [firstLayer.photoLayer addSublayer: textLayer];
    
    [textLayer addAni:1 beginTime:beginTime+0.5 aniFactor:AVArtAniTextPlay];

}

-(void)AVSceneAniLeftLineAndTopLineToCrossEnd
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;
    
    UIImage *origalImage = [UIImage imageNamed:@"1.png"];
    
    
    
    CGFloat moveDurtion = 5.0f;
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage
                                                                   blueImage:imageBlur];
    
    [homeLayer addSublayer: firstLayer];
    
    
    
    
    //第二个镜头
    UIImage *origalImage2 = [UIImage imageNamed:@"2.png"];
    
    UIImage *imageBlur2 = [[AVFilterPhoto alloc] filterGPUImage:origalImage2
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    
    AVBasicLayer *seondLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage2
                                                                   blueImage:imageBlur2];
    
    //[seondLayer insertSublayer: seondLayer.photoLayer below:seondLayer.contentLayer];
    
    [homeLayer addSublayer: seondLayer];
    
    
    UIImage *origalImage3 = [UIImage imageNamed:@"3.png"];
    UIImage *imageBlur3 = [[AVFilterPhoto alloc] filterGPUImage:origalImage3
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    //第三个镜头
    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                      vContentRect:kAVRectWindow
                                                         withImage:origalImage3];
    
//    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
//                                                                vContentRect:kAVRectWindow
//                                                                 origalImage:origalImage3
//                                                                   blueImage:imageBlur3];
//    
//    [thirdLayer insertSublayer: thirdLayer.photoLayer below:thirdLayer.contentLayer];
    
    [homeLayer insertSublayer:thirdLayer below:seondLayer];
    
    
    //第二个镜头动画
    CAAnimationGroup *leftMoveOffsetToRightAni = [self TranstamLeftMoveOffsetToRight:moveDurtion withBeginTime:beginTime];
    {
//        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
//        [seondLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
//        
//        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
//        [seondLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    {
        
        seondLayer.blurMaskLayer.frame = CGRectMake(0, -kMoveOffset, kMaskHeight,  kAVWindowWidth+(2*kMoveOffset));
        
        seondLayer.photoLayer.mask = seondLayer.blurMaskLayer;
        

       // seondLayer.blurMaskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+kLineWidth);
        seondLayer.blurMaskLayer.anchorPoint = CGPointMake(1, 0.5);
    
        [seondLayer.blurMaskLayer addAnimation:leftMoveOffsetToRightAni forKey:@"maskGroupAni"];
        
        
    }
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(0,-kMoveOffset, kLineWidth, kAVWindowWidth+(2*kMoveOffset));
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(1, 0.5);
        [seondLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:leftMoveOffsetToRightAni forKey:@"maskGroupAni"];
    }
    
    //第一个转场
    CAAnimationGroup *centerTopToBottomToCenterAni = [self centerTopToBottomToCenterToBottom:moveDurtion withBeginTime:beginTime];
    
    {
        
        seondLayer.maskLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kMaskHeight);
        seondLayer.maskLayer.anchorPoint = CGPointMake(0.5, 1);
        [seondLayer.maskLayer addAnimation:centerTopToBottomToCenterAni forKey:@"maskGroupAni"];
        
        
    }
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kLineWidth);
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0.5, 1);
        [seondLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:centerTopToBottomToCenterAni forKey:@"maskGroupAni"];
    }
    
    //第二个转场
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.5 fromScaleValue:1];
        [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        
//        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+0.5 fromScaleValue:1];
//        [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    {
        
        thirdLayer.maskLayer.frame = CGRectMake(0, -kMoveOffset, kMaskHeight,  kAVWindowWidth+(2*kMoveOffset));
        thirdLayer.maskLayer.anchorPoint = CGPointMake(1, 0.5);
        [thirdLayer.maskLayer addAnimation:leftMoveOffsetToRightAni forKey:@"maskGroupAni"];
        
        
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(0,-kMoveOffset, kLineWidth, kAVWindowWidth+(2*kMoveOffset));
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(1, 0.5);
        [thirdLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:leftMoveOffsetToRightAni forKey:@"maskGroupAni"];
    }
    
    
    //第三个
    AVBasicLayer *fourLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:imageBlur3];
    [seondLayer.photoLayer addSublayer:fourLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:moveDurtion*0.3 withBeginTime:beginTime+moveDurtion*0.7];
    fourLayer.opacity= 0.0f;
    [fourLayer addAnimation:opacityOpenAni forKey:@"dfs"];
}

-(CAAnimationGroup *)centerTopToBottomToCenterToBottom:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    NSArray *locations = @[@(0.0),
                           
                           @(0.25),
                           @(0.35),
                           
                           @(0.45),
                           @(0.65),
                           
                           @(0.75),
                           @(0.9),
                           
                           @(1.0)];

    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 0)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 70)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 70)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-70)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-75)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-220)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-230)],
                              
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+100)],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                       withBeginTime:0
                                                                        propertyName:kAVBasicAniPosition values:centerValues keyTimes:locations];
    
    NSArray *values = @[[NSValue valueWithCATransform3D: [self simpleToTransform3DZ:0]],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(8), 0, 0, 1)],
                        [NSValue valueWithCATransform3D: [self simpleToTransform3DZ:3]],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                        [NSValue valueWithCATransform3D: [self simpleToTransform3DZ:0]],
                        
                        [NSValue valueWithCATransform3D: [self simpleToTransform3DZ:-3]],
                        ];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                  withBeginTime:0
                                                                   propertyName:@"transform"
                                                                         values:values
                                                                       keyTimes:@[@(0.0),@(0.2),@(0.6),@(1.0)]];
    
    
    CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[moveCenterAni,transAni]];
    
    return maskGroupAni;
}


//
-(CAAnimationGroup *)TranstamLeftMoveOffsetToRight:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    
    
    
    NSArray *locations = @[@(0.0),
                           
                           @(0.4),
                           @(0.6),
                           
                           @(0.75),
                           @(0.9),
                           
                           @(1.0)];
    
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight/2)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(70, kAVWindowHeight/2)],
                              [NSValue valueWithCGPoint:CGPointMake(70, kAVWindowHeight/2)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth-150, kAVWindowHeight/2)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth-170, kAVWindowHeight/2)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth+kMoveOffset/4, kAVWindowHeight/2)],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                       withBeginTime:0
                                                                        propertyName:kAVBasicAniPosition values:centerValues keyTimes:locations];
    
    NSArray *values = @[[NSValue valueWithCATransform3D: [self simpleToTransform3DZ:0]],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(8), 0, 0, 1)],
                        [NSValue valueWithCATransform3D:  [self simpleToTransform3DZ:-3]],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                        [NSValue valueWithCATransform3D:  [self simpleToTransform3DZ:0]],
                        
                        [NSValue valueWithCATransform3D:  [self simpleToTransform3DZ:3] ],
                        ];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                  withBeginTime:0
                                                                   propertyName:@"transform"
                                                                         values:values
                                                                       keyTimes:@[@(0.0),@(0.2),@(0.6),@(1.0)]];
    
    
    CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[moveCenterAni,transAni]];
    
    return maskGroupAni;
}

//转场测试：
-(void)testLeftMoveOffsetToRight
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;
    
    
    UIImage *origalImage2 = [UIImage imageNamed:@"0.png"];
    
    UIImage *imageBlur2 = [[AVFilterPhoto alloc] filterGPUImage:origalImage2
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    
    AVBasicLayer *seondLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage2
                                                                   blueImage:imageBlur2];
    
    [homeLayer addSublayer: seondLayer];
    
    UIImage *origalImage3 = [UIImage imageNamed:@"1.png"];
    
    UIImage *imageBlur3 = [[AVFilterPhoto alloc] filterGPUImage:origalImage3
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    
    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage3
                                                                   blueImage:imageBlur3];
    [seondLayer addSublayer: thirdLayer];
    
    CAAnimationGroup *centerTopToBottomToCenterAni = [self TranstamLeftMoveOffsetToRight:5 withBeginTime:beginTime];
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.5 fromScaleValue:1];
        [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+0.5 fromScaleValue:1];
        [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    {
        
        thirdLayer.maskLayer.frame = CGRectMake(0, -kMoveOffset, kMaskHeight,  kAVWindowWidth+(2*kMoveOffset));
        thirdLayer.maskLayer.anchorPoint = CGPointMake(0, 0.5);
        [thirdLayer.maskLayer addAnimation:centerTopToBottomToCenterAni forKey:@"maskGroupAni"];
        
        
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(0,-kMoveOffset, kLineWidth, kAVWindowWidth+(2*kMoveOffset));
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0, 0.5);
        [thirdLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:centerTopToBottomToCenterAni forKey:@"maskGroupAni"];
    }
}

//转场测试：
-(void)testCenterTopToBottomToCenter
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;
    
    
    UIImage *origalImage2 = [UIImage imageNamed:@"0.png"];
    
    UIImage *imageBlur2 = [[AVFilterPhoto alloc] filterGPUImage:origalImage2
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    
    AVBasicLayer *seondLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage2
                                                                   blueImage:imageBlur2];
    
    [homeLayer addSublayer: seondLayer];
    
    UIImage *origalImage3 = [UIImage imageNamed:@"1.png"];
    
    UIImage *imageBlur3 = [[AVFilterPhoto alloc] filterGPUImage:origalImage3
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    
    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage3
                                                                   blueImage:imageBlur3];
    [seondLayer addSublayer: thirdLayer];
    
    CAAnimationGroup *centerTopToBottomToCenterAni = [self centerTopToBottomToCenterToBottom:5 withBeginTime:beginTime];
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.5 fromScaleValue:1];
        [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+0.5 fromScaleValue:1];
        [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    {
        
        thirdLayer.maskLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kMaskHeight);
        thirdLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
        [thirdLayer.maskLayer addAnimation:centerTopToBottomToCenterAni forKey:@"maskGroupAni"];
        
        
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kLineWidth);
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0.5, 0);
        [thirdLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:centerTopToBottomToCenterAni forKey:@"maskGroupAni"];
    }
}


-(CAAnimationGroup *)centerToBottomToTopToBottom:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    
    NSArray *locations = @[@(0.0),
                           
                           @(0.1),
                           @(0.4),
                           
                           @(0.5),
                           @(0.8),
                           
                           @(1.0)];
    
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-50)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-40)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 100)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 90)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+kMoveOffset)],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                       withBeginTime:0
                                                                        propertyName:kAVBasicAniPosition values:centerValues keyTimes:locations];
    
    NSArray *values = @[[NSValue valueWithCATransform3D: [self simpleToTransform3DZ:0] ],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(8), 0, 0, 1)],
                        [NSValue valueWithCATransform3D: [self simpleToTransform3DZ:10] ],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                        [NSValue valueWithCATransform3D: [self simpleToTransform3DZ:0] ],
                        
                        [NSValue valueWithCATransform3D:  [self simpleToTransform3DZ:-10]],
                        ];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                  withBeginTime:0
                                                                   propertyName:@"transform"
                                                                         values:values
                                                                       keyTimes:@[@(0.0),@(0.2),@(0.6),@(1.0)]];
    
    
    CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[moveCenterAni,transAni]];
    
    return maskGroupAni;
}

-(CAAnimationGroup *)centerToLeftToRightAni:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    NSArray *locations = @[@(0.0),
                           
                           @(0.3),
                           @(0.7),
                           
                           @(1.0)];
    
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowCenter.y)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(60, kAVWindowCenter.y)],
                              [NSValue valueWithCGPoint:CGPointMake(50, kAVWindowCenter.y)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth+kMaskHeight, kAVWindowCenter.y)],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                       withBeginTime:0
                                                                        propertyName:kAVBasicAniPosition values:centerValues keyTimes:locations];
    
    NSArray *values = @[[NSValue valueWithCATransform3D: [self simpleToTransform3DZ:0]],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(8), 0, 0, 1)],
                        [NSValue valueWithCATransform3D:[self simpleToTransform3DZ:10]],
                        
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                        [NSValue valueWithCATransform3D:[self simpleToTransform3DZ:0]],
                        
                        [NSValue valueWithCATransform3D:[self simpleToTransform3DZ:-10]],
                        ];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                  withBeginTime:0
                                                                   propertyName:kAVBasicAniRotationZ
                                                                         values:values
                                                                       keyTimes:@[@(0.0),@(0.2),@(0.6),@(1.0)]];
    
    CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[moveCenterAni,transAni]];
    
    
    return maskGroupAni;
}

- (CATransform3D)simpleToTransform3DZ:(CGFloat) angle
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34                = 1.0/ -500;
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(angle), 0, 0, 1);
    
    return transform;
}

-(CAAnimationGroup *)bottomToCenterRotation:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime
{
    CABasicAnimation *centerAni = [[AVBasicRouteAnimate defaultInstance] customCGPoint:duration
                                                                         withBeginTime:0
                                                                             fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+kLineWidth)
                                                                               toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)
                                                                          propertyName:@"position"];
    
    NSArray *values = @[[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-5)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)],
                        // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)],
                        [NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)],
                        ];
    NSArray *locations = @[@(0.0),@(0.2),@(0.6),@(1.0)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration*0.8
                                                                  withBeginTime:duration
                                                                   propertyName:kAVBasicAniRotationZ
                                                                         values:values
                                                                       keyTimes:locations];
    CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:duration*2 withBeginTime:beginTime aniArr:@[centerAni,transAni]];
    
    return maskGroupAni;
}

// 9.0
-(void)AVSceneAniBottomLinnToCenterThanRotationP_MI2
{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;

    UIImage *origalImage = [UIImage imageNamed:@"1.png"];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage
                                                                   blueImage:imageBlur];
    
    [homeLayer addSublayer: firstLayer];
    
    CGFloat oneDuration = 2;
    
    //第一个镜头
    
    CAAnimationGroup *bottomToCenterRotationAni = [self bottomToCenterRotation:oneDuration withBeginTime:beginTime];
    
    {
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
        [firstLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        
        CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
        [firstLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
    }
    
    {
        
        firstLayer.blurMaskLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kMaskHeight);
        
        firstLayer.photoLayer.mask = firstLayer.blurMaskLayer;
        
        //firstLayer.blurMaskLayer.transform = CATransform3DMakeRotation(-M_PI/18, 0, 0, 1);
        firstLayer.blurMaskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+kLineWidth);
        firstLayer.blurMaskLayer.anchorPoint = CGPointMake(0.5, 0);
        
        [firstLayer.blurMaskLayer addAnimation:bottomToCenterRotationAni forKey:@"maskGroupAni"];
        
        
    }
    
    {
        CALayer *lineLayer = [CALayer layer];
        lineLayer.frame = CGRectMake(-kMoveOffset, 0, kAVWindowWidth+(2*kMoveOffset), kLineWidth);
        lineLayer.borderColor = [UIColor whiteColor].CGColor;
        lineLayer.borderWidth = kLineWidth;
        lineLayer.anchorPoint = CGPointMake(0.5, 0);
        lineLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight+kLineWidth);
        lineLayer.transform = CATransform3DMakeRotation(-M_PI/18, 0, 0, 1);
        [firstLayer addSublayer:lineLayer];
        
        [lineLayer addAnimation:bottomToCenterRotationAni forKey:@"maskGroupAni"];
    }
    
    //第二个镜头
    UIImage *origalImage2 = [UIImage imageNamed:@"2.png"];
    
    UIImage *imageBlur2 = [[AVFilterPhoto alloc] filterGPUImage:origalImage2
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    
    AVBasicLayer *seondLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage2
                                                                   blueImage:imageBlur2];
    
    [homeLayer addSublayer: seondLayer];
    
    CGFloat trantionDuration1 = 3;
    //第一个转场
    {
        CGFloat extraOffset = 150;
        
        seondLayer.maskLayer.position = CGPointMake(kAVWindowWidth/2, -extraOffset/2);
        seondLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
        seondLayer.maskLayer.transform = CATransform3DMakeRotation(-M_PI/18, 0, 0, 1);
        
        
        CGRect fromRect = CGRectMake(0, 0, kAVWindowWidth+2*extraOffset, 0);
        CGRect toRect = CGRectMake(0, 0, kAVWindowWidth+2*extraOffset, kAVWindowHeight+2*extraOffset);
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customBasic:trantionDuration1 withBeginTime:beginTime+oneDuration+(oneDuration*0.1) fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [seondLayer.maskLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CALayer *borderLayer = [CALayer layer];
        borderLayer.frame = CGRectMake(0, 0, kAVWindowWidth+2*extraOffset, kAVWindowHeight+2*extraOffset);
        borderLayer.borderWidth = 2;
        borderLayer.borderColor = [UIColor whiteColor].CGColor;
        borderLayer.position = CGPointMake(kAVWindowWidth/2, -extraOffset/2);
        borderLayer.anchorPoint = CGPointMake(0.5, 0);
        borderLayer.transform = CATransform3DMakeRotation(-M_PI/18, 0, 0, 1);
        [seondLayer addSublayer:borderLayer];
        
        [borderLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    CGFloat secondDuration = 5.2;
    // 第二个镜头动画：
    
    beginTime += trantionDuration1+oneDuration*0.6;
    
    CAAnimationGroup *centerToLeftToRightAni = [self centerToLeftToRightAni:secondDuration withBeginTime:beginTime];
    {
        
        CGFloat offsetValue = 60;
        
        {
            CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
            [seondLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
            
            CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
            [seondLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        }
        
        {
            
            seondLayer.blurMaskLayer.frame = CGRectMake(0, -offsetValue, kMaskHeight,kAVWindowWidth+(2*offsetValue));
            seondLayer.photoLayer.mask = seondLayer.blurMaskLayer;
            
            seondLayer.blurMaskLayer.anchorPoint = CGPointMake(0, 0.5);
            
            [seondLayer.blurMaskLayer addAnimation:centerToLeftToRightAni forKey:@"maskGroupAni"];
            
            
        }
        
        {
            CALayer *lineLayer = [CALayer layer];
            lineLayer.frame = CGRectMake(0, -offsetValue,kLineWidth, kAVWindowWidth+(2*offsetValue));
            lineLayer.borderColor = [UIColor whiteColor].CGColor;
            lineLayer.borderWidth = kLineWidth;
            lineLayer.anchorPoint = CGPointMake(0, 0.5);
            [seondLayer addSublayer:lineLayer];
            
            [lineLayer addAnimation:centerToLeftToRightAni forKey:@"maskGroupAni"];
        }
        
    }
    
    UIImage *origalImage3 = [UIImage imageNamed:@"3.png"];
    UIImage *imageBlur3 = [[AVFilterPhoto alloc] filterGPUImage:origalImage3
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    //第三个镜头
    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage3
                                                                   blueImage:imageBlur3];
    [seondLayer addSublayer: thirdLayer];
    
    //第二个转场
    CGFloat trantionDuration3 = 5.0;
   // beginTime += secondDuration;
    
    CAAnimationGroup *centerToBottomToTopToBottomAni = [self centerToBottomToTopToBottom:trantionDuration3 withBeginTime:beginTime-trantionDuration1*0.18];
    {
    
        
        CGFloat offsetValue = 60;
        
        {
            CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
            [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
            
            CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
            [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        }
        
        {
            
            thirdLayer.maskLayer.frame = CGRectMake(-offsetValue, 0, kAVWindowWidth+(2*offsetValue), kMaskHeight);
            thirdLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
            [thirdLayer.maskLayer addAnimation:centerToBottomToTopToBottomAni forKey:@"maskGroupAni"];
            
            
        }
        
        {
            CALayer *lineLayer = [CALayer layer];
            lineLayer.frame = CGRectMake(-offsetValue, 0, kAVWindowWidth+(2*offsetValue), kLineWidth);
            lineLayer.borderColor = [UIColor whiteColor].CGColor;
            lineLayer.borderWidth = kLineWidth;
            lineLayer.anchorPoint = CGPointMake(0.5, 0);
            [thirdLayer addSublayer:lineLayer];
            
            [lineLayer addAnimation:centerToBottomToTopToBottomAni forKey:@"maskGroupAni"];
        }
        
    }
    
    //第三个镜头动画：
    {
        
        CGFloat offsetValue = 60;
        
        {
            CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
            [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
            
            CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
            [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        }
        
        {
            
            thirdLayer.blurMaskLayer.frame = CGRectMake(0, -offsetValue, kMaskHeight,kAVWindowWidth+(2*offsetValue));
            thirdLayer.photoLayer.mask = thirdLayer.blurMaskLayer;
            
            thirdLayer.blurMaskLayer.anchorPoint = CGPointMake(0, 0.5);
            
            [thirdLayer.blurMaskLayer addAnimation:centerToLeftToRightAni forKey:@"maskGroupAni"];
            
            
        }
        
        {
            CALayer *lineLayer = [CALayer layer];
            lineLayer.frame = CGRectMake(0, -offsetValue,kLineWidth, kAVWindowWidth+(2*offsetValue));
            lineLayer.borderColor = [UIColor whiteColor].CGColor;
            lineLayer.borderWidth = kLineWidth;
            lineLayer.anchorPoint = CGPointMake(0, 0.5);
            [thirdLayer addSublayer:lineLayer];
            
            [lineLayer addAnimation:centerToLeftToRightAni forKey:@"maskGroupAni"];
        }
        
    }
    
    AVBasicLayer *fourLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"shu"]];
    [seondLayer.contentLayer addSublayer:fourLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:trantionDuration3/2 withBeginTime:beginTime+trantionDuration3*0.4];
    fourLayer.opacity= 0.0f;
    [fourLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
}


-(void)ScenceAniCenterToLeftToRight
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;
    
    CGFloat moveDuration = 5;
    
    UIImage *origalImage3 = [UIImage imageNamed:@"3.png"];
    
    UIImage *imageBlur3 = [[AVFilterPhoto alloc] filterGPUImage:origalImage3
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    
    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage3
                                                                   blueImage:imageBlur3];
    
    [homeLayer addSublayer: thirdLayer];
    {
        CGFloat offsetValue = 60;
        
        NSArray *locations = @[@(0.0),
                               @(0.3),
                               
                               @(0.4),
                               @(0.8),
                               
                               @(1.0)];
        
        
        NSArray *centerValues = @[
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowCenter.y)],
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowCenter.y)],
                                  
                                  [NSValue valueWithCGPoint:CGPointMake(60, kAVWindowCenter.y)],
                                  [NSValue valueWithCGPoint:CGPointMake(50, kAVWindowCenter.y)],
                                  
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth+kMaskHeight, kAVWindowCenter.y)],
                                  ];
        
        CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration
                                                                           withBeginTime:0
                                                                            propertyName:kAVBasicAniPosition values:centerValues keyTimes:locations];
        
        NSArray *values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(0), 0 ,0 ,1)],
                            
                            // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(8), 0, 0, 1)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(10), 0, 0, 1)],
                            
                            // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(0), 0, 0, 1)],
                            
                            [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(-10), 0, 0, 1)],
                            ];
        
        CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration
                                                                      withBeginTime:0
                                                                       propertyName:@"transform"
                                                                             values:values
                                                                           keyTimes:@[@(0.0),@(0.2),@(0.6),@(1.0)]];
        
        CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[moveCenterAni,transAni]];
        
        {
            CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1];
            [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
            
            CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime fromScaleValue:1];
            [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        }
        
        {
            
            thirdLayer.blurMaskLayer.frame = CGRectMake(0, -offsetValue, kMaskHeight,kAVWindowWidth+(2*offsetValue));
            thirdLayer.photoLayer.mask = thirdLayer.blurMaskLayer;
            
            thirdLayer.blurMaskLayer.anchorPoint = CGPointMake(0, 0.5);
            
            [thirdLayer.blurMaskLayer addAnimation:maskGroupAni forKey:@"maskGroupAni"];
            
            
        }
        
        {
            CALayer *lineLayer = [CALayer layer];
            lineLayer.frame = CGRectMake(0, -offsetValue,kLineWidth, kAVWindowWidth+(2*offsetValue));
            lineLayer.borderColor = [UIColor whiteColor].CGColor;
            lineLayer.borderWidth = kLineWidth;
            lineLayer.anchorPoint = CGPointMake(0, 0.5);
            [thirdLayer addSublayer:lineLayer];
            
            [lineLayer addAnimation:maskGroupAni forKey:@"maskGroupAni"];
        }
        
    }
    
}

-(void)tranionAniCenterToBottomToTopToBottom
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.3;
    
    CGFloat moveDuration = 4;
    
    UIImage *origalImage = [UIImage imageNamed:@"0.png"];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilterBlackWhite
                                                    blurRadius:20];
    //第二个镜头
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage
                                                                   blueImage:imageBlur];
    
    [homeLayer addSublayer: firstLayer];

    
    //第三个镜头
    
    UIImage *origalImage3 = [UIImage imageNamed:@"3.png"];
    
    UIImage *imageBlur3 = [[AVFilterPhoto alloc] filterGPUImage:origalImage3
                                                     filterType:AVImageFilterBlackWhite
                                                     blurRadius:20];
    
    AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage3
                                                                   blueImage:imageBlur3];
    
    [homeLayer addSublayer: thirdLayer];
    
    {
        
        CGFloat offsetValue = 60;
        
        
        NSArray *locations = @[@(0.0),
                               
                               @(0.1),
                               @(0.4),
                               
                               @(0.5),
                               @(0.8),
                               
                               @(1.0)];
        
        
        NSArray *centerValues = @[
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)],
                                  
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-50)],
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight-40)],
                                  
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 100)],
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, 90)],
                                  
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+offsetValue)],
                                  ];
        
        CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration
                                                                           withBeginTime:moveDuration
                                                                            propertyName:kAVBasicAniPosition values:centerValues keyTimes:locations];
        
        NSArray *values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(0), 0 ,0 ,1)],
                            
                            // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(8), 0, 0, 1)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(10), 0, 0, 1)],
                            
                            // [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(2), 0, 0, 1)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(0), 0, 0, 1)],
                            
                            [NSValue valueWithCATransform3D:CATransform3DMakeRotation(DEGREES_TO_RADIANS(-10), 0, 0, 1)],
                            ];
        
        CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration
                                                                      withBeginTime:moveDuration
                                                                       propertyName:@"transform"
                                                                             values:values
                                                                           keyTimes:@[@(0.0),@(0.2),@(0.6),@(1.0)]];
        
        CAAnimationGroup *maskGroupAni = [[AVBasicRouteAnimate alloc] groupAni:3*moveDuration withBeginTime:beginTime aniArr:@[moveCenterAni,transAni]];
        
        {
            CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+0.5 fromScaleValue:1];
            [thirdLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
            
            CABasicAnimation *saleInAni = [AVAniScaleSlowBasic scaleSlowInBasic:beginTime+0.5 fromScaleValue:1];
            [thirdLayer.photoLayer.contentLayer addAnimation:saleInAni forKey:@"saleOutAni"];
        }
        
        {
            
            thirdLayer.maskLayer.frame = CGRectMake(-offsetValue, 0, kAVWindowWidth+(2*offsetValue), kMaskHeight);
            thirdLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
            [thirdLayer.maskLayer addAnimation:maskGroupAni forKey:@"maskGroupAni"];
            
            
        }
        
        {
            CALayer *lineLayer = [CALayer layer];
            lineLayer.frame = CGRectMake(-offsetValue, 0, kAVWindowWidth+(2*offsetValue), kLineWidth);
            lineLayer.borderColor = [UIColor whiteColor].CGColor;
            lineLayer.borderWidth = kLineWidth;
            lineLayer.anchorPoint = CGPointMake(0.5, 0);
            [thirdLayer addSublayer:lineLayer];
            
            [lineLayer addAnimation:maskGroupAni forKey:@"maskGroupAni"];
        }
        
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
