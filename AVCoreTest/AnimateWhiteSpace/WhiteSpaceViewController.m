//
//  WhiteSpaceViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 2018/5/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WhiteSpaceViewController.h"
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

@interface WhiteSpaceViewController ()

@end

@implementation WhiteSpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self show];
}

- (void)show{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1;
    CGFloat birdWidth =  kAVWindowWidth;
    CGFloat birdHeight = kAVWindowHeight;
    
    CALayer *bgLayer = [CALayer layer];
    bgLayer.frame = CGRectMake(0, 0, birdWidth*5, birdHeight*4);
    bgLayer.backgroundColor = [UIColor blackColor].CGColor;
    [homeLayer addSublayer:bgLayer];
    
    for (NSInteger index = 0; index < 20; index++) {
        
        AVBottomLayer *photoLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight) bgColor:[UIColor brownColor].CGColor];
        CGFloat topValue = (index/5+0.5);
        CGFloat leftValue = (index%5+0.5);
        photoLayer.position = CGPointMake(birdWidth*leftValue, birdHeight*topValue);
        [bgLayer addSublayer:photoLayer];
        
        CATextLayer *textLayer = [CATextLayer layer];
        textLayer.frame = CGRectMake(0, 0, kAVWindowWidth/2, kAVWindowHeight/2);
        textLayer.string = [NSString stringWithFormat:@"%zd",index];
        textLayer.font = (__bridge CFTypeRef _Nullable)(@"PingFangSC-Regular");
        textLayer.foregroundColor = [UIColor redColor].CGColor;
        textLayer.backgroundColor = [UIColor blackColor].CGColor;
        textLayer.alignmentMode = kCAAlignmentCenter;
        textLayer.fontSize = 120;
        textLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
        [photoLayer addSublayer:textLayer];
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
