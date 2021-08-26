//
//  VCHappyTravelViewController.m
//  AVCoreTest
//
//  Created by gemin on 2017/10/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCHappyTravelViewController.h"
#import "AVFundation.h"
#import "AVBasicTextLayer.h"
#import "GPUImageSharpenFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageScreenBlendFilter.h"
#import "GPUImageBrightnessFilter.h"
#import "GPUImageContrastFilter.h"
#import "GPUImageSaturationFilter.h"
#import "GPUImageWhiteBalanceFilter.h"
#import "GPUImageLevelsFilter.h"
#import "GPUImageHighlightShadowFilter.h"
#import "GPUImageHueFilter.h"
#import "GPUImageRGBFilter.h"
#import "GPUImageFilterPipeline.h"

@interface VCHappyTravelViewController ()
{
    GPUImagePicture *sourcePicture;
    GPUImageBrightnessFilter *brightness; // 亮度
    GPUImageContrastFilter *contrast; // 对比度
    GPUImageSaturationFilter *saturation; // 饱和度
    GPUImageWhiteBalanceFilter *whiteBalance; // 色温
    GPUImageHighlightShadowFilter *hightlightShadow; // 高光
    GPUImageLevelsFilter *levels; // 色阶
    GPUImageHueFilter *hue; // HUE
    GPUImageRGBFilter *rgb; // 颜色
    GPUImageFilterPipeline *pipeline; // 组合滤镜
}
@property (nonatomic, strong) CALayer *homeLayer;

@end

@implementation VCHappyTravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _homeLayer = [CALayer layer];
    _homeLayer.frame = CGRectMake( 0, 100, kAVWindowWidth, kAVWindowHeight);
    CGFloat scaleValue = self.view.frame.size.width/kAVWindowWidth;
    [_homeLayer setValue:[NSNumber numberWithFloat:scaleValue] forKeyPath:@"transform.scale"];
    _homeLayer.position =  self.view.center;
    _homeLayer.backgroundColor = [UIColor grayColor].CGColor;
    _homeLayer.masksToBounds = YES;
    [self.view.layer addSublayer: _homeLayer];
    
    [self roundLayerAnimation];
//    [self dottedLineArrowAnimation];
//    [self horizontalArrowAnimation];
//    [self verticalArrowAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gpuImageSharpenFilter
{
    UIImage *image = [UIImage imageNamed:@"bg2"];
    GPUImageSharpenFilter *sharpenFilter = [[GPUImageSharpenFilter alloc] init];
    sharpenFilter.sharpness = -3.5f;
    [sharpenFilter forceProcessingAtSize:image.size];
    GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
    [pic addTarget:sharpenFilter];
    
    [pic processImage];
    [sharpenFilter useNextFrameForImageCapture];
    
    NSArray *keyTimes = @[@(0),@(1)];
    NSArray *contentValues = @[
                                (__bridge id)image.CGImage,
                                (__bridge id)[sharpenFilter imageFromCurrentFramebuffer].CGImage,
                                ];
//    self.homeLayer.contents = (__bridge id)[sharpenFilter imageFromCurrentFramebuffer].CGImage;
    
    CAKeyframeAnimation *contentsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:3
                                                                               withBeginTime:0
                                                                                propertyName:@"contents"
                                                                                      values:contentValues
                                                                                    keyTimes:keyTimes];
    [self.homeLayer addAnimation:contentsAni forKey:nil];
}

//转场一
- (void)horizontalArrowAnimation
{
    CGFloat beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;

    CALayer *currentLayer = [CALayer layer];
    currentLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight);
    currentLayer.contents = (__bridge id)[UIImage imageNamed:@"bg1"].CGImage;
    [self.homeLayer addSublayer:currentLayer];
    
    //背景Layer
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = self.homeLayer.bounds;
    backLayer.contents = (__bridge  id)[UIImage imageNamed:@"beijing"].CGImage;
    [self.homeLayer addSublayer:backLayer];
    
    CGFloat horizontalHeight = kAVWindowWidth/3.f;
    CGFloat horizontalWidth = kAVWindowWidth+horizontalHeight;
    CALayer *horizontalLayer = [self horizontalArrowLayerHeight:horizontalHeight
                                                          width:horizontalWidth];
    [self.homeLayer addSublayer:horizontalLayer];
    
    NSArray *keyTimes = @[@(0),@(1)];
    NSArray *horizontalPsitionValues = @[
                                        @(-horizontalWidth*0.5),
                                        @(horizontalWidth*1.5),
                                        ];
    CAKeyframeAnimation *horizontalPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5
                                                                                         withBeginTime:beginTime
                                                                                          propertyName:@"position.x"
                                                                                                values:horizontalPsitionValues
                                                                                              keyTimes:keyTimes];
    horizontalPositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    [horizontalLayer addAnimation:horizontalPositionAni forKey:nil];
    
    NSArray *backPsitionValues = @[
                                   @(-kAVWindowWidth*0.5),
                                   @(kAVWindowWidth*1.5),
                                  ];
    CAKeyframeAnimation *backPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:4
                                                                                   withBeginTime:beginTime+0.5
                                                                                    propertyName:@"position.x"
                                                                                          values:backPsitionValues
                                                                                        keyTimes:keyTimes];
    backPositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    [backLayer addAnimation:backPositionAni forKey:nil];
    
    CALayer *nextLayer = [CALayer layer];
    nextLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight);
    nextLayer.contents = (__bridge id)[UIImage imageNamed:@"bg2"].CGImage;
    [self.homeLayer addSublayer:nextLayer];
    NSArray *nextPsitionValues = @[
                                   @(-kAVWindowWidth*0.5),
                                   @(kAVWindowWidth*0.5),
                                   ];
    CAKeyframeAnimation *nextPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1.5
                                                                                   withBeginTime:beginTime+2.5
                                                                                    propertyName:@"position.x"
                                                                                          values:nextPsitionValues
                                                                                        keyTimes:keyTimes];
    nextPositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [nextLayer addAnimation:nextPositionAni forKey:nil];

}

//转场二
- (void)verticalArrowAnimation
{
    CGFloat redLayerWidth = kAVWindowWidth/3+20;
    CGFloat centerWidth   = kAVWindowWidth/3+50;
    CGFloat centerHeight  = kAVWindowHeight*2;
    CGFloat dottedLinePoint = redLayerWidth-50.f;
    CGFloat beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CALayer *currentLayer = [CALayer layer];
    currentLayer.frame = self.homeLayer.bounds;
    currentLayer.contents = (__bridge id)[UIImage imageNamed:@"bg1"].CGImage;
    currentLayer.zPosition = -10.f;
    [self.homeLayer addSublayer:currentLayer];
    
    //箭头Layer
    CALayer *arrowLayer = [self verticalArrowLayerWithWidth:centerWidth];
    //下一张图片
    CALayer *nextLayer = [self rightRoundLayerWithWidth:centerWidth height:kAVWindowHeight];
    nextLayer.contents = (__bridge id)[UIImage imageNamed:@"bg2"].CGImage;
    CALayer *centerBackLayer = [CALayer layer];
    centerBackLayer.frame = CGRectMake((kAVWindowWidth-centerWidth)*0.5, -centerHeight, centerWidth, centerHeight);
    centerBackLayer.backgroundColor = [UIColor clearColor].CGColor;
    nextLayer.frame = CGRectMake(0, 0, centerWidth, kAVWindowHeight);
    arrowLayer.frame = CGRectMake(0, nextLayer.bottom, centerWidth, kAVWindowHeight);
    [centerBackLayer addSublayer:nextLayer];
    [centerBackLayer addSublayer:arrowLayer];
    
    CALayer *rightRedLayer = [CALayer layer];
    rightRedLayer.frame = CGRectMake(kAVWindowWidth - redLayerWidth, 0, redLayerWidth, kAVWindowHeight);
    rightRedLayer.backgroundColor = [UIColor redColor].CGColor;
    //背景Layer
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = self.homeLayer.bounds;
    backLayer.contents = (__bridge  id)[UIImage imageNamed:@"beijing"].CGImage;
    
    CAShapeLayer *dottedLayer = [self dottedLineLayerPointX:dottedLinePoint];
    CALayer *littleLayer = [self littleArrowLayerPointX:dottedLinePoint];
    
    [self.homeLayer addSublayer:backLayer];
    [self.homeLayer addSublayer:rightRedLayer];
    [self.homeLayer addSublayer:centerBackLayer];
    [rightRedLayer addSublayer:dottedLayer];
    [rightRedLayer addSublayer:littleLayer];
    
    //箭头动画
    NSArray *keyTimes = @[@(0),@(1)];
    NSArray *centerLayerPositionValues = @[
                                          @(-centerHeight*0.5),
                                          @(centerHeight*0.5),
                                          ];
    CAKeyframeAnimation *centerLayerPostionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5
                                                                                         withBeginTime:beginTime
                                                                                          propertyName:@"position.y"
                                                                                                values:centerLayerPositionValues
                                                                                              keyTimes:keyTimes];
    centerLayerPostionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [centerBackLayer addAnimation:centerLayerPostionAni forKey:nil];
    
    //背景动画
    NSArray *backPositionValues = @[
                                   @(-kAVWindowHeight*0.5),
                                   @(kAVWindowHeight*0.5),
                                   ];
    CAKeyframeAnimation *backPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2
                                                                                   withBeginTime:beginTime+1
                                                                                    propertyName:@"position.y"
                                                                                          values:backPositionValues
                                                                                        keyTimes:keyTimes];
    backPositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [backLayer addAnimation:backPositionAni forKey:nil];
    
    //右边红色Layer动画
    NSArray *redLayerPositionValues = @[
                                       @(-kAVWindowHeight*0.5),
                                       @(kAVWindowHeight*0.5),
                                       ];
    CAKeyframeAnimation *redLayerPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:3.5
                                                                                       withBeginTime:beginTime+1.5
                                                                                        propertyName:@"position.y"
                                                                                              values:redLayerPositionValues
                                                                                            keyTimes:keyTimes];
    redLayerPositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [rightRedLayer addAnimation:redLayerPositionAni forKey:nil];
    
    CABasicAnimation *downLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:3
                                                                     withBeginTime:beginTime+1.5
                                                                         fromValue:@(0.0)
                                                                           toValue:@(1.0)
                                                                      propertyName:@"strokeEnd"];
    downLineStrokeEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [dottedLayer addAnimation:downLineStrokeEnd forKey:nil];
    
    NSArray *positionValues = @[
                                @(0),
                                @(kAVWindowHeight-50*0.5),
                                ];
    CAKeyframeAnimation *littleArrpositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:3
                                                                                        withBeginTime:beginTime+1.5
                                                                                         propertyName:@"position.y"
                                                                                               values:positionValues
                                                                                             keyTimes:keyTimes];
    littleArrpositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [littleLayer addAnimation:littleArrpositionAni forKey:nil];
    
}

//转场三
- (void)dottedLineArrowAnimation
{
    CGFloat centerWidth   = kAVWindowWidth/3+50;
    CGFloat redLayerWidth = kAVWindowWidth/3+20;
    CGFloat dottedLinePoint = redLayerWidth-50.f;
    CGFloat duration = 3.f;
    CGFloat beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CALayer *currentBackLayer = [CALayer layer];
    currentBackLayer.frame = self.homeLayer.bounds;
    currentBackLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.homeLayer addSublayer:currentBackLayer];
    
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = currentBackLayer.bounds;
    backLayer.contents = (__bridge  id)[UIImage imageNamed:@"beijing"].CGImage;
    [currentBackLayer addSublayer:backLayer];
    
    CALayer *rightRedLayer = [CALayer layer];
    rightRedLayer.frame = CGRectMake(kAVWindowWidth - redLayerWidth, 0, redLayerWidth, kAVWindowHeight);
    rightRedLayer.backgroundColor = [UIColor redColor].CGColor;
    [currentBackLayer addSublayer:rightRedLayer];

    CALayer *currentLayer = [self rightRoundLayerWithWidth:centerWidth height:kAVWindowHeight];
    currentLayer.contents = (__bridge id)[UIImage imageNamed:@"bg1"].CGImage;
    [currentBackLayer addSublayer:currentLayer];
    
    CAShapeLayer *dottedLayer = [self dottedLineLayerPointX:dottedLinePoint];
    CALayer *littleLayer = [self littleArrowLayerPointX:dottedLinePoint];
    [rightRedLayer addSublayer:dottedLayer];
    [rightRedLayer addSublayer:littleLayer];
    
    CALayer *nextLayer = [CALayer layer];
    nextLayer.frame = self.homeLayer.bounds;
    nextLayer.contents = (__bridge id)[UIImage imageNamed:@"bg2"].CGImage;
    [self.homeLayer addSublayer:nextLayer];

    NSArray *keyTimes = @[@(0),@(1)];
    CABasicAnimation *downLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:duration
                                                                     withBeginTime:beginTime
                                                                         fromValue:@(0.0)
                                                                           toValue:@(1.0)
                                                                      propertyName:@"strokeEnd"];
    downLineStrokeEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [dottedLayer addAnimation:downLineStrokeEnd forKey:nil];
    
    NSArray *littlePositionValues = @[
                                     @(0),
                                     @(kAVWindowHeight-50*0.5),
                                     ];
    CAKeyframeAnimation *littleArrpositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                        withBeginTime:beginTime
                                                                                         propertyName:@"position.y"
                                                                                               values:littlePositionValues
                                                                                             keyTimes:keyTimes];
    littleArrpositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [littleLayer addAnimation:littleArrpositionAni forKey:nil];
    
    NSArray *currentBackPositionValues = @[
                                           @(kAVWindowWidth*0.5),
                                           @(kAVWindowWidth*1.5)
                                           ];
    CAKeyframeAnimation *currentBackAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                   withBeginTime:beginTime+duration
                                                                                    propertyName:@"position.x"
                                                                                          values:currentBackPositionValues
                                                                                        keyTimes:keyTimes];
    currentBackAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [currentBackLayer addAnimation:currentBackAni forKey:nil];
    
    NSArray *nextBackPositionValues = @[
                                       @(-kAVWindowWidth*0.5),
                                       @(kAVWindowWidth*0.5)
                                           ];
    CAKeyframeAnimation *nextLayerAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration-1
                                                                                withBeginTime:beginTime+duration
                                                                                 propertyName:@"position.x"
                                                                                       values:nextBackPositionValues
                                                                                     keyTimes:keyTimes];
    nextLayerAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [nextLayer addAnimation:nextLayerAni forKey:nil];
}

//转场四
- (void)roundLayerAnimation
{
    CGFloat beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CGFloat roundLayerWidth = kAVWindowWidth*0.5;
    CGFloat roundLayerHeight = kAVWindowHeight - 60;
    CGFloat duration = 2.f;
    CGFloat roundDuration = 1.5;
    
    CALayer *currentLayer = [CALayer layer];
    currentLayer.frame = self.homeLayer.bounds;
    currentLayer.contents = (__bridge id)[UIImage imageNamed:@"bg2"].CGImage;
    [self.homeLayer addSublayer:currentLayer];
    
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = self.homeLayer.bounds;
    backLayer.contents = (__bridge id)[UIImage imageNamed:@"beijing"].CGImage;
    [self.homeLayer addSublayer:backLayer];
    
    CALayer *roundBackLayer = [self rightRoundLayerWithWidth:roundLayerWidth height:roundLayerHeight];
    roundBackLayer.backgroundColor = [UIColor greenColor].CGColor;
    roundBackLayer.masksToBounds = YES;
    [backLayer addSublayer:roundBackLayer];
    
    CALayer *nextLayer = [self rightRoundLayerWithWidth:roundLayerWidth height:roundLayerHeight];
    nextLayer.frame = roundBackLayer.bounds;
    nextLayer.contents = (__bridge id)[UIImage imageNamed:@"bg1"].CGImage;
    [roundBackLayer addSublayer:nextLayer];
    
    NSArray *keyTimes = @[@(0),@(1)];
    
    NSArray *currentPositionValues = @[
                                       @(kAVWindowWidth*0.5),
                                       @(kAVWindowWidth*1.5)
                                       ];
    CAKeyframeAnimation *currentLayerAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                  withBeginTime:beginTime
                                                                                   propertyName:@"position.x"
                                                                                         values:currentPositionValues
                                                                                       keyTimes:keyTimes];
    currentLayerAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [currentLayer addAnimation:currentLayerAni forKey:nil];
    
    NSArray *backLayerPositionValues = @[
                                       @(-kAVWindowWidth*0.5),
                                       @(kAVWindowWidth*.5)
                                       ];
    CAKeyframeAnimation *backLayerAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration-0.5
                                                                                   withBeginTime:beginTime
                                                                                    propertyName:@"position.x"
                                                                                          values:backLayerPositionValues
                                                                                        keyTimes:keyTimes];
    backLayerAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [backLayer addAnimation:backLayerAni forKey:nil];
    
    NSArray *nextBackPositionValues = @[
                                        @(-roundLayerWidth*0.5),
                                        @(roundLayerWidth*0.5)
                                        ];
    CAKeyframeAnimation *nextLayerAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:roundDuration
                                                                                withBeginTime:beginTime+0.5
                                                                                 propertyName:@"position.x"
                                                                                       values:nextBackPositionValues
                                                                                     keyTimes:keyTimes];
    nextLayerAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [nextLayer addAnimation:nextLayerAni forKey:nil];
    
}

//垂直箭头
- (CALayer *)verticalArrowLayerWithWidth:(CGFloat)width
{
    CGFloat height = kAVWindowHeight;
    CGFloat rectArrowHeight  = height - 100;
    CGFloat arrowWidth = 20.f;
    CGFloat arrowXPoint = 50.f;
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = CGRectMake((kAVWindowWidth - width)*0.5, 0, width, height);
    backLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    //矩形箭头
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,
                                                                                  0,
                                                                                  width,
                                                                                  rectArrowHeight)
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(0, 0)];
    
    [bezierPath moveToPoint:CGPointMake(width*0.5, height)];
    [bezierPath addLineToPoint:CGPointMake(0, rectArrowHeight)];
    [bezierPath addLineToPoint:CGPointMake(width, rectArrowHeight)];
    CAShapeLayer *rectArrowLayer = [CAShapeLayer new];
    rectArrowLayer.fillColor = [UIColor greenColor].CGColor;
    rectArrowLayer.path = bezierPath.CGPath;
    [backLayer addSublayer:rectArrowLayer];
    
    //小箭头
    UIBezierPath *arrowLinePath = [UIBezierPath bezierPath];
    [arrowLinePath moveToPoint:CGPointMake(arrowXPoint, rectArrowHeight+40)];
    [arrowLinePath addLineToPoint:CGPointMake(width*0.5, height-arrowWidth*0.5)];
    [arrowLinePath addLineToPoint:CGPointMake(width-arrowXPoint, rectArrowHeight+40)];
    CAShapeLayer *arrowLineLayer = [CAShapeLayer layer];
    arrowLineLayer.lineCap = kCALineCapRound;
    arrowLineLayer.fillColor = [UIColor clearColor].CGColor;
    arrowLineLayer.strokeColor = [UIColor grayColor].CGColor;
    arrowLineLayer.lineWidth =arrowWidth;
    arrowLineLayer.path = arrowLinePath.CGPath;
    [backLayer addSublayer:arrowLineLayer];

    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(width*0.5, height-arrowWidth*0.5)];
    [linePath addLineToPoint:CGPointMake(width*0.5, height - 150)];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor grayColor].CGColor;
    lineLayer.lineWidth = arrowWidth;
    lineLayer.path = linePath.CGPath;
    [backLayer addSublayer:lineLayer];
    
    return backLayer;
}

//右边圆角小图
- (CALayer *)rightRoundLayerWithWidth:(CGFloat)width
                               height:(CGFloat)height
{
    CALayer *contentLayer = [CALayer new];
    contentLayer.frame = CGRectMake((kAVWindowWidth - width)*0.5,
                                    (kAVWindowHeight - height)*0.5,
                                    width,
                                    height);
    //矩形箭头
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:contentLayer.bounds
                                                     byRoundingCorners:UIRectCornerTopRight
                                                           cornerRadii:CGSizeMake(30, 30)];
    

    CAShapeLayer *rectArrowLayer = [CAShapeLayer new];
    rectArrowLayer.fillColor = [UIColor blueColor].CGColor;
    rectArrowLayer.path = bezierPath.CGPath;
    contentLayer.mask = rectArrowLayer;
    return contentLayer;
}

- (CAShapeLayer *)dottedLineLayerPointX:(CGFloat)pointX
{
    CGFloat lineLength = 10.f;//虚线宽度
    CGFloat lineSpace  = 10.f;//虚线间距
    UIBezierPath *dottedLinePath = [UIBezierPath bezierPath];
    [dottedLinePath moveToPoint:CGPointMake(pointX, 0)];
    [dottedLinePath addLineToPoint:CGPointMake(pointX, kAVWindowHeight-50)];
    CAShapeLayer *dottedLineLayer = [CAShapeLayer layer];
    dottedLineLayer.fillColor = [UIColor clearColor].CGColor;
    dottedLineLayer.strokeColor = [UIColor whiteColor].CGColor;
    dottedLineLayer.lineWidth = 5.f;
    dottedLineLayer.lineJoin = kCALineJoinRound;
    dottedLineLayer.lineCap = kCALineCapRound;
    dottedLineLayer.path = dottedLinePath.CGPath;
    dottedLineLayer.lineDashPattern = @[@(lineLength),@(lineSpace)];
    return dottedLineLayer;
}

- (CALayer *)littleArrowLayerPointX:(CGFloat)pointX
{
    CGFloat arrowWidth = 30.f;
    CGFloat arrowHeight = 50.f;
    CGFloat lineWidth   = 3.f;
    CALayer *arrowLayer = [CALayer layer];
    arrowLayer.frame = CGRectMake(0, 0, arrowWidth, arrowHeight);
    arrowLayer.position = CGPointMake(pointX, arrowHeight*0.5);
    
    //小箭头
    UIBezierPath *arrowLinePath = [UIBezierPath bezierPath];
    [arrowLinePath moveToPoint:CGPointMake(0, arrowHeight - arrowWidth*0.5)];
    [arrowLinePath addLineToPoint:CGPointMake(arrowWidth*0.5, arrowHeight)];
    [arrowLinePath addLineToPoint:CGPointMake(arrowWidth, arrowHeight - arrowWidth*0.5)];
    CAShapeLayer *arrowLineLayer = [CAShapeLayer layer];
    arrowLineLayer.lineCap = kCALineCapRound;
    arrowLineLayer.fillColor = [UIColor clearColor].CGColor;
    arrowLineLayer.strokeColor = [UIColor darkGrayColor].CGColor;
    arrowLineLayer.lineWidth = lineWidth;
    arrowLineLayer.path = arrowLinePath.CGPath;
    [arrowLayer addSublayer:arrowLineLayer];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(arrowWidth*0.5, arrowHeight)];
    [linePath addLineToPoint:CGPointMake(arrowWidth*0.5, 0)];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor grayColor].CGColor;
    lineLayer.lineWidth = lineWidth;
    lineLayer.path = linePath.CGPath;
    [arrowLayer addSublayer:lineLayer];
    return arrowLayer;
}

//横向箭头动画
- (CALayer *)horizontalArrowLayerHeight:(CGFloat)height
                                  width:(CGFloat)width
{
    CGFloat rectArrowWidth  = width - 100;
    CGFloat arrowWidth = 20.f;
    CGFloat arrowYPoint = 50.f;
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = CGRectMake(0, self.homeLayer.position.y-height*0.5, width, height);
    backLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    //矩形箭头
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,
                                                                                  0,
                                                                                  rectArrowWidth,
                                                                                  height)
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(0, 0)];

    [bezierPath moveToPoint:CGPointMake(rectArrowWidth, 0)];
    [bezierPath addLineToPoint:CGPointMake(width, height*0.5)];
    [bezierPath addLineToPoint:CGPointMake(rectArrowWidth, height)];
    CAShapeLayer *rectArrowLayer = [CAShapeLayer new];
    rectArrowLayer.fillColor = [UIColor greenColor].CGColor;
    rectArrowLayer.path = bezierPath.CGPath;
    [backLayer addSublayer:rectArrowLayer];
   
    //小箭头
    UIBezierPath *arrowLinePath = [UIBezierPath bezierPath];
    [arrowLinePath moveToPoint:CGPointMake(rectArrowWidth+40, arrowYPoint)];
    [arrowLinePath addLineToPoint:CGPointMake(width-arrowWidth*0.5, height*0.5)];
    [arrowLinePath addLineToPoint:CGPointMake(rectArrowWidth+40, height-arrowYPoint)];
    CAShapeLayer *arrowLineLayer = [CAShapeLayer layer];
    arrowLineLayer.lineCap = kCALineCapRound;
    arrowLineLayer.fillColor = [UIColor clearColor].CGColor;
    arrowLineLayer.strokeColor = [UIColor grayColor].CGColor;
    arrowLineLayer.lineWidth =arrowWidth;
    arrowLineLayer.path = arrowLinePath.CGPath;
    [backLayer addSublayer:arrowLineLayer];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(width-arrowWidth*0.5, height*0.5)];
    [linePath addLineToPoint:CGPointMake(width-200, height*0.5)];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor grayColor].CGColor;
    lineLayer.lineWidth = arrowWidth;
    lineLayer.path = linePath.CGPath;
    [backLayer addSublayer:lineLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(0, 0, width-150, height)
                                                                   intText:@"TRAVEL"
                                                                  textFont:[UIFont systemFontOfSize:120]
                                                                 textColor:[UIColor whiteColor]];
    textLayer.contentsGravity = kCAGravityCenter;
    textLayer.anchorPoint = CGPointMake(0.5, 0.3);
    [backLayer addSublayer:textLayer];
    
    return backLayer;

}

//从上向下转场
- (void)topDownTransitions
{
    CGFloat shapeHeight = 200.f;
    CAShapeLayer  *downLayer = [CAShapeLayer layer];
    UIBezierPath *downBezierPath = [UIBezierPath bezierPath];
    [downBezierPath moveToPoint:CGPointMake(kAVWindowWidth*0.5, 0)];
    [downBezierPath addLineToPoint:CGPointMake(kAVWindowWidth*0.5, shapeHeight)];
    downLayer.strokeColor = [UIColor grayColor].CGColor;
    downLayer.fillColor = [UIColor clearColor].CGColor;
    downLayer.path = downBezierPath.CGPath;
    downLayer.lineWidth = kAVWindowWidth;
    [self.homeLayer addSublayer:downLayer];
    CFTimeInterval beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    CFTimeInterval storkeDur = 2.f;
    CFTimeInterval positionDur = 3.f;
    
    NSArray *keyTimes = @[@(0),@(1)];
    NSArray *positionValues = @[
                                @(0),
                                @(400),
                                ];
    
    CABasicAnimation *downLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:storkeDur
                                                                     withBeginTime:0
                                                                         fromValue:@(0.0)
                                                                           toValue:@(1.0)
                                                                      propertyName:@"strokeEnd"];
    downLineStrokeEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *downLineStrokeStart = [[AVBasicRouteAnimate alloc] customBasic:storkeDur
                                                                      withBeginTime:storkeDur
                                                                          fromValue:@(0.0)
                                                                            toValue:@(1.0)
                                                                       propertyName:@"strokeStart"];
    downLineStrokeStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:positionDur
                                                                               withBeginTime:0
                                                                                propertyName:@"position.y"
                                                                                      values:positionValues
                                                                                    keyTimes:keyTimes];
    positionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    
    CAAnimationGroup *downLineGroupAni = [[AVBasicRouteAnimate alloc] groupAni:positionDur+storkeDur
                                                                 withBeginTime:beginTime
                                                                        aniArr:@[downLineStrokeEnd,
                                                                                 positionAni,
                                                                                 downLineStrokeStart]];

    [downLayer addAnimation:downLineGroupAni forKey:nil];
    
    CAShapeLayer  *centerLayer = [CAShapeLayer layer];
    UIBezierPath *centerBezierPath = [UIBezierPath bezierPath];
    [centerBezierPath moveToPoint:CGPointMake(kAVWindowWidth*0.5, 60)];
    [centerBezierPath addLineToPoint:CGPointMake(kAVWindowWidth*0.5, 200)];
    centerLayer.strokeColor = [UIColor redColor].CGColor;
    centerLayer.fillColor = [UIColor clearColor].CGColor;
    centerLayer.path = centerBezierPath.CGPath;
    centerLayer.lineWidth = kAVWindowWidth;
    [self.homeLayer addSublayer:centerLayer];
    
    NSArray *centerPositionValues = @[
                                      @(0),
                                      @(400),
                                      ];
    
    CABasicAnimation *centerLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:1.5
                                                                     withBeginTime:0
                                                                         fromValue:@(0.0)
                                                                           toValue:@(1.0)
                                                                      propertyName:@"strokeEnd"];
    centerLineStrokeEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *centerLineStrokeStart = [[AVBasicRouteAnimate alloc] customBasic:storkeDur
                                                                       withBeginTime:storkeDur
                                                                           fromValue:@(0.0)
                                                                             toValue:@(1.0)
                                                                        propertyName:@"strokeStart"];
    centerLineStrokeStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    CAKeyframeAnimation *centerPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2.5
                                                                               withBeginTime:0
                                                                                propertyName:@"position.y"
                                                                                      values:centerPositionValues
                                                                                    keyTimes:keyTimes];
    centerPositionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    
    CAAnimationGroup *centerLineGroupAni = [[AVBasicRouteAnimate alloc] groupAni:4
                                                                   withBeginTime:beginTime+0.5
                                                                          aniArr:@[downLineStrokeEnd,
                                                                                   positionAni,
                                                                                   downLineStrokeStart]];
    
    [centerLayer addAnimation:centerLineGroupAni forKey:nil];

}


- (void)moveTransitions
{
    CALayer *currentLayer = [CALayer layer];
    currentLayer.frame = self.homeLayer.bounds;
    currentLayer.contents = (__bridge id)[UIImage imageNamed:@"bg2"].CGImage;
    currentLayer.zPosition = 0;
    [self.homeLayer addSublayer:currentLayer];
    
    CALayer *nextLayer = [CALayer layer];
    nextLayer.frame = CGRectMake(-kAVWindowWidth, 0, kAVWindowWidth, kAVWindowWidth);
    nextLayer.contents = (__bridge id)[UIImage imageNamed:@"london"].CGImage;
    nextLayer.zPosition = 1;
    [self.homeLayer addSublayer:nextLayer];
    
    CATransform3D translation = CATransform3DIdentity;
    NSArray *keyTime = @[@(0),@(1)];
    NSArray *translationValue = @[
                                  [NSValue valueWithCATransform3D:CATransform3DTranslate(translation, 0, 0, 0)],
                                  [NSValue valueWithCATransform3D:CATransform3DTranslate(translation, kAVWindowWidth, 0, 0)],
                                  ];
    CAKeyframeAnimation *currentLayerAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:4
                                                                                   withBeginTime:0
                                                                                    propertyName:@"transform"
                                                                                          values:translationValue
                                                                                        keyTimes:keyTime];
    [currentLayer addAnimation:currentLayerAni forKey:nil];
    
    CAKeyframeAnimation *nextLayerAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2
                                                                                withBeginTime:0
                                                                                 propertyName:@"transform"
                                                                                       values:translationValue
                                                                                     keyTimes:keyTime];
    [nextLayer addAnimation:nextLayerAni forKey:nil];
    
    
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
