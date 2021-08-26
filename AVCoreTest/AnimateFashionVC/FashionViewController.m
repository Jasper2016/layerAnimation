//
//  FashionViewController.m
//  AVCoreTest
//
//  Created by 姚冬润 on 2018/8/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FashionViewController.h"
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

@interface FashionViewController ()

@end

@implementation FashionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self twoSideToCenterShow];
//    [self leftToTopAndRightToDwon];
    //[self transform];
    // Do any additional setup after loading the view.
}


- (void)TextVideoTransform{
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+6;
    CFTimeInterval moveDuration = 2.0;
}

- (void)transform{
 
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+6;
    CFTimeInterval moveDuration = 2.0;
    
    UIImage *currentFilterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"yoona3"] filterType:AVImageFilteriOS7GaussianBlur];
    
    UIImage *nextFilterImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"yoona4"] filterType:AVImageFilteriOS7GaussianBlur];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona3"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *currentFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:currentFilterImage];
    currentFilterLayer.opacity = 0.0;
    [currentLayer addSublayer:currentFilterLayer];
    {
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(0.0) toValue:@(1.0) propertyName:@"opacity"];
        [currentFilterLayer addAnimation:opacityAni forKey:@"opacityAni"];
    }
    
    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(1) toValue:@(3) propertyName:@"transform.scale"];
    
    CABasicAnimation *transfromAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)] toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)] propertyName:kAVBasicAniRotationZ];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[scaleAni,transfromAni]];
    [currentLayer addAnimation:groupAni forKey:@"groupAni"];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona4"]];
    nextLayer.opacity = 0.0;
    [homeLayer addSublayer:nextLayer];
    
    AVBasicLayer *nextFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:nextFilterImage];
    [nextLayer addSublayer:nextFilterLayer];
    
    {
        
        CABasicAnimation *closeAni = [[AVBasicRouteAnimate alloc] opacityClose:moveDuration withBeginTime:beginTime+moveDuration*0.8];
        [nextFilterLayer addAnimation:closeAni forKey:@"closeAni"];
    }
    
    {
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.01 withBeginTime:beginTime+moveDuration*0.8 fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
        [nextLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
        CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(3) toValue:@(1) propertyName:@"transform.scale"];
        
        CABasicAnimation *transfromAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-180)] toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)] propertyName:kAVBasicAniRotationZ];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime+moveDuration*0.81 aniArr:@[scaleAni,transfromAni]];
        [nextLayer addAnimation:groupAni forKey:@"groupAni"];
    }
}

- (void)leftToTopAndRightToDwon{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+4;
    CFTimeInterval moveDuration = 1.3;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    UIImage *originalImage = [UIImage imageNamed:@"heng4"];
    
    UIImage *filterImage = [[AVFilterPhoto alloc] simpleFilter:originalImage filterType:AVImageFilterGaussianBlur blurRadius:10];
    
    AVBasicLayer *LeftNextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:LeftNextLayer];
    
    LeftNextLayer.mask = LeftNextLayer.maskLayer;
    LeftNextLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight);
    {
        AVBasicLayer *leftFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
        [LeftNextLayer.contentLayer addSublayer:leftFilterLayer];
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customCGFloat:moveDuration*0.5 withBeginTime:beginTime+moveDuration*0.5 fromValue:1.0 toValue:0.0 propertyName:@"opacity"];
        [leftFilterLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
    }
    //leftAni
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.5)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] propertyName:@"position"];
        [LeftNextLayer addAnimation:positionAni forKey:@"positionAni"];
        
    }
    
    AVBasicLayer *rightNextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:rightNextLayer];
    rightNextLayer.mask = rightNextLayer.maskLayer;
    rightNextLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight);
    rightNextLayer.maskLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2);
    {
        
        AVBasicLayer *rightFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
        [rightNextLayer addSublayer:rightFilterLayer];
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customCGFloat:moveDuration*0.5 withBeginTime:beginTime+moveDuration*0.5 fromValue:1.0 toValue:0.0 propertyName:@"opacity"];
        [rightFilterLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
    }
    
    //rightAni
    {
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.5, -kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] propertyName:@"position"];
        [rightNextLayer addAnimation:positionAni forKey:@"positionAni"];
    }
}

- (void)twoSideToCenterShow{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+4;
    CFTimeInterval moveDuration = 1.3;

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    UIImage *originalImage = [UIImage imageNamed:@"heng4"];

    UIImage *filterImage = [[AVFilterPhoto alloc] simpleFilter:originalImage filterType:AVImageFilterGaussianBlur blurRadius:10];
    
    AVBasicLayer *LeftNextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:LeftNextLayer];
    
    LeftNextLayer.mask = LeftNextLayer.maskLayer;
    LeftNextLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight);
    {
    AVBasicLayer *leftFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
    [LeftNextLayer.contentLayer addSublayer:leftFilterLayer];
    
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customCGFloat:moveDuration*0.5 withBeginTime:beginTime+moveDuration*0.5 fromValue:1.0 toValue:0.0 propertyName:@"opacity"];
    [leftFilterLayer addAnimation:opacityAni forKey:@"opacityAni"];
    
    }
    //leftAni
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(-kAVWindowWidth/2, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] propertyName:@"position"];
        [LeftNextLayer addAnimation:positionAni forKey:@"positionAni"];
     
    }
    
    AVBasicLayer *rightNextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:rightNextLayer];
    rightNextLayer.mask = rightNextLayer.maskLayer;
    rightNextLayer.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight);
    rightNextLayer.maskLayer.position = CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight/2);
    {
        
        AVBasicLayer *rightFilterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
        [rightNextLayer addSublayer:rightFilterLayer];
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customCGFloat:moveDuration*0.5 withBeginTime:beginTime+moveDuration*0.5 fromValue:1.0 toValue:0.0 propertyName:@"opacity"];
        [rightFilterLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
    }
    
    //rightAni
    {
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*1.5, kAVWindowHeight/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)] propertyName:@"position"];
        [rightNextLayer addAnimation:positionAni forKey:@"positionAni"];
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
