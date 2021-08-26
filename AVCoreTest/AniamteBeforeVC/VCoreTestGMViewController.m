//
//  VCoreTestGMViewController.m
//  AVCoreTest
//
//  Created by gemin on 2017/6/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCoreTestGMViewController.h"
#import "AVFundation.h"
#import "AVBasicTextLayer.h"
#import "NSString+AVCore.h"

#define ktrans3DTitleFontValue 25
#define ktrans3DTitleFont [UIFont fontWithName:@"SnellRoundhand-Bold" size:ktrans3DTitleFontValue]
#define kTrans3DSceneTextInterval 6 //文字间隙


@interface VCoreTestGMViewController ()

@property (nonatomic, strong) CALayer *homeLayer;

@end

@implementation VCoreTestGMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    
    _homeLayer = [CALayer layer];
    _homeLayer.frame = CGRectMake( 0, 100, kAVWindowWidth, kAVWindowWidth);
    
    CGFloat scaleValue = self.view.frame.size.width/kAVWindowWidth;
    
    [_homeLayer setValue:[NSNumber numberWithFloat:scaleValue] forKeyPath:@"transform.scale"];
    
    _homeLayer.position =  self.view.center;
    
    [self.view.layer addSublayer: _homeLayer];
    
    CGRect  titleFrame  = (CGRect){CGPointZero,CGSizeMake(kAVWindowWidth - 200, kAVWindowWidth - 200)};
    
    CALayer *titleLayer = [self trans3DSceneTitleAniWithFrame:titleFrame title:@"水电费建设路口的老实交代发大水了历史课电视剧开发部"];
    
    [_homeLayer addSublayer:titleLayer];
    
    CALayer *diamondLayer = [self diamondBackLayerWithFrame:CGRectMake(100, 100, 40, 10)];
    [self.view.layer addSublayer:diamondLayer];
    
//    [self goodsShowAnimation];
//    [self beginStartText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CALayer *)diamondBackLayerWithFrame:(CGRect)frame
{
    CALayer *backLayer = [CALayer layer];
    backLayer.backgroundColor = [UIColor clearColor].CGColor;
    backLayer.frame = frame;
    
    for (int i = 0; i < 3; i++)
    {
        CALayer *diamonLayer = [CALayer layer];
        diamonLayer.frame = (CGRect){CGPointZero,CGSizeMake(3, 3)};
        diamonLayer.position = CGPointMake(backLayer.position.x+(-10)*i, backLayer.position.y);
        diamonLayer.backgroundColor = [UIColor whiteColor].CGColor;
        CATransform3D transRotate = CATransform3DIdentity;
        transRotate = CATransform3DRotate(transRotate, M_PI/4, 0, 0, 1);
        diamonLayer.transform = transRotate;
        [backLayer addSublayer:diamonLayer];
    }
    
    return backLayer;
}

//标题Layer
- (CALayer *)trans3DSceneTitleAniWithFrame:(CGRect)frame
                                     title:(NSString *)title
{
    AVBasicLayer *shadowLayer = [[AVBasicLayer alloc] initWithFrame:frame
                                                            bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
    
    CGSize broadSize = [title textBroadSizeWithFont:ktrans3DTitleFont
                                            maxSize:CGSizeMake(kAVWindowWidth-200, MAXFLOAT)
                                           interval:kTrans3DSceneTextInterval
                                     isDefluatWidth:YES];
    
    //文字背景layer 高度加20是4条线的高度
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+20)];
    bgLayer.position = CGPointMake(shadowLayer.width/2, shadowLayer.height/2);
    [shadowLayer addSublayer:bgLayer];
    
    //上面第二条线
    {
        CALayer *diamondLayer = [self diamondBackLayerWithFrame:CGRectMake(0, 0, 40, 10)];
        diamondLayer.position = CGPointMake(bgLayer.position.x+10, 6);
        [bgLayer addSublayer:diamondLayer];

        UIBezierPath *leftLinePath = [UIBezierPath bezierPath];
        [leftLinePath moveToPoint:CGPointMake(0, 6)];
        [leftLinePath addLineToPoint:CGPointMake(bgLayer.width*0.5 - 20, 6)];
        CAShapeLayer *leftLineLayer = [CAShapeLayer layer];
        leftLineLayer.path = leftLinePath.CGPath;
        leftLineLayer.fillColor = [UIColor clearColor].CGColor;
        leftLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        leftLineLayer.lineWidth = 1;
        [bgLayer addSublayer:leftLineLayer];
        
        UIBezierPath *rightLinePath = [UIBezierPath bezierPath];
        [rightLinePath moveToPoint:CGPointMake(bgLayer.width*0.5+20, 6)];
        [rightLinePath addLineToPoint:CGPointMake(bgLayer.width, 6)];
        CAShapeLayer *rightLineLayer = [CAShapeLayer layer];
        rightLineLayer.path = rightLinePath.CGPath;
        rightLineLayer.fillColor = [UIColor clearColor].CGColor;
        rightLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        rightLineLayer.lineWidth = 1;
        [bgLayer addSublayer:rightLineLayer];

    }
    
    //字体layer
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0,
                                                                                     0,
                                                                                     broadSize.width-2*kTrans3DSceneTextInterval,
                                                                                     broadSize.height-2*kTrans3DSceneTextInterval)
                                                                  intText:title
                                                                 textFont:ktrans3DTitleFont
                                                                textColor:[UIColor whiteColor]];
    textLayer.position = CGPointMake(bgLayer.width/2,
                                     bgLayer.height/2+(ktrans3DTitleFontValue*kTextFontOffsetFactor2)+kTrans3DSceneTextInterval/2);
    [bgLayer addSublayer:textLayer];
    
    //下面第一条线
    {
        UIBezierPath *oneBottomLinePath = [UIBezierPath bezierPath];
        [oneBottomLinePath moveToPoint:CGPointMake(0, bgLayer.height-6)];
        [oneBottomLinePath addLineToPoint:CGPointMake(bgLayer.width, bgLayer.height-6)];
        CAShapeLayer *oneBottomLineLayer = [CAShapeLayer layer];
        oneBottomLineLayer.path = oneBottomLinePath.CGPath;
        oneBottomLineLayer.fillColor = [UIColor clearColor].CGColor;
        oneBottomLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        oneBottomLineLayer.lineWidth = 1;
        [bgLayer addSublayer:oneBottomLineLayer];
    }
    
    return shadowLayer;
}

//3D轮播
- (void)goodsShowAnimation
{
    NSArray *imageList = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"0.png"],
                          [UIImage imageNamed:@"1.png"],
                          [UIImage imageNamed:@"2.png"],
                          [UIImage imageNamed:@"3.png"],
                          [UIImage imageNamed:@"z0.png"],
                          [UIImage imageNamed:@"z1.png"],
                          [UIImage imageNamed:@"z2.png"],
                          [UIImage imageNamed:@"z3.png"],nil];


    CGFloat beforeImageWidth  = kAVWindowWidth-250;  //展示图片的宽
    CGFloat beforeImageHeight = kAVWindowWidth - 100;
    CGFloat beforeZPosition = 100;                   //前面展示图片的z轴距离
    CGFloat behindZPosition = -300;                //后面图片的z轴距离
    CGFloat offsetX         = 150;                 //后面图片偏移量
    CGFloat showTime        = 2;                   //前面图片展示时间
    CGFloat moveTime        = 0.6;                 //图片由前到后的运动时间
    CGFloat waitTimeScale   = (showTime + moveTime)*0.5; //动画等待时间比
    CGFloat dismissOpacity  = 0;
    CGFloat showOpacity     = 1;
    
    CATransform3D center3DValue      = CATransform3DIdentity;
    center3DValue.m34                = 1.0/ -500;
    CATransform3D centerScaleToValue = CATransform3DIdentity;
    centerScaleToValue               = CATransform3DScale(center3DValue, 1, 1, 1);
    center3DValue                    = CATransform3DRotate(centerScaleToValue, 0, 0, 1, 0);

    CATransform3D left3DValue      = CATransform3DIdentity;
    left3DValue.m34                = 1.0/ -500;
    CATransform3D leftScaleToValue = CATransform3DIdentity;
    leftScaleToValue               = CATransform3DScale(left3DValue, 0.6, 0.6, 1);
    left3DValue                    = CATransform3DRotate(leftScaleToValue, M_PI/6, 0, 1, 0);
    
    CATransform3D right3DValue      = CATransform3DIdentity;
    right3DValue.m34                = 1.0/ -500;
    CATransform3D rightScaleToValue = CATransform3DIdentity;
    rightScaleToValue               = CATransform3DScale(right3DValue, 0.6, 0.6, 1);
    right3DValue                    = CATransform3DRotate(rightScaleToValue, -M_PI/6, 0, 1, 0);
    
    CATransformLayer *transContainerLayer = [CATransformLayer layer];
    transContainerLayer.backgroundColor = [UIColor blackColor].CGColor;
    transContainerLayer.frame = self.homeLayer.bounds;
    [self.homeLayer addSublayer:transContainerLayer];
    
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
    
    NSArray *zPositionValues = @[
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(behindZPosition),
                                 @(beforeZPosition),
                                 @(beforeZPosition),
                                 @(behindZPosition),
                                 ];
    NSArray *transformValue = @[
                              [NSValue valueWithCATransform3D:left3DValue],
                              [NSValue valueWithCATransform3D:left3DValue],
                              [NSValue valueWithCATransform3D:right3DValue],
                              [NSValue valueWithCATransform3D:right3DValue],
                              [NSValue valueWithCATransform3D:center3DValue],
                              [NSValue valueWithCATransform3D:center3DValue],
                              [NSValue valueWithCATransform3D:left3DValue],
                              ];
    
    CFTimeInterval opactiyDuration = duration+moveTime+showTime;
    CGFloat        opactiyPerDuration = 1/opactiyDuration;
    CGFloat        opactiyShowPerDuration = showTime*opactiyPerDuration;
    CGFloat        opactiyMovePerDuration = moveTime*opactiyPerDuration;
    
    
    NSArray *opactiyKeyTime = @[
                                [NSNumber numberWithFloat:0],
                                [NSNumber numberWithFloat:opactiyShowPerDuration],
                                [NSNumber numberWithFloat:opactiyShowPerDuration+opactiyMovePerDuration],
                                [NSNumber numberWithFloat:4*opactiyShowPerDuration+3*opactiyMovePerDuration],
                                [NSNumber numberWithFloat:4*(opactiyShowPerDuration+opactiyMovePerDuration)],
                                ];
    NSArray *opactiyValues = @[
                               @(dismissOpacity),
                               @(dismissOpacity),
                               @(showOpacity),
                               @(showOpacity),
                               @(dismissOpacity),
                               ];
    
    NSArray *showOpactiyValues = @[
                                 @(showOpacity),
                                 @(dismissOpacity),
                                 ];
    
    NSArray *showOpactiyKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:1],
                                  ];
    
    for (int i = 0; i < imageList.count; i++) {
        UIImage *image = imageList[i];
        if (i == 0) {
            CGRect layerFrame = (CGRect){CGPointZero,CGSizeMake(beforeImageWidth, beforeImageHeight)};
            CALayer *firstLayer = [self reflectionLayerWithFrame:layerFrame contents:(__bridge id)image.CGImage];
            firstLayer.position = CGPointMake(transContainerLayer.position.x, transContainerLayer.position.y);
            firstLayer.zPosition = beforeZPosition;
            [transContainerLayer addSublayer:firstLayer];
            
            CFTimeInterval firstDuration = showTime+moveTime;
            CGFloat        firstPerDuration = 1/firstDuration;
            CGFloat        firstShowPerDuration = showTime*firstPerDuration;
            CGFloat        firstMovePerDuration = moveTime*firstPerDuration;

            NSArray *firstKeyTime = @[
                                      [NSNumber numberWithFloat:0],
                                      [NSNumber numberWithFloat:firstShowPerDuration],
                                      [NSNumber numberWithFloat:firstShowPerDuration+firstMovePerDuration],
                                      ];

            NSArray *firstPositionValues = @[
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x,
                                                                                   transContainerLayer.position.y)],
                                             [NSValue valueWithCGPoint:CGPointMake(transContainerLayer.position.x-offsetX,
                                                                                   transContainerLayer.position.y)],
                                             ];

            NSArray *firstzPositionValues = @[
                                              @(beforeZPosition),
                                              @(beforeZPosition),
                                              @(behindZPosition),
                                              ];
            
            NSArray *firstTransformValues = @[
                                              [NSValue valueWithCATransform3D:center3DValue],
                                              [NSValue valueWithCATransform3D:center3DValue],
                                              [NSValue valueWithCATransform3D:left3DValue],
                                              ];
            
            CAKeyframeAnimation *firstPositionAni  = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                            withBeginTime:0
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:firstPositionValues
                                                                                                 keyTimes:firstKeyTime];
            CAKeyframeAnimation *firstTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                             withBeginTime:0
                                                                                              propertyName:@"zPosition"
                                                                                                    values:firstzPositionValues
                                                                                                  keyTimes:firstKeyTime];
            
            CAKeyframeAnimation *firstTransform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:firstDuration
                                                                                               withBeginTime:0
                                                                                                propertyName:@"transform"
                                                                                                      values:firstTransformValues
                                                                                                    keyTimes:firstKeyTime];
            
            CAKeyframeAnimation *firstOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveTime
                                                                                           withBeginTime:firstDuration+showTime
                                                                                            propertyName:@"opacity"
                                                                                                  values:showOpactiyValues
                                                                                                keyTimes:showOpactiyKeyTime];

            
            CAAnimationGroup *firstGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:firstDuration+showTime+moveTime
                                                                                withBeginTime:beginTime
                                                                                       aniArr:@[firstTransform3DAni,
                                                                                                firstTranslateAni,
                                                                                                firstPositionAni,
                                                                                                firstOpactiyAni,
                                                                                                ]];
            [firstLayer addAnimation:firstGroupAni forKey:nil];
            
        }
        else if (i == 1)
        {
            CGRect secondLayerFrame = (CGRect){CGPointZero,CGSizeMake(beforeImageWidth, beforeImageHeight)};
            CALayer *secondLayer = [self reflectionLayerWithFrame:secondLayerFrame contents:(__bridge id)image.CGImage];
            secondLayer.position  = CGPointMake(transContainerLayer.position.x+offsetX, transContainerLayer.position.y);
            secondLayer.zPosition = behindZPosition;
            secondLayer.transform = right3DValue;
            [transContainerLayer addSublayer:secondLayer];
            CFTimeInterval secondDuration = 2*(showTime+moveTime);
            CGFloat seconPerDuration      = 1/secondDuration;
            CGFloat seconShowPerDuration  = showTime*seconPerDuration;
            CGFloat seconMovePerDuration  = moveTime*seconPerDuration;
            
            NSArray *secondKeyTime = @[
                                       [NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:seconShowPerDuration],
                                       [NSNumber numberWithFloat:seconShowPerDuration+seconMovePerDuration],
                                       [NSNumber numberWithFloat:2*seconShowPerDuration+seconMovePerDuration],
                                       [NSNumber numberWithFloat:2*(seconShowPerDuration+seconMovePerDuration)],
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
                                              ];
            
            NSArray *secondzPositionValues = @[
                                               @(behindZPosition),
                                               @(behindZPosition),
                                               @(beforeZPosition),
                                               @(beforeZPosition),
                                               @(behindZPosition),
                                               ];
            
            NSArray *secondTransformValue = @[
                                             [NSValue valueWithCATransform3D:right3DValue],
                                             [NSValue valueWithCATransform3D:right3DValue],
                                             [NSValue valueWithCATransform3D:center3DValue],
                                             [NSValue valueWithCATransform3D:center3DValue],
                                             [NSValue valueWithCATransform3D:left3DValue],
                                             ];
            
            CAKeyframeAnimation *secondPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                             withBeginTime:0
                                                                                              propertyName:kAVBasicAniPosition
                                                                                                    values:secondPositionValues
                                                                                                  keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondTranslateAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                              withBeginTime:0
                                                                                               propertyName:@"zPosition"
                                                                                                     values:secondzPositionValues
                                                                                                   keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondTransform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:secondDuration
                                                                                               withBeginTime:0
                                                                                                propertyName:@"transform"
                                                                                                      values:secondTransformValue
                                                                                                    keyTimes:secondKeyTime];
            CAKeyframeAnimation *secondOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveTime
                                                                                           withBeginTime:secondDuration+showTime
                                                                                            propertyName:@"opacity"
                                                                                                  values:showOpactiyValues
                                                                                                keyTimes:showOpactiyKeyTime];
            CAAnimationGroup *secondGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:secondDuration+showTime+moveTime
                                                                                 withBeginTime:beginTime
                                                                                        aniArr:@[secondPositionAni,
                                                                                                 secondTranslateAni,
                                                                                                 secondTransform3DAni,
                                                                                                 secondOpactiyAni,
                                                                                                 ]];
            [secondLayer addAnimation:secondGroupAni forKey:nil];
            
        }
        else if (i == 2)
        {
            CGRect thirdLayerFrame = (CGRect){CGPointZero,CGSizeMake(beforeImageWidth, beforeImageHeight)};
            CALayer *thirdLayer = [self reflectionLayerWithFrame:thirdLayerFrame contents:(__bridge id)image.CGImage];
            thirdLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            thirdLayer.zPosition = behindZPosition;
            thirdLayer.transform = left3DValue;
            [transContainerLayer addSublayer:thirdLayer];
            
            CAKeyframeAnimation *thirdPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:0
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:positionValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *thirdzPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                             withBeginTime:0
                                                                                              propertyName:@"zPosition"
                                                                                                    values:zPositionValues
                                                                                                  keyTimes:keyTime];
            CAKeyframeAnimation *thirdOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveTime
                                                                                           withBeginTime:duration+showTime
                                                                                            propertyName:@"opacity"
                                                                                                  values:showOpactiyValues
                                                                                                keyTimes:showOpactiyKeyTime];
            CAKeyframeAnimation *thirdTransform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                               withBeginTime:0
                                                                                                propertyName:@"transform"
                                                                                                      values:transformValue
                                                                                                    keyTimes:keyTime];
            CAAnimationGroup *thirdGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration+showTime+moveTime
                                                                                withBeginTime:beginTime
                                                                                       aniArr:@[thirdPositionAni,
                                                                                                thirdzPositionAni,
                                                                                                thirdOpactiyAni,
                                                                                                thirdTransform3DAni,
                                                                                                ]];
            [thirdLayer addAnimation:thirdGroupAni forKey:nil];
        }
        else if (i == imageList.count - 1)
        {
            CGRect lastLayerFrame = (CGRect){CGPointZero,CGSizeMake(beforeImageWidth, beforeImageHeight)};
            CALayer *lastLayer = [self reflectionLayerWithFrame:lastLayerFrame contents:(__bridge id)image.CGImage];
            lastLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            lastLayer.zPosition = behindZPosition;
            lastLayer.transform = left3DValue;
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
            
            NSArray *lastZPositionValues = @[
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(behindZPosition),
                                             @(beforeZPosition),
                                             ];
            
            NSArray *lastTransformValue = @[
                                          [NSValue valueWithCATransform3D:left3DValue],
                                          [NSValue valueWithCATransform3D:left3DValue],
                                          [NSValue valueWithCATransform3D:right3DValue],
                                          [NSValue valueWithCATransform3D:right3DValue],
                                          [NSValue valueWithCATransform3D:center3DValue],
                                          ];
            CFTimeInterval lastOpacityDuration  = showTime+moveTime;
            CGFloat lastOpacityPerDuration      = 1/lastOpacityDuration;
            CGFloat lastOpacityShowPerDuration  = showTime*lastOpacityPerDuration;
            NSArray *lastOpactiyValues = @[
                                           @(dismissOpacity),
                                           @(dismissOpacity),
                                           @(showOpacity)
                                           ];
            
            NSArray *lastOpactiyKeyTime = @[
                                            [NSNumber numberWithFloat:0],
                                            [NSNumber numberWithFloat:lastOpacityShowPerDuration],
                                            [NSNumber numberWithFloat:1],
                                            ];
            
            CAKeyframeAnimation *lastPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:kAVBasicAniPosition
                                                                                                  values:lastPositionValues
                                                                                                keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastzPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:@"zPosition"
                                                                                                   values:lastZPositionValues
                                                                                                 keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastTransform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastDuration
                                                                                                withBeginTime:waitTimeScale*(i-2)
                                                                                                 propertyName:@"transform"
                                                                                                       values:lastTransformValue
                                                                                                     keyTimes:lastKeyTime];
            CAKeyframeAnimation *lastOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:lastOpacityDuration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:@"opacity"
                                                                                                  values:lastOpactiyValues
                                                                                                keyTimes:lastOpactiyKeyTime];

            CAAnimationGroup *lastGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:lastDuration+waitTimeScale*(i-2)
                                                                               withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                      aniArr:@[lastPositionAni,
                                                                                               lastzPositionAni,
                                                                                               lastTransform3DAni,
                                                                                               lastOpactiyAni,
                                                                                               ]];
            [lastLayer addAnimation:lastGroupAni forKey:nil];
            
        }
        else if (i == imageList.count - 2)
        {
            CGRect penultimateLayerFrame = (CGRect){CGPointZero,CGSizeMake(beforeImageWidth, beforeImageHeight)};
            CALayer *penultimateLayer = [self reflectionLayerWithFrame:penultimateLayerFrame contents:(__bridge id)image.CGImage];
            penultimateLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            penultimateLayer.zPosition = behindZPosition;
            penultimateLayer.transform = left3DValue;
            [transContainerLayer addSublayer:penultimateLayer];
            
            CFTimeInterval penultimateOpacityDuration  = showTime+moveTime;
            CGFloat penultimateOpacityPerDuration      = 1/penultimateOpacityDuration;
            CGFloat penultimateOpacityShowPerDuration  = showTime*penultimateOpacityPerDuration;
            NSArray *penultimateOpactiyValues = @[
                                                   @(dismissOpacity),
                                                   @(dismissOpacity),
                                                   @(showOpacity)
                                                   ];
            
            NSArray *penultimateOpactiyKeyTime = @[
                                                    [NSNumber numberWithFloat:0],
                                                    [NSNumber numberWithFloat:penultimateOpacityShowPerDuration],
                                                    [NSNumber numberWithFloat:1],
                                                    ];
            
            CAKeyframeAnimation *penultimatePositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:kAVBasicAniPosition
                                                                                                  values:positionValues
                                                                                                keyTimes:keyTime];
            CAKeyframeAnimation *penultimatezPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:@"zPosition"
                                                                                                   values:zPositionValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *penultimateTransform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                              withBeginTime:waitTimeScale*(i-2)
                                                                                               propertyName:@"transform"
                                                                                                     values:transformValue
                                                                                                   keyTimes:keyTime];
            CAKeyframeAnimation *penultimateOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:penultimateOpacityDuration
                                                                                          withBeginTime:waitTimeScale*(i-2)
                                                                                           propertyName:@"opacity"
                                                                                                 values:penultimateOpactiyValues
                                                                                               keyTimes:penultimateOpactiyKeyTime];
            
            CAAnimationGroup *penultimateGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration+waitTimeScale*(i-2)
                                                                               withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                      aniArr:@[penultimatePositionAni,
                                                                                               penultimatezPositionAni,
                                                                                               penultimateTransform3DAni,
                                                                                               penultimateOpactiyAni,
                                                                                               ]];
            [penultimateLayer addAnimation:penultimateGroupAni forKey:nil];
        }
        else
        {
            CGRect nomalLayerFrame = (CGRect){CGPointZero,CGSizeMake(beforeImageWidth, beforeImageHeight)};
            CALayer *nomalLayer = [self reflectionLayerWithFrame:nomalLayerFrame contents:(__bridge id)image.CGImage];
            nomalLayer.position = CGPointMake(transContainerLayer.position.x-offsetX, transContainerLayer.position.y);
            nomalLayer.zPosition = behindZPosition;
            nomalLayer.transform = left3DValue;
            [transContainerLayer addSublayer:nomalLayer];
            
            CAKeyframeAnimation *nomalPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                            withBeginTime:waitTimeScale*(i-2)
                                                                                             propertyName:kAVBasicAniPosition
                                                                                                   values:positionValues
                                                                                                 keyTimes:keyTime];
            CAKeyframeAnimation *nomalzPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                             withBeginTime:waitTimeScale*(i-2)
                                                                                              propertyName:@"zPosition"
                                                                                                    values:zPositionValues
                                                                                                  keyTimes:keyTime];
            CAKeyframeAnimation *nomalTransform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                                withBeginTime:waitTimeScale*(i-2)
                                                                                                 propertyName:@"transform"
                                                                                                       values:transformValue
                                                                                                     keyTimes:keyTime];
            CAKeyframeAnimation *thirdOpactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration+showTime+moveTime
                                                                                           withBeginTime:waitTimeScale*(i-2)
                                                                                            propertyName:@"opacity"
                                                                                                  values:opactiyValues
                                                                                                keyTimes:opactiyKeyTime];
            CAAnimationGroup *nomalGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:opactiyDuration+waitTimeScale*(i-2)
                                                                                withBeginTime:beginTime+waitTimeScale*(i-2)
                                                                                       aniArr:@[nomalPositionAni,
                                                                                                nomalzPositionAni,
                                                                                                nomalTransform3DAni,
                                                                                                thirdOpactiyAni,
                                                                                                ]];
            [nomalLayer addAnimation:nomalGroupAni forKey:nil];
            
        }
        
    }
}

- (CALayer *)startTextLayerWithFrame:(CGRect)frame
{
    CGFloat lineHeight  = 2.f;
    CGFloat lineCenterY = kAVWindowHeight/2;
    CGFloat lineCenterX = 100.f;
    CGFloat duration    = 0.5;
    
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = frame;
    backLayer.backgroundColor = UIColorFromRGBAlpha(0x000000, 0.4).CGColor;
    
    CFTimeInterval beginTime = [backLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    AVBasicLayer *topLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(lineCenterX, lineCenterY, 0, 0)
                                                             bgColor:[UIColor whiteColor].CGColor];
    topLineLayer.anchorPoint = CGPointMake(0, 0);
    [backLayer addSublayer:topLineLayer];
    
    AVBasicLayer *bottomLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(lineCenterX, lineCenterY, 0, 0)
                                                                bgColor:[UIColor whiteColor].CGColor];
    bottomLineLayer.anchorPoint = CGPointMake(0, 0);
    [backLayer addSublayer:bottomLineLayer];
    
    AVBasicLayer *textBackLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(lineCenterX, lineCenterY, 0, 0)
                                                                  bgColor:UIColorFromRGBAlpha(0x000000, 0.5).CGColor];
    textBackLineLayer.anchorPoint = CGPointMake(0, 0.5);
    textBackLineLayer.zPosition = -1;
    [backLayer addSublayer:textBackLineLayer];
    
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
    [backLayer addSublayer:textLayer];
    
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
    
    return backLayer;
}


- (CALayer *)reflectionLayerWithFrame:(CGRect)frame
                             contents:(id)contents
{
    CGFloat gradientHeight = 130;
    CALayer *layer = [CALayer layer];
    layer.allowsEdgeAntialiasing = YES;
    layer.frame = frame;
    
    CALayer *contentsLayer = [CALayer layer];
    contentsLayer.frame    = (CGRect){CGPointZero,CGSizeMake(layer.size.width,
                                                             layer.size.height - gradientHeight)};
    contentsLayer.contents = contents;
    contentsLayer.allowsEdgeAntialiasing = YES;
    contentsLayer.masksToBounds = YES;
    contentsLayer.cornerRadius = 8.f;
    [layer addSublayer:contentsLayer];
    
    CALayer *reflectionLayer = [CALayer layer];
    reflectionLayer.contents = contentsLayer.contents;
    reflectionLayer.frame = CGRectMake(0,
                                       contentsLayer.bottom,
                                       contentsLayer.width,
                                       layer.height - contentsLayer.height);
    reflectionLayer.opacity = 0.5;
    reflectionLayer.allowsEdgeAntialiasing = YES;
    reflectionLayer.masksToBounds = YES;
    reflectionLayer.cornerRadius = 8.f;
    [reflectionLayer setValue:[NSNumber numberWithFloat:M_PI]
                   forKeyPath:@"transform.rotation.x"];
    [layer addSublayer:reflectionLayer];

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = reflectionLayer.bounds;
    [gradientLayer setPosition:CGPointMake([reflectionLayer bounds].size.width/2,
                                           [reflectionLayer bounds].size.height/2)];
    [gradientLayer setColors:[NSArray arrayWithObjects: (id)[[UIColor clearColor] CGColor],
                              (id)[[UIColor blackColor]CGColor], nil]];
    [gradientLayer setStartPoint:CGPointMake(0.5,0.35)];
    [gradientLayer setEndPoint:CGPointMake(0.5,1.0)];
    [reflectionLayer setMask:gradientLayer];

    return layer;
}

@end
