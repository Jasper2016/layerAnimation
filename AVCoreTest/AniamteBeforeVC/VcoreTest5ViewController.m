//
//  VcoreTest5ViewController.m
//  AVCoreTest
//
//  Created by gemin on 15/11/25.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "VcoreTest5ViewController.h"

#import "AVBasicLayer.h"

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

#import "AVPlayTextLayer.h"

static CGFloat const KLoadingViewWidth = 70;

static CGFloat const KShapeLayerWidth = 50;

static CGFloat const KShapeLayerRadius = KShapeLayerWidth / 2;

static CGFloat const KShapelayerLineWidth = 2.5;

static CGFloat const KAnimationDurationTime = 1.5;

static CGFloat const KShapeLayerMargin = (KLoadingViewWidth - KShapeLayerWidth) / 2;


#define kArtBlueAlphaColor     [[UIColor greenColor] colorWithAlphaComponent:0.5]


@interface VcoreTest5ViewController ()

@end

@implementation VcoreTest5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    //[self AVSceneTColorCoverPushNextEndOpen];
    
   // [self AVAniSTMoreColorSidewaysMoveGoNextClose];
    
   // [self maskLineBlurStart];
    
   // [self lensOne];
    
//    [self loading];
    
 //   [self magazineStartOne];
    
    
   // [self magazineStartTwo];
    
    
   // [self magazineStartThree];
    
    
   /// [self AVSceneTransitePushBeforeColor];
    
   // [self AVSAniMoreColorLayerSudokuLayout];
    
   // [self AVSAniMoreColorLayerHorizontalLayout];
    
    [self AVSAniMoreColorLayerSidewaysSudokuLayout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AVSAniMoreColorLayerSidewaysSudokuLayout
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    UIImage *currentImage = [UIImage imageNamed:@"0"];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    CGFloat subDuration = 0.45;
    
    CGFloat beginOffsetTime = 0.5;
    
    int count = 4;
    float photoLayerHeight = kAVWindowHeight/3.0;
    float photoLayerWidth = kAVWindowWidth/3.0;
    
    //顶部
    AVBottomLayer *topLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, photoLayerWidth*count, photoLayerHeight)];
    [currentLayer addSublayer:topLayer];
    NSArray *topColorList = @[(__bridge id)UIColorFromRGBAlpha(0x00a0e9, 0.3).CGColor,
                              (__bridge id)UIColorFromRGBAlpha(0x7d7d7d, 0.3).CGColor,
                              (__bridge id)UIColorFromRGBAlpha(0xfff799, 0.3).CGColor,
                              (__bridge id)UIColorFromRGBAlpha(0xf39700, 0.3).CGColor
                              ];
    for (int i = 0; i < count; i++) {
        AVBasicLayer *imageLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(photoLayerWidth*i, 0, photoLayerWidth, photoLayerHeight) withImage:currentImage];
        [topLayer addSublayer:imageLayer];
        AVBottomLayer *filterLayer = [[AVBottomLayer alloc] initWithFrame:imageLayer.bounds bgColor:(__bridge CGColorRef)(topColorList[i])];
        [imageLayer addSublayer:filterLayer];
    }
    
    
    CGRect topStartArea =  CGRectMake(-topLayer.width,  0, topLayer.width, photoLayerHeight);
    
    CGRect topSecodArea = CGRectMake(-photoLayerWidth/2, 0, topLayer.width, photoLayerHeight);
    
    CAAnimationGroup *topCameraMoveAni = [[AVSceneAnimateCamera alloc] cameraMovePath:subDuration withBeginTime:beginTime+beginOffsetTime startArea:topStartArea endArea:topSecodArea windowArea:CGRectMake(0, 0,photoLayerWidth*4, photoLayerHeight)];
    
    topCameraMoveAni.timingFunction = [CAMediaTimingFunction easeOutQuart];
    
    [topLayer addAnimation:topCameraMoveAni forKey:@"topCameraMoveAni"];
    
    //中间
    AVBottomLayer *centerLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, topLayer.bottom, kAVWindowWidth, photoLayerHeight)];
    [currentLayer addSublayer:centerLayer];
    NSArray *centerLayerList = @[(__bridge id)UIColorFromRGBAlpha(0x8957a1, 0.3).CGColor,
                                 (__bridge id)[UIColor clearColor].CGColor,
                                 (__bridge id)UIColorFromRGBAlpha(0x32b16c, 0.3).CGColor
                                 ];
    for (int i = 0; i < 3; i++) {
        AVBasicLayer *imageLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(photoLayerWidth*i, topLayer.bottom, photoLayerWidth, photoLayerHeight) withImage:currentImage];
        [centerLayer addSublayer:imageLayer];
        AVBottomLayer *filterLayer = [[AVBottomLayer alloc] initWithFrame:imageLayer.bounds bgColor:(__bridge CGColorRef)(centerLayerList[i])];
        [imageLayer addSublayer:filterLayer];
    }
    CGRect centerStartArea =  CGRectMake(centerLayer.width,  0, centerLayer.width, photoLayerHeight);
    
    CGRect centerSecodArea = CGRectMake(0, 0, centerLayer.width, photoLayerHeight);
    
    CAAnimationGroup *centerCameraMoveAni = [[AVSceneAnimateCamera alloc] cameraMovePath:subDuration withBeginTime:beginTime+beginOffsetTime startArea:centerStartArea endArea:centerSecodArea windowArea:CGRectMake(0, topLayer.bottom,kAVWindowWidth, photoLayerHeight)];
    
    centerCameraMoveAni.timingFunction = [CAMediaTimingFunction easeOutQuart];
    
    [centerLayer addAnimation:centerCameraMoveAni forKey:@"centerCameraMoveAni"];
    
    //底部
    AVBottomLayer *bottomLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, centerLayer.bottom, photoLayerWidth*count, photoLayerHeight)];
    [currentLayer addSublayer:bottomLayer];
    NSArray *bottomColorList = @[(__bridge id)UIColorFromRGBAlpha(0xf39700, 0.3).CGColor,
                                 (__bridge id)UIColorFromRGBAlpha(0xf29c9f, 0.3).CGColor,
                                 (__bridge id)UIColorFromRGBAlpha(0x7ecef4, 0.3).CGColor,
                                 (__bridge id)UIColorFromRGBAlpha(0x00a0e9, 0.3).CGColor
                                 ];
    for (int i = 0; i < count; i++) {
        AVBasicLayer *imageLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(photoLayerWidth*i, centerLayer.bottom, photoLayerWidth, photoLayerHeight) withImage:currentImage];
        [bottomLayer addSublayer:imageLayer];
        AVBottomLayer *filterLayer = [[AVBottomLayer alloc] initWithFrame:imageLayer.bounds bgColor:(__bridge CGColorRef)(bottomColorList[i])];
        [imageLayer addSublayer:filterLayer];
    }
    CGRect bottomStartArea =  CGRectMake(-bottomLayer.width,  0, bottomLayer.width, photoLayerHeight);
    
    CGRect bottomSecodArea = CGRectMake(-photoLayerWidth/2, 0, bottomLayer.width, photoLayerHeight);
    
    CAAnimationGroup *bottomCameraMoveAni = [[AVSceneAnimateCamera alloc] cameraMovePath:subDuration
                                                                           withBeginTime:beginTime+beginOffsetTime startArea:bottomStartArea endArea:bottomSecodArea windowArea:CGRectMake(0, 0,photoLayerWidth*4, photoLayerHeight)];
    
    bottomCameraMoveAni.timingFunction = [CAMediaTimingFunction easeOutQuart];
    
    [bottomLayer addAnimation:bottomCameraMoveAni forKey:@"bottomCameraMoveAni"];

}

-(void)AVSAniMoreColorLayerHorizontalLayout
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    UIImage *currentImage = [UIImage imageNamed:@"shu.png"];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat duration = 2.0;
    
    int count  = 4;
    float spaceWidth = kAVCeilfY(5);
    float subLayerWidth = currentLayer.contentLayer.bounds.size.width*kAVWindowHeight/currentLayer.contentLayer.bounds.size.height;
    
    NSArray *colorList = @[(__bridge id)UIColorFromRGBAlpha(0xf29c9f, 0.3).CGColor,
                           (__bridge id)UIColorFromRGBAlpha(0xf39700, 0.3).CGColor,
                           (__bridge id)UIColorFromRGBAlpha(0x84ccc9, 0.3).CGColor,
                           (__bridge id)[UIColor clearColor].CGColor,
                           ];
    AVBottomLayer *backLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, (subLayerWidth+spaceWidth)*count, kAVWindowHeight) bgColor:[UIColor whiteColor].CGColor];
    backLayer.anchorPoint = CGPointMake(0, 0);
    [currentLayer addSublayer:backLayer];
    
    for(int i = 0 ; i < count; i++)
    {
        AVBottomLayer *imageLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake((subLayerWidth+spaceWidth)*i, 0, subLayerWidth, kAVWindowHeight) withImage:currentImage];
        [backLayer addSublayer:imageLayer];
        AVBottomLayer *filterLayer = [[AVBottomLayer alloc] initWithFrame:imageLayer.bounds bgColor:(__bridge CGColorRef)(colorList[i])];
        [imageLayer addSublayer:filterLayer];
    }
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *moveCenterValues = @[
                                  [NSValue valueWithCGPoint:CGPointMake(0, 0 )],
                                  
                                  [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth-backLayer.width, 0)],
                                  ];
    CAKeyframeAnimation *moveAnimation = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:moveCenterValues keyTimes:moveKeyTime];
    
    // moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [backLayer addAnimation:moveAnimation forKey:nil];
}

-(void)AVSAniMoreColorLayerSudokuLayout
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    UIImage *currentImage = [UIImage imageNamed:@"shu.png"];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    NSArray *colorList = @[UIColorFromRGBAlpha(0x00a0e9, 0.3),UIColorFromRGBAlpha(0x7d7d7d, 0.3),UIColorFromRGBAlpha(0xfff799, 0.3),UIColorFromRGBAlpha(0xf39700, 0.5),UIColorFromRGBAlpha(0x8957a1, 0.5),UIColorFromRGBAlpha(0x32b16c, 0.5),UIColorFromRGBAlpha(0xf29c9f, 0.5),UIColorFromRGBAlpha(0x7ecef4, 0.3)];
    
    int count = 3;
    float photoLayerHeight = kAVWindowHeight/count;
    float photoLayerWidth = kAVWindowWidth/count;
    int index = 0;
    
    for (int i = 0; i < count; i++) {
        for (int j = 0; j < count; j++) {
            if (!(i==1&&j==1))
            {
                AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(j*photoLayerWidth, i*photoLayerHeight, photoLayerWidth, photoLayerHeight) withImage:currentImage];
                
                [currentLayer addSublayer:photoLayer];
                if(i==0)
                {
                    index = j;
                    
                }else if (i == 1)
                {
                    if (j == 0) {index = 7;}else if (j==2){index = 3;};
                }else
                {
                    if (j==0){index = 6;}else if (j==1){index = 5;}else{index = 4;}
                }
                UIColor *filterColor = (UIColor *)colorList[index];
                AVBasicLayer *filterLayer = [[AVBasicLayer alloc] initWithFrame:photoLayer.bounds bgColor:filterColor.CGColor];
                [photoLayer addSublayer:filterLayer];
                
                CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.3 withBeginTime:beginTime+(index*0.15)];
                filterLayer.opacity= 0.0f;
                [filterLayer addAnimation:opacityOpenAni forKey:@"dfs"];
                
            }
        }
    }
    AVBasicLayer *centerPhotoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight) withImage:currentImage];
    [currentLayer addSublayer:centerPhotoLayer];
    NSValue *fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.333333, 0.333333, 1.0)];
    NSValue *toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    CABasicAnimation *centerAni = [[AVBasicRouteAnimate alloc] customBasic:0.5 withBeginTime:beginTime+1.3 fromValue:fromValue toValue:toValue propertyName:@"transform.scale"];
    [centerPhotoLayer addAnimation:centerAni forKey:nil];

}

-(void)magazineStartOne
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 1.0;
    
    NSMutableArray *moveLayerList = [[NSMutableArray alloc] init];
    
    NSString *titleString = @"里插入一行或多行数据";
    
        //three
    AVBottomLayer *threeGgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"MagazineStartBg3"]];
    
    
        AVBottomLayer *contendthreeLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(300, 300, 280, 280) withImage:[UIImage imageNamed:@"0"]];
    
    [threeGgLayer addSublayer: contendthreeLayer];
    
    [homeLayer addSublayer: threeGgLayer];
    
    
    
    [moveLayerList addObject: threeGgLayer];
    
    //two
    AVBottomLayer *twoGgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"MagazineStartBg2"]];
    
    
    [homeLayer addSublayer:twoGgLayer];
    
    UIImage *contendTwoImage = [UIImage imageNamed:@"shu.png"];
    
    CGFloat twoImageHight = contendTwoImage.size.height*300/contendTwoImage.size.width;
    
    AVBottomLayer *contendTwoLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(270, 0, 300, twoImageHight) withImage:contendTwoImage];
    
    contendTwoLayer.anchorPoint = CGPointMake(0, 1);
    contendTwoLayer.position = CGPointMake(270, kAVWindowHeight-30);
    
    [twoGgLayer addSublayer:contendTwoLayer];
    
    [moveLayerList addObject: twoGgLayer];
    
    //one
    AVBottomLayer *oneGgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                             withImage:[UIImage imageNamed:@"MagazineStartBg1"]];
    
    [homeLayer addSublayer: oneGgLayer];
    
    UIFont *font = [UIFont systemFontOfSize:37];
    
    CGSize textSize = [titleString sizeWithAttributes:
                   @{NSFontAttributeName:font}];
    
    AVBottomLayer *borthLayer= [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 300, textSize.width+30, textSize.height+40)
                                                            bgColor:[UIColor clearColor].CGColor];
    
    borthLayer.position = CGPointMake(kAVWindowCenter.x, 350);
    
    borthLayer.borderColor = UIColorFromRGB(0xf19ec2).CGColor;
    
    borthLayer.borderWidth = 7;
    
    [oneGgLayer addSublayer: borthLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, textSize.width, textSize.height)
                                                                   intText:titleString
                                                                  textFont:font
                                                                 textColor:UIColorFromRGB(0xf19ec2)];

    [borthLayer addSublayer: textLayer];
    
    [moveLayerList addObject: oneGgLayer];

    
    for (NSInteger index = 0; index < [moveLayerList count]; index++) {

        AVBottomLayer *bgLayer =moveLayerList[[moveLayerList count]-1-index];
        
        CGPoint nextPosition = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
        
        CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.45 withBeginTime:beginTime+0.5+(index*0.4) fromValue:kAVWindowCenter toValue:nextPosition];
        
        [bgLayer addAnimation: moveAni forKey:@"moveAni"];
    }
    
}

-(void)magazineStartTwo
{
    
    AVBottomLayer *twoGgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                  withImage:[UIImage imageNamed:@"MagazineStartBg2"]];
    
    
    [homeLayer addSublayer:twoGgLayer];
    
    UIImage *contendTwoImage = [UIImage imageNamed:@"shu.png"];
    
    CGFloat twoImageHight = contendTwoImage.size.height*300/contendTwoImage.size.width;
    
    AVBottomLayer *contendTwoLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(270, 0, 300, twoImageHight) withImage:contendTwoImage];
    
    contendTwoLayer.anchorPoint = CGPointMake(0, 1);
    contendTwoLayer.position = CGPointMake(270, kAVWindowHeight-30);
    
    [twoGgLayer addSublayer:contendTwoLayer];
    
}



-(void)magazineStartThree
{
    AVBasicLayer *currentLayerThree = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                             vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"magazineStartThree"]];
    
    [homeLayer addSublayer:currentLayerThree];
    
    
    AVBottomLayer *threeBlurLayerTop = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"gril"]];
    
    
    threeBlurLayerTop.position = CGPointMake(160, 160);
    
    
    [currentLayerThree addSublayer:threeBlurLayerTop];
    
    AVBottomLayer *threeBlurLayerBottom = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"top"]];
    
    
    threeBlurLayerBottom.position = CGPointMake(450,450);
    
    
    [currentLayerThree addSublayer:threeBlurLayerBottom];
}

- (void)lensOne{

    //lensOne
    
    UIImage *lensOneImage = [UIImage imageNamed:@"magazineStartOne"];
    
    AVBottomLayer *blurLayerTop = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:lensOneImage];
    AVBasicLayer *currentLayerOne = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:lensOneImage];
    
    [homeLayer addSublayer:currentLayerOne];
    
   // AVBottomLayer *blurLayerTop = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 280, 280) withImage:[UIImage imageNamed:@"gril"]];
    
    blurLayerTop.position = CGPointMake(430, 160);
    
    [currentLayerOne addSublayer:blurLayerTop];
    
    AVBottomLayer *blurLayerBottom = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 280, 280) withImage:[UIImage imageNamed:@"top"]];
    
    blurLayerBottom.position = CGPointMake(430,450);
    
    [currentLayerOne addSublayer:blurLayerBottom];
    
    
    return;
    //lensTwo
    
    AVBasicLayer *currentLayerTwo = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"magazineStartTwo"]];

    [homeLayer addSublayer:currentLayerTwo];
    
    AVBottomLayer *twoBlurLayerTop = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"gril"]];
    
    twoBlurLayerTop.position = CGPointMake(440, 160);
    
    [currentLayerTwo addSublayer:twoBlurLayerTop];
    
    AVBottomLayer *twoBlurLayerBottom = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"top"]];
    
    twoBlurLayerBottom.position = CGPointMake(440,450);
    
    [currentLayerTwo addSublayer:twoBlurLayerBottom];
    
    AVBottomLayer *twoBlurLayerLeft = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"top"]];
    
    twoBlurLayerLeft.position = CGPointMake(150,370);
    
    [currentLayerTwo addSublayer:twoBlurLayerLeft];
    
    
    //lensThree
    
    AVBasicLayer *currentLayerThree = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"magazineStartThree"]];
    
    [homeLayer addSublayer:currentLayerThree];
    
    
    AVBottomLayer *threeBlurLayerTop = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"gril"]];
    
    
    threeBlurLayerTop.position = CGPointMake(160, 160);
    
    
    [currentLayerThree addSublayer:threeBlurLayerTop];
    
    AVBottomLayer *threeBlurLayerBottom = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 270, 270) withImage:[UIImage imageNamed:@"top"]];
    
    
    threeBlurLayerBottom.position = CGPointMake(450,450);
    
    
    [currentLayerThree addSublayer:threeBlurLayerBottom];
    
    
    AVBottomLayer *threeBlurLayerLeft = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 160, 160) withImage:[UIImage imageNamed:@"magazineStartThreeCenter"]];
    
    threeBlurLayerLeft.position = CGPointMake(300,300);
    
    [currentLayerThree addSublayer:threeBlurLayerLeft];
    
    
    //end
    CFTimeInterval beginTime = ([homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1);
    
    CGFloat duration = 1.0;
    
    NSArray *keyTime = @[
                         
                         [NSNumber numberWithFloat:0],
                         
                         [NSNumber numberWithFloat:1],
                         
                         ];
    
    NSArray *centerValues = @[
                              
                            [NSValue valueWithCGPoint:CGPointMake(currentLayerOne.width/2, currentLayerOne.width/2)],
                              
                            [NSValue valueWithCGPoint:CGPointMake(300, -300)],
                              
                              ];
    
     CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    
    [currentLayerTwo addAnimation: leftRightMoveAni forKey:nil];
    
    
}



- (void)loading{
    
    AVBasicLayer *basicLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"lensThree.png"]];
    
    [homeLayer addSublayer:basicLayer];
    
    CAShapeLayer *bottomShapeLayer = [CAShapeLayer layer];
    
    bottomShapeLayer.position = CGPointMake(275, 275);
    
    bottomShapeLayer.strokeColor  =[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    
    bottomShapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    bottomShapeLayer.lineWidth = KShapelayerLineWidth;
    
    bottomShapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(KShapeLayerMargin, 0, KShapeLayerWidth, KShapeLayerWidth) cornerRadius:KShapeLayerRadius].CGPath;
    
    [basicLayer addSublayer:bottomShapeLayer];
    
    CAShapeLayer *outShapeLayer = [CAShapeLayer layer];
    
    outShapeLayer.position = CGPointMake(275, 275);
    
    outShapeLayer.strokeColor = [UIColor colorWithRed:0.984 green:0.153 blue:0.039 alpha:1.000].CGColor;
    
    outShapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    outShapeLayer.lineWidth = KShapelayerLineWidth;
    
    outShapeLayer.lineDashPattern = @[@6,@3];
    
    outShapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(KShapeLayerMargin, 0, KShapeLayerWidth, KShapeLayerWidth) cornerRadius:KShapeLayerRadius].CGPath;
    
    [basicLayer addSublayer:outShapeLayer];
    
    //起始动画
    
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    
    strokeStartAnimation.fromValue = @(-1);
    
    strokeStartAnimation.toValue = @(1.0);
    
    //终点动画
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    strokeEndAnimation.fromValue = @(0.0);
    
    strokeEndAnimation.toValue = @(1.0);
    
    //组合动画
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    animationGroup.animations = @[strokeStartAnimation,strokeEndAnimation];
    
    animationGroup.duration = KAnimationDurationTime;
    
    animationGroup.repeatCount = CGFLOAT_MAX;
    
    animationGroup.fillMode = kCAFillModeForwards;
    
    animationGroup.removedOnCompletion = NO;
    
    [outShapeLayer addAnimation:animationGroup forKey:nil];
    
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    
    blurView.layer.cornerRadius = 10;
    
    blurView.layer.masksToBounds = YES;
    
    blurView.frame = CGRectMake(0, 0, 100, 100);
    
    blurView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    [self.view insertSubview:blurView belowSubview:self.view];
    
    
}

-(void)AVAniSTMoreColorSidewaysMoveGoNextClose
{
    CGFloat BgDuration = 1.7;
    
    CGFloat moveduration = 0.8;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat moveDuration = 1.0;
    
    
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
    
    CGFloat offset = kAVCeilfX(kAVDiagonalSlope*130);
    CGFloat slopeWidth = kAVWindowWidth+(offset*2);
    CGFloat slopeHeight = kAVWindowHeight+(offset*2);
    
    currentLayer.masksToBounds = YES;
    
    AVBottomLayer *lastTopLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-offset, -offset,slopeWidth, slopeHeight)
                                                               bgColor:UIColorFromRGBAlpha(0x8957a1, 0.8).CGColor];
    lastTopLayer.anchorPoint = CGPointMake(0, 0.5);
    lastTopLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    [currentLayer addSublayer:lastTopLayer];
    
    AVBottomLayer *lastBottomLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-offset, -offset,slopeWidth, slopeHeight)
                                                                  bgColor:UIColorFromRGBAlpha(0x8957a1, 0.8).CGColor];
    lastBottomLayer.anchorPoint = CGPointMake(1, 0.5);
    lastBottomLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    [currentLayer addSublayer:lastBottomLayer];
    NSArray *lastBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  
                                  [NSNumber numberWithFloat:1],
                                  ];
    
    NSArray *lastBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  slopeHeight)],
                                       
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, slopeWidth,slopeHeight)],
                                       ];
    
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveduration withBeginTime:beginTime+1 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:lastBoundKeyTime];
    
    [lastTopLayer addAnimation:boundsAni forKey:nil];
    [lastBottomLayer addAnimation:boundsAni forKey:nil];
    NSArray *colorArr = @[
                          (__bridge id)UIColorFromRGBAlpha(0xf39700, 0.9).CGColor,
                          
                          (__bridge id)UIColorFromRGBAlpha(0x7ecef4, 0.9).CGColor,
                          ];
    
    for (int i = 0; i < colorArr.count; i++) {
        
        AVBottomLayer *topLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-offset, -offset, slopeWidth/3, slopeHeight) bgColor:(__bridge CGColorRef)(colorArr[i])];
        topLayer.anchorPoint = CGPointMake(0, 0.5);
        topLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        [currentLayer addSublayer:topLayer];
        
        AVBottomLayer *bottomLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-offset, -offset, slopeWidth/3, slopeHeight) bgColor:(__bridge CGColorRef)(colorArr[i])];
        bottomLayer.anchorPoint = CGPointMake(1, 0.5);
        bottomLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        [currentLayer addSublayer:bottomLayer];
        NSArray *boundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  
                                  [NSNumber numberWithFloat:1],
                                  ];
        
        NSArray *boundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  slopeHeight)],
                                       
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, slopeWidth/3,slopeHeight)],
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
    CGFloat offsetValue =  kAVCeilfX(kAVDiagonalSlope*130);
    
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

-(void)maskLineBlurStart
{

    
    UIImage *origalImage = [UIImage imageNamed:@"gril.png"];
    
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:6];
    
    
    UIImage *nostalgia = [[AVFilterPhoto alloc] filterGPUImage:imageBlur
                                                    filterType:AVImageFilterNostalgia
                                                    blurRadius:6];
    
    AVBasicLayer *blurBothLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                         vContentRect:kAVRectWindow
                                                            withImage:nostalgia];
    
    [homeLayer addSublayer: blurBothLayer];

}

-(void)AVSceneTransitePushBeforeColor
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.0;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CGPoint startPoint = CGPointZero;
    
    CGPoint endPoint =CGPointMake(kAVWindowCenter.x,  kAVWindowCenter.y);
    
    startPoint =  CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
    
    NSInteger transiteFactor = AVAniXYRightToLeft;
    
    UIColor  *beforeColor= [[UIColor redColor] colorWithAlphaComponent:0.3];

    
    switch (transiteFactor) {
        case AVAniXYRightToLeft:
        {
            
            startPoint =CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            
            startPoint =CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            
            startPoint =CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            
            startPoint =CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y+kAVWindowHeight);
            
            break;
        }
            
            
        default:
            break;
    }
    
    AVBottomLayer *filterColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, kAVWindowHeight)
                                                                   bgColor:beforeColor.CGColor];
    
    [currentLayer addSublayer: filterColorLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:duration withBeginTime:beginTime];
    filterColorLayer.opacity= 0.0f;
    [filterColorLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
    nextLayer.position = startPoint;
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPoint toValue:endPoint];
    
    moveCenter1.timingFunction = [CAMediaTimingFunction easeOutQuart];
    
    [nextLayer addAnimation:moveCenter1 forKey:@"startCenter1ds"];
    
    //before color
    AVBottomLayer *filterColorNextLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                       bgColor:beforeColor.CGColor];
    
    [nextLayer addSublayer: filterColorNextLayer];
    
    CABasicAnimation *opacityCoseAni = [[AVBasicRouteAnimate alloc] opacityClose:duration withBeginTime:beginTime];
    
    [filterColorNextLayer addAnimation:opacityCoseAni forKey:@"dfs"];
}


-(void)AVSceneTColorCoverPushNextEndOpen
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat moveDuration = 1.0;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CGPoint startPoint = CGPointZero;
    
    CGPoint endPoint = CGPointZero;
    
    UIColor  *beforeColor= [[UIColor redColor] colorWithAlphaComponent:0.4];
    
    NSInteger transiteFactor= AVAniXYRightToLeft;
    
    
    CATransform3D rationTransform = CATransform3DIdentity;
    
    switch (transiteFactor) {
        case AVAniXYRightToLeft:
        {
            
            startPoint = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            
            endPoint =CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            
            rationTransform =  CATransform3DMakeRotation(-M_PI_2, 0, 0, 1);
            
            break;
        }
            
        case AVAniXYLeftToRight:
        {
            
            endPoint = CGPointMake(kAVWindowWidth+kAVWindowCenter.y, kAVWindowCenter.y);
            
            startPoint =CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            
            rationTransform =  CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
            
            break;
        }
            
        case AVAniXYTopToBottom:
        {
            
            endPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            
            startPoint =CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            rationTransform =  CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            
            break;
        }
            
        case AVAniXYBottomToTop:
        {
            
            startPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            
            endPoint =CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            rationTransform =  CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
            
            break;
        }
            
            
        default:
            break;
    }
    
    AVBottomLayer *filterColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                   bgColor:[beforeColor colorWithAlphaComponent:0.5].CGColor];
    
    [currentLayer addSublayer: filterColorLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:moveDuration withBeginTime:beginTime];
    filterColorLayer.opacity= 0.0f;
    [filterColorLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
    AVBottomLayer *nextColorBgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                   bgColor:[beforeColor colorWithAlphaComponent:0.7].CGColor];
    
    [homeLayer addSublayer: nextColorBgLayer];
    
    nextColorBgLayer.position =startPoint;
    
    [nextColorBgLayer addSublayer: nextLayer];
    nextLayer.position = startPoint;
    
    CABasicAnimation *nextBgMoveAni = [[AVBasicRouteAnimate alloc]
                                       moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:startPoint
                                       toValue:endPoint];
    
    nextBgMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [nextColorBgLayer addAnimation:nextBgMoveAni forKey:@"currentAniMove"];
    
    
    AVBottomLayer *beforNextColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                      bgColor:[beforeColor colorWithAlphaComponent:0.5].CGColor];
    
    [nextLayer addSublayer: beforNextColorLayer];
    
    
    [beforNextColorLayer setMask:beforNextColorLayer.maskLayer];
    
    beforNextColorLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    CGFloat offset = kAVCeilfX(kAVDiagonalSlope*130);
    
    CGFloat slopeWidth = kAVWindowWidth+(offset*2);
    
    CGFloat slopeHeight = kAVWindowHeight+(offset*2);
    
    beforNextColorLayer.maskLayer.frame = CGRectMake(-offset, -offset,slopeWidth, slopeHeight);
    
    beforNextColorLayer.maskLayer.transform = rationTransform;
    
    AVBottomLayer *nextLeftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, slopeWidth/2,  slopeHeight)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    nextLeftLayer.anchorPoint = CGPointMake(0, 0);
    [ beforNextColorLayer.maskLayer addSublayer: nextLeftLayer];
    
    CABasicAnimation *nextLeftMoveAni = [[AVBasicRouteAnimate alloc]
                                         moveXYCenterTo:0.4 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(0, 0)
                                         toValue:CGPointMake(-(slopeWidth/2), 0)];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(slopeWidth/2, 0, slopeWidth/2,  slopeHeight)
                                                                 bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0);
    [ beforNextColorLayer.maskLayer addSublayer: nextRightLayer];
    
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate alloc]
                                          moveXYCenterTo:0.4 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(slopeWidth/2, 0)
                                          toValue:CGPointMake(slopeWidth, 0)];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];

}

-(void)ColorCoverPushNextEndOpen
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat moveDuration = 1.0;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CGPoint startPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
    
    CGPoint endPoint =CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
    
    AVBottomLayer *filterColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                   bgColor:kArtBlueAlphaColor.CGColor];
    
    [currentLayer addSublayer: filterColorLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:moveDuration withBeginTime:beginTime];
    filterColorLayer.opacity= 0.0f;
    [filterColorLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
    
    
    AVBottomLayer *nextColorBgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                   bgColor:[[UIColor yellowColor] colorWithAlphaComponent:0.7].CGColor];
    
    [homeLayer addSublayer: nextColorBgLayer];
    
    nextColorBgLayer.position =startPoint;
    
    [nextColorBgLayer addSublayer: nextLayer];
    nextLayer.position = startPoint;
    
    CABasicAnimation *nextBgMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                               moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:startPoint
                                                                                            toValue:endPoint];
    
    nextBgMoveAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [nextColorBgLayer addAnimation:nextBgMoveAni forKey:@"currentAniMove"];
    
    
    AVBottomLayer *beforNextColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                   bgColor:[[UIColor yellowColor] colorWithAlphaComponent:0.5].CGColor];
    
    [nextLayer addSublayer: beforNextColorLayer];

    
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
                                          moveXYCenterTo:0.4 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(0, 0)
                                          toValue:CGPointMake(-(newSize/2), 0)];
    
    [nextLeftLayer addAnimation:nextLeftMoveAni forKey:@"currentAniMove"];
    
    
    
    
    AVBottomLayer *nextRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(newSize/2, 0, newSize/2,  newSize)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    nextRightLayer.anchorPoint = CGPointMake(0, 0);
    [ beforNextColorLayer.maskLayer addSublayer: nextRightLayer];
    
    
    CABasicAnimation *nextRightMoveAni = [[AVBasicRouteAnimate defaultInstance]
                                       moveXYCenterTo:0.4 withBeginTime:beginTime+moveDuration fromValue:CGPointMake(newSize/2, 0)
                                       toValue:CGPointMake(newSize, 0)];
    
    [nextRightLayer addAnimation:nextRightMoveAni forKey:@"currentAniMove"];
    

    
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
