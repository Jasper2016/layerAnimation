//
//  FullVideoViewController.m
//  AVCoreTest
//
//  Created by mac on 2018/4/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FullVideoViewController.h"
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

@interface FullVideoViewController ()

@end

@implementation FullVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    homeLayer.backgroundColor = [UIColor redColor].CGColor;
    [self AVTransiteFashionWeedEndWaveRightToLeft];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)AVTransiteFashionWeedEndWaveRightToLeft{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    //
    //    CGFloat duration = 4;//整个动画时间
    //
    CGFloat moveDuration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"bg2.png"]];
    
    [homeLayer addSublayer: currentLayer];
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
