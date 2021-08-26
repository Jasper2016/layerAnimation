//
//  HawaiiViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/6/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "HawaiiViewController.h"
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

@interface HawaiiViewController ()

@end

@implementation HawaiiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}


- (void)drawCurveLine{
    
    CGFloat beginOffsetX = 30;
    CGFloat beginOffsetY = kAVWindowHeight/2;
    CGFloat controlerWidth = 30;
    CGFloat controlerheight = 30;
    NSInteger pointCount = 10;
    
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"floatPhotoBroadBg"]];
    bgLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:bgLayer];

    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    [curvePath moveToPoint:CGPointMake(beginOffsetX, beginOffsetY)];
    for (NSInteger i = 1; i <= pointCount; i++) {
        
//        [curvePath addCurveToPoint:CGPointMa<#CGFloat x#>ke(i*controlerWidth, beginOffsetY) controlPoint1:CGPointMake(, beginOffsetY-controlerheight) controlPoint2:CGPointMake(<#CGFloat x#>, beginOffsetY+controlerheight)];
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
