//
//  SunshineViewController.m
//  AVCoreTest
//
//  Created by 姚冬润 on 2018/6/28.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SunshineViewController.h"
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

@interface SunshineViewController ()

@end

@implementation SunshineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self AVTransiteSunshineLeftToRightWithArtInRight];
//    [self AVTransiteSunshineTopToBottom];
//    [self AVTransiteSunshineRightToLeftWithArtInLeft];
//    [self AVTransiteSunshineRightToLeftWithArtInRight];
//    [self AVTransiteSunshineTopToLeftAndDownToRight];
//    [self AVTransiteSunshineFastRightToLeft];
//    [self AVSceneSunshineManyPhotoShow];
//    [self AVSceneSunshineMirrorTransform];
//    [self AVSceneSunshineMirrorTransform2];
//    [self AVTransiteSunshineOpenFromCenterToUpAndDown];
//    [self AVTransiteSunshineOpenFromCenterToLeftAndRight];
//    [self testMoveSunshine];
//    [self AVTransiteSunshineThreeSilderMove];
//    [self testScale];
//    [self testLightMove];
//    [self testFilterScale];
//    [self AVTransiteSunShineScaleAndMove];
//    [self colorLayer];
//    [self AVTransiteSunshineTwoPhotoMoveTocenter];
//    [self AVTransiteSunshineDownToTopWithArtInTop];
//    [self testopacityAni];
//    [self AVSceneSunshineScaleJump];
//    [self AVSceneSunshineSkinwhiteOpactiy];
//    [self testOpacityAndMove];
//    [self AVSceneSunshineNineBird];
//    [self AVSceneSunshineScaleJump];
//    [self testjump];
//    [self AVTransiteSunShineScaleAndMove2];
    
//    [self testOne];
    // Do any additional setup after loading the view.
    
    
}


- (void)AVTransiteSunShineScaleAndMove2{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.3;
    
    CALayer *bgLayer = [CALayer layer];
    bgLayer.frame = CGRectMake(0, 0, kAVWindowWidth*6, kAVWindowHeight*4);
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    bgLayer.anchorPoint = CGPointMake(0.244, 0.625);
    bgLayer.backgroundColor = UIColorFromRGB(0x34005B).CGColor;
    [homeLayer addSublayer:bgLayer];
    [bgLayer setValue:@(0.5) forKeyPath:@"transform.scale"];
    
    AVBasicLayer *leftTopLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) withImage:[UIImage imageNamed:@"y1"]];
    leftTopLayer.contentsGravity = kCAGravityResizeAspectFill;
    leftTopLayer.position = CGPointMake(0.9*kAVWindowWidth, kAVWindowHeight);
    [bgLayer addSublayer:leftTopLayer];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    currentLayer.position = CGPointMake(1.4*kAVWindowWidth, 2.5*kAVWindowHeight);
    [bgLayer addSublayer:currentLayer];
    
    AVBottomLayer *leftDownLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight) bgColor:UIColorFromRGB(0xFF9C00).CGColor];
    leftDownLayer.position = CGPointMake(kAVWindowWidth*0.9, 3.5*kAVWindowHeight);
    [bgLayer addSublayer:leftDownLayer];
    
    AVBasicLayer *centerDownLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) withImage:[UIImage imageNamed:@"y2"]];
    centerDownLayer.contentsGravity = kCAGravityResizeAspectFill;
    centerDownLayer.position = CGPointMake(kAVWindowWidth*2.9, 3*kAVWindowHeight);
    [bgLayer addSublayer:centerDownLayer];
    
    AVBasicLayer *rightTopLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) withImage:[UIImage imageNamed:@"y3"]];
    rightTopLayer.contentsGravity = kCAGravityResizeAspectFill;
    rightTopLayer.position = CGPointMake(4.9*kAVWindowWidth, kAVWindowHeight);
    [bgLayer addSublayer:rightTopLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.position = CGPointMake(4.4*kAVWindowWidth, 1.5*kAVWindowHeight);
    [bgLayer addSublayer:nextLayer];
    
    AVBottomLayer *rightDownLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) bgColor:UIColorFromRGB(0xFF9C00).CGColor];
    rightDownLayer.position = CGPointMake(4.9*kAVWindowWidth, 3*kAVWindowHeight);
    [bgLayer addSublayer:rightDownLayer];
    
    
    NSArray *values = @[@(1),@(0.5),@(0.5),@(1.0)];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"transform.scale" values:values keyTimes:@[@(0.0),@(0.3),@(0.7),@(1.0)]];
    
    NSArray *location = @[[NSValue valueWithCGPoint:CGPointMake(0.233, 0.625)],
                          [NSValue valueWithCGPoint:CGPointMake(0.233, 0.625)],
                          [NSValue valueWithCGPoint:CGPointMake(0.733, 0.375)],
                          [NSValue valueWithCGPoint:CGPointMake(0.733, 0.375)]];
    NSArray *times = @[@(0.0),@(0.34),@(0.66),@(1.0)];
    
    CAKeyframeAnimation *moveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"anchorPoint" values:location keyTimes:times];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[scaleAni,moveAni]];
    
    [bgLayer addAnimation:groupAni forKey:@"ani"];
    
//    CABasicAnimation *moveAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(0.25, 0.625)] toValue:[NSValue valueWithCGPoint:CGPointMake(0.75, 0.375)] propertyName:@"anchorPoint"];
//    [bgLayer addAnimation:moveAni forKey:@"moveAni"];

}

- (void)testOne{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];

    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.opacity = 0.0;
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *opacityAin = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
    [nextLayer addAnimation:opacityAin forKey:@"opacityAin"];
}

- (void)testjump{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+3;
    CFTimeInterval moveDuration = 0.83;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    NSArray *values = @[@(1.0),@(1.0),@(1.3),@(1.3),@(1.4),@(1.4),@(1),@(1.3),@(1.3),@(1.4)];
    NSArray *times = @[@(0.0),@(0.35),@(0.4),@(0.55),@(0.6),@(0.75),@(0.8),@(0.85),@(0.95),@(1.0)];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniTransformScale values:values keyTimes:times];
    [currentLayer addAnimation:scaleAni forKey:@"scaleAni"];
}

- (void)AVSceneSunshineNineBird{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.83;
    
    CALayer *bgLayer = [CALayer layer];
    bgLayer.frame = CGRectMake(0, 0, kAVWindowWidth*3, kAVWindowHeight*3);
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    [homeLayer addSublayer:bgLayer];
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"desktop"] filterType:AVImageFilterBlackWhite];
    
    for (NSInteger index = 0; index < 9; index++) {
        
//        NSInteger topValue = index/3;
//        NSInteger leftValue = index%3;
        
//        AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(leftValue*kAVWindowWidth, topValue*kAVWindowHeight, kAVWindowWidth, kAVWindowHeight) withImage:filterImage];
        
        AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
        
        CGFloat topValue = (CGFloat)(2*((index/3)+1)-1)/6;
        CGFloat leftValue = (CGFloat)(2*((index%3)+1)-1)/6;
        photoLayer.position = CGPointMake(kAVWindowWidth*leftValue, kAVWindowHeight*topValue);
        if (index == 4) {
            
            photoLayer.contentLayer.contents = (id)[UIImage imageNamed:@"desktop"].CGImage;
        }
        
        [bgLayer addSublayer:photoLayer];
    }
    
    [bgLayer setValue:@(0.3333) forKeyPath:@"transform.scale"];
    
}

- (void)testOpacityAndMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.83;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.opacity = 0.0;
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.05 withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
    [nextLayer addAnimation:opacityAni forKey:@"opacityAni"];
    
    CABasicAnimation *posiationAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.9 withBeginTime:beginTime+moveDuration*0.1 fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight/2)] propertyName:@"position"];
    [currentLayer addAnimation:posiationAni forKey:@"posiationAni"];
    
    CABasicAnimation *posiation2Ani = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.9 withBeginTime:beginTime+moveDuration*0.1 fromValue:[NSValue valueWithCGPoint:CGPointMake(-kAVWindowWidth/2, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] propertyName:@"position"];
    [nextLayer addAnimation:posiation2Ani forKey:@"posiation2Ani"];
    
    {
        
        CGFloat width = kAVWindowWidth*0.40;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.2);
        CGPoint fromPoint = CGPointMake(kAVWindowWidth+width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(kAVWindowWidth-width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime+moveDuration*0.1
                                               duration:moveDuration*0.9
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
    
    {
        CGFloat width = kAVWindowWidth*0.27;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.5);
        CGPoint fromPoint = CGPointMake(kAVWindowWidth+width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(kAVWindowWidth-width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime+moveDuration*0.1
                                               duration:moveDuration*0.9
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
    
    {
        CGFloat width = kAVWindowWidth*0.13;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.8);
        CGPoint fromPoint = CGPointMake(kAVWindowWidth+width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(kAVWindowWidth-width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime+moveDuration*0.1
                                               duration:moveDuration*0.9
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
}

- (void)AVSceneSunshineSkinwhiteOpactiy{
   
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;
    
    UIImage *original = [UIImage imageNamed:@"desktop"];
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:original filterType:AVImageFilterBrightness blurRadius:10];
    
    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:original];
    [homeLayer addSublayer:photoLayer];
    
    AVBasicLayer *filterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
    [photoLayer addSublayer:filterLayer];
    
    AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor];
    [filterLayer addSublayer:colorLayer];
    
    NSArray *values = @[@(0.0),@(0.4),@(1.0),@(0.9),@(0.0)];
    NSArray *time = @[@(0.0),@(0.2),@(0.5),@(0.7),@(1.0)];
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"opacity" values:values keyTimes:time];
    [filterLayer addAnimation:opacityAni forKey:@"opacityAni"];
    [colorLayer addAnimation:opacityAni forKey:@"opacityAni1"];
    
}

- (void)AVSceneSunshineScaleJump{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.6;
    
    AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"bgImage"]];
    [homeLayer addSublayer:colorLayer];
    
    CALayer *bgLayer = [CALayer layer];
    bgLayer.frame = CGRectMake(0, 0, kAVWindowWidth*6, kAVWindowHeight*3);
    
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    bgLayer.anchorPoint = CGPointMake(0.25, 0.5);
    [homeLayer addSublayer:bgLayer];
    
    NSArray *photoList = @[@"desktop",@"heng4",@"y1",@"y2",@"y3",@"y4"];
    
    for (NSInteger index = 0; index < photoList.count; index++) {
     
        UIImage *image = [UIImage imageNamed:photoList[index]];
        
        AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:image];
        photoLayer.position = CGPointMake(kAVWindowWidth*((index+1)-0.5), kAVWindowHeight*1.5);
        [bgLayer addSublayer:photoLayer];
    }
    NSArray *scaleValue = @[@(1.0),@(0.3333),@(0.3333),@(1)];

    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"transform.scale" values:scaleValue keyTimes:@[@(0.0),@(0.3),@(0.8),@(1.0)]];

    NSArray *location = @[[NSValue valueWithCGPoint:CGPointMake(0.25, 0.5)],
                          [NSValue valueWithCGPoint:CGPointMake(0.25, 0.5)],
                          [NSValue valueWithCGPoint:CGPointMake(0.75, 0.50)],
                          [NSValue valueWithCGPoint:CGPointMake(0.75, 0.50)]];
    NSArray *times = @[@(0.0),@(0.4),@(0.7),@(1.0)];
    
    CAKeyframeAnimation *moveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"anchorPoint" values:location keyTimes:times];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[moveAni,scaleAni]];
    [bgLayer addAnimation:groupAni forKey:@"groupAni"];
}


- (void)testopacityAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+3;
    CFTimeInterval moveDuration = 0.1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.opacity = 0.0;
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
    [nextLayer addAnimation:opacityAni forKey:@"opacityAni"];
}

- (void)AVTransiteSunshineDownToTopWithArtInTop{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.33;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*1.33) bgColor:[UIColor clearColor].CGColor];
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.335);
    [homeLayer addSublayer:bgLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.83);
    [bgLayer addSublayer:nextLayer];
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.665) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.335) propertyName:@"position"];
    [bgLayer addAnimation:positionAni forKey:@"positionAni"];
    
    CGFloat pointY = kAVWindowHeight*0.33;
    
    //one
    {
        CGFloat height = kAVWindowHeight*0.33;
    
        AVBottomLayer *oneColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.4).CGColor];
        oneColorLayer.anchorPoint = CGPointMake(0.5, 1);
        oneColorLayer.position = CGPointMake(kAVWindowWidth/2, pointY);
        [bgLayer addSublayer:oneColorLayer];
        
        CGRect fromRect = CGRectMake(0, 0, kAVWindowWidth, height);
        CGRect toRect = CGRectMake(0, 0, kAVWindowWidth, 0);
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [oneColorLayer addAnimation:boundsAni forKey:@"boundsAni"];
    }
    //two
    {
        CGFloat height = kAVWindowHeight*0.22;

        AVBottomLayer *oneColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.6).CGColor];
        oneColorLayer.anchorPoint = CGPointMake(0.5, 1);
        oneColorLayer.position = CGPointMake(kAVWindowWidth/2, pointY);
        [bgLayer addSublayer:oneColorLayer];
        
        CGRect fromRect = CGRectMake(0, 0, kAVWindowWidth, height);
        CGRect toRect = CGRectMake(0, 0, kAVWindowWidth, 0);
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [oneColorLayer addAnimation:boundsAni forKey:@"boundsAni"];

    }
    
    //three
    {
        CGFloat height = kAVWindowHeight*0.11;
        
        AVBottomLayer *oneColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.9).CGColor];
        oneColorLayer.anchorPoint = CGPointMake(0.5, 1);
        oneColorLayer.position = CGPointMake(kAVWindowWidth/2, pointY);
        [bgLayer addSublayer:oneColorLayer];
        
        CGRect fromRect = CGRectMake(0, 0, kAVWindowWidth, height);
        CGRect toRect = CGRectMake(0, 0, kAVWindowWidth, 0);
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [oneColorLayer addAnimation:boundsAni forKey:@"boundsAni"];
        
    }
    
}

- (void)AVTransiteSunshineTwoPhotoMoveTocenter{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    CFTimeInterval moveDuration = 0.25;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];

    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:UIColorFromRGBAlpha(0x180038, 1).CGColor];
    bgLayer.opacity = 0.0;
    [homeLayer addSublayer:bgLayer];
    
    CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:moveDuration*0.16 withBeginTime:beginTime];
    [bgLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    
    AVBasicLayer *nextLeftLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight/2) withImage:[UIImage imageNamed:@"heng4"]];
    nextLeftLayer.position = CGPointMake(kAVWindowWidth*0.25, kAVWindowHeight/2);
    [bgLayer addSublayer:nextLeftLayer];
    
    CABasicAnimation *leftPositionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.84 withBeginTime:beginTime+moveDuration*0.16 fromValue:CGPointMake(0, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.25, kAVWindowHeight/2) propertyName:@"position"];
    [nextLeftLayer addAnimation:leftPositionAni forKey:@"leftPositionAni"];
    
    AVBasicLayer *nextRightLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight/2) withImage:[UIImage imageNamed:@"desktop"]];
    nextRightLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2);
    [bgLayer addSublayer:nextRightLayer];
    
    CABasicAnimation *nextPositionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.84 withBeginTime:beginTime+moveDuration*0.16 fromValue:CGPointMake(kAVWindowWidth, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2) propertyName:@"position"];
    [nextRightLayer addAnimation:nextPositionAni forKey:@"leftPositionAni"];
    
    
    AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) withImage:[UIImage imageNamed:@"redLight"]];
    colorLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    [bgLayer addSublayer:colorLayer];
    
    CABasicAnimation *colorPositionAni = [[AVBasicRouteAnimate alloc] customCGPoint:3 withBeginTime:beginTime+moveDuration*0.16 fromValue:CGPointMake(0.2, 0.5) toValue:CGPointMake(0.7, 0.5) propertyName:@"anchorPoint"];
    [colorLayer addAnimation:colorPositionAni  forKey:@"colorPositionAni"];
    
}

- (void)AVTransiteSunshineHorizontalMove{
    
    
    
    
}


- (void)test{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.5;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:0.2 withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight/2) propertyName:@"position"];
        [currentLayer addAnimation:positionAni forKey:@"positionAni"];
        
    }
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"desktop"] filterType:AVImageFilterGaussianBlur blurRadius:4];
    
    AVBasicLayer *nextFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
    [homeLayer addSublayer:nextFilterLayer];
    
//    NSArray *colorsList = @[
//                            (id)[UIColor clearColor].CGColor,
//                            (id)[UIColor whiteColor].CGColor,
//                            (id)[UIColor whiteColor].CGColor,
//                            (id)[UIColor clearColor].CGColor,
//                            ];
//
//
//    NSArray *locationList = @[
//                              [NSNumber numberWithFloat:0.0f],
//                              [NSNumber numberWithFloat:0.3f],
//                              [NSNumber numberWithFloat:0.7f],
//                              [NSNumber numberWithFloat:1.0f],
//                              ];
//
//    AVBasicGradientLayer *leftMaskLayer = [[AVBasicGradientLayer alloc] initWithFrame:kAVRectWindow
//           colorsList:colorsList
//         locationList:locationList
//           startPoint:CGPointMake(0.5, 0)
//             endPoint:CGPointMake(0.5, 1)];
//    nextFilterLayer.mask = leftMaskLayer;
    
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:0.3 withBeginTime:beginTime+0.2 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.5) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        positionAni.repeatCount = 4;
        positionAni.fillMode = kCAFillModeForwards;
        [nextFilterLayer addAnimation:positionAni forKey:@"positionAni"];
        
    }
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:nextLayer];

    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:beginTime+moveDuration];
    nextLayer.opacity= 0.0f;
    [nextLayer addAnimation:opacityOpenAni1 forKey:@"opacityOpenAni1"];
}


- (UIImage *)gradientImage:(CGRect)imageRect
                startColor:(UIColor *)startColor
                  endColor:(UIColor *)endColor{
    
    UIGraphicsBeginImageContext(imageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    //绘制Path
    CGRect rect = imageRect;
    CGPathAddEllipseInRect(path, nil, rect);
    CGPathCloseSubpath(path);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 0.9 };
    
    NSArray *colors = @[(__bridge id) startColor.CGColor, (__bridge id) endColor.CGColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    //具体方向可根据需求修改
    CGRect pathRect = CGPathGetBoundingBox(path);
    CGPoint center = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMidY(pathRect));
    CGFloat radius = MAX(pathRect.size.width / 2.0, pathRect.size.height / 2.0) * sqrt(2);
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextEOClip(context);
    
    CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    
    //从Context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)colorLayer{
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    //FFDDD8
    AVBottomLayer *bgcolorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor];
    [currentLayer addSublayer:bgcolorLayer];
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"beHappyStartIcon2"]];
    [homeLayer addSublayer:bgLayer];
    
    
    
    
    
    UIColor *oneColor = UIColorFromRGBAlpha(0xFFC8C4, 1);
    UIColor *twoColor = UIColorFromRGBAlpha(0xFFE7DD, 1);
    UIColor *threeColor = UIColorFromRGBAlpha(0xFFEEDE, 1);
    UIColor *fourColor = UIColorFromRGBAlpha(0x979AC9, 1);
    UIColor *fiveColor = UIColorFromRGBAlpha(0x9CC8DA, 1);
    UIColor *sixColor = UIColorFromRGBAlpha(0x9CC8DA, 0.4);
    UIImage *gradiendImage = [self gradientImage:CGRectMake(0, 0, kAVWindowWidth*1.5, kAVWindowHeight*1.5) startColor:[[UIColor whiteColor] colorWithAlphaComponent:0.7] endColor:fourColor];
    AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*1.5, kAVWindowHeight*1.5) withImage:gradiendImage];
    colorLayer.opacity = 0.8;
    colorLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
//    [homeLayer addSublayer:colorLayer];
    
    NSArray *colors = @[(id)oneColor.CGColor,
                          (id)twoColor.CGColor,
                          (id)twoColor.CGColor,
                          (id)oneColor.CGColor];
    NSArray *location = @[@(0.0),@(0.15),@(0.85),@(1.0)];
    
    CAGradientLayer *gradiendLayer = [CAGradientLayer layer];
    gradiendLayer.frame = CGRectMake(0, 0, kAVWindowWidth*1.2, kAVWindowHeight);
    gradiendLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    gradiendLayer.startPoint = CGPointMake(0, 0.5);
    gradiendLayer.endPoint = CGPointMake(1, 0.5);
    gradiendLayer.colors = colors;
    gradiendLayer.locations = location;
//    [homeLayer addSublayer:gradiendLayer];
}

- (void)AVTransiteSunShineScaleAndMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.3;
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*5, kAVWindowHeight*2) bgColor:UIColorFromRGB(0x34005B).CGColor];
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    bgLayer.anchorPoint = CGPointMake(0.3, 0.5);
    [homeLayer addSublayer:bgLayer];
    
    AVBasicLayer *leftTopLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 2.0*kAVWindowWidth, kAVWindowHeight) withImage:[UIImage imageNamed:@"y1"]];
    leftTopLayer.contentsGravity = kCAGravityResizeAspectFill;
    leftTopLayer.position = CGPointMake(kAVWindowWidth, 0);
    [bgLayer addSublayer:leftTopLayer];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    currentLayer.position = CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight);
    [bgLayer addSublayer:currentLayer];
    
    AVBottomLayer *downRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*1.5, kAVWindowHeight) bgColor:UIColorFromRGB(0xFF9C00).CGColor];
    downRightLayer.position = CGPointMake(kAVWindowWidth*1.75, kAVWindowHeight*2);
    [bgLayer addSublayer:downRightLayer];
    
    AVBasicLayer *rightTopLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight) withImage:[UIImage imageNamed:@"y2"]];
    rightTopLayer.position = CGPointMake(kAVWindowWidth*3, 0);
    [bgLayer addSublayer:rightTopLayer];
    
    AVBasicLayer *rightDownLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight) withImage:[UIImage imageNamed:@"y3"]];
    rightDownLayer.position = CGPointMake(kAVWindowWidth*3, kAVWindowHeight*2);
    [bgLayer addSublayer:rightDownLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.position = CGPointMake(kAVWindowWidth*3.5, kAVWindowHeight);
    [bgLayer addSublayer:nextLayer];
    
    AVBottomLayer *lastRightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*2) bgColor:UIColorFromRGB(0xFF9C00).CGColor];
    lastRightLayer.position = CGPointMake(kAVWindowWidth*4.5, kAVWindowHeight);
    [bgLayer addSublayer:lastRightLayer];
    
    NSArray *values = @[@(1),@(0.5),@(0.5),@(1.0)];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"transform.scale" values:values keyTimes:@[@(0.0),@(0.3),@(0.7),@(1.0)]];

    NSArray *location = @[[NSValue valueWithCGPoint:CGPointMake(0.3, 0.5)],
                          [NSValue valueWithCGPoint:CGPointMake(0.3, 0.5)],
                          [NSValue valueWithCGPoint:CGPointMake(0.7, 0.5)],
                          [NSValue valueWithCGPoint:CGPointMake(0.7, 0.5)]];
    NSArray *times = @[@(0.0),@(0.34),@(0.66),@(1.0)];
    
    CAKeyframeAnimation *moveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"anchorPoint" values:location keyTimes:times];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[scaleAni,moveAni]];

    [bgLayer addAnimation:groupAni forKey:@"ani"];
    
}

- (void)testFilterScale{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"desktop"] filterType:AVImageFilterGaussianBlur blurRadius:8];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    
    AVBasicLayer *filterLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*1.5) withImage:filterImage];
    filterLayer.contentsGravity = kCAGravityResize;
    filterLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    [homeLayer addSublayer:filterLayer];
}

- (void)testLightMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 3;

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *lightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*3 ,kAVWindowHeight) withImage:[UIImage imageNamed:@"yellowLight"]];
    lightLayer.position = CGPointMake(0, kAVWindowHeight/2);
    [homeLayer addSublayer:lightLayer];
    
    NSArray *values = @[[NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight/2)],
                        [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight/2)],
                        [NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight/2)]];
    NSArray *times = @[@(0.0),@(0.5),@(1.0)];
    
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];

//    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight/2)] propertyName:@"position"];
//    positionAni.repeatCount = 5;
    [lightLayer addAnimation:positionAni forKey:@"positionAni"];
}


- (void)testScale{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1;
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight*2) bgColor:[UIColor redColor].CGColor];
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    [homeLayer addSublayer:bgLayer];
    
    AVBottomLayer *topLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight) bgColor:[UIColor whiteColor].CGColor];
    topLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
    [bgLayer addSublayer:topLayer];
    
    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*2, kAVWindowHeight) withImage:[UIImage imageNamed:@"heng4"]];
    photoLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight*1.5);
    [bgLayer addSublayer:photoLayer];
    
    CABasicAnimation *sclaeAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(1) toValue:@(0.50) propertyName:@"transform.scale"];
    [bgLayer addAnimation:sclaeAni forKey:@"sclaeAni"];
    
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime+moveDuration fromValue:CGPointMake(0.5, 0.5) toValue:CGPointMake(1, 0.5) propertyName:@"anchorPoint"];
    [bgLayer addAnimation:moveAni forKey:@"moveAni"];
}


- (void)AVTransiteSunshineScaleAndMove2{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2.58;
    
    AVBottomLayer *homeBgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor redColor].CGColor];
    [homeLayer addSublayer:homeBgLayer];
    
    CGFloat width = kAVWindowWidth*4.9;
    CGFloat height = kAVWindowHeight*4;
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, height) bgColor:UIColorFromRGBAlpha(0x34005B, 1).CGColor];
    bgLayer.anchorPoint = CGPointMake(0.16, 0.62);
    bgLayer.position = CGPointMake(kAVWindowWidth*0.36, kAVWindowHeight/2);
    [homeLayer addSublayer:bgLayer];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    currentLayer.position = CGPointMake(width*0.19, height*0.62);
    [bgLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.position = CGPointMake(width*0.75, height*0.52);
    [bgLayer addSublayer:nextLayer];
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"transform.scale" values:@[@(1),@(0.5),@(0.5),@(0.5)] keyTimes:@[@(0.0),@(0.24),@(0.76),@(1.0)]];

    NSArray *location = @[[NSValue valueWithCGPoint:CGPointMake(0.16, 0.62)],
                          [NSValue valueWithCGPoint:CGPointMake(0.16, 0.62)],
                           [NSValue valueWithCGPoint:CGPointMake(0.72, 0.52)],
                          [NSValue valueWithCGPoint:CGPointMake(0.72, 0.52)]];
    NSArray *times = @[@(0.0),@(0.3),@(0.7),@(1.0)];
    
    CAKeyframeAnimation *moveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"anchorPoint" values:location keyTimes:times];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[moveAni,scaleAni]];
    [bgLayer addAnimation:groupAni forKey:@"groupAni"];
    
}


- (void)testMoveSunshine{
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 3;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *testLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, 200) bgColor:[UIColor redColor].CGColor];
    testLayer.anchorPoint = CGPointMake(0.5, 1);
    testLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    [homeLayer addSublayer:testLayer];
    
    CABasicAnimation *bounds = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 200)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)] propertyName:@"bounds"];
    [testLayer addAnimation:bounds forKey:@"bounds"];
    
}

#pragma mark -
#pragma mark - AVTransiteSunshineThreeSilderMove

- (void)AVTransiteSunshineThreeSilderMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    {
        AVBasicLayer *nextTopLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:nextTopLayer];
        nextTopLayer.mask = nextTopLayer.maskLayer;
        nextTopLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/3);
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth*2, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [nextTopLayer addAnimation:positionAni forKey:@"positionAni"];

    }
    
    //topArtLayer
    {
        CGFloat artHeight = kAVWindowHeight/3;
        AVBottomLayer *topArtLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, artHeight) bgColor:[UIColor clearColor].CGColor];
        [homeLayer addSublayer:topArtLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth, kAVWindowHeight/6) toValue:CGPointMake(-kAVWindowWidth*0.5, kAVWindowHeight/6) propertyName:@"position"];
        [topArtLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat width = kAVWindowWidth*0.475;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [topArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //two
        {
            CGFloat width = kAVWindowWidth*0.38;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.3).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [topArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //three
        {
            
            CGFloat width = kAVWindowWidth*0.29;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.7).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [topArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //four
        {
        
            CGFloat width = kAVWindowWidth*0.19;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [topArtLayer addSublayer:artLayer];
            
        }
    }
    
    {
        AVBasicLayer *nextCenterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:nextCenterLayer];
        nextCenterLayer.mask = nextCenterLayer.maskLayer;
        nextCenterLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/3);
        nextCenterLayer.maskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.82 withBeginTime:beginTime+moveDuration*0.18 fromValue:CGPointMake(kAVWindowWidth*2, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [nextCenterLayer addAnimation:positionAni forKey:@"positionAni"];
        
    }
    
    //centerArtLayer
    {
        CGFloat artHeight = kAVWindowHeight/3;
        AVBottomLayer *centerArtLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, artHeight) bgColor:[UIColor clearColor].CGColor];
        [homeLayer addSublayer:centerArtLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.82 withBeginTime:beginTime+moveDuration*0.18 fromValue:CGPointMake(kAVWindowWidth, kAVWindowHeight/2) toValue:CGPointMake(-kAVWindowWidth*0.5, kAVWindowHeight/2) propertyName:@"position"];
        [centerArtLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat width = kAVWindowWidth*0.475;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [centerArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.82 withBeginTime:beginTime+moveDuration*0.18 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //two
        {
            CGFloat width = kAVWindowWidth*0.38;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.3).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [centerArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.82 withBeginTime:beginTime+moveDuration*0.18 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //three
        {
            
            CGFloat width = kAVWindowWidth*0.29;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.7).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [centerArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.82 withBeginTime:beginTime+moveDuration*0.18 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //four
        {
            
            CGFloat width = kAVWindowWidth*0.19;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [centerArtLayer addSublayer:artLayer];
            
        }
    }
    
    {
        AVBasicLayer *nextDownLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:nextDownLayer];
        nextDownLayer.mask = nextDownLayer.maskLayer;
        nextDownLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/3);
        nextDownLayer.maskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/6*5);
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.7 withBeginTime:beginTime+moveDuration*0.3 fromValue:CGPointMake(kAVWindowWidth*2, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [nextDownLayer addAnimation:positionAni forKey:@"positionAni"];

    }
    
    //downArtLayer
    {
        CGFloat artHeight = kAVWindowHeight/3;
        AVBottomLayer *downArtLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, artHeight) bgColor:[UIColor clearColor].CGColor];
        [homeLayer addSublayer:downArtLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.7 withBeginTime:beginTime+moveDuration*0.3 fromValue:CGPointMake(kAVWindowWidth, kAVWindowHeight/6*5) toValue:CGPointMake(-kAVWindowWidth*0.5, kAVWindowHeight/6*5) propertyName:@"position"];
        [downArtLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat width = kAVWindowWidth*0.475;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [downArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.7 withBeginTime:beginTime+moveDuration*0.3 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //two
        {
            CGFloat width = kAVWindowWidth*0.38;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.3).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [downArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.7 withBeginTime:beginTime+moveDuration*0.3 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //three
        {
            
            CGFloat width = kAVWindowWidth*0.29;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.7).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [downArtLayer addSublayer:artLayer];
            
            CGRect fromRect = CGRectMake(0, 0, width, artHeight);
            CGRect toRect = CGRectMake(0, 0, kAVWindowWidth*0.19, artHeight);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.7 withBeginTime:beginTime+moveDuration*0.3 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //four
        {
            
            CGFloat width = kAVWindowWidth*0.19;
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, artHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth, artHeight/2);
            [downArtLayer addSublayer:artLayer];
            
        }
    }
}



#pragma mark -
#pragma mark - AVTransiteSunshineOpenFromCenterToLeftAndRight

- (void)AVTransiteSunshineOpenFromCenterToLeftAndRight{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 3;
//    0.58;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    //nextLeft
    {
        AVBasicLayer *leftPhotoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:leftPhotoLayer];
        
        leftPhotoLayer.mask = leftPhotoLayer.maskLayer;
        leftPhotoLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight);
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [leftPhotoLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(-kAVWindowWidth*0.25, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.25, kAVWindowHeight/2) propertyName:@"position"];
        [leftPhotoLayer.maskLayer addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //leftArt
    {
        
        AVBottomLayer *leftArtBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight) bgColor:[UIColor redColor].CGColor];
        [currentLayer addSublayer:leftArtBgLayer];
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.04 withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
        opacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [leftArtBgLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth*0.25, kAVWindowHeight/2) toValue:CGPointMake(-kAVWindowWidth*0.25, kAVWindowHeight/2) propertyName:@"position"];
        [leftArtBgLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat width = kAVWindowWidth*0.36;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
//            [leftArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.36, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.41, kAVWindowHeight);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth*0.26, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //two
        {
            CGFloat width = kAVWindowWidth*0.22;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.3).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
//            [leftArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.22, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.34, kAVWindowHeight);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth*0.27, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
            
        }
        
        //three
        {
            CGFloat width = kAVWindowWidth*0.1;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.6).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
//            [leftArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.1, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.26, kAVWindowHeight);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth*0.18, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //four
        {
            
            CGFloat width = kAVWindowWidth*0.05;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
//            [leftArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.05, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.16, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.1)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
    }
    
    //nextRight
    {
        
        AVBasicLayer *rightPhotoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:rightPhotoLayer];
        
        rightPhotoLayer.mask = rightPhotoLayer.maskLayer;
        rightPhotoLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight);
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(0, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [rightPhotoLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth*1.25, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2) propertyName:@"position"];
        [rightPhotoLayer.maskLayer addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //rihtArt
    {
        
        AVBottomLayer *rightArtBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
        [currentLayer addSublayer:rightArtBgLayer];
        rightArtBgLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2);
        rightArtBgLayer.opacity = 0.0;
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.04 withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
        opacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [rightArtBgLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*1.25, kAVWindowHeight/2) propertyName:@"position"];
        [rightArtBgLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat width = kAVWindowWidth*0.36;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.1).CGColor];
            artLayer.anchorPoint = CGPointMake(0, 0.5);
            artLayer.position = CGPointMake(0, kAVWindowHeight/2);
            [rightArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.36, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.41, kAVWindowHeight);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth*0.26, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //two
        {
            CGFloat width = kAVWindowWidth*0.22;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.3).CGColor];
            artLayer.anchorPoint = CGPointMake(0, 0.5);
            artLayer.position = CGPointMake(0, kAVWindowHeight/2);
            [rightArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.22, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.34, kAVWindowHeight);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth*0.27, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
            
        }
        
        //three
        {
            CGFloat width = kAVWindowWidth*0.1;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.6).CGColor];
            artLayer.anchorPoint = CGPointMake(0, 0.5);
            artLayer.position = CGPointMake(0, kAVWindowHeight/2);
            [rightArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.1, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.26, kAVWindowHeight);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth*0.18, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
        //four
        {
            
            CGFloat width = kAVWindowWidth*0.05;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(0, 0.5);
            artLayer.position = CGPointMake(0, kAVWindowHeight/2);
            [rightArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth*0.05, kAVWindowHeight);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth*0.16, kAVWindowHeight);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.1)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        
    }
}

#pragma mark -
#pragma mark - AVTransiteSunshineOpenFromCenterToUpAndDown

- (void)AVTransiteSunshineOpenFromCenterToUpAndDown{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.58;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    //nextTop
    {
        AVBasicLayer *topPhotoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:topPhotoLayer];
        
        topPhotoLayer.mask = topPhotoLayer.maskLayer;
        topPhotoLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2);

        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [topPhotoLayer addAnimation:positionAni forKey:@"positionAni"];
    
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*0.25) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.25) propertyName:@"position"];
        [topPhotoLayer.maskLayer addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //topArt
    {
        
        AVBottomLayer *topArtBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2) bgColor:[UIColor clearColor].CGColor];
        [currentLayer addSublayer:topArtBgLayer];
        topArtBgLayer.opacity = 0.0;
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.04 withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
        opacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [topArtBgLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.25) toValue:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*0.25) propertyName:@"position"];
        [topArtBgLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat height = kAVWindowHeight*0.26;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.4).CGColor];
            artLayer.anchorPoint = CGPointMake(0.5, 1);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            [topArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.2);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.26);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.1);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //two
        {
            CGFloat height = kAVWindowHeight*0.2;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.7).CGColor];
            artLayer.anchorPoint = CGPointMake(0.5, 1);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            [topArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.1);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.2);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:oneRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //three
        {
            CGFloat height = kAVWindowHeight*0.12;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(0.5, 1);
            artLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
            [topArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.03);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.12);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.1);
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
    }
    //nextDown
    {
        AVBasicLayer *downPhotoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        [homeLayer addSublayer:downPhotoLayer];
        
        downPhotoLayer.mask = downPhotoLayer.maskLayer;
        downPhotoLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2);

        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth/2, 0) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [downPhotoLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.25) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75) propertyName:@"position"];
        [downPhotoLayer.maskLayer addAnimation:maskAni forKey:@"maskAni"];
        
    }
    
    //downArt
    {
        
        AVBottomLayer *downArtBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2) bgColor:[UIColor clearColor].CGColor];
        [currentLayer addSublayer:downArtBgLayer];
        downArtBgLayer.opacity = 0.0;
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.04 withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
        opacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [downArtBgLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.94 withBeginTime:beginTime+moveDuration*0.06 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.25) propertyName:@"position"];
        [downArtBgLayer addAnimation:positionAni forKey:@"positionAni"];
        
        //one
        {
            CGFloat height = kAVWindowHeight*0.26;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.4).CGColor];
            artLayer.anchorPoint = CGPointMake(0.5, 0);
            artLayer.position = CGPointMake(kAVWindowWidth/2, 0);
            [downArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.2);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.26);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.1);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //two
        {
            CGFloat height = kAVWindowHeight*0.2;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFAA500, 0.7).CGColor];
            artLayer.anchorPoint = CGPointMake(0.5, 0);
            artLayer.position = CGPointMake(kAVWindowWidth/2, 0);
            [downArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.1);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.2);
            
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:oneRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
        //three
        {
            CGFloat height = kAVWindowHeight*0.12;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, height) bgColor:UIColorFromRGBAlpha(0xFAA500, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(0.5, 0);
            artLayer.position = CGPointMake(kAVWindowWidth/2, 0);
            [downArtBgLayer addSublayer:artLayer];
            
            CGRect oneRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.03);
            CGRect twoRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.12);
            CGRect threeRect = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight*0.1);
            NSArray *values = @[[NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:oneRect],
                                [NSValue valueWithCGRect:twoRect],
                                [NSValue valueWithCGRect:threeRect]];
            
            NSArray *times = @[@(0.0),@(0.06),@(0.12),@(1.0)];
            
            CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"bounds" values:values keyTimes:times];
            
            [artLayer addAnimation:boundsAni forKey:@"boundsAni"];
        }
    }
}

- (void)AVSceneSunshineMirrorTransform2{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+10;
    CFTimeInterval moveDuration = 1;
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"desktop"] filterType:AVImageFilterGaussianBlur blurRadius:4];
    
    CALayer *twoLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:1.6 toScale:2.4];
//    [self normalPhtotLayer:kAVRectWindow image:filterImage];
//    [twoLayer setValue:@(1.6) forKeyPath:@"transform.scale"];
//    [twoLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:twoLayer];
    
    CALayer *threeLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:1.3 toScale:2.1];
//    [self normalPhtotLayer:kAVRectWindow image:filterImage];
//    [threeLayer setValue:@(1.3) forKeyPath:@"transform.scale"];
//    [threeLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:threeLayer];
    
    CALayer *fourLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:1.0 toScale:1.8];
//    [self normalPhtotLayer:kAVRectWindow image:filterImage];
//    [fourLayer setValue:@(1.0) forKeyPath:@"transform.scale"];
//    [fourLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:fourLayer];
    
    CALayer *fiveLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:0.8 toScale:1.6];
//    [self normalPhtotLayer:kAVRectWindow image:filterImage];
//    [fiveLayer setValue:@(0.7) forKeyPath:@"transform.scale"];
//    [fiveLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:fiveLayer];
    
    CALayer *sixLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:0.6 toScale:1.4];
//    [self normalPhtotLayer:kAVRectWindow image:filterImage];
//    [sixLayer setValue:@(0.5) forKeyPath:@"transform.scale"];
//    [sixLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:sixLayer];
    
    CALayer *sevenLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:0.4 toScale:1.2];
    //    [self normalPhtotLayer:kAVRectWindow image:filterImage];
    //    [sixLayer setValue:@(0.5) forKeyPath:@"transform.scale"];
    //    [sixLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:sevenLayer];
    
    CALayer *oneLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:[UIImage imageNamed:@"desktop"] fromScale:0.2 toScale:1.0];
//    [self normalPhtotLayer:kAVRectWindow image:[UIImage imageNamed:@"desktop"]];
//    [oneLayer setValue:@(0.3) forKeyPath:@"transform.scale"];
//    [oneLayer setValue:@(DEGREES_TO_RADIANS(-40)) forKeyPath:@"transform.rotation.z"];
    [homeLayer addSublayer:oneLayer];
    
    
//    [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:[UIImage imageNamed:@"desktop"] fromScale:0.3 toScale:1];
//    [homeLayer addSublayer:oneLayer];
    

//    for (NSInteger index = 0; index < 10 ; index++) {
    
//    CALayer *photoLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:filterImage fromScale:0.2 toScale:1];
//    [homeLayer addSublayer:photoLayer];
    
//    }
}


- (void)AVSceneSunshineMirrorTransform{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.5;
    
    //one
    CALayer *oneLayer = [self rotationAndSacleLayer:beginTime
                                           duration:moveDuration
                                              frame:kAVRectWindow
                                              image:[UIImage imageNamed:@"heng4"]
                                          fromScale:1.6
                                            toScale:1.8];
    [homeLayer addSublayer:oneLayer];
    
    //two
    CALayer *twoLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:[UIImage imageNamed:@"heng4"] fromScale:1 toScale:1.4];
    [homeLayer addSublayer:twoLayer];
    
    //three
    CALayer *threeLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:[UIImage imageNamed:@"heng4"] fromScale:0.8 toScale:1.2];
    [homeLayer addSublayer:threeLayer];
    
    //four
    CALayer *fourLayer = [self rotationAndSacleLayer:beginTime duration:moveDuration frame:kAVRectWindow image:[UIImage imageNamed:@"heng4"] fromScale:0.6 toScale:1];
    [homeLayer addSublayer:fourLayer];
    

    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"heng4"] filterType:AVImageFilterGaussianBlur blurRadius:6];
    CALayer *filterLayer = [self normalPhtotLayer:kAVRectWindow
                                            image:filterImage];

    [homeLayer addSublayer:filterLayer];
    CALayer *maskLayer = [self normalPhtotLayer:kAVRectWindow
                                          image:[UIImage imageNamed:@"mirrorMask2"]];
    filterLayer.mask = maskLayer;
    
    CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(1) toValue:@(0) propertyName:@"opacity"];
    [filterLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
}

- (CALayer *)rotationAndSacleLayer:(CFTimeInterval)beginTime
                          duration:(CFTimeInterval)duration
                             frame:(CGRect)frame
                             image:(UIImage *)image
                         fromScale:(CGFloat)fromScale
                           toScale:(CGFloat)toScale{
    
    CALayer *photoLayer = [self normalPhtotLayer:frame image:image];
    
    CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                                     customBasic:duration
                                     withBeginTime:0
                                     fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-40)]
                                     toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                                     propertyName:kAVBasicAniRotationZ];

    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc]
                                  customBasic:duration
                                  withBeginTime:0
                                  fromValue:@(fromScale)
                                  toValue:@(toScale)
                             propertyName:kAVBasicAniTransformScale];

    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:0 aniArr:@[rotationAni,scaleAni]];
    [photoLayer addAnimation:groupAni forKey:@"groupAni"];
    return photoLayer;
}

- (CALayer *)normalPhtotLayer:(CGRect)frame image:(UIImage *)image{
    
    CALayer *photoLayer = [CALayer layer];
    photoLayer.frame = frame;
    photoLayer.contents = (id)image.CGImage;
    photoLayer.contentsGravity = kCAGravityResizeAspectFill;
    
    return photoLayer;
}

- (void)AVSceneSunshineManyPhotoShow{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.1;
    
    NSMutableArray *aniList = [NSMutableArray array];
    
    NSArray *photoList = @[[UIImage imageNamed:@"heng4"],
                           [UIImage imageNamed:@"desktop"],
                           [UIImage imageNamed:@"y1"],
                           [UIImage imageNamed:@"y2"],
                           [UIImage imageNamed:@"y3"],
                           [UIImage imageNamed:@"y4"],
                           [UIImage imageNamed:@"heng4"],
                           [UIImage imageNamed:@"desktop"],
                           [UIImage imageNamed:@"y1"],
                           [UIImage imageNamed:@"y2"],
                           [UIImage imageNamed:@"y3"],
                           [UIImage imageNamed:@"y4"],
                           [UIImage imageNamed:@"heng4"],
                           [UIImage imageNamed:@"desktop"],
                           [UIImage imageNamed:@"y1"],
                           [UIImage imageNamed:@"y2"],
                           [UIImage imageNamed:@"y3"],
                           [UIImage imageNamed:@"y4"]];
    
    CALayer *photoLayer = [CALayer layer];
    photoLayer.frame = kAVRectWindow;
    UIImage *image = photoList[0];
    photoLayer.contents = (id)image.CGImage;
    photoLayer.contentsGravity = kCAGravityResizeAspectFill;
    [homeLayer addSublayer:photoLayer];

    for (NSInteger index = 0; index < photoList.count; index++) {

        if (index == photoList.count-1) {
            
            break;
        }
        
        UIImage *currentImage = photoList[index];
        UIImage *nextImage = photoList[index+1];
        
        CABasicAnimation *contentAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:index*moveDuration fromValue:(id)currentImage.CGImage toValue:(id)nextImage.CGImage propertyName:@"contents"];
        contentAni.fillMode = kCAFillModeForwards;
        [aniList addObject:contentAni];
    }
    
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration*(photoList.count-1) withBeginTime:beginTime aniArr:aniList];
    [photoLayer addAnimation:groupAni forKey:@"groupAni"];
    
    AVBottomLayer *closeLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:UIColorFromRGB(0x7700BE).CGColor];
    [homeLayer addSublayer:closeLayer];
    closeLayer.mask = closeLayer.maskLayer;
    closeLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    //topMask
    {
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, 0)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [startPath addLineToPoint:CGPointMake(0, 0)];
        [startPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(0, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight*0.47)];
        [endPath addLineToPoint:CGPointMake(0, kAVWindowHeight*0.47)];
        [endPath closePath];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = endPath.CGPath;
        maskLayer.fillColor = [UIColor blackColor].CGColor;
        [closeLayer.maskLayer addSublayer:maskLayer];
        
        CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*(photoList.count-2) withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:@"path"];
        [maskLayer addAnimation:pathAni forKey:@"pathAni"];
    }
    
    //downMask
    {
        
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        [startPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(0, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight*0.62)];
        [endPath addLineToPoint:CGPointMake(0, kAVWindowHeight*0.62)];
        [endPath closePath];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = endPath.CGPath;
        maskLayer.fillColor = [UIColor blackColor].CGColor;
        [closeLayer.maskLayer addSublayer:maskLayer];
        
        CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*(photoList.count-2) withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:@"path"];
        [maskLayer addAnimation:pathAni forKey:@"pathAni"];
    }
}


- (void)AVTransiteSunshineFastRightToLeft{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.29;
    //1111
    {
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *nextBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*1.43, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
    nextBgLayer.position = CGPointMake(kAVWindowWidth*0.285, kAVWindowHeight/2);
    [homeLayer addSublayer:nextBgLayer];
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth*1.715, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.285, kAVWindowHeight/2) propertyName:@"position"];
    [nextBgLayer addAnimation:positionAni forKey:@"positionAni"];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    nextLayer.position = CGPointMake(kAVWindowWidth*0.93, kAVWindowHeight/2);
    [nextBgLayer addSublayer:nextLayer];

    CGFloat pointX = kAVWindowWidth*0.43;
    //one
    {
        CGFloat width = kAVWindowWidth*0.43;
        
        AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
        artLayer.anchorPoint = CGPointMake(1, 0.5);
        artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextBgLayer addSublayer:artLayer];
    }
    
    //two
    {
        CGFloat width = kAVWindowWidth*0.34;
        
        AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.6).CGColor];
        artLayer.anchorPoint = CGPointMake(1, 0.5);
        artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextBgLayer addSublayer:artLayer];
    }
    
    //three
    {
        CGFloat width = kAVWindowWidth*0.17;
        
        AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 1).CGColor];
        artLayer.anchorPoint = CGPointMake(1, 0.5);
        artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextBgLayer addSublayer:artLayer];
    }
    }
    ///2222
    CFTimeInterval twoBeginTime = beginTime+moveDuration+0.08;
    {
        
        AVBottomLayer *nextBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*1.43, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
        nextBgLayer.position = CGPointMake(kAVWindowWidth*0.285, kAVWindowHeight/2);
        [homeLayer addSublayer:nextBgLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:twoBeginTime fromValue:CGPointMake(kAVWindowWidth*1.715, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.285, kAVWindowHeight/2) propertyName:@"position"];
        [nextBgLayer addAnimation:positionAni forKey:@"positionAni"];
        
        AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
        nextLayer.position = CGPointMake(kAVWindowWidth*0.93, kAVWindowHeight/2);
        [nextBgLayer addSublayer:nextLayer];
        
        CGFloat pointX = kAVWindowWidth*0.43;
        //one
        {
            CGFloat width = kAVWindowWidth*0.43;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
            [nextBgLayer addSublayer:artLayer];
        }
        
        //two
        {
            CGFloat width = kAVWindowWidth*0.34;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.6).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
            [nextBgLayer addSublayer:artLayer];
        }
        
        //three
        {
            CGFloat width = kAVWindowWidth*0.17;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
            [nextBgLayer addSublayer:artLayer];
        }
    }
    //3333
    CFTimeInterval threeBeginTime = twoBeginTime+moveDuration+0.08;
    {
        
        AVBottomLayer *nextBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*1.43, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
        nextBgLayer.position = CGPointMake(kAVWindowWidth*0.285, kAVWindowHeight/2);
        [homeLayer addSublayer:nextBgLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:threeBeginTime fromValue:CGPointMake(kAVWindowWidth*1.715, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.285, kAVWindowHeight/2) propertyName:@"position"];
        [nextBgLayer addAnimation:positionAni forKey:@"positionAni"];
        
        AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
        nextLayer.position = CGPointMake(kAVWindowWidth*0.93, kAVWindowHeight/2);
        [nextBgLayer addSublayer:nextLayer];
        
        CGFloat pointX = kAVWindowWidth*0.43;
        //one
        {
            CGFloat width = kAVWindowWidth*0.43;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
            [nextBgLayer addSublayer:artLayer];
        }
        
        //two
        {
            CGFloat width = kAVWindowWidth*0.34;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.6).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
            [nextBgLayer addSublayer:artLayer];
        }
        
        //three
        {
            CGFloat width = kAVWindowWidth*0.17;
            
            AVBottomLayer *artLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 1).CGColor];
            artLayer.anchorPoint = CGPointMake(1, 0.5);
            artLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
            [nextBgLayer addSublayer:artLayer];
        }
    }
    
}

#pragma mark -
#pragma mark - AVTransiteSunshineLeftToRightWithArtInRight

- (void)AVTransiteSunshineLeftToRightWithArtInRight{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.83;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    CABasicAnimation *posiationAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight/2)] propertyName:@"position"];
    [currentLayer addAnimation:posiationAni forKey:@"posiationAni"];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *posiation2Ani = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(-kAVWindowWidth/2, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] propertyName:@"position"];
    [nextLayer addAnimation:posiation2Ani forKey:@"posiationAni"];

    {
        
        CGFloat width = kAVWindowWidth*0.40;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.2);
        CGPoint fromPoint = CGPointMake(kAVWindowWidth+width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(kAVWindowWidth-width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime
                                               duration:moveDuration
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
    
    {
        CGFloat width = kAVWindowWidth*0.27;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.5);
        CGPoint fromPoint = CGPointMake(kAVWindowWidth+width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(kAVWindowWidth-width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime
                                               duration:moveDuration
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
    
    {
        CGFloat width = kAVWindowWidth*0.13;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.8);
        CGPoint fromPoint = CGPointMake(kAVWindowWidth+width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(kAVWindowWidth-width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime
                                               duration:moveDuration
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
}

- (CALayer *)colorPositionAni:(CFTimeInterval)beginTime
                     duration:(CFTimeInterval)duration
                        width:(CGFloat)width
                        color:(UIColor *)color
                     fromPoint:(CGPoint)fromPoint
                      toPoint:(CGPoint)toPoint{
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, width, kAVWindowHeight);
    colorLayer.position = fromPoint;
    colorLayer.backgroundColor = color.CGColor;
    
    NSArray *value = @[[NSValue valueWithCGPoint:fromPoint],
                       [NSValue valueWithCGPoint:toPoint],
                       [NSValue valueWithCGPoint:toPoint],
                       [NSValue valueWithCGPoint:fromPoint]];
    NSArray *time = @[@(0.0),@(0.6),@(0.65),@(1.0)];

    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:@"position" values:value keyTimes:time];
    positionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [colorLayer addAnimation:positionAni forKey:@"ani"];

    return colorLayer;
}

#pragma mark -
#pragma mark - AVTransiteSunshineTopToBottom

- (void)AVTransiteSunshineTopToBottom{
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.85;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    CABasicAnimation *posiationAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight*0.5)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight*1.5)] propertyName:@"position"];
    [currentLayer addAnimation:posiationAni forKey:@"posiationAni"];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *posiation2Ani = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, -kAVWindowHeight*0.5)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight*0.5)] propertyName:@"position"];
    [nextLayer addAnimation:posiation2Ani forKey:@"posiationAni"];
}

#pragma mark -
#pragma mark - AVTransiteSunshineRightToLeftWithArtInLeft

- (void)AVTransiteSunshineRightToLeftWithArtInLeft{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.7;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    CABasicAnimation *posiationAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight*0.5)] toValue:[NSValue valueWithCGPoint:CGPointMake(-kAVWindowWidth*0.5, kAVWindowHeight*0.5)] propertyName:@"position"];
    [currentLayer addAnimation:posiationAni forKey:@"posiationAni"];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *posiation2Ani = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight*0.5)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight*0.5)] propertyName:@"position"];
    [nextLayer addAnimation:posiation2Ani forKey:@"posiationAni"];
    
    {
        
        CGFloat width = kAVWindowWidth*0.40;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.2);
        CGPoint fromPoint = CGPointMake(-width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime
                                               duration:moveDuration
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
    
    {
        CGFloat width = kAVWindowWidth*0.27;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.5);
        CGPoint fromPoint = CGPointMake(-width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime
                                               duration:moveDuration
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
    
    {
        CGFloat width = kAVWindowWidth*0.13;
        UIColor *color = UIColorFromRGBAlpha(0xFAA500, 0.8);
        CGPoint fromPoint = CGPointMake(-width*0.5, kAVWindowHeight/2);
        CGPoint toPoint = CGPointMake(width*0.5, kAVWindowHeight/2);
        CALayer *colorOneLayer = [self colorPositionAni:beginTime
                                               duration:moveDuration
                                                  width:width
                                                  color:color
                                              fromPoint:fromPoint
                                                toPoint:toPoint];
        [nextLayer addSublayer:colorOneLayer];
    }
}

#pragma mark -
#pragma mark - AVTransiteSunshineRightToLeftWithArtInRight

- (void)AVTransiteSunshineRightToLeftWithArtInRight{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.3;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *nextBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth*1.375, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
    nextBgLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
    [homeLayer addSublayer:nextBgLayer];
    
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth*1.6875, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.3125, kAVWindowHeight/2) propertyName:@"position"];
//        [nextBgLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    nextLayer.position = CGPointMake(kAVWindowWidth*0.875, kAVWindowHeight/2);
    [nextBgLayer addSublayer:nextLayer];
    
    CGFloat pointX = kAVWindowWidth*0.375;
    //one
    {
        CGFloat width = kAVWindowWidth*0.375;
        AVBottomLayer *artColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
        artColorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        artColorLayer.anchorPoint = CGPointMake(1, 0.5);
        [nextBgLayer addSublayer:artColorLayer];
        
        CGRect fromRect = CGRectMake(0, 0, width, kAVWindowHeight);
        CGRect toRect = CGRectMake(0, 0, width*0.2, kAVWindowHeight);
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.4 withBeginTime:beginTime+moveDuration*0.5 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [artColorLayer addAnimation:boundsAni forKey:@"boundsAni"];
    }
    
    //two
    {
        CGFloat width = kAVWindowWidth*0.25;
        AVBottomLayer *artColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
        artColorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        artColorLayer.anchorPoint = CGPointMake(1, 0.5);
        [nextBgLayer addSublayer:artColorLayer];
        
        CGRect fromRect = CGRectMake(0, 0, width, kAVWindowHeight);
        CGRect toRect = CGRectMake(0, 0, width*0.2, kAVWindowHeight);
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.4 withBeginTime:beginTime+moveDuration*0.5 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [artColorLayer addAnimation:boundsAni forKey:@"boundsAni"];

    }
    
    //three
    {
        CGFloat width = kAVWindowWidth*0.125;
        AVBottomLayer *artColorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
        artColorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        artColorLayer.anchorPoint = CGPointMake(1, 0.5);
        [nextBgLayer addSublayer:artColorLayer];
        
        CGRect fromRect = CGRectMake(0, 0, width, kAVWindowHeight);
        CGRect toRect = CGRectMake(0, 0, width*0.2, kAVWindowHeight);
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.4 withBeginTime:beginTime+moveDuration*0.5 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [artColorLayer addAnimation:boundsAni forKey:@"boundsAni"];
    }
}

- (CAAnimationGroup *)opactiyAniAndPositionAni:(CFTimeInterval)beginTime
                                      duration:(CFTimeInterval)duration
                                     fromPoint:(CGPoint)fromPoint
                                       toPoint:(CGPoint)toPoint{
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"opacity" values:@[@(0.0),@(1.0),@(1.0)] keyTimes:@[@(0.0),@(0.04),@(1.0)]];
    
    NSArray *values = @[[NSValue valueWithCGPoint:fromPoint],
                        [NSValue valueWithCGPoint:fromPoint],
                        [NSValue valueWithCGPoint:toPoint]];
    
    NSArray *times = @[@(0.0),@(0.06),@(1.0)];
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:@"position" values:values keyTimes:times];
    
    CAAnimationGroup *groupAni= [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[opacityAni,positionAni]];
    
    return groupAni;
    
}

- (CALayer *)colorPositionAni2:(CFTimeInterval)beginTime
                      duration:(CFTimeInterval)duration
                         width:(CGFloat)width
                         color:(UIColor *)color
                     fromPoint:(CGPoint)fromPoint
                       toPoint:(CGPoint)toPoint
                         times:(NSArray *)times{
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, width, kAVWindowHeight);
    colorLayer.position = fromPoint;
    colorLayer.backgroundColor = color.CGColor;
    
    NSArray *value = @[[NSValue valueWithCGPoint:fromPoint],
                       [NSValue valueWithCGPoint:fromPoint],
                       [NSValue valueWithCGPoint:toPoint]];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:@"position" values:value keyTimes:times];
    [colorLayer addAnimation:positionAni forKey:@"ani"];
    
    return colorLayer;
}

#pragma mark -
#pragma mark - AVTransiteSunshineTopToLeftAndDownToRight

- (void)AVTransiteSunshineTopToLeftAndDownToRight{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.625;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *nextTopBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 1.4375*kAVWindowWidth, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
    nextTopBgLayer.position = CGPointMake(kAVWindowWidth*0.28125, kAVWindowHeight/2);
    [homeLayer addSublayer:nextTopBgLayer];
    
    nextTopBgLayer.mask = nextTopBgLayer.maskLayer;
    nextTopBgLayer.maskLayer.frame = CGRectMake(0, 0, 1.4375*kAVWindowWidth, kAVWindowHeight/2);
    
    //动画
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(1.71875*kAVWindowWidth, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.28125, kAVWindowHeight/2) propertyName:@"position"];
        [nextTopBgLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    
    AVBasicLayer *nextTopLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    nextTopLayer.position = CGPointMake(kAVWindowWidth*0.9375, kAVWindowHeight/2);
    [nextTopBgLayer addSublayer:nextTopLayer];
    CGFloat pointX = kAVWindowWidth*0.4375;
    //one
    {
        CGFloat width = kAVWindowWidth*0.4375;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
        colorLayer.anchorPoint = CGPointMake(1, 0.5);
        colorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextTopBgLayer addSublayer:colorLayer];
        
    }
    //two
    {
        CGFloat width = kAVWindowWidth*0.35;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.5).CGColor];
        colorLayer.anchorPoint = CGPointMake(1, 0.5);
        colorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextTopBgLayer addSublayer:colorLayer];
        
    }
    //three
    {
        CGFloat width = kAVWindowWidth*0.27;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.7).CGColor];
        colorLayer.anchorPoint = CGPointMake(1, 0.5);
        colorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextTopBgLayer addSublayer:colorLayer];
    }
    //four
    {
        CGFloat width = kAVWindowWidth*0.1875;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 1).CGColor];
        colorLayer.anchorPoint = CGPointMake(1, 0.5);
        colorLayer.position = CGPointMake(pointX, kAVWindowHeight/2);
        [nextTopBgLayer addSublayer:colorLayer];
    }
    
    //下面
    AVBottomLayer *nextDownBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 1.4375*kAVWindowWidth, kAVWindowHeight) bgColor:[UIColor clearColor].CGColor];
    nextDownBgLayer.position = CGPointMake(kAVWindowWidth*0.71875, kAVWindowHeight/2);
    [homeLayer addSublayer:nextDownBgLayer];
    
    nextDownBgLayer.mask = nextDownBgLayer.maskLayer;
    nextDownBgLayer.maskLayer.frame = CGRectMake(0, 0, 1.4375*kAVWindowWidth, kAVWindowHeight/2);
    nextDownBgLayer.maskLayer.position = CGPointMake(kAVWindowWidth*0.71875, kAVWindowHeight*0.75);
    
    {
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(-0.71875*kAVWindowWidth, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth*0.71875, kAVWindowHeight/2) propertyName:@"position"];
        [nextDownBgLayer addAnimation:positionAni forKey:@"positionAni"];
    }
    
    AVBasicLayer *nextDownLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    nextDownLayer.position = CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight/2);
    [nextDownBgLayer addSublayer:nextDownLayer];
    
    CGFloat offsetX = kAVWindowWidth;
    //one
    {
        CGFloat width = kAVWindowWidth*0.4375;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.2).CGColor];
        colorLayer.anchorPoint = CGPointMake(0, 0.5);
        colorLayer.position = CGPointMake(offsetX, kAVWindowHeight/2);
        [nextDownBgLayer addSublayer:colorLayer];
    
    }
    
    //two
    {
        CGFloat width = kAVWindowWidth*0.35;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.5).CGColor];
        colorLayer.anchorPoint = CGPointMake(0, 0.5);
        colorLayer.position = CGPointMake(offsetX, kAVWindowHeight/2);
        [nextDownBgLayer addSublayer:colorLayer];
    
    }
    
    //three
    {
        CGFloat width = kAVWindowWidth*0.27;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 0.7).CGColor];
        colorLayer.anchorPoint = CGPointMake(0, 0.5);
        colorLayer.position = CGPointMake(offsetX, kAVWindowHeight/2);
        [nextDownBgLayer addSublayer:colorLayer];
        
    }
    //four
    {
       
        CGFloat width = kAVWindowWidth*0.1875;
        AVBottomLayer *colorLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, width, kAVWindowHeight) bgColor:UIColorFromRGBAlpha(0xFF9C00, 1).CGColor];
        colorLayer.anchorPoint = CGPointMake(0, 0.5);
        colorLayer.position = CGPointMake(offsetX, kAVWindowHeight/2);
        [nextDownBgLayer addSublayer:colorLayer];
        
    }
}

- (void)creatTopColorArtLayer:(CFTimeInterval)beginTime
                     duration:(CFTimeInterval)duration
                    rootLayer:(CALayer *)rootLayer{
    //top
    {
        CFTimeInterval moveDuration2 = duration;
        CGFloat blockWidth = kAVWindowWidth*0.08;
        CGFloat offset = kAVWindowWidth*0.1875;
        //one
        {
            CGPoint onePoint = CGPointMake(kAVWindowWidth-offset-1.5*blockWidth, kAVWindowHeight*0.25);
            CGPoint toPoint = CGPointMake(kAVWindowWidth-offset-blockWidth*0.5, kAVWindowHeight*0.25);
            CALayer *oneLayer = [CALayer layer];
            oneLayer.frame = CGRectMake(0, 0, blockWidth*3, kAVWindowHeight/2);
            oneLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 0.2).CGColor;
            oneLayer.position = onePoint;
            [rootLayer addSublayer:oneLayer];
            
            NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                                [NSValue valueWithCGPoint:onePoint],
                                [NSValue valueWithCGPoint:toPoint]];
            NSArray *times = @[@(0.0),@(0.32),@(1.0)];
            
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            [oneLayer addAnimation:positionAni forKey:@"positionAni"];
        }
        //two
        {
            
            CGPoint twoPoint = CGPointMake(kAVWindowWidth-offset-blockWidth*0.5, kAVWindowHeight*0.25);
            
            CGPoint fromPoint = CGPointMake(kAVWindowWidth-offset-blockWidth*0.25, kAVWindowHeight*0.25);
            
            CGPoint toPoint = CGPointMake(kAVWindowWidth-offset+blockWidth*0.2, kAVWindowHeight*0.25);
            
            CALayer *twoLayer = [CALayer layer];
            twoLayer.frame = CGRectMake(0, 0, blockWidth*3, kAVWindowHeight/2);
            twoLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 0.4).CGColor;
            twoLayer.position = fromPoint;
            [rootLayer addSublayer:twoLayer];
            
            NSArray *values = @[[NSValue valueWithCGPoint:fromPoint],
                                [NSValue valueWithCGPoint:twoPoint],
                                [NSValue valueWithCGPoint:twoPoint],
                                [NSValue valueWithCGPoint:toPoint]];
            NSArray *times = @[@(0.0),@(0.1),@(0.24),@(1.0)];
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            [twoLayer addAnimation:positionAni forKey:@"positionAni"];
            
        }
        //three
        {
            
            CGPoint threePoint = CGPointMake(kAVWindowWidth-offset+blockWidth*0.5, kAVWindowHeight*0.25);
            CGPoint toPoint = CGPointMake(kAVWindowWidth-offset+blockWidth*0.8, kAVWindowHeight*0.25);
            CALayer *threeLayer = [CALayer layer];
            threeLayer.frame = CGRectMake(0, 0, blockWidth*3, kAVWindowHeight/2);
            threeLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 0.6).CGColor;
            threeLayer.position = toPoint;
            [rootLayer addSublayer:threeLayer];
            
            NSArray *values = @[[NSValue valueWithCGPoint:toPoint],
                                [NSValue valueWithCGPoint:threePoint],
                                [NSValue valueWithCGPoint:threePoint],
                                [NSValue valueWithCGPoint:toPoint]];
            NSArray *times = @[@(0.0),@(0.1),@(0.24),@(1.0)];
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            [threeLayer addAnimation:positionAni forKey:@"positionAni"];
            
        }
        //four
        {
            CGFloat fourWidth = kAVWindowWidth*0.1875;
            CGPoint fourPoint = CGPointMake(kAVWindowWidth-fourWidth/2, kAVWindowHeight*0.25);
            CALayer *fourLayer = [CALayer layer];
            fourLayer.frame = CGRectMake(0, 0, fourWidth, kAVWindowHeight/2);
            fourLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 1).CGColor;
            fourLayer.position = fourPoint;
            [rootLayer addSublayer:fourLayer];
        }
    }
}


- (void)creatDownColorArtLayer:(CFTimeInterval)beginTime
                     duration:(CFTimeInterval)duration
                    rootLayer:(CALayer *)rootLayer{
    {
        CFTimeInterval moveDuration2 = duration;
        CGFloat blockWidth = kAVWindowWidth*0.08;
        CGFloat offset = kAVWindowWidth*0.1875;
        //one
        {
            CGPoint onePoint = CGPointMake(offset+1.5*blockWidth, kAVWindowHeight*0.25);
            CGPoint toPoint = CGPointMake(offset+blockWidth*0.5, kAVWindowHeight*0.25);
            CALayer *oneLayer = [CALayer layer];
            oneLayer.frame = CGRectMake(0, 0, blockWidth*3, kAVWindowHeight/2);
            oneLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 0.2).CGColor;
            oneLayer.position = onePoint;
            [rootLayer addSublayer:oneLayer];
            
            NSArray *values = @[[NSValue valueWithCGPoint:onePoint],
                                [NSValue valueWithCGPoint:onePoint],
                                [NSValue valueWithCGPoint:toPoint]];
            NSArray *times = @[@(0.0),@(0.32),@(1.0)];
            
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            [oneLayer addAnimation:positionAni forKey:@"positionAni"];
        }
        //two
        {
            
            CGPoint twoPoint = CGPointMake(offset+blockWidth*0.5, kAVWindowHeight*0.25);
            
            CGPoint fromPoint = CGPointMake(offset+blockWidth*0.25, kAVWindowHeight*0.25);
            
            CGPoint toPoint = CGPointMake(offset-blockWidth*0.2, kAVWindowHeight*0.25);
            
            CALayer *twoLayer = [CALayer layer];
            twoLayer.frame = CGRectMake(0, 0, blockWidth*3, kAVWindowHeight/2);
            twoLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 0.4).CGColor;
            twoLayer.position = fromPoint;
            [rootLayer addSublayer:twoLayer];
            
            NSArray *values = @[[NSValue valueWithCGPoint:fromPoint],
                                [NSValue valueWithCGPoint:twoPoint],
                                [NSValue valueWithCGPoint:twoPoint],
                                [NSValue valueWithCGPoint:toPoint]];
            NSArray *times = @[@(0.0),@(0.1),@(0.24),@(1.0)];
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            [twoLayer addAnimation:positionAni forKey:@"positionAni"];
            
        }
        //three
        {
            
            CGPoint threePoint = CGPointMake(offset-blockWidth*0.5, kAVWindowHeight*0.25);
            CGPoint toPoint = CGPointMake(offset-blockWidth*0.8, kAVWindowHeight*0.25);
            CALayer *threeLayer = [CALayer layer];
            threeLayer.frame = CGRectMake(0, 0, blockWidth*3, kAVWindowHeight/2);
            threeLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 0.6).CGColor;
            threeLayer.position = toPoint;
            [rootLayer addSublayer:threeLayer];
            
            NSArray *values = @[[NSValue valueWithCGPoint:toPoint],
                                [NSValue valueWithCGPoint:threePoint],
                                [NSValue valueWithCGPoint:threePoint],
                                [NSValue valueWithCGPoint:toPoint]];
            NSArray *times = @[@(0.0),@(0.1),@(0.24),@(1.0)];
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            [threeLayer addAnimation:positionAni forKey:@"positionAni"];
            
        }
        //four
        {
            CGFloat fourWidth = kAVWindowWidth*0.1875;
            CGPoint fourPoint = CGPointMake(fourWidth/2, kAVWindowHeight*0.25);
            CALayer *fourLayer = [CALayer layer];
            fourLayer.frame = CGRectMake(0, 0, fourWidth, kAVWindowHeight/2);
            fourLayer.backgroundColor = UIColorFromRGBAlpha(0xFF9800, 1).CGColor;
            fourLayer.position = fourPoint;
            [rootLayer addSublayer:fourLayer];
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
