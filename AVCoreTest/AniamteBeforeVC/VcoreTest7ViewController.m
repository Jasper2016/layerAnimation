//
//  VcoreTest7ViewController.m
//  AVCoreTest
//
//  Created by Netease on 16/2/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "VcoreTest7ViewController.h"
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

#define kCirPointBorderColor      UIColorFromRGBAlpha(0xf19ec2 ,0.75)

#define kPointOpacityDuration   0.4

//#define kSmoothLineTextHight   80

@implementation VcoreTest7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    homeLayer.backgroundColor = [UIColor whiteColor].CGColor;
    // Do any additional setup after loading the view.
    
    CATransform3D sublayerTransform = CATransform3DIdentity;
    sublayerTransform.m34 = -1.0 / 1000;
    self.view.layer.sublayerTransform = sublayerTransform;
    
    homeLayer.masksToBounds = YES;
    
  //  [self testBg];
//    [self TimeLinesBG];
    
//    [self testTextLayer];
    
//     [self TimeLinesStartAni];
    
//     [self TimeLinesSeondAni];
    
    // [self TimeLinesSeondOKAni];
    
//     [self AVSAniTimeLineVerticalTwoPhoto];
    
    // [self OnePhotoLineInRight];
    
//    [self TimeLinesTwoPhto3DAni];
    
    //[self TimeLinesFastMoveTrantim];
    
  //  [self AVSAniTimeLineHorizontalTwoPhoto];
    
//    [self AVSAniTimeLineHorizontalOneLineInBottom];
    
//    [self AVSAniTimeLineVerticalOneLineInLeft];
    
//    [self AVSTransiteTimeLineCenterMoveToNext];
    
//    [self AVSAniTimeLineHorizontalOneLineInBottom];
    
//    [self AVSAniTimeLineVerticalOneLineInLeft];
    
    [self AVSTransiteTimeLineCenterMoveToNext];

   // [self testTopLine];
//    [self testBottomText];
    
//    [self simelpText];
    
}

-(void)simelpText
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
//    CGFloat duration = 3;
//    
//    CGFloat mvoeDuration = 3.5;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧啥打法是否是防守打法，瑟吉欧啥打法是否是防守打法";
    UIFont *font = [UIFont systemFontOfSize:27];
    
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(kAVWindowWidth-80, MAXFLOAT) interval:15 isDefluatWidth:NO isDefaultHeight:NO];
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(40, kAVWindowHeight, kAVWindowWidth-80, broadSize.height) intText:text textFont:font textColor:[UIColor whiteColor]];
    textLayer.anchorPoint = CGPointMake(0.5, 1);
    
    [textLayer addAni:0.35 beginTime:beginTime aniFactor:AVArtAniTextFadeInOut];
    
    [currentLayer addSublayer:textLayer];
}

-(void)testBottomText
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
//    CGFloat duration = 3;
//    
//    CGFloat mvoeDuration = 3.5;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    NSString *sceneDescString = @"度自动适应宽度和高度 oiuytre";
    UIFont *font =   [UIFont systemFontOfSize:30];
    
    CGSize textSize = [self sizeWithString:sceneDescString font:font];
    textSize.height+=2;
    
    CGFloat textBGHight = 30+ textSize.height;
    
    AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, kAVWindowHeight-textBGHight, kAVWindowWidth, textBGHight)
                                                              bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor];
    
    [currentLayer addSublayer: textBgLayer];
    
//    NSArray *keyTime = @[
//                         [NSNumber numberWithFloat:0],
//                         [NSNumber numberWithFloat:0.1],
//                         [NSNumber numberWithFloat:0.9],
//                         [NSNumber numberWithFloat:1],
//                         ];
//    
//    NSArray *alphaTime = @[
//                           [NSNumber numberWithFloat:0],
//                           [NSNumber numberWithFloat:1],
//                           [NSNumber numberWithFloat:1],
//                           [NSNumber numberWithFloat:0],
//                           ];
//    
//    
//    CAKeyframeAnimation *alphaBgAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:mvoeDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaTime keyTimes:keyTime];
//    
//    textBgLayer.opacity= 0;
//    [textBgLayer addAnimation:alphaBgAni forKey:@"openBgAni"];
    
    
    CGRect pathFrame = CGRectMake((kAVWindowWidth- (textSize.width))/2, (textBGHight-textSize.height)/2+1, textSize.width, textSize.height);
    
    AVPlayTextLayer *textLayer =  [[AVPlayTextLayer alloc] initWithFrame:pathFrame intText:sceneDescString textFont:font textColor:UIColorFromRGB(0xa07454)];
    
    [textBgLayer addSublayer: textLayer];
    
    [textLayer addAni:0.35 beginTime:beginTime+0.1 aniFactor:AVArtAniTextBottomToCenter];
    
}

-(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font

{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(kAVWindowWidth-20, 250)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传人的字体字典
                                       context:nil];
    
    return rect.size;
}

-(void)testBg
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
    UIImage *bgImage = [[UIImage alloc]initWithContentsOfFile:imagePath];
    
    UIImage *imageBlur = [bgImage applyBlurWithRadius:60 tintColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6] saturationDeltaFactor:1 maskImage:nil];
    
    
    AVBasicLayer *sceneBGLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:imageBlur];
    [homeLayer addSublayer: sceneBGLayer];

}

-(void)AVSTransiteTimeLineCenterMoveToNext
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
//    CGFloat duration = 0.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CABasicAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:currentLayer.position
                                                                                  toValue: CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y)];
    
    [currentLayer addAnimation:centerMoveAni forKey:@"centerMoveAni"];
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:beginTime+0.4];
    nextLayer.opacity= 0.0f;
    [nextLayer addAnimation:opacityOpenAni1 forKey:@"opacityOpenAni1"];
    
    
}

-(void)AVSTransiteTimeLineCenterMoveToLeftUp
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
//    CGFloat duration = 0.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CABasicAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:currentLayer.position
                                                                                    toValue: CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y)];
    
    [currentLayer addAnimation:centerMoveAni forKey:@"centerMoveAni"];
    
     centerMoveAni.fillMode=kCAFillModeBackwards;
    
    
    CABasicAnimation *nextMoveAni1 = [[AVBasicRouteAnimate alloc] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:CGPointMake(-kAVWindowCenter.x, -kAVWindowCenter.y)
                                                                                    toValue: CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];
    
        centerMoveAni.fillMode=kCAFillModeForwards;
    
    [nextLayer addAnimation:nextMoveAni1 forKey:@"centerMoveAni"];
    
    
    
    CABasicAnimation *centerMoveAni2 = [[AVBasicRouteAnimate alloc] moveXYCenterTo:0.7 withBeginTime:beginTime+1 fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)
                                                                                   toValue: CGPointMake(kAVWindowWidth+kAVWindowCenter.x, -kAVWindowCenter.y)];
    
        centerMoveAni2.fillMode=kCAFillModeForwards;
    
    [nextLayer addAnimation:centerMoveAni2 forKey:@"centerMoveAni2"];
    
}


-(AVBottomLayer *)createLineWithFrame:(CGRect)frame position:(CGPoint)position anchorPoint:(CGPoint)anchorPoint
{
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: frame
                                                                bgColor:kTimeLineColor.CGColor];
    
    longLineLayer.position = position;
    longLineLayer.anchorPoint = anchorPoint;
    
    return longLineLayer;
}

-(AVShapeBaseLayer *)createPointWithCenter:(CGPoint)position beginTime:(CFTimeInterval)beginTime
{
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = position;
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:kPointOpacityDuration withBeginTime:beginTime];
    pointLayer1.opacity= 0.0f;
    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
    
    return pointLayer1;
}

-(void)AVSAniTimeLineVerticalOneLineInLeft
{
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    [homeLayer addSublayer: aniBgLayer];
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
//    CGFloat duration = 1.7;

    AVBottomLayer *longLineLayer = [self createLineWithFrame:CGRectMake(20, 0, kTimeLineWith, kAVWindowHeight)
                                                         position:CGPointMake(40, kAVWindowCenter.y)
                                                      anchorPoint: CGPointMake(0.5, 0.5)];
    [aniBgLayer addSublayer:longLineLayer];
    
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:0.4
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  kAVWindowHeight)]
                                                                       propertyName:kAVBasicAniBounds];
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    
    CGPoint photoPosition = CGPointZero;
    CGPoint pointPosition = CGPointZero;
    
    if (_isHasText) {
        
        pointPosition = CGPointMake(40, 240);
        photoPosition = CGPointMake(40+kWithPointInterval, 250);
    }else{
        
        pointPosition = CGPointMake(40, kAVWindowCenter.y);
        photoPosition = CGPointMake(40+kWithPointInterval, kAVWindowCenter.y);
    }
    //point1
    AVShapeBaseLayer *pointLayer1 = [self createPointWithCenter:pointPosition
                                                              beginTime:beginTime+0.3];
    [aniBgLayer addSublayer:pointLayer1];

    
    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 480, 480)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicLeft];
    photoLayer.position = photoPosition;
    [aniBgLayer addSublayer: photoLayer];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.6 fromValue:0 toValue: photoLayer.radio];
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
    
    //point2
    AVShapeBaseLayer *pointLayer2 = [self createPointWithCenter:CGPointMake(40, 540) beginTime:beginTime+0.8];
    [aniBgLayer addSublayer:pointLayer2];

    
    
}


-(void)TimeLinesBG
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;
    
    CGFloat mvoeDuration = duration;
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:20];
    
    blurBGLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                        withImage:imageBlur];
    
//    [blurBGLayer addSublayer: blurBGLayer.beforeLayer];
//    blurBGLayer.beforeLayer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6].CGColor;
    
    [homeLayer addSublayer: blurBGLayer];
    
    
    NSString *sceneDescString = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来";
    
    UIFont *font =   [UIFont systemFontOfSize:30];
    
    CGSize textSize = [self sizeWithString:sceneDescString font:font];
    textSize.height+=2;
    
    CGFloat textBGHight = 30+ textSize.height;
    
    AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, kAVWindowHeight-textBGHight, kAVWindowWidth, textBGHight)
                                                              bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor];
    
    [blurBGLayer addSublayer: textBgLayer];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.1],
                         [NSNumber numberWithFloat:0.9],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *alphaTime = @[
                           [NSNumber numberWithFloat:0],
                           [NSNumber numberWithFloat:1],
                           [NSNumber numberWithFloat:1],
                           [NSNumber numberWithFloat:0],
                           ];
    
    
    CAKeyframeAnimation *alphaBgAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:mvoeDuration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:alphaTime keyTimes:keyTime];
    
    textBgLayer.opacity= 0;
    [textBgLayer addAnimation:alphaBgAni forKey:@"openBgAni"];
    
    
    CGRect pathFrame = CGRectMake((kAVWindowWidth- (textSize.width))/2, (textBGHight-textSize.height)/2+1, textSize.width, textSize.height);
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:pathFrame intText:sceneDescString textFont:font textColor:UIColorFromRGB(0xa07454)];
    
    [textBgLayer addSublayer: textLayer];
    
    [textLayer addAni:0.35 beginTime:beginTime+0.1 aniFactor:3];
    
}

-(void)AVSTransiteTimeLineReCountUpMoveToBottom
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 1.7;
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:10];
 
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    aniBgLayer.position =  CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
    [blurBGLayer addSublayer: aniBgLayer];
    
    AVBottomLayer *leftBlureLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(10, 30, 270, 270)
                                                            withImage:imageBlur];
    
    [aniBgLayer addSublayer: leftBlureLayer];
    
    NSArray *colorsList = @[
                            (id)[UIColor clearColor].CGColor,
                            (id)[UIColor whiteColor].CGColor,
                            (id)[UIColor whiteColor].CGColor,
                            (id)[UIColor clearColor].CGColor,
                            ];
    
    
    NSArray *locationList = @[
                              [NSNumber numberWithFloat:0.0f],
                              [NSNumber numberWithFloat:0.3f],
                              [NSNumber numberWithFloat:0.7f],
                              [NSNumber numberWithFloat:1.0f],
                              ];
    
    AVBasicGradientLayer *leftMaskLayer = [[AVBasicGradientLayer alloc] initWithFrame:leftBlureLayer.bounds
                                                                       colorsList:colorsList
                                                                     locationList:locationList
                                                                       startPoint:CGPointMake(0.5, 0)
                                                                         endPoint:CGPointMake(0.5, 1)];
    leftBlureLayer.mask = leftMaskLayer;
    
    
    AVBottomLayer *rightBlureLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(320, 200, 270, 270)
                                                               withImage:imageBlur];
    
    [aniBgLayer addSublayer: rightBlureLayer];
    
    AVBasicGradientLayer *rightMaskLayer = [[AVBasicGradientLayer alloc] initWithFrame:leftBlureLayer.bounds
                                                                           colorsList:colorsList
                                                                         locationList:locationList
                                                                           startPoint:CGPointMake(0.5, 0)
                                                                             endPoint:CGPointMake(0.5, 1)];
    rightBlureLayer.mask = rightMaskLayer;
    
    
    
    CABasicAnimation *bgCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime
                                                                                fromValue: CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y)
                                                                                  toValue: CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y)];
    bgCenterAni.autoreverses=NO;
    bgCenterAni.repeatCount = 4;
    
    [aniBgLayer addAnimation:bgCenterAni forKey:@"bgCenterAni"];
    
}

-(void)AVSAniTimeLineHorizontalOneLineInBottom
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
//    CGFloat duration = 1.7;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20,kAVWindowWidth, kTimeLineWith)
                                                                bgColor:kTimeLineColor.CGColor];

    longLineLayer.position = CGPointMake(kAVWindowCenter.x, 550);
    longLineLayer.anchorPoint = CGPointMake(0.5, 0.5);
    [aniBgLayer addSublayer: longLineLayer];
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:0.4
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 0, kTimeLineWith )]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 500,  kTimeLineWith)]
                                                                       propertyName:kAVBasicAniBounds];
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    //point
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = CGPointMake(kAVWindowCenter.x, 550);
    [aniBgLayer addSublayer: pointLayer1];
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime+0.3];
    pointLayer1.opacity= 0.0f;
    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
    
    
    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 480, 480)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicBottom];
    photoLayer.position = CGPointMake(kAVWindowCenter.x, 550-kWithPointInterval);
    [aniBgLayer addSublayer: photoLayer];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.6 fromValue:0 toValue: photoLayer.radio];
    
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
    
    
}

-(void)AVSAniTimeLineHorizontalTwoPhoto
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
//    CGFloat duration = 1.7;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:15];
    
    AVBottomLayer *BGLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                        withImage:imageBlur];
    
    [aniBgLayer addSublayer: BGLayer];
    
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20, 540, kTimeLineWith)
                                                                bgColor:kTimeLineColor.CGColor];
    
    longLineLayer.position = kAVWindowCenter;
    longLineLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [aniBgLayer addSublayer: longLineLayer];
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:1.5
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kTimeLineWith)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 540,  kTimeLineWith)]
                                                                       propertyName:kAVBasicAniBounds];
    
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    //point
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = CGPointMake(380, kAVWindowCenter.y);
    [aniBgLayer addSublayer: pointLayer1];
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime+0.5];
    pointLayer1.opacity= 0.0f;
    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
    
    
    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicBottom];
    photoLayer.position = CGPointMake(380, kAVWindowCenter.y-kWithPointInterval);
    [aniBgLayer addSublayer: photoLayer];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.5 fromValue:0 toValue: photoLayer.radio];
    
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
    
    
    //point2
    AVShapeBaseLayer *pointLayer2 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer2.position =  CGPointMake(250, kAVWindowCenter.y);
    [aniBgLayer addSublayer: pointLayer2];
    
    CABasicAnimation *opacityOpenAni2 = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime+1];
    pointLayer2.opacity= 0.0f;
    [pointLayer2 addAnimation:opacityOpenAni2 forKey:@"dfs"];
    
    
    AVTimeLineLayer *photoLayer2 = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270)
                                                             vContentRect:kAVRectWindow
                                                                withImage:[UIImage imageNamed:@"2.png"]
                                                                borderDic:AVBorderRrrowDicUp];
    photoLayer2.position = CGPointMake(250, kAVWindowCenter.x+kWithPointInterval);
    [aniBgLayer addSublayer: photoLayer2];
    
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+1 fromValue:0 toValue: photoLayer2.radio];
    
    saleToAni.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer2 addAnimation:saleToAni forKey:@"scaleAni"];
    
}

-(void)TimeLinesTwoPhto3DAni
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 1.7;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    aniBgLayer.position = CGPointMake(300, 300);
    aniBgLayer.anchorPoint = CGPointMake(0.5, 0.5);
    [homeLayer addSublayer: aniBgLayer];
    
//     CABasicAnimation *bgCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:5 withBeginTime:beginTime+0.5 fromValue:  CGPointMake(-100, -300)
//                                                                                   toValue: CGPointMake(750, 400)];
//    
//    [aniBgLayer addAnimation:bgCenterAni forKey:@"bgCenterAni"];
    
    // line
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20, kTimeLineWith, 700)
                                                                bgColor:kTimeLineColor.CGColor];
    
    longLineLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
    longLineLayer.anchorPoint = CGPointMake(0.5, 1);
    
    [aniBgLayer addSublayer: longLineLayer];
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:1.0
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  700)]
                                                                       propertyName:kAVBasicAniBounds];
    
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    //point
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = CGPointMake(kAVWindowCenter.x, 380);
    [aniBgLayer addSublayer: pointLayer1];
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.5 withBeginTime:beginTime+0.3];
    pointLayer1.opacity= 0.0f;
    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
    
    
    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 550, 550)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicLeft];
    photoLayer.position = CGPointMake(kAVWindowCenter.x+kWithPointInterval, 380);
    [aniBgLayer addSublayer: photoLayer];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1.0 withBeginTime:beginTime+0.3 fromValue:0 toValue: photoLayer.radio];
    
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
    
    
    //point2
    AVShapeBaseLayer *pointLayer2 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer2.position =  CGPointMake(kAVWindowCenter.x, 250);;
    [aniBgLayer addSublayer: pointLayer2];
    
    CABasicAnimation *opacityOpenAni2 = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime+1];
    pointLayer2.opacity= 0.0f;
    [pointLayer2 addAnimation:opacityOpenAni2 forKey:@"dfs"];
    
    
    AVTimeLineLayer *photoLayer2 = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 550, 550)
                                                             vContentRect:kAVRectWindow
                                                                withImage:[UIImage imageNamed:@"2.png"]
                                                                borderDic:AVBorderRrrowDicRight];
    photoLayer2.position = CGPointMake(kAVWindowCenter.x-kWithPointInterval, 250);
    [aniBgLayer addSublayer: photoLayer2];
    
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:1.0 withBeginTime:beginTime+1 fromValue:0 toValue: photoLayer2.radio];
    
    saleToAni.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer2 addAnimation:saleToAni forKey:@"scaleAni"];
    //
//    aniBgLayer.transform = CATransform3DMakeRotation(M_PI_4, 1, 0, 1);
    //
    //    [aniBgLayer setValue:[NSNumber numberWithFloat:1.7] forKeyPath:@"transform.scale"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)TimeLinesStartAni
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;

    NSString *titleString = @"快乐工作20.16";
    UIFont *font = [UIFont systemFontOfSize:37];
    
    CGSize textSize = [titleString sizeWithAttributes:
                       @{NSFontAttributeName:font}];
    
    CGRect pathFrame = CGRectMake((kAVWindowWidth- (textSize.width+30))/2, 300, textSize.width+30, textSize.height+40);
    
    AVShapeBaseLayer *shapeLayer = [[AVShapeBaseLayer  alloc] initWithFrame:pathFrame
                                                                 bezierPath:[UIBezierPath squareShape: pathFrame]
                                                                  fillColor: [UIColor clearColor]
                                                                strokeColor:UIColorFromRGB(0xa07454)
                                                                  lineWidth:4];
    
    
    [homeLayer addSublayer: shapeLayer];
    
    
    CABasicAnimation *strokeStartAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
    
    [shapeLayer addAnimation: strokeStartAni forKey:@"strokeStartAni"];
    
    //seond
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 20, pathFrame.size.width, pathFrame.size.height) intText:titleString textFont:font textColor:UIColorFromRGB(0xa07454)];
    
    [shapeLayer addSublayer: textLayer];
    
    [textLayer addAni:3.0f beginTime:beginTime aniFactor:AVArtAniTextFadeInOut];
}


-(void)AVSAniTimeLineVerticalOneLineInRight
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
//    CGFloat duration = 1.7;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20, kTimeLineWith, kAVWindowHeight)
                                                                bgColor:kTimeLineColor.CGColor];
    
    longLineLayer.position = CGPointMake(40, kAVWindowCenter.y);
    longLineLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [aniBgLayer addSublayer: longLineLayer];
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:0.4
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  kAVWindowHeight)]
                                                                       propertyName:kAVBasicAniBounds];
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    //point
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = CGPointMake(40, 300);
    [aniBgLayer addSublayer: pointLayer1];
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime+0.3];
    pointLayer1.opacity= 0.0f;
    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
    
    
    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 480, 480)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicLeft];
    photoLayer.position = CGPointMake(40+kWithPointInterval, 300);
    [aniBgLayer addSublayer: photoLayer];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.6 fromValue:0 toValue: photoLayer.radio];
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
    
    
}

//-(void)AVSAniTimeLineVerticalOneLineInRight
//{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
//    
//    CGFloat duration = 1.7;
//    
//    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
//                                                             bgColor:[UIColor clearColor].CGColor];
//    
//    [homeLayer addSublayer: aniBgLayer];
//    
//    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20, kTimeLineWith, kAVWindowHeight)
//                                                                bgColor:kTimeLineColor.CGColor];
//    
//    longLineLayer.position = CGPointMake(560, kAVWindowCenter.y);
//    longLineLayer.anchorPoint = CGPointMake(0.5, 0.5);
//    
//    [aniBgLayer addSublayer: longLineLayer];
//    
//    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:0.4
//                                                                      withBeginTime:beginTime
//                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
//                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  kAVWindowHeight)]
//                                                                       propertyName:kAVBasicAniBounds];
//    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
//    
//    //point
//    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
//                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
//                                                                   fillColor: kCirPointFillColor
//                                                                 strokeColor:kCirPointBorderColor
//                                                                   lineWidth:5];
//    pointLayer1.position = CGPointMake(560, 300);
//    [aniBgLayer addSublayer: pointLayer1];
//    
//    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime+0.3];
//    pointLayer1.opacity= 0.0f;
//    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
//    
//    
//    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 480, 480)
//                                                            vContentRect:kAVRectWindow
//                                                               withImage:[UIImage imageNamed:@"1.png"]
//                                                               borderDic:AVBorderRrrowDicRight];
//    photoLayer.position = CGPointMake(560-kWithPointInterval, 300);
//    [aniBgLayer addSublayer: photoLayer];
//    
//    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.6 fromValue:0 toValue: photoLayer.radio];
//    
//    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
//    
//    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
//    
//}
-(void)AVSAniTimeLineVerticalTwoPhoto
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    
//    CGFloat duration = 1.7;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:15];
    
    AVBottomLayer *BGLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                        withImage:imageBlur];
    
    [aniBgLayer addSublayer: BGLayer];
    
    // Longline
    AVBottomLayer *longLineLayer = [self createLineWithFrame:CGRectMake(0, 20, kTimeLineWith, kAVWindowHeight)
                                                    position: CGPointMake(kAVWindowCenter.x, kAVWindowHeight)
                                                 anchorPoint: CGPointMake(0.5, 1)];
    [aniBgLayer addSublayer: longLineLayer];
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:1.5
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  kAVWindowHeight)]
                                                                       propertyName:kAVBasicAniBounds];
    
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    
    //photo1
    [self createPhotoAndPointWithCenter: CGPointMake(kAVWindowCenter.x, 380)
                             photoImage:[UIImage imageNamed:@"1.png"]
                            vBorderSize:CGSizeMake(270, 270)
                              borderDic:AVBorderRrrowDicLeft
                              rootLayer:aniBgLayer
                              beginTime:beginTime+0.5];
    
    /*
    //point1
    AVShapeBaseLayer *pointLayer1 = [self createPointWithCenter: CGPointMake(kAVWindowCenter.x, 380)
                                                      beginTime:beginTime+0.5];
    [aniBgLayer addSublayer: pointLayer1];
    
    AVTimeLineLayer *photoLayer1 = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicLeft];
    photoLayer1.position = CGPointMake(kAVWindowCenter.x+kWithPointInterval, 380);
    [aniBgLayer addSublayer: photoLayer1];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.5 fromValue:0 toValue: photoLayer1.radio];
    
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer1 addAnimation:saleToAni1 forKey:@"scaleAni"];*/
    
    
    [self createPhotoAndPointWithCenter: CGPointMake(kAVWindowCenter.x, 250)
                             photoImage:[UIImage imageNamed:@"2.png"]
                            vBorderSize:CGSizeMake(270, 270)
                              borderDic:AVBorderRrrowDicRight
                              rootLayer:aniBgLayer
                              beginTime:beginTime+1.0];
    
    
    //point2
    AVShapeBaseLayer *pointLayer2 =  [self createPointWithCenter: CGPointMake(kAVWindowCenter.x, 250)
                                                       beginTime:beginTime+1];

    [aniBgLayer addSublayer: pointLayer2];
    
    AVTimeLineLayer *photoLayer2 = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270)
                                                             vContentRect:kAVRectWindow
                                                                withImage:[UIImage imageNamed:@"2.png"]
                                                                borderDic:AVBorderRrrowDicRight];
    photoLayer2.position = CGPointMake(kAVWindowCenter.x-kWithPointInterval, 250);
    [aniBgLayer addSublayer: photoLayer2];
    
    CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+1 fromValue:0 toValue: photoLayer2.radio];
    saleToAni.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer2 addAnimation:saleToAni forKey:@"scaleAni"];
    
}



- (void)createPhotoAndPointWithCenter:(CGPoint)center
                           photoImage:(UIImage *)photoImage
                          vBorderSize:(CGSize)vBorderSize
                            borderDic:(AVBorderRrrowDicType)borderDic
                            rootLayer:(AVBottomLayer *)rootLayer
                            beginTime:(CFTimeInterval)beginTime
{
    AVShapeBaseLayer *pointLayer1 = [self createPointWithCenter: center
                                                      beginTime:beginTime];
    [rootLayer addSublayer: pointLayer1];
    
    AVTimeLineLayer *photoLayer1 = [[AVTimeLineLayer alloc]  initWithCenter:center
                                                               vContentRect:kAVRectWindow
                                                                       size:vBorderSize
                                                                  withImage:photoImage
                                                                  borderDic:borderDic];
    
    [rootLayer addSublayer: photoLayer1];
    
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime fromValue:0 toValue: photoLayer1.radio];
    
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [photoLayer1 addAnimation:saleToAni1 forKey:@"scaleAni"];
}

//- (void)createTextAndPointWithCenter:(CGPoint)center
//                           text:(NSString *)text
//                          vBorderSize:(CGSize)vBorderSize
//                            borderDic:(AVBorderRrrowDicType)borderDic
//                            rootLayer:(AVBottomLayer *)rootLayer
//                            beginTime:(CFTimeInterval)beginTime
//{
//    AVShapeBaseLayer *pointLayer1 = [self createPointWithCenter: center
//                                                      beginTime:beginTime];
//    [rootLayer addSublayer: pointLayer1];
//    
//    AVTimeLineTextLayer *textLayer = [AVTimeLineTextLayer];
//    
//    AVTimeLineLayer *photoLayer1 = [[AVTimeLineLayer alloc]  initWithCenter:center
//                                                               vContentRect:kAVRectWindow
//                                                                       size:vBorderSize
//                                                                  withImage:photoImage
//                                                                  borderDic:borderDic];
//    
//    [rootLayer addSublayer: photoLayer1];
//    
//    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime fromValue:0 toValue: photoLayer1.radio];
//    
//    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
//    
//    [photoLayer1 addAnimation:saleToAni1 forKey:@"scaleAni"];
//}

-(void)TimeLinesSeondOKAni
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20, kTimeLineWith, 500)
                                                                bgColor:kTimeLineColor.CGColor];
    
    longLineLayer.position = CGPointMake(15, kAVWindowHeight);
    longLineLayer.anchorPoint = CGPointMake(0.5, 1);
    
    [aniBgLayer addSublayer: longLineLayer];
    
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  500)]
                                                                       propertyName:kAVBasicAniBounds];
    
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    //point
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(287, 100, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = CGPointMake(15, 260);
    [aniBgLayer addSublayer: pointLayer1];
    
    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithFrame:CGRectMake(0, 0, 500, 500)
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"1.png"]
                                                               borderDic:AVBorderRrrowDicRight];
    
    photoLayer.position = CGPointMake(kAVWindowCenter.x, 30);
    
    [aniBgLayer addSublayer: photoLayer];
    
}
-(void)TimeLinesSeondAni
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.7;
    
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 20, kTimeLineWith, 500)
                                                                bgColor:kTimeLineColor.CGColor];
    
    longLineLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
    longLineLayer.anchorPoint = CGPointMake(0.5, 1);
    
    [homeLayer addSublayer: longLineLayer];
    
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kTimeLineWith,  500)]
                                                                       propertyName:kAVBasicAniBounds];
    
    [longLineLayer addAnimation: boundAni forKey:@"kAVBasicAniBounds"];
    
    //point
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(287, 100, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    
    pointLayer1.position = CGPointMake(kAVWindowCenter.x, 300);
    
    [homeLayer addSublayer: pointLayer1];
    
    
    AVShapeBaseLayer *photoBorderLayer = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 50, 200, 200)
                                                                       bezierPath:[UIBezierPath chatPopoBorderStroke:CGRectMake(50, 50, 200, 200) dirMode:0 rowOffset:0]
                                                                        fillColor: [UIColor whiteColor]
                                                                      strokeColor:kPhotoBorderColor
                                                                        lineWidth:3];
    
    // photoBorderLayer.position = CGPointMake(kAVWindowCenter.x, 300);
    
    [homeLayer addSublayer: photoBorderLayer];
    
    
    
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


-(void)AVArtMoreColorFilterStart
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
    CGFloat offsetWidth = kAVCeilfX(130);
    
    CGFloat offsetHeight= kAVCeilfY(130);
    
    CGFloat slopeOffsetWidth = kAVWindowHeight+(offsetWidth*2);
    
    CGFloat slopeOffsetHeight = kAVWindowHeight+(offsetHeight*2);
    
    CGFloat moveDuration =0.35;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    AVBottomLayer *colorBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-offsetWidth, -offsetHeight,slopeOffsetWidth, slopeOffsetHeight)
                                                               bgColor:[[UIColor yellowColor] colorWithAlphaComponent:0.5].CGColor];
    
    [currentLayer addSublayer: colorBgLayer];
    
    colorBgLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    [colorBgLayer setMask:colorBgLayer.maskLayer];
    
    colorBgLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    AVBottomLayer *nextLeftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, slopeOffsetWidth/2,  slopeOffsetHeight)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    nextLeftLayer.anchorPoint = CGPointMake(1, 0.5);
    [colorBgLayer.maskLayer addSublayer: nextLeftLayer];
    
    CABasicAnimation *nextLeftMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                         moveXYCenterTo:0.5 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(slopeOffsetWidth/2, slopeOffsetHeight/2)
                                         toValue:CGPointMake(0, slopeOffsetHeight/2)];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(slopeOffsetWidth/2, 0, slopeOffsetWidth/2,  slopeOffsetHeight)
                                                                 bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0.5);
    [colorBgLayer.maskLayer addSublayer: nextRightLayer];
    
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                          moveXYCenterTo:0.5 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(slopeOffsetWidth/2, slopeOffsetHeight/2)
                                          toValue:CGPointMake(slopeOffsetWidth, slopeOffsetHeight/2)];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];
    
    
    //full ani move
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *boundsValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  0,  kAVWindowHeight+(offsetHeight*2))],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(offsetWidth*2), kAVWindowHeight+(offsetHeight*2))],
                              ];
    
    CAKeyframeAnimation *bounsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.35 withBeginTime:beginTime propertyName:kAVBasicAniBounds values:boundsValues keyTimes:keyTime];
    
    [colorBgLayer addAnimation:bounsAni forKey:@"bounsAni"];
    
    
}


@end
