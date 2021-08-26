//
//  HeartViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 2017/11/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "HeartViewController.h"

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

#import "ShowManyPhotoLayer.h"

@interface HeartViewController ()

@end

@implementation HeartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//  [self drawHeart];
    
    [self drawNewHeart];
}

- (void)drawNewHeart{
    
    NSArray *rectList = [self getNewFrame];
    NSArray *imageList = [self getImageList];
    
    AVBottomLayer *currentLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    for (NSInteger index = 0; index < rectList.count; index++) {
        
        UIImage *photoImage = [UIImage imageNamed:imageList[index]];
        CGRect layerRect = [rectList[index] CGRectValue];
        
        AVBottomLayer *photoLayer = [[AVBottomLayer alloc] initWithFrame:layerRect withImage:photoImage];
        photoLayer.borderColor = [UIColor whiteColor].CGColor;
        photoLayer.borderWidth = 4;
        [currentLayer addSublayer:photoLayer];
     
        CGPoint layerPoint = [[photoLayer valueForKey:@"position"] CGPointValue];
        
        NSLog(@"index = %zd X = %.f Y = %.f",index,layerPoint.x,layerPoint.y);
        
    }
}


- (NSArray *)getNewFrame{
    
    NSArray *rectList = @[[NSValue valueWithCGRect:CGRectMake(223, 197, 155, 155)],
                          [NSValue valueWithCGRect:CGRectMake(72, 197, 155, 155)],
                          [NSValue valueWithCGRect:CGRectMake(374, 197, 154, 154)],
                          [NSValue valueWithCGRect:CGRectMake(223, 348, 154, 154)],
                          [NSValue valueWithCGRect:CGRectMake(0, 267, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(0, 197, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(0, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(72, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(72, 57, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(144, 57, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(144, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(216, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(526, 267, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(526, 197, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(526, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(454, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(454, 57, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(382, 57, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(382, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(310, 126, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(83, 348, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(153, 348, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(153, 418, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(444, 348, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(374, 348, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(374, 418, 74, 74)],
                          [NSValue valueWithCGRect:CGRectMake(264, 499, 74, 74)]];
    
    return rectList;
}

- (NSArray *)getNewToPoint{

    NSArray *toPoints = @[[NSValue valueWithCGPoint:CGPointMake(300, 274)],
                          [NSValue valueWithCGPoint:CGPointMake(150, 274)],
                          [NSValue valueWithCGPoint:CGPointMake(451, 274)],
                          [NSValue valueWithCGPoint:CGPointMake(300, 425)],
                          [NSValue valueWithCGPoint:CGPointMake(37, 304)],
                          [NSValue valueWithCGPoint:CGPointMake(37, 234)],
                          [NSValue valueWithCGPoint:CGPointMake(37, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(109, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(109, 94)],
                          [NSValue valueWithCGPoint:CGPointMake(181, 94)],
                          [NSValue valueWithCGPoint:CGPointMake(181, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(253, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(563, 304)],
                          [NSValue valueWithCGPoint:CGPointMake(563, 234)],
                          [NSValue valueWithCGPoint:CGPointMake(563, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(491, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(491, 94)],
                          [NSValue valueWithCGPoint:CGPointMake(419, 94)],
                          [NSValue valueWithCGPoint:CGPointMake(419, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(347, 163)],
                          [NSValue valueWithCGPoint:CGPointMake(120, 385)],
                          [NSValue valueWithCGPoint:CGPointMake(190, 385)],
                          [NSValue valueWithCGPoint:CGPointMake(190, 455)],
                          [NSValue valueWithCGPoint:CGPointMake(481, 385)],
                          [NSValue valueWithCGPoint:CGPointMake(411, 385)],
                          [NSValue valueWithCGPoint:CGPointMake(411, 455)],
                          [NSValue valueWithCGPoint:CGPointMake(301, 536)]];


    return toPoints;
}

//- (NSArray *)getNewFromPotion{
//    
//    
//    
//    
//}

- (void)drawHeart{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    CFTimeInterval moveDuration = 0.4;
    
//    NSMutableArray *photoLayerList = [NSMutableArray array];
    
    NSArray *imagelist = [self getImageList];
    NSArray *frameList = [self getFrameList];
    NSArray *toPositionList = [self getToPositionList];
    NSArray *fromPositionList = [self getFromPositionList];
    NSArray *beginTimeList = [self getBeginTimeList];
    UIImage *bgImage = [UIImage imageNamed:imagelist[0]];;
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:bgImage filterType:AVImageFilteriOS7GaussianBlur];
    
    AVBottomLayer *filterLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:filterImage];
    
    [homeLayer addSublayer:filterLayer];
    
    AVBottomLayer *heartImageLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"clearHeart"]];
    [homeLayer addSublayer:heartImageLayer];
    
    AVBottomLayer *firstLayer = [[AVBottomLayer alloc] init];
    
    for (NSInteger index = 0; index < imagelist.count; index++) {
        
        CGRect layerRect = [frameList[index] CGRectValue];
        
        CGPoint layerFromPoint = [fromPositionList[index] CGPointValue];
        
        CGPoint layerToPoint = [toPositionList[index] CGPointValue];
        
        UIImage *photoImage = [UIImage imageNamed:imagelist[index]];
        
        AVBottomLayer *photoLayer = [[AVBottomLayer alloc] initWithFrame:layerRect withImage:photoImage];
        photoLayer.position = layerToPoint;
        photoLayer.borderColor = [UIColor whiteColor].CGColor;
        photoLayer.borderWidth = 4;
        
        if (index == 0) {
            
            firstLayer = photoLayer;
            
            [homeLayer addSublayer:firstLayer];
        }else{
            
            [homeLayer insertSublayer:photoLayer below:firstLayer];
        }

        
        CGFloat intervalTime = [beginTimeList[index] floatValue];
        
        if (index == 0){
            
            firstLayer.opacity = 0;
            
            CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"opacity" values:@[@(0),@(1),@(1)] keyTimes:@[@(0),@(1.0),@(1.0)]];

            CABasicAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(0) toValue:@(1) propertyName:@"transform.scale"];

            CAAnimationGroup *openAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime+intervalTime aniArr:@[opacityAni,sacleAni]];
            
//            CABasicAnimation *openAni = [[AVBasicRouteAnimate alloc] opacityOpen:moveDuration withBeginTime:beginTime+intervalTime];
            
            [firstLayer addAnimation:openAni forKey:@"groupAni"];
            
        }else{
         
            photoLayer.opacity = 0;
            CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"opacity" values:@[@(0),@(1),@(1)] keyTimes:@[@(0),@(0.4),@(1.0)]];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:0 fromValue:layerFromPoint toValue:layerToPoint propertyName:@"position"];
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime+intervalTime aniArr:@[positionAni,opacityAni]];
            
            [photoLayer addAnimation:groupAni forKey:@"groupAni"];
            
        }
    }
    
    
}


- (NSArray *)getFrameList{
    
    NSArray *frameList = @[[NSValue valueWithCGRect:CGRectMake(0, 0, 144, 191)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 121, 94)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 121, 94)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 132, 100)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 132, 100)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 103, 135)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 103, 135)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 116, 97)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 116, 97)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 92,
                                                               71)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 92,
                                                               71)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 114, 152)],
                          [NSValue valueWithCGRect:CGRectMake(0, 0, 114, 152)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, 114, 152)]];
    
    return frameList;
}

- (NSArray *)getImageList{
    
    NSArray *imageList = @[@"heng4",@"yoona2",@"yoona3",@"desktop",@"london",@"cat",@"bg1",@"bg2",@"heng4",@"yoona2",@"yoona2",@"yoona3",@"yoona3",@"yoona3",@"heng4",@"yoona2",@"yoona3",@"desktop",@"london",@"cat",@"bg1",@"bg2",@"heng4",@"yoona2",@"yoona2",@"yoona3",@"yoona3"];
    
    return imageList;
}

- (NSArray *)getToPositionList{
    
    NSArray *positionList = @[[NSValue valueWithCGPoint:CGPointMake(300, 310)],
                              [NSValue valueWithCGPoint:CGPointMake(172, 261)],
                              [NSValue valueWithCGPoint:CGPointMake(430, 261)],
                              [NSValue valueWithCGPoint:CGPointMake(166, 355)],
                              [NSValue valueWithCGPoint:CGPointMake(435,
                                                                    355)],
                              [NSValue valueWithCGPoint:CGPointMake(162, 152)],
                              [NSValue valueWithCGPoint:CGPointMake(438, 152)],
                              [NSValue valueWithCGPoint:CGPointMake(188, 450)],
                              [NSValue valueWithCGPoint:CGPointMake(416, 450)],
                              [NSValue valueWithCGPoint:CGPointMake(256, 184)],
                              [NSValue valueWithCGPoint:CGPointMake(344, 184)],
                              [NSValue valueWithCGPoint:CGPointMake(57, 233)],
                              [NSValue valueWithCGPoint:CGPointMake(543, 233)],
                              [NSValue valueWithCGPoint:CGPointMake(301, 477)]];
    
    return positionList;
}

- (NSArray *)getFromPositionList{
    
    NSArray *positionList = @[[NSValue valueWithCGPoint:CGPointMake(300, 310)],
                              [NSValue valueWithCGPoint:CGPointMake(293, 261)],
                              [NSValue valueWithCGPoint:CGPointMake(309, 261)],
                              [NSValue valueWithCGPoint:CGPointMake(298, 355)],
                              [NSValue valueWithCGPoint:CGPointMake(303,
                                                                    355)],
                              [NSValue valueWithCGPoint:CGPointMake(162, 287)],
                              [NSValue valueWithCGPoint:CGPointMake(438, 287)],
                              [NSValue valueWithCGPoint:CGPointMake(188, 353)],
                              [NSValue valueWithCGPoint:CGPointMake(414, 353)],
                              [NSValue valueWithCGPoint:CGPointMake(256, 255)],
                              [NSValue valueWithCGPoint:CGPointMake(344, 255)],
                              [NSValue valueWithCGPoint:CGPointMake(171,
                                                                    233)],
                              [NSValue valueWithCGPoint:CGPointMake(429, 233)],
                              [NSValue valueWithCGPoint:CGPointMake(301, 325)]];
    
    return positionList;
}


- (NSArray *)getBeginTimeList{
    
    NSArray *timeList = @[@(0.0),@(0.5),@(0.55),@(0.6),@(0.65),@(1.10),@(1.12),@(1.14),@(1.16),@(1.18),@(1.20),@(1.7),@(1.7),@(1.9)];
    
    return timeList;
}

- (void)test{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    CFTimeInterval moveDuration = 0.4;
    
    AVBasicLayer *BGLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:BGLayer];
    
    NSArray *imageList = @[[UIImage imageNamed:@"heng4"],
                           [UIImage imageNamed:@"yoona2"],
                           [UIImage imageNamed:@"desktop"]];
    NSArray *dirList = @[@(0),@(1),@(2)];
    
    NSArray *beginTimes = @[@(0.0),@(1.2),@(2.2)];
    NSArray *durations = @[@(1),@(1),@(1)];
    
    ShowManyPhotoLayer *showLayer = [[ShowManyPhotoLayer alloc] initWithFrame:CGRectMake(0, 0, 130, 100)
           beginTime:beginTime
            ImageList:imageList
          moveDirList:dirList
        beginTimeList:beginTimes
         durationList:durations];
    showLayer.position = kAVWindowCenter;
    [BGLayer addSublayer:showLayer];
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
