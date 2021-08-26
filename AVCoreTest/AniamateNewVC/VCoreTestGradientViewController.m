//
//  VCoreTestGradientViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2017/10/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCoreTestGradientViewController.h"
#import "AVBasicLayer.h"
#import "AVConstant.h"
#import "AVBasicRouteAnimate.h"
#import "AVFilterPhoto.h"

@interface VCoreTestGradientViewController ()

@end

@implementation VCoreTestGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self slope_animationTest];
}

- (void)slope_animationTest
{
    CGFloat duration = 3.0;//动画总时长

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1.0;

    UIImage *currentImage = [UIImage imageNamed:@"2.png"];
    UIImage *nextImage = [UIImage imageNamed:@"1.png"];
    UIImage *currentBlur = [[AVFilterPhoto alloc] filterGPUImage:currentImage
                                                      filterType:AVImageFilteriOS7GaussianBlur
                                                      blurRadius:20];

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                  vContentRect:kAVRectWindow
                                                                   origalImage:currentImage
                                                                     blueImage:currentBlur];
    currentLayer.photoLayer.contentLayer.opacity = 0;
    [homeLayer addSublayer:currentLayer];
    CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityFromTo:duration*0.8 withBeginTime:beginTime fromValue:0 toValue:1];
    [currentLayer.photoLayer.contentLayer addAnimation: opacityOpen forKey:@"opacityOpen"];

    {
        //渐变色
        CAGradientLayer *gradientLayer = [self slope_gradientEffect];
        [currentLayer addSublayer:gradientLayer];
        [gradientLayer setValue:[NSNumber numberWithFloat:0]
                     forKeyPath:@"opacity"];
        CABasicAnimation *openOpacityAnimation = [[AVBasicRouteAnimate defaultInstance] opacityFromTo:duration*0.2 withBeginTime:beginTime+duration*0.2 fromValue:0 toValue:1];
        
        [gradientLayer addAnimation:openOpacityAnimation forKey:@"open_opacity"];
        [self slope_locationsAnimation:gradientLayer
                              duration:duration*0.8
                             beginTime:beginTime];
    }
    {
        //下一个镜头
        AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:nextImage];
        [homeLayer addSublayer:nextLayer];
        nextLayer.mask = nextLayer.maskLayer;
        nextLayer.maskLayer.opacity = 0.0;
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:duration*0.9 withBeginTime:beginTime+0.1*duration];
        [nextLayer.maskLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    }
}

- (CAGradientLayer *)slope_gradientEffect
{
    // maske effect
    CAGradientLayer  *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = homeLayer.bounds;
    
    NSArray *startlocationsList  =@[
                                    [NSNumber numberWithFloat:0.0f],
                                    [NSNumber numberWithFloat:0.25f],
                                    [NSNumber numberWithFloat:0.5f],
                                    ];
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[
                             (id)[UIColor colorWithRed:68/255.0 green:172/255.0 blue:232/255.0 alpha:0.45].CGColor,
                             (id)[UIColor colorWithRed:68/255.0 green:172/255.0 blue:232/255.0 alpha:0.45].CGColor,
//                             (id)[UIColor clearColor].CGColor,
                             (id)[UIColor colorWithRed:68/255.0 green:172/255.0 blue:232/255.0 alpha:0.15].CGColor,
                             ];;
    //  设置三种颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = startlocationsList;
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    return gradientLayer;
}

- (void)slope_locationsAnimation:(CALayer *)layer
                        duration:(CFTimeInterval)duration
                       beginTime:(CFTimeInterval)beginTime
{
    NSArray *startlocationsList  =@[
                                    [NSNumber numberWithFloat:0.0f],
                                    [NSNumber numberWithFloat:0.25f],
                                    [NSNumber numberWithFloat:0.5f],
                                    ];
    NSArray *endLocationsList  =@[
                                  [NSNumber numberWithFloat:0.0f],
                                  [NSNumber numberWithFloat:0.75f],
                                  [NSNumber numberWithFloat:1.0f],
                                  ];
    
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.removedOnCompletion=NO;
    basicAnimation.fillMode=kCAFillModeBoth;
    basicAnimation.autoreverses=NO;
    basicAnimation.fromValue = startlocationsList;
    basicAnimation.toValue = endLocationsList;
    basicAnimation.beginTime = beginTime;
    basicAnimation.duration = duration;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:basicAnimation forKey:@"slope_locations"];
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
