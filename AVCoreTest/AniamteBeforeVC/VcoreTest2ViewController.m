//
//  VcoreTest2ViewController.m
//  AVCoreTest
//
//  Created by gemin on 15/11/25.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "VcoreTest2ViewController.h"
#import "AVFundation.h"
#import "JNWSpringAnimation.h"
#import <Accelerate/Accelerate.h>
#import "AVBasicTextLayer.h"

#define kLeftSpace     15
#define kEndPointY      50
@interface VcoreTest2ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *shipLayer;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) CALayer *homeLayer;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@end

@implementation VcoreTest2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _homeLayer = [CALayer layer];
    _homeLayer.frame = CGRectMake( 0, 100, kAVWindowWidth, kAVWindowWidth);
    
    CGFloat scaleValue = self.view.frame.size.width/kAVWindowWidth;
    
    [_homeLayer setValue:[NSNumber numberWithFloat:scaleValue] forKeyPath:@"transform.scale"];
    
    _homeLayer.position =  self.view.center;

    [self.view.layer addSublayer: _homeLayer];
//    [self beginAcrossLineAnimation];
//    [self beginStartText];
//    [self goodsShowAnimation];
//    [self beginTextAnimation];
//    [self beginAnimationStanSpring];
//    [self beginTenSlantedLineAnimation];
    [self beginMultilayDiamondShape];
//    [self beginCrucifixonAnimation];
//    [self beginTenLineAnimation];
//    [self beginAcrossLineAnimation];
//    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:nil];
//    self.visualEffectView.frame = CGRectMake( 0, 0, kAVWindowWidth, kAVWindowWidth);
//    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, kAVWindowWidth, kAVWindowWidth)];
//    grayView.alpha = 0.6f;
//    grayView.backgroundColor = [UIColor darkGrayColor];
//    self.visualEffectView.contentView.alpha = 1.0;
//    [self.visualEffectView.contentView addSubview:grayView];
//    [_homeLayer addSublayer:self.visualEffectView.layer];
//    [self beginAnimation];
    // Do any additional setup after loading the view.
//    self.colorLayer = [CALayer layer];
//    self.colorLayer.frame = CGRectMake(50.0f, 100.0f, 100.0f, 100.0f);
//    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
//    [self.view.layer addSublayer:self.colorLayer];
////    _imageArr = @[[UIImage imageNamed:@"z0"],
////                          [UIImage imageNamed:@"z1"],
////                          [UIImage imageNamed:@"z2"],
////                          [UIImage imageNamed:@"z3"]];
//    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    _imageView.image = [UIImage imageNamed:@"z0"];
//    [self.view addSubview:_imageView];
//    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
//    start.frame = CGRectMake(0,350, 100, 40);
//    [start setTitle:@"start" forState:UIControlStateNormal];
//    [start setBackgroundColor:[UIColor blueColor]];
//    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:start];
//    UIButton *stop = [UIButton buttonWithType:UIButtonTypeCustom];
//    stop.frame = CGRectMake(180,350, 100, 40);
//    [stop setTitle:@"stop" forState:UIControlStateNormal];
//    [stop setBackgroundColor:[UIColor blueColor]];
//    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:stop];

//    self.shipLayer = [CALayer layer];
//    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
//    self.shipLayer.position = CGPointMake(150, 150);
//    self.shipLayer.anchorPoint = CGPointMake(0, 0.5);
//    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"heng3.png"].CGImage;
//    [self.view.layer addSublayer:self.shipLayer];
//    CATransform3D perspective = CATransform3DIdentity;
//    perspective.m34 = -1.0/500.0;
//    self.view.layer.sublayerTransform = perspective;
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
//    [pan addTarget:self action:@selector(pan:)];
//    [self.view addGestureRecognizer:pan];
//    self.shipLayer.speed = 0.0;
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation.y";
//    animation.toValue = @(-M_PI_2);
//    animation.duration = 2.0;
////    animation.repeatDuration = INFINITY;
////    animation.autoreverses = YES;
//    [self.shipLayer addAnimation:animation forKey:nil];

}

- (void)beginStartText
{
    CGFloat lineHeight  = 2.f;
    CGFloat lineCenterY = kAVWindowHeight/2;
    CGFloat lineCenterX = 100.f;
    CGFloat duration    = 0.5;
    CFTimeInterval beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    AVBasicLayer *topLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(lineCenterX, lineCenterY, 0, 0)
                                                          bgColor:[UIColor whiteColor].CGColor];
    topLineLayer.anchorPoint = CGPointMake(0, 0);
    [_homeLayer addSublayer:topLineLayer];
    
    AVBasicLayer *bottomLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(lineCenterX, lineCenterY, 0, 0)
                                                                bgColor:[UIColor whiteColor].CGColor];
    bottomLineLayer.anchorPoint = CGPointMake(0, 0);
    [_homeLayer addSublayer:bottomLineLayer];

    AVBasicLayer *textBackLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(lineCenterX, lineCenterY, 0, 0)
                                                             bgColor:UIColorFromRGBAlpha(0x000000, 0.5).CGColor];
    textBackLineLayer.anchorPoint = CGPointMake(0, 0.5);
    textBackLineLayer.zPosition = -1;
    [_homeLayer addSublayer:textBackLineLayer];
    
    NSString *text = @"删掉会房间卡大栅栏水电费看放假酸辣粉设计费啥房间fdsfsdfdddffdfdggfgdg里";
    CGFloat fontSize = 30;
    CGSize size = [text boundingRectWithSize:CGSizeMake(kAVWindowWidth-lineCenterX*2, 500)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                     context:nil].size;
    
    CGFloat textBackHeight = ceil(size.height) + 20;
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(lineCenterX,
                                                                                      lineCenterY,
                                                                                      kAVWindowWidth-lineCenterX*2,
                                                                                      size.height+5)
                                                                  intText:text
                                                                 textFont:[UIFont systemFontOfSize:fontSize]
                                                                 textColor:[UIColor whiteColor]];
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.anchorPoint = CGPointMake(0.5, 1);
    textLayer.wrapped = YES;
    [_homeLayer addSublayer:textLayer];

    NSArray *boundsKeyTime = @[
                               [NSNumber numberWithFloat:0],
                               [NSNumber numberWithFloat:1],
                               ];
    
    NSArray *boundsValues = @[
                              [NSValue valueWithCGRect:CGRectMake(lineCenterX,
                                                                  lineCenterY,
                                                                  0,
                                                                  lineHeight)],
                              [NSValue valueWithCGRect:CGRectMake(lineCenterX,
                                                                  lineCenterY,
                                                                  kAVWindowWidth-lineCenterX*2,
                                                                  lineHeight)],
                              ];
    
    NSArray *topPositionValues = @[
                                 [NSValue valueWithCGPoint:CGPointMake(topLineLayer.position.x,
                                                                       topLineLayer.position.y)],
                                 [NSValue valueWithCGPoint:CGPointMake(topLineLayer.position.x,
                                                                       topLineLayer.position.y-textBackHeight*0.5)],
            
                                 ];

    
    CAKeyframeAnimation *lineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                 withBeginTime:0
                                                                                  propertyName:kAVBasicAniBounds
                                                                                        values:boundsValues
                                                                                      keyTimes:boundsKeyTime];
    CAKeyframeAnimation *topPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                  withBeginTime:duration
                                                                                   propertyName:kAVBasicAniPosition
                                                                                         values:topPositionValues
                                                                                       keyTimes:boundsKeyTime];

    CAAnimationGroup *topLineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:beginTime+duration*2
                                                                       withBeginTime:beginTime
                                                                              aniArr:@[lineBoundsAni,
                                                                                       topPositionAni]];
    
    [topLineLayer addAnimation:topLineGroupAni forKey:@"topLineBoundsKey"];
    
    NSArray *bottomPositionValues = @[
                                    [NSValue valueWithCGPoint:CGPointMake(topLineLayer.position.x,
                                                                          topLineLayer.position.y)],
                                    [NSValue valueWithCGPoint:CGPointMake(topLineLayer.position.x,
                                                                          topLineLayer.position.y+textBackHeight*0.5)],
                                    ];
    CAKeyframeAnimation *bottomPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                     withBeginTime:duration
                                                                                      propertyName:kAVBasicAniPosition
                                                                                            values:bottomPositionValues
                                                                                          keyTimes:boundsKeyTime];
    CAAnimationGroup *bottomLineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:beginTime+duration*2
                                                                       withBeginTime:beginTime
                                                                              aniArr:@[lineBoundsAni,
                                                                                       bottomPositionAni]];
    [bottomLineLayer addAnimation:bottomLineGroupAni forKey:@"bottomLineBoundsKey"];
    
    NSArray *textBackBoundValues = @[
                                  [NSValue valueWithCGRect:CGRectMake(lineCenterX,
                                                                      lineCenterY,
                                                                      kAVWindowWidth-lineCenterX*2,
                                                                      0)],
                                  [NSValue valueWithCGRect:CGRectMake(lineCenterX,
                                                                      lineCenterY,
                                                                      kAVWindowWidth-lineCenterX*2,
                                                                      textBackHeight)],
                                  ];
    CAKeyframeAnimation *textBackBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                     withBeginTime:beginTime+duration
                                                                                      propertyName:kAVBasicAniBounds
                                                                                            values:textBackBoundValues
                                                                                          keyTimes:boundsKeyTime];
    [textBackLineLayer addAnimation:textBackBoundsAni forKey:nil];
    
    CAKeyframeAnimation *textOpacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                     withBeginTime:beginTime+duration
                                                                                      propertyName:@"opacity"
                                                                                            values:@[@(0),@(1)]
                                                                                          keyTimes:boundsKeyTime];
    [textLayer addAnimation:textOpacityAni forKey:nil];


}

- (CATextLayer *)basicTextLayerWithFrame:(CGRect)frame
                                    font:(UIFont *)font
{
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = frame;
    textLayer.alignmentMode = kCAAlignmentCenter;
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font =  fontRef;
    textLayer.fontSize = font.pointSize;
    textLayer.wrapped = YES;
    CGFontRelease(fontRef);
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    return textLayer;
}


//3D轮播
- (void)goodsShowAnimation
{
    NSArray *imageList = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"0.png"],
                          [UIImage imageNamed:@"git1.jpg"],
                          [UIImage imageNamed:@"meinv2.png"],
                          [UIImage imageNamed:@"meinv.png"],
                          [UIImage imageNamed:@"magazineStartOne.png"],
                          [UIImage imageNamed:@"gril.png"],
                          [UIImage imageNamed:@"z2.png"],
                          [UIImage imageNamed:@"z3.png"],nil];

    //图片模糊化处理
    NSMutableArray *blurImageList = [[NSMutableArray alloc] init];
    for (UIImage *image in imageList) {
        UIImage *blurImage = [self boxblurImage:image withBlurNumber:0.5];
        [blurImageList addObject:blurImage];
    }
    
    CGFloat imageWidth      = kAVWindowWidth-200;  //展示图片的宽
    CGFloat beforeZPosition = 0;                   //前面展示图片的z轴距离
    CGFloat behindZPosition = -300;                //后面图片的z轴距离
    CGFloat beforeOpacity   = 1;                   //前面展示图片的透明度
    CGFloat behindOpacity   = 0.5;                 //后面图片的透明度
    CGFloat dismissOpacity  = 0;                   //图片消失
    CGFloat offsetX         = 200;                 //后面图片偏移量
    CGFloat showTime        = 2;                   //前面图片展示时间
    CGFloat moveTime        = 0.6;                 //图片由前到后的运动时间
    CGFloat waitTimeScale   = (showTime + moveTime)*0.5; //动画等待时间比
    
    CATransformLayer *transContainerLayer = [CATransformLayer layer];
    transContainerLayer.frame = self.homeLayer.bounds;
    [self.homeLayer addSublayer:transContainerLayer];
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/1000.0;
    transform = CATransform3DRotate(transform, 0, 0, 0, 0);
    transContainerLayer.transform = transform;
    
    CFTimeInterval beginTime = [transContainerLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval duration = (showTime + moveTime)*3;
    CGFloat        perDuration = 1/duration;
    CGFloat        showPerDuration = showTime*perDuration;
    CGFloat        movePerDuration = moveTime*perDuration;
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:showPerDuration],
                         [NSNumber numberWithFloat:showPerDuration+movePerDuration],
                         [NSNumber numberWithFloat:2*showPerDuration+movePerDuration],
                         [NSNumber numberWithFloat:2*(showPerDuration+movePerDuration)],
                         [NSNumber numberWithFloat:3*showPerDuration+2*movePerDuration],
                         [NSNumber numberWithFloat:3*(showPerDuration+movePerDuration)],
                         ];
    
    NSArray *positionValues = @[
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                      transContainerLayer.position.y)],
                                ];
    
    NSArray *translateValues = @[
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(beforeZPosition),
                                 @(beforeZPosition),
                                 @(behindZPosition),
                                 ];
    
    CFTimeInterval opactiyDuration = duration+moveTime+showTime;
    CGFloat        opactiyPerDuration = 1/opactiyDuration;
    CGFloat        opactiyShowPerDuration = showTime*opactiyPerDuration;
    CGFloat        opactiyMovePerDuration = moveTime*opactiyPerDuration;
    
    
    NSArray *opactiyKeyTime = @[
                                [NSNumber numberWithFloat:0],
                                [NSNumber numberWithFloat:opactiyShowPerDuration],
                                [NSNumber numberWithFloat:opactiyShowPerDuration+opactiyMovePerDuration],
                                [NSNumber numberWithFloat:2*opactiyShowPerDuration+opactiyMovePerDuration],
                                [NSNumber numberWithFloat:2*(opactiyShowPerDuration+opactiyMovePerDuration)],
                                [NSNumber numberWithFloat:3*opactiyShowPerDuration+2*opactiyMovePerDuration],
                                [NSNumber numberWithFloat:3*(opactiyShowPerDuration+opactiyMovePerDuration)],
                                [NSNumber numberWithFloat:4*opactiyShowPerDuration+3*opactiyMovePerDuration],
                                [NSNumber numberWithFloat:4*(opactiyShowPerDuration+opactiyMovePerDuration)],
                                ];
    NSArray *opactiyValues = @[
                               @(dismissOpacity),
                               @(dismissOpacity),
                               @(behindOpacity),
                               @(behindOpacity),
                               @(beforeOpacity),
                               @(beforeOpacity),
                               @(behindOpacity),
                               @(behindOpacity),
                               @(dismissOpacity),
                               ];
    
    //背景变化
    NSMutableArray *blurImageKeyTime = [NSMutableArray array];
    NSMutableArray *blureImageValue = [NSMutableArray array];
    CGFloat arithmetic = 1.0/((showTime + moveTime)*blurImageList.count);
    CGFloat index1 = 0;
    CGFloat index2 = showTime*arithmetic;
    for (int i = 0; i < blurImageList.count; i++) {
        [blurImageKeyTime addObject:[NSNumber numberWithFloat:index1]];
        [blurImageKeyTime addObject:[NSNumber numberWithFloat:index2]];
        index1 = index1 + (showTime + moveTime)*arithmetic;
        index2 = index2 + (showTime + moveTime)*arithmetic;
        UIImage *image = blurImageList[i];
        [blureImageValue addObject:(__bridge id)image.CGImage];
        [blureImageValue addObject:(__bridge id)image.CGImage];
    }
    CAKeyframeAnimation *contentsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:(showTime + moveTime)*blurImageList.count
                                                                               withBeginTime:beginTime
                                                                                propertyName:@"contents"
                                                                                      values:blureImageValue
                                                                                    keyTimes:blurImageKeyTime];
    [self.homeLayer addAnimation:contentsAni forKey:nil];
    
    for (int i = 0; i < imageList.count; i++) {
        UIImage *image = imageList[i];
        //第一张图片动画
        if (i == 0) {
            CALayer *firstLayer = [CALayer layer];
            firstLayer.frame = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            firstLayer.position = CGPointMake(transContainerLayer.position.x, transContainerLayer.position.y);
            firstLayer.opacity = beforeOpacity;
            firstLayer.zPosition = beforeZPosition;
            firstLayer.contents = (__bridge id)image.CGImage;
            [transContainerLayer addSublayer:firstLayer];
            CFTimeInterval firstDuration = 2*showTime+moveTime;
            CGFloat        firstPerDuration = 1/firstDuration;
            CGFloat        firstShowPerDuration = showTime*firstPerDuration;
            CGFloat        firstMovePerDuration = moveTime*firstPerDuration;
            
            NSArray *firstKeyTime = @[
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:firstShowPerDuration],
                                      [NSNumber numberWithFloat:firstShowPerDuration+firstMovePerDuration],
                                      [NSNumber numberWithFloat:2*firstShowPerDuration+firstMovePerDuration],
                                      ];
            
            NSArray *firstPositionValues = @[
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                   transContainerLayer.position.y)],
                                             ];
            
            NSArray *firstTranslateValues = @[
                                              @(beforeZPosition),
                                              @(beforeZPosition),
                                              @(behindZPosition),
                                              @(behindZPosition),
                                              ];
            
            CFTimeInterval firstOpactiyDuration = firstDuration+moveTime;
            CGFloat        firstOpactiyPerDuration = 1/firstOpactiyDuration;
            CGFloat        firstOpactiyShowPerDuration = showTime*firstOpactiyPerDuration;
            CGFloat        firstOpactiyMovePerDuration = moveTime*firstOpactiyPerDuration;
            NSArray *firstOpactiyKeyTime = @[
                                             [NSNumber numberWithFloat:0],
                                             [NSNumber numberWithFloat:firstOpactiyShowPerDuration],
                                             [NSNumber numberWithFloat:firstOpactiyShowPerDuration+firstOpactiyMovePerDuration],
                                             [NSNumber numberWithFloat:2*firstOpactiyShowPerDuration+firstOpactiyMovePerDuration],
                                             [NSNumber numberWithFloat:2*(firstOpactiyShowPerDuration+firstOpactiyMovePerDuration)],
                                             ];
            
            NSArray *firstOpactiyValues = @[
                                            @(beforeOpacity),
                                            @(beforeOpacity),
                                            @(behindOpacity),
                                            @(behindOpacity),
                                            @(dismissOpacity),
                                            ];
            
            CAKeyframeAnimation *firstPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                            withBeginTime:0
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:firstPositionValues
                                                                                                 keyTimes:firstKeyTime];
            CAKeyframeAnimation *firstTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                             withBeginTime:0
                                                                                              propertyName:@"zPosition"
                                                                                                    values:firstTranslateValues
                                                                                                  keyTimes:firstKeyTime];
            CAKeyframeAnimation *firstOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstOpactiyDuration
                                                                                           withBeginTime:0
                                                                                            propertyName:@"opacity"
                                                                                                  values:firstOpactiyValues
                                                                                                keyTimes:firstOpactiyKeyTime];
            
            CAAnimationGroup *firstGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:firstOpactiyDuration
                                                                                withBeginTime:beginTime
                                                                                       aniArr:@[firstOpactiyAni,
                                                                                                firstTranslateAni,
                                                                                                firstPositionAni]];
            [firstLayer addAnimation:firstGroupAni forKey:nil];
            
        }
        //第二张图片动画
        else if (i == 1)
        {
            CALayer  *secondLayer = [CALayer layer];
            secondLayer.frame     = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            secondLayer.position  = CGPointMake(transContainerLayer.position.x+offsetX, transContainerLayer.position.y);
            secondLayer.opacity   = behindOpacity;
            secondLayer.zPosition = behindZPosition;
            secondLayer.contents  = (__bridge id)image.CGImage;
            [transContainerLayer addSublayer:secondLayer];
            CFTimeInterval secondDuration = 3*showTime+2*moveTime;
            CGFloat seconPerDuration      = 1/secondDuration;
            CGFloat seconShowPerDuration  = showTime*seconPerDuration;
            CGFloat seconMovePerDuration  = moveTime*seconPerDuration;
            
            NSArray *secondKeyTime = @[
                                       [NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:seconShowPerDuration],
                                       [NSNumber numberWithFloat:seconShowPerDuration+seconMovePerDuration],
                                       [NSNumber numberWithFloat:2*seconShowPerDuration+seconMovePerDuration],
                                       [NSNumber numberWithFloat:2*(seconShowPerDuration+seconMovePerDuration)],
                                       [NSNumber numberWithFloat:3*seconShowPerDuration+2*seconMovePerDuration],
                                       ];
            
            NSArray *secondPositionValues = @[
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                    transContainerLayer.position.y)],
                                              ];
            
            NSArray *secondTranslateValues = @[
                                               @(behindZPosition),
                                               @(behindZPosition),
                                               @(beforeZPosition),
                                               @(beforeZPosition),
                                               @(behindZPosition),
                                               @(behindZPosition),
                                               ];
            
            CFTimeInterval secondOpactiyDuration = secondDuration+moveTime;
            CGFloat seconOpactiyPerDuration      = 1/secondOpactiyDuration;
            CGFloat seconOpactiyShowPerDuration  = showTime*seconOpactiyPerDuration;
            CGFloat seconOpactiyMovePerDuration  = moveTime*seconOpactiyPerDuration;
            
            NSArray *secondOpactiyKeyTime = @[
                                              [NSNumber numberWithFloat:0],
                                              [NSNumber numberWithFloat:seconOpactiyShowPerDuration],
                                              [NSNumber numberWithFloat:seconOpactiyShowPerDuration+seconOpactiyMovePerDuration],
                                              [NSNumber numberWithFloat:2*seconOpactiyShowPerDuration+seconOpactiyMovePerDuration],
                                              [NSNumber numberWithFloat:2*(seconOpactiyShowPerDuration+seconOpactiyMovePerDuration)],
                                              [NSNumber numberWithFloat:3*seconOpactiyShowPerDuration+2*seconOpactiyMovePerDuration],
                                              [NSNumber numberWithFloat:3*(seconOpactiyShowPerDuration+seconOpactiyMovePerDuration)],
                                              ];
            
            NSArray *secondOpactiyValues = @[
                                             @(behindOpacity),
                                             @(behindOpacity),
                                             @(beforeOpacity),
                                             @(beforeOpacity),
                                             @(behindOpacity),
                                             @(behindOpacity),
                                             @(dismissOpacity),
                                             ];
            
            CAKeyframeAnimation *secondPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                             withBeginTime:0
                                                                                              propertyName:kAVBasicAniPosition
                                                                                                    values:secondPositionValues
                                                                                                  keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                              withBeginTime:0
                                                                                               propertyName:@"zPosition"
                                                                                                     values:secondTranslateValues
                                                                                                   keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondOpactiyDuration
                                                                                            withBeginTime:0
                                                                                             propertyName:@"opacity"
                                                                                                   values:secondOpactiyValues
                                                                                                 keyTimes:secondOpactiyKeyTime];
            CAAnimationGroup *secondGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:secondOpactiyDuration
                                                                                 withBeginTime:beginTime
                                                                                        aniArr:@[secondPositionAni,
                                                                                                 secondTranslateAni,
                                                                                                 secondOpactiyAni,
                                                                                                 ]];
            [secondLayer addAnimation:secondGroupAni forKey:nil];
        }
        //第三张图片动画
        else if (i == 2)
        {
            CALayer *thirdLayer = [CALayer layer];
            thirdLayer.frame = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            thirdLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            thirdLayer.opacity = behindOpacity;
            thirdLayer.zPosition = behindZPosition;
            thirdLayer.contents = (__bridge id)image.CGImage;
            [transContainerLayer addSublayer:thirdLayer];
            
            NSArray *thirdOpactiyValues = @[
                                            @(behindOpacity),
                                            @(behindOpacity),
                                            @(behindOpacity),
                                            @(behindOpacity),
                                            @(beforeOpacity),
                                            @(beforeOpacity),
                                            @(behindOpacity),
                                            @(behindOpacity),
                                            @(dismissOpacity),
                                            ];
            
            CAKeyframeAnimation *thirdPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:0
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:positionValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *thirdTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                             withBeginTime:0
                                                                                              propertyName:@"zPosition"
                                                                                                    values:translateValues
                                                                                                  keyTimes:keyTime];
            CAKeyframeAnimation *thirdOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:opactiyDuration
                                                                                           withBeginTime:0
                                                                                            propertyName:@"opacity"
                                                                                                  values:thirdOpactiyValues
                                                                                                keyTimes:opactiyKeyTime];
            CAAnimationGroup *thirdGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:opactiyDuration
                                                                                withBeginTime:beginTime
                                                                                       aniArr:@[thirdPositionAni,
                                                                                                thirdTranslateAni,
                                                                                                thirdOpactiyAni,
                                                                                                ]];
            [thirdLayer addAnimation:thirdGroupAni forKey:nil];
        }
        //最后一张图片动画
        else if (i == imageList.count - 1)
        {
            CALayer  *lastLayer = [CALayer layer];
            lastLayer.frame     = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            lastLayer.position  = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            lastLayer.opacity   = behindOpacity;
            lastLayer.zPosition = behindZPosition;
            lastLayer.contents  = (__bridge id)image.CGImage;
            [transContainerLayer addSublayer:lastLayer];
            CFTimeInterval lastDuration = 2*showTime+2*moveTime;
            CGFloat lastPerDuration      = 1/lastDuration;
            CGFloat lastShowPerDuration  = showTime*lastPerDuration;
            CGFloat lastMovePerDuration  = moveTime*lastPerDuration;
            
            NSArray *lastKeyTime = @[
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:lastShowPerDuration],
                                     [NSNumber numberWithFloat:lastShowPerDuration+lastMovePerDuration],
                                     [NSNumber numberWithFloat:2*lastShowPerDuration+lastMovePerDuration],
                                     [NSNumber numberWithFloat:2*(lastShowPerDuration+lastMovePerDuration)],
                                     ];
            
            NSArray *lastPositionValues = @[
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                  transContainerLayer.position.y)],
                                            ];
            
            NSArray *lastTranslateValues = @[
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(beforeZPosition),
                                             ];
            
            NSArray *lastOpactiyKeyTime = @[
                                            [NSNumber numberWithFloat:0],
                                            [NSNumber numberWithFloat:lastShowPerDuration],
                                            [NSNumber numberWithFloat:lastShowPerDuration+lastMovePerDuration],
                                            [NSNumber numberWithFloat:2*lastShowPerDuration+lastMovePerDuration],
                                            [NSNumber numberWithFloat:2*(lastShowPerDuration+lastMovePerDuration)],
                                            ];
            
            NSArray *lastOpactiyValues = @[
                                           @(dismissOpacity),
                                           @(dismissOpacity),
                                           @(behindOpacity),
                                           @(behindOpacity),
                                           @(beforeOpacity),
                                           ];
            
            CAKeyframeAnimation *lastPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:kAVBasicAniPosition
                                                                                                  values:lastPositionValues
                                                                                                keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:@"zPosition"
                                                                                                   values:lastTranslateValues
                                                                                                 keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                          withBeginTime:waitTimeScale*(i-2)
                                                                                           propertyName:@"opacity"
                                                                                                 values:lastOpactiyValues
                                                                                               keyTimes:lastOpactiyKeyTime];
            CAAnimationGroup *lastGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:lastDuration+waitTimeScale*(i-2)
                                                                               withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                      aniArr:@[lastPositionAni,
                                                                                               lastTranslateAni,
                                                                                               lastOpactiyAni,
                                                                                               ]];
            [lastLayer addAnimation:lastGroupAni forKey:nil];
            
        }
        //倒数第二张图片动画
        else if (i == imageList.count - 2)
        {
            CALayer  *penultimateLayer = [CALayer layer];
            penultimateLayer.frame     = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            penultimateLayer.position  = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            penultimateLayer.opacity   = behindOpacity;
            penultimateLayer.zPosition = behindZPosition;
            penultimateLayer.contents  = (__bridge id)image.CGImage;
            [transContainerLayer addSublayer:penultimateLayer];
            
            NSArray *penultimateOpactiyValues = @[
                                                   @(dismissOpacity),
                                                   @(dismissOpacity),
                                                   @(behindOpacity),
                                                   @(behindOpacity),
                                                   @(beforeOpacity),
                                                   @(beforeOpacity),
                                                   @(behindOpacity),
                                                   ];
            
            CAKeyframeAnimation *penultimatePositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:kAVBasicAniPosition
                                                                                                  values:positionValues
                                                                                                keyTimes:keyTime];
            CAKeyframeAnimation *penultimateTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:@"zPosition"
                                                                                                   values:translateValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *penultimateOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                          withBeginTime:waitTimeScale*(i-2)
                                                                                           propertyName:@"opacity"
                                                                                                 values:penultimateOpactiyValues
                                                                                               keyTimes:keyTime];
            CAAnimationGroup *penultimateGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration+waitTimeScale*(i-2)
                                                                                      withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                             aniArr:@[penultimatePositionAni,
                                                                                                      penultimateTranslateAni,
                                                                                                      penultimateOpactiyAni,
                                                                                                      ]];
            [penultimateLayer addAnimation:penultimateGroupAni forKey:nil];

        }
        else
        {
            //中间的图片动画
            CALayer *nomalLayer = [CALayer layer];
            nomalLayer.frame = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            nomalLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            nomalLayer.opacity = behindOpacity;
            nomalLayer.zPosition = behindZPosition;
            nomalLayer.contents = (__bridge id)image.CGImage;
            [transContainerLayer addSublayer:nomalLayer];
            
            CAKeyframeAnimation *nomalPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:positionValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *nomalTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                             withBeginTime:waitTimeScale*(i-2)
                                                                                              propertyName:@"zPosition"
                                                                                                    values:translateValues
                                                                                                  keyTimes:keyTime];
            CAKeyframeAnimation *nomalOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:opactiyDuration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:@"opacity"
                                                                                                  values:opactiyValues
                                                                                                keyTimes:opactiyKeyTime];
            CAAnimationGroup *nomalGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:opactiyDuration+waitTimeScale*(i-2)
                                                                                withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                       aniArr:@[nomalPositionAni,
                                                                                                nomalTranslateAni,
                                                                                                nomalOpactiyAni,
                                                                                                ]];
            [nomalLayer addAnimation:nomalGroupAni forKey:nil];
            
        }
        
    }
}

- (UIImage *)boxblurImage:(UIImage *)image
           withBlurNumber:(CGFloat)blur {
    
    if (image==nil)
    {
        NSLog(@"error:为图片添加模糊效果时，未能获取原始图片");
        return nil;
    }
    //模糊度,
    if (blur < 0.025f) {
        blur = 0.025f;
    } else if (blur > 1.0f) {
        blur = 1.0f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    NSLog(@"boxSize:%i",boxSize);
    //图像处理
    CGImageRef img = image.CGImage;
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    return returnImage;
}

//横线
- (void)beginLineAnimation
{
    CGFloat lineHeight      = 2.0;
    CGFloat leftPointX      = 10.0;
    CGFloat verticalSpace   = 10.0;
    CGFloat duration        = 1;
    CGFloat rightPointX     = kAVWindowWidth - 10.f;
    CGFloat movePoint      = kAVWindowWidth * 0.5;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    for (int i = 0; i < 2; i++) {
        CGFloat startPointX = i == 0?leftPointX:rightPointX;
        //上方的横线
        UIBezierPath *topPath = [UIBezierPath bezierPath];
        [topPath moveToPoint:CGPointMake(startPointX, verticalSpace)];
        [topPath addLineToPoint:CGPointMake(movePoint, verticalSpace)];
        CAShapeLayer *topPathLayer = [CAShapeLayer layer];
        topPathLayer.path = topPath.CGPath;
        topPathLayer.fillColor = [UIColor clearColor].CGColor;
        topPathLayer.strokeColor = [UIColor whiteColor].CGColor;
        topPathLayer.lineWidth = lineHeight;
        [_homeLayer addSublayer:topPathLayer];
        
        NSNumber *fromeValue = @0;
        NSNumber *toValue = @1;
        CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
                                                                              withBeginTime:0
                                                                                  fromValue:fromeValue
                                                                                    toValue:toValue
                                                                               propertyName:@"strokeEnd"];
        
        CABasicAnimation *strokeEndAniDis = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
                                                                                 withBeginTime:2
                                                                                     fromValue:fromeValue
                                                                                       toValue:toValue
                                                                                  propertyName:@"strokeStart"];
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:3
                                                                       withBeginTime:beginTime
                                                                              aniArr:@[strokeEndAni,strokeEndAniDis]];
        [topPathLayer addAnimation:groupAni forKey:nil];
        
        //下方的横线
        UIBezierPath *downPath = [UIBezierPath bezierPath];
        [downPath moveToPoint:CGPointMake(startPointX, rightPointX)];
        [downPath addLineToPoint:CGPointMake(movePoint, rightPointX)];
        CAShapeLayer *downPathLayer = [CAShapeLayer layer];
        downPathLayer.path = downPath.CGPath;
        downPathLayer.fillColor = [UIColor clearColor].CGColor;
        downPathLayer.strokeColor = [UIColor whiteColor].CGColor;
        downPathLayer.lineWidth = lineHeight;
        [_homeLayer addSublayer:downPathLayer];
        [downPathLayer addAnimation:groupAni forKey:nil];
        
        //左边的横线
        CGFloat startPointY = i == 0?verticalSpace:kAVWindowWidth - verticalSpace;
        UIBezierPath *leftPath = [UIBezierPath bezierPath];
        [leftPath moveToPoint:CGPointMake(leftPointX, startPointY)];
        [leftPath addLineToPoint:CGPointMake(leftPointX, movePoint)];
        CAShapeLayer *leftPathLayer = [CAShapeLayer layer];
        leftPathLayer.path = leftPath.CGPath;
        leftPathLayer.fillColor = [UIColor clearColor].CGColor;
        leftPathLayer.strokeColor = [UIColor whiteColor].CGColor;
        leftPathLayer.lineWidth = lineHeight;
        [_homeLayer addSublayer:leftPathLayer];
        [leftPathLayer addAnimation:groupAni forKey:nil];
        
        //右边的横线
        UIBezierPath *rightPath = [UIBezierPath bezierPath];
        [rightPath moveToPoint:CGPointMake(rightPointX, startPointY)];
        [rightPath addLineToPoint:CGPointMake(rightPointX, movePoint)];
        CAShapeLayer *rightPathLayer = [CAShapeLayer layer];
        rightPathLayer.path = rightPath.CGPath;
        rightPathLayer.fillColor = [UIColor clearColor].CGColor;
        rightPathLayer.strokeColor = [UIColor whiteColor].CGColor;
        rightPathLayer.lineWidth = lineHeight;
        [_homeLayer addSublayer:rightPathLayer];
        [rightPathLayer addAnimation:groupAni forKey:nil];
    }
}

- (void)beginTextAnimation
{
    CGFloat lineHeight = 1.0;
    CGFloat duration = 1.0f;
    CGFloat offsetX = 100.0f;
    CGFloat offsetY = 100.0f;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    UIBezierPath *leftUpPath = [UIBezierPath bezierPath];
    [leftUpPath moveToPoint:CGPointMake( kAVWindowWidth-2*offsetX, offsetY)];
    [leftUpPath addLineToPoint:CGPointMake(offsetX, 2*offsetY)];
    CAShapeLayer *leftUpPathLayer = [CAShapeLayer layer];
    leftUpPathLayer.path = leftUpPath.CGPath;
    leftUpPathLayer.fillColor = [UIColor clearColor].CGColor;
    leftUpPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    leftUpPathLayer.lineWidth = lineHeight;
    [_homeLayer addSublayer:leftUpPathLayer];
    NSNumber *fromeValue = @0;
    NSNumber *toValue = @1;
    
    CABasicAnimation *leftUpStrokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:0 fromValue:fromeValue toValue:toValue propertyName:@"strokeEnd"];
    
    CABasicAnimation *leftUpStrokeEndAniDis = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:2 fromValue:fromeValue toValue:toValue propertyName:@"strokeStart"];
    
    CAAnimationGroup *leftUpGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:3 withBeginTime:beginTime aniArr:@[leftUpStrokeEndAni,leftUpStrokeEndAniDis]];
    
    [leftUpPathLayer addAnimation:leftUpGroup forKey:nil];
    
    
    UIBezierPath *rightUpPath = [UIBezierPath bezierPath];
    [rightUpPath moveToPoint:CGPointMake(2*offsetX, offsetY)];
    [rightUpPath addLineToPoint:CGPointMake(kAVWindowWidth-offsetX, 2*offsetY)];
    CAShapeLayer *rightUpPathLayer = [CAShapeLayer layer];
    rightUpPathLayer.path = rightUpPath.CGPath;
    rightUpPathLayer.fillColor = [UIColor clearColor].CGColor;
    rightUpPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    rightUpPathLayer.lineWidth = lineHeight;
    [_homeLayer addSublayer:rightUpPathLayer];
    [rightUpPathLayer addAnimation:leftUpGroup forKey:nil];
    
    
    UIBezierPath *leftDownPath = [UIBezierPath bezierPath];
    [leftDownPath moveToPoint:CGPointMake(offsetX, kAVWindowHeight-2*offsetY)];
    [leftDownPath addLineToPoint:CGPointMake(kAVWindowWidth-2*offsetX, kAVWindowHeight-offsetY)];
    CAShapeLayer *leftDownPathLayer = [CAShapeLayer layer];
    leftDownPathLayer.path = leftDownPath.CGPath;
    leftDownPathLayer.fillColor = [UIColor clearColor].CGColor;
    leftDownPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    leftDownPathLayer.lineWidth = lineHeight;
    [_homeLayer addSublayer:leftDownPathLayer];
    [leftDownPathLayer addAnimation:leftUpGroup forKey:nil];

    
    UIBezierPath *rightDownPath = [UIBezierPath bezierPath];
    [rightDownPath moveToPoint:CGPointMake(kAVWindowWidth-offsetX, kAVWindowHeight-2*offsetY)];
    [rightDownPath addLineToPoint:CGPointMake(2*offsetX, kAVWindowHeight-offsetY)];
    CAShapeLayer *rightDownPathLayer = [CAShapeLayer layer];
    rightDownPathLayer.path = rightDownPath.CGPath;
    rightDownPathLayer.fillColor = [UIColor clearColor].CGColor;
    rightDownPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    rightDownPathLayer.lineWidth = lineHeight;
    [_homeLayer addSublayer:rightDownPathLayer];
    [rightDownPathLayer addAnimation:leftUpGroup forKey:nil];


}

//菱形
- (void)beginMultilayDiamondShape
{
    CGFloat lineHeight = 2.0;
    CGFloat insideLineWidth = sqrt(kAVWindowHeight*kAVWindowHeight*0.5);
    CGFloat outsideLineWidth = sqrt(kAVWindowHeight*kAVWindowHeight*0.125);
    CGFloat durion = 0.5;
    CGFloat durionSpace = 0.1;
    CGFloat groupDur = 2.5;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    for (int i = 0; i < 2; i++) {
        //左下角线条
        UIBezierPath *leftDownMovePath = [UIBezierPath bezierPath];
        [leftDownMovePath moveToPoint:CGPointMake(0,kAVWindowWidth*(0.5+i*0.25))];
        [leftDownMovePath addLineToPoint:CGPointMake(kAVWindowWidth*(0.5-i*0.25), kAVWindowHeight)];
        CGFloat lineWidth = i==1?outsideLineWidth:insideLineWidth;
        AVBasicLayer *leftDownLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0,kAVWindowHeight*(0.5+i*0.25), lineWidth, lineHeight) bgColor:[UIColor whiteColor].CGColor];
        leftDownLineLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        leftDownLineLayer.anchorPoint = CGPointMake(1, 0.5);
        [_homeLayer addSublayer:leftDownLineLayer];
        
        NSArray *boundsKeyTime = @[
                                   [NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:1],
                                   ];
        
        NSArray *boundsValues = @[
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, lineWidth, lineHeight)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, 0, lineHeight)],
                                  ];
        
        CAKeyframeAnimation *leftDownLineMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:durion-i*0.2 withBeginTime:i propertyName:kAVBasicAniPosition path:(CGMutablePathRef)leftDownMovePath.CGPath];;
        CAKeyframeAnimation *leftDownLineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:durion-i*0.2 withBeginTime:1.2+i propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAAnimationGroup *leftDownLineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:groupDur withBeginTime:beginTime aniArr:@[leftDownLineMoveAni,leftDownLineBoundsAni]];
        [leftDownLineLayer addAnimation:leftDownLineGroupAni forKey:nil];
        
        //右下角线条
        UIBezierPath *rightDownMovePath = [UIBezierPath bezierPath];
        [rightDownMovePath moveToPoint:CGPointMake(kAVWindowWidth*(0.5+i*0.25),kAVWindowWidth)];
        [rightDownMovePath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight*(0.5+i*0.25))];
        AVBasicLayer *rightDownLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0,0, lineWidth, lineHeight) bgColor:[UIColor whiteColor].CGColor];
        rightDownLineLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        rightDownLineLayer.anchorPoint = CGPointMake(1, 0.5);
        [_homeLayer addSublayer:rightDownLineLayer];
        CAKeyframeAnimation *rightDownLineMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:durion-i*0.2 withBeginTime:i propertyName:kAVBasicAniPosition path:(CGMutablePathRef)rightDownMovePath.CGPath];;
        CAKeyframeAnimation *rightDownLineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:durion-i*0.2 withBeginTime:1.2+i propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAAnimationGroup *rightDownLineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:groupDur withBeginTime:leftDownLineGroupAni.beginTime+durionSpace aniArr:@[rightDownLineMoveAni,rightDownLineBoundsAni]];
        [rightDownLineLayer addAnimation:rightDownLineGroupAni forKey:nil];
        
        //右上角线条
        UIBezierPath *rightUpMovePath = [UIBezierPath bezierPath];
        [rightUpMovePath moveToPoint:CGPointMake(kAVWindowWidth,kAVWindowHeight*(0.5-i*0.25))];
        [rightUpMovePath addLineToPoint:CGPointMake(kAVWindowWidth*(0.5+i*0.25), 0)];
        AVBasicLayer *rightUpLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0,0, lineWidth, lineHeight) bgColor:[UIColor whiteColor].CGColor];
        rightUpLineLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        rightUpLineLayer.anchorPoint = CGPointMake(0, 0.5);
        [_homeLayer addSublayer:rightUpLineLayer];
        CAKeyframeAnimation *rightUpLineMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:durion-i*0.2 withBeginTime:i propertyName:kAVBasicAniPosition path:(CGMutablePathRef)rightUpMovePath.CGPath];;
        CAKeyframeAnimation *rightUpLineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:durion-i*0.2 withBeginTime:1.2+i propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAAnimationGroup *rightUpLineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:groupDur withBeginTime:rightDownLineGroupAni.beginTime aniArr:@[rightUpLineMoveAni,rightUpLineBoundsAni]];
        [rightUpLineLayer addAnimation:rightUpLineGroupAni forKey:nil];
        
        //左上角线条
        UIBezierPath *leftUpMovePath = [UIBezierPath bezierPath];
        [leftUpMovePath moveToPoint:CGPointMake(kAVWindowWidth*(0.5-i*0.25),0)];
        [leftUpMovePath addLineToPoint:CGPointMake(0, kAVWindowHeight*(0.5-i*0.25))];
        AVBasicLayer *leftUpLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0,0, lineWidth, lineHeight) bgColor:[UIColor whiteColor].CGColor];
        leftUpLineLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        leftUpLineLayer.anchorPoint = CGPointMake(0, 0.5);
        [_homeLayer addSublayer:leftUpLineLayer];
        CAKeyframeAnimation *leftUpLineMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:durion-i*0.2 withBeginTime:i propertyName:kAVBasicAniPosition path:(CGMutablePathRef)leftUpMovePath.CGPath];;
        CAKeyframeAnimation *leftUpLineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:durion-i*0.2 withBeginTime:1.2+i propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAAnimationGroup *leftUpLineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:groupDur withBeginTime:leftDownLineGroupAni.beginTime aniArr:@[leftUpLineMoveAni,leftUpLineBoundsAni]];
        [leftUpLineLayer addAnimation:leftUpLineGroupAni forKey:nil];
        
    }
}


//满屏十字
- (void)beginCrucifixonAnimation
{
    CGFloat lineHeight = 2.0;
    CGFloat lineWidth = 50.0;
    CGFloat offsetX = 50.0;
    int count = 5;
    CGFloat horizontalSpace = (kAVWindowWidth - 2*offsetX - lineWidth)/(count - 1);
    CGFloat verticalSpace = (kAVWindowHeight - offsetX - lineWidth)/(count - 1);
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    for (int i = 0; i < count; i++)
    {
        for (int j = 0; j < count; j++)
        {
            
            UIBezierPath *movePathH = [UIBezierPath bezierPath];
            [movePathH moveToPoint:CGPointMake(-0.5*lineWidth,1)];
            [movePathH addLineToPoint:CGPointMake(lineWidth*0.5, 1)];
            AVBasicLayer *horizontalLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(offsetX+i*horizontalSpace,kAVWindowHeight-offsetX - j*verticalSpace, lineWidth, lineHeight) bgColor:[UIColor whiteColor].CGColor];
            [_homeLayer addSublayer:horizontalLineLayer];
            CALayer *horizontalMaskLayer = [CALayer layer];
            horizontalMaskLayer.frame = horizontalLineLayer.bounds;
            horizontalMaskLayer.backgroundColor = [UIColor blackColor].CGColor;
            horizontalLineLayer.mask = horizontalMaskLayer;
            UIBezierPath *movePathV = [UIBezierPath bezierPath];
            [movePathV moveToPoint:CGPointMake(1,1.5*lineWidth)];
            [movePathV addLineToPoint:CGPointMake(1, lineWidth*0.5)];
            AVBasicLayer *verticalLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(offsetX+lineWidth*0.5+i*horizontalSpace, kAVWindowHeight-1.5*offsetX-j*verticalSpace, lineHeight, lineWidth) bgColor:[UIColor whiteColor].CGColor];
            [_homeLayer addSublayer:verticalLineLayer];
            CALayer *verticalMaskLayer = [CALayer layer];
            verticalMaskLayer.frame = verticalLineLayer.bounds;
            verticalMaskLayer.backgroundColor = [UIColor blackColor].CGColor;
            verticalLineLayer.mask = verticalMaskLayer;
            
            NSArray *boundsKeyTime = @[
                                       [NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:1],
                                       ];
            
            NSArray *horizontalBoundsValues = @[
                                                [NSValue valueWithCGRect:CGRectMake(0, 0, lineWidth, lineHeight)],
                                                [NSValue valueWithCGRect:CGRectMake(0, 0, 0, lineHeight)],
                                                ];
            NSArray *vertialBoundsValues = @[
                                             [NSValue valueWithCGRect:CGRectMake(0, 0, lineHeight, lineWidth)],
                                             [NSValue valueWithCGRect:CGRectMake(0, 0, lineHeight, 0)],
                                             ];
            CAKeyframeAnimation *horizontalLineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.5 withBeginTime:beginTime+1+j*0.1+i*0.1 propertyName:kAVBasicAniBounds values:horizontalBoundsValues keyTimes:boundsKeyTime];
            CAKeyframeAnimation *horizontalMaskMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:0.5 withBeginTime:beginTime+j*0.1+i*0.1 propertyName:kAVBasicAniPosition path:(CGMutablePathRef)movePathH.CGPath];
            CAKeyframeAnimation *verticalLineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.5 withBeginTime:beginTime+1+j*0.1+i*0.1 propertyName:kAVBasicAniBounds values:vertialBoundsValues keyTimes:boundsKeyTime];
            CAKeyframeAnimation *verticalMaskMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:0.5 withBeginTime:beginTime+j*0.1+i*0.1 propertyName:kAVBasicAniPosition path:(CGMutablePathRef)movePathV.CGPath];
            
            [horizontalMaskLayer addAnimation:horizontalMaskMoveAni forKey:nil];
            [horizontalLineLayer addAnimation:horizontalLineBoundsAni forKey:nil];
            [verticalMaskLayer addAnimation:verticalMaskMoveAni forKey:nil];
            [verticalLineLayer addAnimation:verticalLineBoundsAni forKey:nil];
        }
    }
}

- (void)beginTenSlantedLineAnimation
{
    CGFloat lineHeight = 1.0;
    CGFloat lineSpace = 30.0;
    CGFloat duration = 0.5f;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    for (int i = 0; i < 10; i++) {
        UIBezierPath *movePath = [UIBezierPath bezierPath];
        [movePath moveToPoint:CGPointMake(0, kAVWindowHeight/3+i*lineSpace)];
        [movePath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight/6+i*lineSpace)];
        CAShapeLayer *pathLayer = [CAShapeLayer layer];
        pathLayer.path = movePath.CGPath;
        pathLayer.fillColor = [UIColor clearColor].CGColor;
        pathLayer.strokeColor = [UIColor whiteColor].CGColor;
        pathLayer.lineWidth = lineHeight;
        [_homeLayer addSublayer:pathLayer];
        NSNumber *fromeValue = @0;
        NSNumber *toValue = @1;
        CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:i*0.1 fromValue:fromeValue toValue:toValue propertyName:@"strokeEnd"];
        
        CABasicAnimation *strokeStartAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:1.2+i*0.1 fromValue:fromeValue toValue:toValue propertyName:@"strokeStart"];
        
        CAAnimationGroup *lineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:2.7 withBeginTime:beginTime aniArr:@[strokeEndAni,strokeStartAni]];
        [pathLayer addAnimation:lineGroupAni forKey:nil];
    }
}

//十条横线
- (void)beginTenLineAnimation
{
    CGFloat lineHeight = 2.0;
    int count = 10;
    int center = floor(count/2);
    int space = 15;
    float lineCenterY = kAVWindowHeight/2;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.5;
    for (int i =0; i < count; i++) {
        
        AVBasicLayer *lineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, lineCenterY+(i-center)*space, 0, 0) bgColor:[UIColor whiteColor].CGColor];
        lineLayer.anchorPoint = CGPointMake(0, 0);
        [_homeLayer addSublayer:lineLayer];
        UIBezierPath *movePath = [UIBezierPath bezierPath];
        [movePath moveToPoint:CGPointMake(0, kAVWindowHeight/2+(i-center)*space)];
        [movePath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight/2+(i-center)*space)];
        NSArray *boundsKeyTime = @[
                                   [NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:1],
                                   ];
        
        NSArray *boundsValues = @[
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, 0, lineHeight)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, lineHeight)],
                                  ];
        
        CAKeyframeAnimation *lineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.5 withBeginTime:abs(i-center)*0.1 propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAKeyframeAnimation *lineMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:0.5 withBeginTime:i<=center?1+i*0.1:1+(2*center-i)*0.1 propertyName:kAVBasicAniPosition path:(CGMutablePathRef)movePath.CGPath];
        CAAnimationGroup *lineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:2 withBeginTime:beginTime aniArr:@[lineBoundsAni,lineMoveAni]];
        
        [lineLayer addAnimation:lineGroupAni forKey:@"lineBoundsKey"];
    }
    
}

- (void)beginAcrossLineAnimation
{
    
    CGFloat offsetX = 50.0;
    CGFloat lineWith  = 100.0;
    CGFloat lineHeight = 2.0;
    CGFloat slope = 1.0;//斜率
    CGFloat constant = 430.0;//常数
    CGFloat sideLength = (50*sqrtf(2));//边长
    CGFloat space = (kAVWindowWidth - offsetX*2-sideLength)/2;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.5;
    
    for (int i = 0; i<3; i++) {
        
        UIBezierPath *movePath = [UIBezierPath bezierPath];
        [movePath moveToPoint:CGPointMake(offsetX+i*space, slope*offsetX+constant)];
        [movePath addLineToPoint:CGPointMake(offsetX+sideLength+(i*space), slope*(offsetX+sideLength)+constant)];
        
        UIBezierPath *movePath1 = [UIBezierPath bezierPath];
        [movePath1 moveToPoint:CGPointMake(offsetX+(i*space), slope*(offsetX+sideLength)+constant)];
        [movePath1 addLineToPoint:CGPointMake(offsetX+sideLength+(i*space), slope*offsetX+constant)];
        
        AVBasicLayer *plusLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(offsetX+i*space, kAVWindowHeight-offsetX-lineHeight, lineWith, lineHeight) bgColor:[UIColor whiteColor].CGColor];
        plusLineLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        plusLineLayer.anchorPoint = CGPointMake(1.0, 0.5);
        [_homeLayer addSublayer:plusLineLayer];
        
        AVBasicLayer *negativeLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(offsetX+i*space, kAVWindowHeight-offsetX-lineHeight, lineWith, lineHeight) bgColor:[UIColor whiteColor].CGColor];
        negativeLineLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
        negativeLineLayer.anchorPoint = CGPointMake(1.0, 0.5);
        [_homeLayer addSublayer:negativeLineLayer];
        
        NSArray *boundsKeyTime = @[
                                   [NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.01],
                                   [NSNumber numberWithFloat:0.3],
                                   [NSNumber numberWithFloat:0.7],
                                   [NSNumber numberWithFloat:1],
                                   ];
        
        NSArray *boundsValues = @[
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, 0, lineHeight)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, lineWith*0.5, lineHeight)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, lineWith, lineHeight)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, lineWith, lineHeight)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, 0, lineHeight)],
                                  ];
        
        CAKeyframeAnimation *plusBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1.5 withBeginTime:i*0.2 propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAKeyframeAnimation *plusMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:0.5 withBeginTime:i*0.2 propertyName:@"position" path:(CGMutablePathRef)movePath.CGPath];
        CAAnimationGroup *plusLinAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2.5 withBeginTime:beginTime+0.5 aniArr: @[plusMoveAni,plusBoundsAni]];
        [plusLineLayer addAnimation:plusLinAniGroup forKey:@"plusLineAniKey"];
        
        CAKeyframeAnimation *negativeBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1.5 withBeginTime:i*0.2+0.3 propertyName:kAVBasicAniBounds values:boundsValues keyTimes:boundsKeyTime];
        CAKeyframeAnimation *negativeMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframePath:0.5 withBeginTime:i*0.2+0.3 propertyName:@"position" path:(CGMutablePathRef)movePath1.CGPath];
        CAAnimationGroup *negativeLinAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2.5 withBeginTime:beginTime+0.5 aniArr: @[negativeMoveAni,negativeBoundsAni]];
        [negativeLineLayer addAnimation:negativeLinAniGroup forKey:@"negativeLineAniKey"];
    }
}

- (void)beginAnimationStanSpring
{

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"backImage"]];
    [_homeLayer addSublayer:currentLayer];
    
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.5;
    
    CGFloat duration = 2.0f;
//
//    UIImage *pendantImage = [UIImage imageNamed:@"christmasPendant"];
//    AVBasicLayer *pendantLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, pendantImage.size.width, pendantImage.size.height) withImage:pendantImage];
//    [currentLayer addSublayer:pendantLayer];
//    pendantLayer.anchorPoint = CGPointMake(0.0, 0.0);
//    CGPoint startCenterPoint = CGPointMake(0, -pendantImage.size.height);
//    
//    CGPoint endCenterPoint = CGPointMake(0, -40);
//    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
//                                                                               withBeginTime:beginTime
//                                                                                   fromValue:startCenterPoint
//                                                                                     toValue:endCenterPoint
//                                                                                        mass:8];
//    [pendantLayer addAnimation:moveCenter1 forKey:nil];
    
    UIImage *treeImage = [UIImage imageNamed:@"tree"];
    UIImage *giftBlueImage = [UIImage imageNamed:@"gift_blue"];
    UIImage *fruitImage = [UIImage imageNamed:@"fruit"];
    UIImage *giftRedImage = [UIImage imageNamed:@"gift_red"];
    UIImage *santaClausImage = [UIImage imageNamed:@"santaClaus"];
    UIImage *flowerImage = [UIImage imageNamed:@"flower"];
    UIImage *infomationImage = [UIImage imageNamed:@"infomationBack"];
    float leftX = kLeftSpace;
    AVBasicLayer *treeLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(leftX, 0, treeImage.size.width, treeImage.size.height)
                                                       withImage:treeImage];
    leftX += treeImage.size.width+kLeftSpace;
    AVBasicLayer *giftBlueLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(leftX, 0, giftBlueImage.size.width, giftBlueImage.size.height)
                                                        withImage:giftBlueImage];
    
    leftX += giftBlueLayer.size.width+kLeftSpace;
    AVBasicLayer *fruitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(leftX, 0, fruitImage.size.width, fruitImage.size.height)
                                                            withImage:fruitImage];
    leftX += fruitLayer.size.width+kLeftSpace;
    AVBasicLayer *giftRedLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(leftX, 0, giftRedImage.size.width, giftRedImage.size.height)
                                                            withImage:giftRedImage];
    leftX += giftRedLayer.size.width+kLeftSpace;
    AVBasicLayer *santaClausLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(leftX, 0, santaClausImage.size.width, santaClausImage.size.height)
                                                            withImage:santaClausImage];
    AVBasicLayer *flowerLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, flowerImage.size.width, flowerImage.size.height) withImage:flowerImage];
    AVBasicLayer *infomationLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth-infomationImage.size.width)*0.5, (kAVWindowHeight-infomationImage.size.height)*0.5, infomationImage.size.width, infomationImage.size.height) withImage:infomationImage];
    
    [currentLayer addSublayer: treeLayer];
    [currentLayer addSublayer:giftBlueLayer];
    [currentLayer addSublayer:fruitLayer];
    [currentLayer addSublayer:giftRedLayer];
    [currentLayer addSublayer:santaClausLayer];
    [currentLayer addSublayer:flowerLayer];
    [currentLayer addSublayer:infomationLayer];
    
    treeLayer.anchorPoint = CGPointMake(0.0, 0.0);
    giftBlueLayer.anchorPoint = CGPointMake(0.2, 0.0);
    fruitLayer.anchorPoint = CGPointMake(0.2, 0.0);
    giftRedLayer.anchorPoint = CGPointMake(0.2, 0.0);
    santaClausLayer.anchorPoint = CGPointMake(0.2, 0.0);
    flowerLayer.anchorPoint = CGPointMake(0.0, 0.0);
    
    
    CGPoint startCenterPoint = CGPointMake(kLeftSpace, -treeImage.size.height);
    
    CGPoint endCenterPoint = CGPointMake(kLeftSpace, -kEndPointY);

    CGPoint startCenterPoint1 = CGPointMake(giftBlueLayer.frame.origin.x, -giftBlueLayer.size.height);
    
    CGPoint endCenterPoint1 = CGPointMake(giftBlueLayer.frame.origin.x, -kEndPointY);
    
    CGPoint startCenterPoint2 = CGPointMake(fruitLayer.frame.origin.x, -fruitLayer.size.height);
    
    CGPoint endCenterPoint2 = CGPointMake(fruitLayer.frame.origin.x, -kEndPointY);
    
    CGPoint startCenterPoint3 = CGPointMake(giftRedLayer.frame.origin.x, -giftRedLayer.size.height);
    
    CGPoint endCenterPoint3 = CGPointMake(giftRedLayer.frame.origin.x, -kEndPointY);
    
    CGPoint startCenterPoint4 = CGPointMake(santaClausLayer.frame.origin.x, -santaClausLayer.size.height);
    
    CGPoint endCenterPoint4 = CGPointMake(santaClausLayer.frame.origin.x, -kEndPointY);
    
    CGPoint startCenterPoint5 = CGPointMake((kAVWindowWidth-flowerLayer.size.width)*0.5, kAVWindowHeight);
    
    CGPoint endCenterPoint5 = CGPointMake((kAVWindowWidth-flowerLayer.size.width)*0.5, kAVWindowHeight-flowerLayer.size.height);


    JNWSpringAnimation *boundAni = [JNWSpringAnimation animationWithKeyPath:@"transform"];
    
    boundAni.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 1.0)];
        
    boundAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];

    boundAni.removedOnCompletion=NO;
    boundAni.fillMode=kCAFillModeBoth;
    boundAni.autoreverses=NO;
    boundAni.beginTime = beginTime+2;
    boundAni.mass = 8;
    
    boundAni.damping = 40;

    
    [infomationLayer addAnimation:boundAni forKey:@"sd"];
    
    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime
                                                                                   fromValue:startCenterPoint
                                                                                     toValue:endCenterPoint
                                                                                        mass:8];
    CAKeyframeAnimation *moveCenter2 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime+0.3
                                                                                   fromValue:startCenterPoint1
                                                                                     toValue:endCenterPoint1
                                                                                        mass:8];
    CAKeyframeAnimation *moveCenter3 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime+0.6
                                                                                   fromValue:startCenterPoint2
                                                                                     toValue:endCenterPoint2
                                                                                        mass:8];
    CAKeyframeAnimation *moveCenter4 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime+0.9
                                                                                   fromValue:startCenterPoint3
                                                                                     toValue:endCenterPoint3
                                                                                        mass:8];
    CAKeyframeAnimation *moveCenter5 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime+1.2
                                                                                   fromValue:startCenterPoint4
                                                                                     toValue:endCenterPoint4
                                                                                        mass:8];
    CAKeyframeAnimation *moveCenter6 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime+1.5
                                                                                   fromValue:startCenterPoint5
                                                                                     toValue:endCenterPoint5
                                                                                        mass:8];

    [treeLayer addAnimation:moveCenter1 forKey:nil];
    [giftBlueLayer addAnimation:moveCenter2 forKey:nil];
    [fruitLayer addAnimation:moveCenter3 forKey:nil];
    [giftRedLayer addAnimation:moveCenter4 forKey:nil];
    [santaClausLayer addAnimation:moveCenter5 forKey:nil];
    [flowerLayer addAnimation:moveCenter6 forKey:nil];
}


float interpolate (float from, float to, float time)
{
    return (to - from) * time + from;
}

- (id)interpolateFromValue:(id)fromVaule toValue:(id)toVaule time:(float)time
{
    if ([fromVaule isKindOfClass:[NSValue class]])
    {
        const char *type = [fromVaule objCType];
        if (strcmp(type, @encode(CGPoint))==0)
        {
            CGPoint from = [fromVaule CGPointValue];
            CGPoint to = [toVaule CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
        }
    }
    return (time < 0.5)?fromVaule:toVaule;
}

- (void)animate
{
    self.imageView.center = CGPointMake(150, 32);
    NSValue *fromeVaule = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    NSValue *toVaule = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    CFTimeInterval duration = 1.0;
    NSInteger numFrames = duration * 60;
    NSMutableArray *frames = [NSMutableArray array];
    for (int i = 0; i < numFrames; i++) {
        float time = 1/(float)numFrames * i;
        [frames addObject:[self interpolateFromValue:fromeVaule toValue:toVaule time:time]];
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate = self;
    animation.values = frames;
    [self.imageView.layer addAnimation:animation forKey:nil];

    
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGFloat x = [pan translationInView:self.view].x;
    x /= 200;
    CFTimeInterval timeOffset = self.shipLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset-x));
    self.shipLayer.timeOffset = timeOffset;
    [pan setTranslation:CGPointZero inView:self.view];
}

- (void)start
{
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation";
//    animation.duration = 2.0;
//    animation.byValue = @(M_PI *2);
//    animation.delegate = self;
//    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    
//    CATransform3D perspective = CATransform3DIdentity;
//    perspective.m34 = -1.0/500.0;
//    self.view.layer.sublayerTransform = perspective;
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation.y";
//    animation.toValue = @(-M_PI_2);
//    animation.duration = 2.0;
//    animation.repeatDuration = INFINITY;
//    animation.autoreverses = YES;
//    [self.shipLayer addAnimation:animation forKey:nil];
    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"backgroundColor";
//    animation.duration = 2.0;
//    animation.values = @[(__bridge id) [UIColor blueColor].CGColor,
//                         (__bridge id) [UIColor redColor].CGColor,
//                         (__bridge id) [UIColor yellowColor].CGColor,
//                         (__bridge id) [UIColor blackColor].CGColor];
//    CAMediaTimingFunction *fun = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.timingFunctions = @[fun,fun,fun];
//    [self.colorLayer addAnimation:animation forKey:nil];
    
    [self animate];
    

}

- (void)stop
{
    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"The animation stopped (finished%@)",flag?@"YES":NO);
}

- (void)changeColor:(id)sender
{
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"backgroundColor";
//    animation.duration = 2.0;
//    animation.values = @[
//                         (__bridge id)[UIColor blueColor].CGColor,
//                         (__bridge id)[UIColor redColor].CGColor,
//                         (__bridge id)[UIColor greenColor].CGColor,
//                         (__bridge id)[UIColor blueColor].CGColor ];
//    [self.colorLayer addAnimation:animation forKey:nil];
//    CGFloat red = arc4random()/(CGFloat)INT_MAX;
//    CGFloat green = arc4random()/(CGFloat)INT_MAX;
//    CGFloat blue = arc4random()/(CGFloat)INT_MAX;
//    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath =  @"backgroundColor";
//    animation.fromValue = (__bridge id)self.colorLayer.backgroundColor;
//    animation.toValue = (__bridge id)color.CGColor;
//    self.colorLayer.backgroundColor = color.CGColor;
//    [self.colorLayer addAnimation:animation forKey:nil];
    
    
//    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
//    [bezierPath moveToPoint:CGPointMake(0, 150)];
//    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
//    CAShapeLayer *pathLayer = [CAShapeLayer layer];
//    pathLayer.path = bezierPath.CGPath;
//    pathLayer.fillColor = [UIColor clearColor].CGColor;
//    pathLayer.strokeColor = [UIColor redColor].CGColor;
//    pathLayer.lineWidth = 3.0f;
//    [self.view.layer addSublayer:pathLayer];
//
//    CALayer *shipLayer = [CALayer layer];
//    shipLayer.frame = CGRectMake(0, 0, 64, 64);
//    shipLayer.position = CGPointMake(0, 150);
//    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"heng3.png"].CGImage;
//    [self.view.layer addSublayer:shipLayer];
//
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    animation.duration = 4.0;
//    animation.path = bezierPath.CGPath;
//    animation.rotationMode = kCAAnimationRotateAuto;
//    [shipLayer addAnimation:animation forKey:nil];
    
//    CALayer *shipLayer = [CALayer layer];
//    shipLayer.frame = CGRectMake(0, 0, 128, 128);
//    shipLayer.position = CGPointMake(150, 150);
//    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"heng3.png"].CGImage;
//    [self.view.layer addSublayer:shipLayer];
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation";
//    animation.duration = 2.0;
//    animation.byValue = @(M_PI *2);//[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI,0,0,1)];
//    [shipLayer addAnimation:animation forKey:nil];
    
    
    CATransition *transiton = [CATransition animation];
    transiton.type = kCATransitionFade;
    [_imageView.layer addAnimation:transiton forKey:nil];
    UIImage *currentImage = _imageView.image;
    NSUInteger index = [_imageArr indexOfObject:currentImage];
    index = (index + 1) % [_imageArr count];
    _imageView.image = _imageArr[index];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//3D轮播
- (void)goodsShowAnimation2
{
    NSArray *imageList = [NSArray arrayWithObjects:[UIImage imageNamed:@"0.png"],
                          [UIImage imageNamed:@"1.png"],
                          [UIImage imageNamed:@"2.png"],
                          [UIImage imageNamed:@"3.png"],
                          [UIImage imageNamed:@"z0.png"],
                          [UIImage imageNamed:@"z1.png"],
                          [UIImage imageNamed:@"z2.png"],
                          [UIImage imageNamed:@"z3.png"],
                          [UIImage imageNamed:@"0.png"],
                          [UIImage imageNamed:@"1.png"],
                          [UIImage imageNamed:@"2.png"],
                          [UIImage imageNamed:@"3.png"],
                          [UIImage imageNamed:@"z0.png"],
                          [UIImage imageNamed:@"z1.png"],
                          [UIImage imageNamed:@"z2.png"],
                          [UIImage imageNamed:@"z3.png"],nil];
    //图片模糊化处理
    NSMutableArray *blurImageList = [[NSMutableArray alloc] init];
    for (UIImage *image in imageList) {
        UIImage *blurImage = [self boxblurImage:image withBlurNumber:0.5];
        [blurImageList addObject:blurImage];
    }
    
    CGFloat imageWidth      = kAVWindowWidth-200;  //展示图片的宽
    CGFloat beforeZPosition = 0;                   //前面展示图片的z轴距离
    CGFloat behindZPosition = -300;                //后面图片的z轴距离
    CGFloat beforeOpacity   = 1;                   //前面展示图片的透明度
    CGFloat behindOpacity   = 0.5;                 //后面图片的透明度
    CGFloat offsetX         = 200;                 //后面图片偏移量
    CGFloat showTime        = 2;                   //前面图片展示时间
    CGFloat moveTime        = 0.6;                 //图片由前到后的运动时间
    CGFloat waitTimeScale   = (showTime + moveTime)*0.5; //动画等待时间比
    
    CATransformLayer *transContainerLayer = [CATransformLayer layer];
    transContainerLayer.frame = self.homeLayer.bounds;
    [self.homeLayer addSublayer:transContainerLayer];
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/1000.0;
    transform = CATransform3DRotate(transform, 0, 0, 0, 0);
    transContainerLayer.transform = transform;
    
    CFTimeInterval beginTime = [transContainerLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval duration = (showTime + moveTime)*3;
    CGFloat        perDuration = 1/duration;
    CGFloat        showPerDuration = showTime*perDuration;
    CGFloat        movePerDuration = moveTime*perDuration;
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:showPerDuration],
                         [NSNumber numberWithFloat:showPerDuration+movePerDuration],
                         [NSNumber numberWithFloat:2*showPerDuration+movePerDuration],
                         [NSNumber numberWithFloat:2*(showPerDuration+movePerDuration)],
                         [NSNumber numberWithFloat:3*showPerDuration+2*movePerDuration],
                         [NSNumber numberWithFloat:3*(showPerDuration+movePerDuration)],
                         ];
    
    NSArray *positionValues = @[
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                      transContainerLayer.position.y)],
                                [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                      transContainerLayer.position.y)],
                                ];
    
    NSArray *translateValues = @[
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(beforeZPosition),
                                 @(beforeZPosition),
                                 @(behindZPosition),
                                 ];
    
    NSArray *opactiyValues = @[
                               @(behindOpacity),
                               @(behindOpacity),
                               @(behindOpacity),
                               @(behindOpacity),
                               @(beforeOpacity),
                               @(beforeOpacity),
                               @(behindOpacity),
                               ];
    
    //背景变化
    NSMutableArray *blurImageKeyTime = [NSMutableArray array];
    NSMutableArray *blureImageValue = [NSMutableArray array];
    CGFloat arithmetic = 1.0/((showTime + moveTime)*blurImageList.count);
    CGFloat index1 = 0;
    CGFloat index2 = showTime*arithmetic;
    for (int i = 0; i < blurImageList.count; i++) {
        [blurImageKeyTime addObject:[NSNumber numberWithFloat:index1]];
        [blurImageKeyTime addObject:[NSNumber numberWithFloat:index2]];
        index1 = index1 + (showTime + moveTime)*arithmetic;
        index2 = index2 + (showTime + moveTime)*arithmetic;
        UIImage *image = blurImageList[i];
        [blureImageValue addObject:(__bridge id)image.CGImage];
        [blureImageValue addObject:(__bridge id)image.CGImage];
    }
    CAKeyframeAnimation *contentsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:(showTime + moveTime)*blurImageList.count
                                                                               withBeginTime:beginTime
                                                                                propertyName:@"contents"
                                                                                      values:blureImageValue
                                                                                    keyTimes:blurImageKeyTime];
    [self.homeLayer addAnimation:contentsAni forKey:nil];
    
    for (int i = 0; i < imageList.count; i++) {
        if (i == 0) {
            CALayer *firstLayer = [CALayer layer];
            firstLayer.frame = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            firstLayer.position = CGPointMake(transContainerLayer.position.x, transContainerLayer.position.y);
            firstLayer.opacity = beforeOpacity;
            firstLayer.zPosition = beforeZPosition;
            UIImage *firstImage = imageList[0];
            firstLayer.contents = (__bridge id)firstImage.CGImage;
            [transContainerLayer addSublayer:firstLayer];
            CFTimeInterval firstDuration = 2*showTime+moveTime;
            CGFloat        firstPerDuration = 1/firstDuration;
            CGFloat        firstShowPerDuration = showTime*firstPerDuration;
            CGFloat        firstMovePerDuration = moveTime*firstPerDuration;
            
            NSArray *firstKeyTime = @[
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:firstShowPerDuration],
                                      [NSNumber numberWithFloat:firstShowPerDuration+firstMovePerDuration],
                                      [NSNumber numberWithFloat:2*firstShowPerDuration+firstMovePerDuration],
                                      ];
            
            NSArray *firstPositionValues = @[
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                   transContainerLayer.position.y)],
                                             ];
            
            NSArray *firstTranslateValues = @[
                                              @(beforeZPosition),
                                              @(beforeZPosition),
                                              @(behindZPosition),
                                              @(behindZPosition),
                                              ];
            
            NSArray *firstOpactiyValues = @[
                                            @(beforeOpacity),
                                            @(beforeOpacity),
                                            @(behindOpacity),
                                            @(behindOpacity),
                                            ];
            
            CAKeyframeAnimation *firstPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                            withBeginTime:0
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:firstPositionValues
                                                                                                 keyTimes:firstKeyTime];
            CAKeyframeAnimation *firstTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                             withBeginTime:0
                                                                                              propertyName:@"zPosition"
                                                                                                    values:firstTranslateValues
                                                                                                  keyTimes:firstKeyTime];
            CAKeyframeAnimation *firstOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                           withBeginTime:0
                                                                                            propertyName:@"opacity"
                                                                                                  values:firstOpactiyValues
                                                                                                keyTimes:firstKeyTime];
            
            CAAnimationGroup *firstGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:firstDuration
                                                                                withBeginTime:beginTime
                                                                                       aniArr:@[firstOpactiyAni,
                                                                                                firstTranslateAni,
                                                                                                firstPositionAni]];
            [firstLayer addAnimation:firstGroupAni forKey:nil];
            
        }
        else if (i == 1)
        {
            CALayer  *secondLayer = [CALayer layer];
            secondLayer.frame     = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            secondLayer.position  = CGPointMake(transContainerLayer.position.x+offsetX, transContainerLayer.position.y);
            secondLayer.opacity   = behindOpacity;
            secondLayer.zPosition = behindZPosition;
            UIImage *thirdImage   = imageList[1];
            secondLayer.contents  = (__bridge id)thirdImage.CGImage;
            [transContainerLayer addSublayer:secondLayer];
            CFTimeInterval secondDuration = 3*showTime+2*moveTime;
            CGFloat seconPerDuration      = 1/secondDuration;
            CGFloat seconShowPerDuration  = showTime*seconPerDuration;
            CGFloat seconMovePerDuration  = moveTime*seconPerDuration;
            
            NSArray *secondKeyTime = @[
                                       [NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:seconShowPerDuration],
                                       [NSNumber numberWithFloat:seconShowPerDuration+seconMovePerDuration],
                                       [NSNumber numberWithFloat:2*seconShowPerDuration+seconMovePerDuration],
                                       [NSNumber numberWithFloat:2*(seconShowPerDuration+seconMovePerDuration)],
                                       [NSNumber numberWithFloat:3*seconShowPerDuration+2*seconMovePerDuration],
                                       ];
            
            NSArray *secondPositionValues = @[
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                    transContainerLayer.position.y)],
                                              [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                    transContainerLayer.position.y)],
                                              ];
            
            NSArray *secondTranslateValues = @[
                                               @(behindZPosition),
                                               @(behindZPosition),
                                               @(beforeZPosition),
                                               @(beforeZPosition),
                                               @(behindZPosition),
                                               @(behindZPosition),
                                               ];
            
            NSArray *secondOpactiyValues = @[
                                             @(behindOpacity),
                                             @(behindOpacity),
                                             @(beforeOpacity),
                                             @(beforeOpacity),
                                             @(behindOpacity),
                                             @(behindOpacity),
                                             ];
            
            CAKeyframeAnimation *secondPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                             withBeginTime:0
                                                                                              propertyName:kAVBasicAniPosition
                                                                                                    values:secondPositionValues
                                                                                                  keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                              withBeginTime:0
                                                                                               propertyName:@"zPosition"
                                                                                                     values:secondTranslateValues
                                                                                                   keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                            withBeginTime:0
                                                                                             propertyName:@"opacity"
                                                                                                   values:secondOpactiyValues
                                                                                                 keyTimes:secondKeyTime];
            CAAnimationGroup *secondGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:secondDuration
                                                                                 withBeginTime:beginTime
                                                                                        aniArr:@[secondPositionAni,
                                                                                                 secondTranslateAni,
                                                                                                 secondOpactiyAni,
                                                                                                 ]];
            [secondLayer addAnimation:secondGroupAni forKey:nil];
        }
        else if (i == imageList.count - 1)
        {
            CALayer  *lastLayer = [CALayer layer];
            lastLayer.frame     = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            lastLayer.position  = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            lastLayer.opacity   = behindOpacity;
            lastLayer.zPosition = behindZPosition;
            UIImage *lastImage   = imageList[i];
            lastLayer.contents  = (__bridge id)lastImage.CGImage;
            [transContainerLayer addSublayer:lastLayer];
            CFTimeInterval lastDuration = 2*showTime+2*moveTime;
            CGFloat lastPerDuration      = 1/lastDuration;
            CGFloat lastShowPerDuration  = showTime*lastPerDuration;
            CGFloat lastMovePerDuration  = moveTime*lastPerDuration;
            
            NSArray *lastKeyTime = @[
                                     [NSNumber numberWithFloat:0],
                                     [NSNumber numberWithFloat:lastShowPerDuration],
                                     [NSNumber numberWithFloat:lastShowPerDuration+lastMovePerDuration],
                                     [NSNumber numberWithFloat:2*lastShowPerDuration+lastMovePerDuration],
                                     [NSNumber numberWithFloat:2*(lastShowPerDuration+lastMovePerDuration)],
                                     ];
            
            NSArray *lastPositionValues = @[
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x+offsetX,
                                                                                  transContainerLayer.position.y)],
                                            [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                  transContainerLayer.position.y)],
                                            ];
            
            NSArray *lastTranslateValues = @[
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(beforeZPosition),
                                             ];
            
            NSArray *lastOpactiyValues = @[
                                           @(behindOpacity),
                                           @(behindOpacity),
                                           @(behindOpacity),
                                           @(behindOpacity),
                                           @(beforeOpacity),
                                           ];
            
            CAKeyframeAnimation *lastPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:kAVBasicAniPosition
                                                                                                  values:lastPositionValues
                                                                                                keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:@"zPosition"
                                                                                                   values:lastTranslateValues
                                                                                                 keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                          withBeginTime:waitTimeScale*(i-2)
                                                                                           propertyName:@"opacity"
                                                                                                 values:lastOpactiyValues
                                                                                               keyTimes:lastKeyTime];
            CAAnimationGroup *lastGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:lastDuration+waitTimeScale*(i-2)
                                                                               withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                      aniArr:@[lastPositionAni,
                                                                                               lastTranslateAni,
                                                                                               lastOpactiyAni,
                                                                                               ]];
            [lastLayer addAnimation:lastGroupAni forKey:nil];
            
        }
        else
        {
            CALayer *thirdLayer = [CALayer layer];
            thirdLayer.frame = (CGRect){CGPointZero,CGSizeMake(imageWidth, imageWidth)};
            thirdLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            thirdLayer.opacity = behindOpacity;
            thirdLayer.zPosition = behindZPosition;
            UIImage *thirdImage = imageList[i];
            thirdLayer.contents = (__bridge id)thirdImage.CGImage;
            [transContainerLayer addSublayer:thirdLayer];
            
            CAKeyframeAnimation *thirdPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:positionValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *thirdTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                             withBeginTime:waitTimeScale*(i-2)
                                                                                              propertyName:@"zPosition"
                                                                                                    values:translateValues
                                                                                                  keyTimes:keyTime];
            CAKeyframeAnimation *thirdOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:@"opacity"
                                                                                                  values:opactiyValues
                                                                                                keyTimes:keyTime];
            CAAnimationGroup *thirdGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration+waitTimeScale*(i-2)
                                                                                withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                       aniArr:@[thirdPositionAni,
                                                                                                thirdTranslateAni,
                                                                                                thirdOpactiyAni,
                                                                                                ]];
            [thirdLayer addAnimation:thirdGroupAni forKey:nil];
            
        }
        
    }
}
@end
