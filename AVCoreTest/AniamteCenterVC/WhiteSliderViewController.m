//
//  WhiteSliderViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/6/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WhiteSliderViewController.h"

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


@interface WhiteSliderViewController ()

@end

@implementation WhiteSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self AVAniOneLineWhiteGridFourDirection];
//    [self AVAniOneLineWhiteGridMoveLineFromeFourDicEnd];
//    [self WhiteSliderTextScreen];
 //   [self textGradientLayer];
//    [self AVAniOneLineWhiteGridLeftDownToRightUp];
    //[self showOriginalAndWhiteFilterSceneAni];
//    [self trans3DSceneTextAni];
//    [self trans3DSceneTitleAni];
//    [self AVAniOneLineWhiteGridBothSideToCenter];
//    [self AVAniOneLineWhiteGridCenterToBothSide];
//    [self AVAniOneLineWhiteGridCenterToBothCorner];
    [self AVAniOneLineWhiteGridBothCornerToCenter];


    // Do any additional setup after loading the view from its nib.
}



#define KDefaultLineWidth 4

- (void)AVAniOneLineWhiteGridBothCornerToCenter{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 1.3;//整个动画时间
    CGFloat moveDuration = 1;

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer:nextLayer];
    
    CGFloat kSliderWidth = (kAVWindowWidth)/4;
    CGFloat intervalDuration = .1;
    CGPoint pathOnePoint = CGPointZero;
    CGPoint pathTwoPoint = CGPointZero;
    CGPoint pathThreePoint = CGPointZero;
    CGPoint pathFourPoint = CGPointZero;
    CGPoint lineMovePoint = CGPointZero;
    CGPoint lineEndPoint = CGPointZero;
    
    //添加到nextLayer的右上三角形
    for (int i = 0; i < 4; i++) {
        
        pathOnePoint = CGPointMake(i*kSliderWidth, 0);
        pathTwoPoint = CGPointMake(kAVWindowWidth, kAVWindowHeight-i*kSliderWidth);
        pathThreePoint = CGPointMake(kAVWindowWidth, kAVWindowHeight-(i+1)*kSliderWidth);
        pathFourPoint = CGPointMake((i+1)*kSliderWidth,0);
        lineMovePoint = CGPointMake(i*kSliderWidth,0);
        lineEndPoint = CGPointMake(kAVWindowWidth, kAVWindowHeight-i*kSliderWidth);
        
        UIBezierPath *path = [self drawTrapezoidShapeWithOnePoint:pathOnePoint twoPoint:pathTwoPoint threePoint:pathThreePoint fourPoint:pathFourPoint];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [nextLayer addSublayer:shapeLayer];
        
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:lineMovePoint];
        [linePath addLineToPoint:lineEndPoint];
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.path = linePath.CGPath;
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor whiteColor].CGColor;
        lineLayer.lineWidth = KDefaultLineWidth;
        [shapeLayer addSublayer:lineLayer];
        
        NSArray *values = @[@1,@1,@1,@1,@1,@1,@1,@0.5,@0];
        NSArray *timeList = @[@0,@0.1,@0.15,@0.3,@0.45,@0.6,@0.75,@0.8,@1];
        
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveDuration withBeginTime:beginTime+i*intervalDuration propertyName:@"opacity" values:values keyTimes:timeList];
        [shapeLayer addAnimation:opacityAni forKey:@"shapeOpacityAni"];
        
    }
    
    //添加到nextLayer的左下三角形
    for(int i = 0; i < 4; i++) {
        
        pathOnePoint = CGPointMake(0,i*kSliderWidth);
        pathTwoPoint = CGPointMake(kAVWindowWidth-(i*kSliderWidth), kAVWindowHeight);
        pathThreePoint = CGPointMake(kAVWindowWidth-(i+1)*kSliderWidth, kAVWindowHeight);
        pathFourPoint = CGPointMake(0,(i+1)*kSliderWidth);
        lineMovePoint = CGPointMake(0,i*kSliderWidth);
        lineEndPoint = CGPointMake(kAVWindowWidth-(i*kSliderWidth), kAVWindowHeight);
        
        UIBezierPath *path = [self drawTrapezoidShapeWithOnePoint:pathOnePoint twoPoint:pathTwoPoint threePoint:pathThreePoint fourPoint:pathFourPoint];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7].CGColor;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [nextLayer addSublayer:shapeLayer];
        
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:lineMovePoint];
        [linePath addLineToPoint:lineEndPoint];
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.path = linePath.CGPath;
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor whiteColor].CGColor;
        lineLayer.lineWidth = KDefaultLineWidth;
        [shapeLayer addSublayer:lineLayer];
        
        NSArray *values = @[@1,@1,@1,@1,@1,@1,@1,@0.5,@0];
        NSArray *timeList = @[@0,@0.1,@0.15,@0.3,@0.45,@0.6,@0.75,@0.8,@1];
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveDuration withBeginTime:beginTime+i*intervalDuration propertyName:@"opacity" values:values keyTimes:timeList];
        [shapeLayer addAnimation:opacityAni forKey:@"shapeOpacity"];
        
    }
    
    //对角线
    {
    CAShapeLayer *topLine = [self creatTwoCornerLineAndAniWithFromPoint:CGPointMake(-kAVWindowWidth/2, kAVWindowHeight/2) toPoint:CGPointMake(0, 0) duration:moveDuration beginTime:beginTime];
    [currentLayer addSublayer:topLine];
    
    CAShapeLayer *downLine = [self creatTwoCornerLineAndAniWithFromPoint:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight/2) toPoint:CGPointMake(0, 0) duration:moveDuration beginTime:beginTime];
    [currentLayer addSublayer:downLine];
    }
    
    //添加到nextLayer的maskLayer的三角形
    {
    CAShapeLayer *leftUpShapeLayer = [self creatDrawTriangleShapeWithOnePoint:CGPointMake(0, 0)
                                                                     twoPoint:CGPointMake(kAVWindowWidth, 0)
                                                                   threePoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
    
    CAShapeLayer *rightDownShapeLayer = [self creatDrawTriangleShapeWithOnePoint:CGPointMake(0, 0)
                                                                        twoPoint:CGPointMake(0, kAVWindowHeight)
                                                                      threePoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
    nextLayer.mask = nextLayer.maskLayer;
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    nextLayer.maskLayer.frame = kAVRectWindow;
    [nextLayer.maskLayer addSublayer:leftUpShapeLayer];
    [nextLayer.maskLayer addSublayer:rightDownShapeLayer];
    
    CABasicAnimation *leftPositionAni = [[ AVBasicRouteAnimate defaultInstance] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight/2) toValue:CGPointMake(-0.5, 0.5) propertyName:@"position"];
    [leftUpShapeLayer addAnimation:leftPositionAni forKey:@"leftPositionAni"];
    
    CABasicAnimation *rightPositionAni = [[ AVBasicRouteAnimate defaultInstance] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(-kAVWindowWidth/2, kAVWindowHeight/2) toValue:CGPointMake(0.5, -0.5) propertyName:@"position"];
    [rightDownShapeLayer addAnimation:rightPositionAni forKey:@"rightPositionAni"];
    }
}

//对角线layer和对角线position动画
- (CAShapeLayer *)creatTwoCornerLineAndAniWithFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime {

    UIBezierPath *upLinePath = [UIBezierPath bezierPath];
    [upLinePath moveToPoint:CGPointMake(0, 0)];
    [upLinePath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
    CAShapeLayer *upLineShape = [CAShapeLayer layer];
    upLineShape.path = upLinePath.CGPath;
    upLineShape.fillColor = [UIColor clearColor].CGColor;
    upLineShape.strokeColor = [UIColor whiteColor].CGColor;
    upLineShape.lineWidth = 3;
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customCGPoint:duration withBeginTime:0 fromValue:fromPoint toValue:toPoint propertyName:@"position"];
    NSArray *values = @[@1,@1,@0];
    NSArray *keyTimes = @[@0,@0.9,@1];
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"opacity" values:values keyTimes:keyTimes];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration*2 withBeginTime:beginTime aniArr:@[opacityAni,positionAni]];
    [upLineShape addAnimation:groupAni forKey:@"groupAni"];
    
    return upLineShape;
}

//创建添加到maskLayer上的三角形
- (CAShapeLayer *)creatDrawTriangleShapeWithOnePoint:(CGPoint)onePoint twoPoint:(CGPoint)twoPoint threePoint:(CGPoint)threePoint{

    UIBezierPath *leftUpPath = [UIBezierPath bezierPath];
    [leftUpPath moveToPoint:onePoint];
    [leftUpPath addLineToPoint:twoPoint];
    [leftUpPath addLineToPoint:threePoint];
    [leftUpPath closePath];
    
    CAShapeLayer *leftUpShapeLayer = [CAShapeLayer layer];
    leftUpShapeLayer.path = leftUpPath.CGPath;
    leftUpShapeLayer.fillColor = [UIColor blackColor].CGColor;
    leftUpShapeLayer.strokeColor = [UIColor clearColor].CGColor;
    leftUpShapeLayer.lineWidth = 0;
    return leftUpShapeLayer;
}

//创建三角形和三角形position动画
- (CAShapeLayer*)creatTriangleShapeAndAniWithOnePoint:(CGPoint)onePoint
                                    twoPoint:(CGPoint)twoPoint
                                  threePoint:(CGPoint)threePoint
                                   fromPoint:(CGPoint)fromPoint
                                     toPoint:(CGPoint)toPoint
                                    duration:(CFTimeInterval)duration
                                   beginTime:(CFTimeInterval)beginTime{

    
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:onePoint];
    [trianglePath addLineToPoint:twoPoint];
    [trianglePath addLineToPoint:threePoint];
    
    CAShapeLayer *triangleLayer = [CAShapeLayer layer];
    triangleLayer.path = trianglePath.CGPath;
    triangleLayer.fillColor = [UIColor clearColor].CGColor;
    triangleLayer.strokeColor = [UIColor clearColor].CGColor;
    triangleLayer.position = fromPoint;
    triangleLayer.anchorPoint = CGPointMake(0.0, 0.0);
    CGPoint fromValue = fromPoint;
    CGPoint toValue = toPoint;
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customCGPoint:duration withBeginTime:beginTime fromValue:fromValue toValue:toValue propertyName:@"position"];
    [triangleLayer addAnimation:positionAni forKey:@"positionAni"];

    return triangleLayer;
}

#define kDefaultExtraDistance 20//获取直线开始位置时，需要额外加的距离
//从中间到两边
- (void)AVAniOneLineWhiteGridCenterToBothCorner{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer:nextLayer];

    CGFloat offestDuration = 1.0;
    
    CGFloat moveDuration = .1;
    
    CAShapeLayer *rightUpTriangleLayer = [self creatTriangleShapeAndAniWithOnePoint:CGPointZero
                                    twoPoint:CGPointMake(kAVWindowWidth, 0)
                                  threePoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)
                                   fromPoint:CGPointMake(0, 0)
                                     toPoint:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight/2)
                                    duration:offestDuration+0.3
                                   beginTime:beginTime+1];
    [currentLayer addSublayer:rightUpTriangleLayer];

    CGFloat kSliderWidth = (kAVWindowWidth)/4;

    CGPoint pathOnePoint = CGPointZero;
    CGPoint pathTwoPoint = CGPointZero;
    CGPoint pathThreePoint = CGPointZero;
    CGPoint pathFourPoint = CGPointZero;
    CGPoint lineMovePoint = CGPointZero;
    CGPoint lineEndPoint = CGPointZero;
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    for (int i = 0; i < 4; i++) {

        pathOnePoint = CGPointMake(kAVWindowWidth-i*kSliderWidth, 0);
        pathTwoPoint = CGPointMake(kAVWindowWidth, i*kSliderWidth);
        pathThreePoint = CGPointMake(kAVWindowWidth, (i+1)*kSliderWidth);
        pathFourPoint = CGPointMake(kAVWindowWidth-(i+1)*kSliderWidth,0);
        lineMovePoint = CGPointMake(kAVWindowWidth-(i+1)*kSliderWidth,0);
        lineEndPoint = CGPointMake(kAVWindowWidth, (i+1)*kSliderWidth);
        startPoint = CGPointMake(1, 0);
        endPoint = CGPointMake(0, 1);

        UIBezierPath *path = [self drawTrapezoidShapeWithOnePoint:pathOnePoint twoPoint:pathTwoPoint threePoint:pathThreePoint fourPoint:pathFourPoint];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [rightUpTriangleLayer addSublayer:shapeLayer];
        
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:lineMovePoint];
        [linePath addLineToPoint:lineEndPoint];
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.path = linePath.CGPath;
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor whiteColor].CGColor;
        lineLayer.lineWidth = KDefaultLineWidth;
        [shapeLayer addSublayer:lineLayer];
        
        NSArray *keyTime = @[@0,@0.5,@1];
        NSArray *values = @[@0,@0.5,@1];
        
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:offestDuration withBeginTime:beginTime+i*moveDuration propertyName:@"opacity" values:values keyTimes:keyTime];
        [shapeLayer addAnimation:opacityAni forKey:@"shapeOpacity"];
        
    }
    
    CAShapeLayer *leftDownTriangleLayer = [self creatTriangleShapeAndAniWithOnePoint:CGPointZero
                                    twoPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)
                                  threePoint:CGPointMake(0, kAVWindowHeight)
                                   fromPoint:CGPointMake(0, 0)
                                     toPoint:CGPointMake(-kAVWindowWidth/2, kAVWindowHeight/2)
                                    duration:offestDuration+0.3
                                   beginTime:beginTime+1];
    [currentLayer addSublayer:leftDownTriangleLayer];
    for(int i = 0; i < 4; i++) {
     
        pathOnePoint = CGPointMake(0, kAVWindowHeight-i*kSliderWidth);
        pathTwoPoint = CGPointMake(i*kSliderWidth, kAVWindowHeight);
        pathThreePoint = CGPointMake((i+1)*kSliderWidth, kAVWindowHeight);
        pathFourPoint = CGPointMake(0,kAVWindowHeight-(i+1)*kSliderWidth);
        lineMovePoint = CGPointMake(0,kAVWindowHeight-(i+1)*kSliderWidth);
        lineEndPoint = CGPointMake((i+1)*kSliderWidth, kAVWindowHeight);
        startPoint = CGPointMake(0, 1);
        endPoint = CGPointMake(1, 0);
        
        UIBezierPath *path = [self drawTrapezoidShapeWithOnePoint:pathOnePoint twoPoint:pathTwoPoint threePoint:pathThreePoint fourPoint:pathFourPoint];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [leftDownTriangleLayer addSublayer:shapeLayer];
        
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:lineMovePoint];
        [linePath addLineToPoint:lineEndPoint];
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.path = linePath.CGPath;
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor whiteColor].CGColor;
        lineLayer.lineWidth = KDefaultLineWidth;
        [shapeLayer addSublayer:lineLayer];

        NSArray *keyTime = @[@0,@0.5,@1];
        NSArray *values = @[@0,@0.5,@1];
        
        CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:offestDuration withBeginTime:beginTime+i*moveDuration propertyName:@"opacity" values:values keyTimes:keyTime];
        [shapeLayer addAnimation:opacityAni forKey:@"shapeOpacity"];

    }
    
    CGFloat offsetValue = 130;
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.maskLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    nextLayer.maskLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[

                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(offsetValue*2), 0)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(offsetValue*2),kAVWindowHeight+(offsetValue*2))],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:offestDuration*0.8 withBeginTime:beginTime+1.1 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    [nextLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = KDefaultLineWidth;
    [nextLayer addSublayer:lineLayer];
    
    [lineLayer addAnimation: leftRightMoveAni forKey:@"ds"];
    lineLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
}


//- (CAAnimationGroup *)cornerToCenterAndReturnCornerWithDuration:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime{
//
//    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:0];
//
//
//
//}


//直线 对角移动
- (void)AVAniOneLineWhiteGridLeftDownToRightUp{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1.png"]];
    
    [homeLayer addSublayer:nextLayer];

    
    CGFloat kSliderWidth = (kAVWindowWidth+kDefaultExtraDistance)/4;
    CGFloat duration = 1.0;
    CGFloat moveDuration = 0.1;
    CGPoint pathOnePoint = CGPointZero;
    CGPoint pathTwoPoint = CGPointZero;
    CGPoint pathThreePoint = CGPointZero;
    CGPoint pathFourPoint = CGPointZero;
    CGPoint lineMovePoint = CGPointZero;
    CGPoint lineEndPoint = CGPointZero;
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    NSInteger transiteFactor= AVAniMoveMustLeftBottomToRightUp;
    for (int i = 0; i < 8; i++) {
        
        switch (transiteFactor) {
            case AVAniMoveMustRightUpToLeftBottom:
            {
                pathOnePoint = CGPointMake(kAVWindowWidth-i*kSliderWidth, 0);
                pathTwoPoint = CGPointMake(kAVWindowWidth, i*kSliderWidth);
                pathThreePoint = CGPointMake(kAVWindowWidth, (i+1)*kSliderWidth);
                pathFourPoint = CGPointMake(kAVWindowWidth-(i+1)*kSliderWidth,0);
                lineMovePoint = CGPointMake(kAVWindowWidth-(i+1)*kSliderWidth,0);
                lineEndPoint = CGPointMake(kAVWindowWidth, (i+1)*kSliderWidth);
                startPoint = CGPointMake(1, 0);
                endPoint = CGPointMake(0, 1);
                break;
            }
            case AVAniMoveMustLeftBottomToRightUp:
            {
                pathOnePoint = CGPointMake(0, kAVWindowHeight-i*kSliderWidth);
                pathTwoPoint = CGPointMake(i*kSliderWidth, kAVWindowHeight);
                pathThreePoint = CGPointMake((i+1)*kSliderWidth, kAVWindowHeight);
                pathFourPoint = CGPointMake(0,kAVWindowHeight-(i+1)*kSliderWidth);
                lineMovePoint = CGPointMake(0,kAVWindowHeight-(i+1)*kSliderWidth);
                lineEndPoint = CGPointMake((i+1)*kSliderWidth, kAVWindowHeight);
                startPoint = CGPointMake(0, 1);
                endPoint = CGPointMake(1, 0);
                break;
            }
            default:
                break;
        }
        
        UIBezierPath *path = [self drawTrapezoidShapeWithOnePoint:pathOnePoint twoPoint:pathTwoPoint threePoint:pathThreePoint fourPoint:pathFourPoint];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.opacity = 0;
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7].CGColor;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [currentLayer addSublayer:shapeLayer];
       
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:lineMovePoint];
        [linePath addLineToPoint:lineEndPoint];
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.path = linePath.CGPath;
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor whiteColor].CGColor;
        lineLayer.lineWidth = KDefaultLineWidth;
        [shapeLayer addSublayer:lineLayer];
        
        CAKeyframeAnimation *opacityAni = [self creatSliderOpacityAniWithDuration:duration beginTime:beginTime+(i*moveDuration)];
        [shapeLayer addAnimation:opacityAni forKey:@"opacityAni"];
    }
    
    //渐变色layer frame每边都需扩大100
    AVBasicGradientLayer *shadowLayer = [self creatShadowBgGradientLayerWithRect:CGRectMake(-100, -100, kAVWindowWidth+200, kAVWindowHeight+200) startPoint:startPoint endPoint:endPoint duration:duration beginTime:beginTime+moveDuration*2];
    [currentLayer addSublayer:shadowLayer];
    
    //给下一个layer加动画
    CABasicAnimation *nextLayerOpacityAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime+3*moveDuration fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
    [nextLayer addAnimation:nextLayerOpacityAni forKey:@"opacity"];
    
}



//trapezoid 梯形Path
- (UIBezierPath *)drawTrapezoidShapeWithOnePoint:(CGPoint)onePoint twoPoint:(CGPoint)twoPoint threePoint:(CGPoint)threePoint fourPoint:(CGPoint)fourPoint{

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:onePoint];
    
    [path addLineToPoint:twoPoint];
    
    [path addLineToPoint:threePoint];
    
    [path addLineToPoint:fourPoint];
    
    [path closePath];
    return path;
    
}

//直线 上下左右方向移动
- (void)AVAniOneLineWhiteGridFourDirection{

//    CGFloat duration = 8;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer:nextLayer];
    nextLayer.opacity = 0.0;
    
    CGFloat duration = 1.0;
    CGFloat moveDuration = 0.15;
    
    NSInteger transiteFactor = AVAniMoveMustLeftToRight;
    CGFloat kSliderWidth = (kAVWindowWidth-kDefaultExtraDistance)/5;
    CGRect sliderBarRect = CGRectZero;
    CGRect lineRect = CGRectZero;
    CGPoint sliderPosition = CGPointZero;
    CGPoint linePosition = CGPointZero;
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    
    for (int i = -1; i < 6; i++) {
        
        switch (transiteFactor) {
            case AVAniMoveMustLeftToRight:
            {
                kSliderWidth = (kAVWindowWidth-kDefaultExtraDistance)/5;
                startPoint = CGPointMake(0, 0.5);
                endPoint = CGPointMake(1, 0.5);
                sliderBarRect = CGRectMake(0, 0, kSliderWidth, kAVWindowHeight);
                lineRect = CGRectMake(0, 0, KDefaultLineWidth, kAVWindowHeight);
                sliderPosition = CGPointMake((i+0.5)*kSliderWidth, kAVWindowCenter.y);
                linePosition = CGPointMake(kSliderWidth-KDefaultLineWidth/2, kAVWindowCenter.y);
                break;
            }
            case AVAniMoveMustRightToLeft:
            {
                kSliderWidth = (kAVWindowWidth-kDefaultExtraDistance)/5;
                startPoint = CGPointMake(1, 0.5);
                endPoint = CGPointMake(0, 0.5);
                sliderBarRect = CGRectMake(0, 0, kSliderWidth, kAVWindowHeight);
                lineRect = CGRectMake(0, 0, KDefaultLineWidth, kAVWindowHeight);
                sliderPosition = CGPointMake(kAVWindowWidth-(i+0.5)*kSliderWidth, kAVWindowCenter.y);
                linePosition = CGPointMake(KDefaultLineWidth/2, kAVWindowCenter.y);
                break;
            }
            case AVAniMoveMustTopToBottom:
            {
                kSliderWidth = (kAVWindowHeight-kDefaultExtraDistance)/5;
                startPoint = CGPointMake(0.5, 0);
                endPoint = CGPointMake(0.5, 1);
                sliderBarRect = CGRectMake(0, 0, kAVWindowWidth, kSliderWidth);
                lineRect = CGRectMake(0, 0, kAVWindowWidth, KDefaultLineWidth);
                sliderPosition = CGPointMake(kAVWindowCenter.x, (i+0.5)*kSliderWidth);
                linePosition = CGPointMake(kAVWindowCenter.x, kSliderWidth-KDefaultLineWidth/2);
                break;
            }
            case AVAniMoveMustBottomToTop:
            {
                kSliderWidth = (kAVWindowHeight-kDefaultExtraDistance)/5;
                startPoint = CGPointMake(0.5, 1);
                endPoint = CGPointMake(0.5, 0);
                sliderBarRect = CGRectMake(0, 0, kAVWindowWidth, kSliderWidth);
                lineRect = CGRectMake(0, 0, kAVWindowWidth, KDefaultLineWidth);
                sliderPosition = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-(i+0.5)*kSliderWidth);
                linePosition = CGPointMake(kAVWindowCenter.x,KDefaultLineWidth/2);
                break;
            }
            default:
                break;
        }

    
        AVBasicLayer *sliderBarLayer = [[AVBasicLayer alloc] initWithFrame:sliderBarRect bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
        sliderBarLayer.opacity = 0;
        sliderBarLayer.position = sliderPosition;
        [currentLayer addSublayer:sliderBarLayer];
        AVBottomLayer *lineLayer = [[AVBottomLayer alloc] initWithFrame:lineRect bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.7].CGColor];
        lineLayer.position = linePosition;
        [sliderBarLayer addSublayer:lineLayer];
        
    CAKeyframeAnimation *opacityAni = [self creatSliderOpacityAniWithDuration:duration beginTime:beginTime+((i+1)*0.1)];
    [sliderBarLayer addAnimation:opacityAni forKey:@"opacityAni"];

    }
    
    AVBasicGradientLayer *shadowLayer = [self creatShadowBgGradientLayerWithRect:CGRectMake(-kAVWindowWidth, 0, 3*kAVWindowWidth, kAVWindowHeight)
                                startPoint:startPoint
                                  endPoint:endPoint
                                  duration:duration-moveDuration
                                 beginTime:beginTime+0.2];
//    nextLayer.maskLayer = shadowLayer ;
    [currentLayer addSublayer:shadowLayer];

    //给下一个layer加动画
    CABasicAnimation *nextLayerOpacityAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime+3*moveDuration];
    
    [nextLayer addAnimation:nextLayerOpacityAni forKey:@"nextLayerOpacityAni"];
}

//创建滑块移动动画
- (CAKeyframeAnimation *)creatSliderOpacityAniWithDuration:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime{
    
    NSArray *values = @[@0,@0.5,@1,@1,@1,@1,@1,@0.5,@0];
    NSArray *timeList = @[@0,@0.1,@0.15,@0.3,@0.45,@0.6,@0.75,@0.9,@1];
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniOpacity values:values keyTimes:timeList];
    return opacityAni;
}


//创建背景渐变layer
- (AVBasicGradientLayer *)creatShadowBgGradientLayerWithRect:(CGRect)rect startPoint:(CGPoint)startPoint
           endPoint:(CGPoint)endPoint
           duration:(CFTimeInterval)duration
          beginTime:(CFTimeInterval)beginTime{

    UIColor *oneColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
    UIColor *twoColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    UIColor *threeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    NSArray *colorList = @[(id)oneColor.CGColor,(id)threeColor.CGColor,(id)twoColor.CGColor,(id)threeColor.CGColor,(id)oneColor.CGColor];
    NSArray *locationList = @[@0.1,@0.3,@0.5,@0.7,@0.9];
    AVBasicGradientLayer *shadowLayer = [[AVBasicGradientLayer alloc] initWithFrame:rect colorsList:colorList locationList:locationList startPoint:startPoint endPoint:endPoint];
    shadowLayer.opacity = 0;

    NSArray *values = @[@0.0,@1.0,@1.0,@0.0];
    NSArray *timeList = @[@0.1,@0.3,@0.8,@1,];
    CAKeyframeAnimation *shadowOpacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniOpacity values:values keyTimes:timeList];
    
    CABasicAnimation *moveBgAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:0 fromValue:@[@0.0,@0.1,@0.2,@0.3,@0.4] toValue:@[@0.6,@0.7,@0.8,@0.9,@1] propertyName:@"locations"];
//    [shadowLayer addAnimation:moveBgAni forKey:@"locations"];
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[shadowOpacityAni,moveBgAni]];
    [shadowLayer addAnimation:groupAni forKey:@"groupAni"];

    return shadowLayer;

}


#define kDefalutInterval 15
#define kDefaultBottomOffsetY 100
#define kDefaultCenterXDistance 30
#define kDefultFontValue    23
#define kDefalutTextFont  [UIFont systemFontOfSize:kDefultFontValue]
#define kDefaultWhiteSliderTextWidth (kAVWindowWidth-80)

- (void)WhiteSliderTextScreen{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 1;

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: currentLayer];

    NSString *text = @"假发票水井坊附近艘非";
    CGSize broadSize = [text textBroadSizeWithFont:kDefalutTextFont maxSize:CGSizeMake(kDefaultWhiteSliderTextWidth, MAXFLOAT) interval:kDefalutInterval isDefluatWidth:YES isDefaultHeight:YES];
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height)];
    bgLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-kDefaultBottomOffsetY);
    [currentLayer addSublayer:bgLayer];
    
    
    UIBezierPath *textWhitePartPath = [self textBgWhitePartShapePath:CGRectMake(0, 0, broadSize.width, broadSize.height)];
    AVShapeBaseLayer *textWhitePartLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height) bezierPath:textWhitePartPath fillColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [bgLayer addSublayer:textWhitePartLayer];
    
    UIBezierPath *textClearPartPath = [self textBgClearPartShapePath:CGRectMake(20, 0, broadSize.width-20, broadSize.height-10)];
    AVShapeBaseLayer *textClearPartLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(20, 0, broadSize.width-20, broadSize.height-10) bezierPath:textClearPartPath fillColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6]];
    [bgLayer addSublayer:textClearPartLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0,0,bgLayer.width-(4*kDefalutInterval), broadSize.height-2*kDefalutInterval) intText:text textFont:kDefalutTextFont textColor:[UIColor darkGrayColor]];
    textLayer.position = CGPointMake((bgLayer.width+10)/2, bgLayer.height/2+(kDefultFontValue*kTextFontOffsetFactor2));
    textLayer.alignmentMode = kCAAlignmentLeft;
    [bgLayer addSublayer:textLayer];
    
    
    CGPoint startPosition = CGPointMake(-(broadSize.width/2), broadSize.height/2);
    
    CGPoint nextPosition =  CGPointMake(broadSize.width/2, broadSize.height/2);
    
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPosition toValue:nextPosition];
    
    [bgLayer.maskLayer addAnimation: moveAni forKey:@"moveAni"];
    
    
}

//字体背景不规则白色图形Path
- (UIBezierPath *)textBgWhitePartShapePath:(CGRect)bounds{

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 0)];
    
    [path addLineToPoint:CGPointMake(30, 0)];
    
    [path addLineToPoint:CGPointMake(20, bounds.size.height-10)];
    
    [path addLineToPoint:CGPointMake(bounds.size.width-10, bounds.size.height-10)];
    
    [path addLineToPoint:CGPointMake(bounds.size.width-12, bounds.size.height)];
    
    [path addLineToPoint:CGPointMake(0, bounds.size.height)];
    
    [path closePath];
    
    return path;
}

//字体背景不规则模糊白色图形Path
- (UIBezierPath *)textBgClearPartShapePath:(CGRect)bouns{

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(10, 0)];
    
    [path addLineToPoint:CGPointMake(0, bouns.size.height)];
    
    [path addLineToPoint:CGPointMake(bouns.size.width-10, bouns.size.height)];
    
    [path addLineToPoint:CGPointMake(bouns.size.width, 0)];
    
    [path closePath];
    
    return path;
}




//结束交错直线动画
- (void)AVAniOneLineWhiteGridMoveLineFromeFourDicEnd{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 1;
    
    CGFloat kLineDistance = kAVWindowWidth/4;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor whiteColor].CGColor];
    [homeLayer addSublayer:nextLayer];
    
    CABasicAnimation *nextOpacityAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime+1.5 fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
    [nextLayer addAnimation:nextOpacityAni forKey:@"nextOpacityAni"];
    
    //vertical垂直   Horizontal水平
    //for循环创建垂直3条线
    for (int i = 0; i < 3; i++) {
        
        CAShapeLayer *horizontalLineLayer = [self creatLineShapeWithStartPoint:CGPointMake((i+1)*kLineDistance, kAVWindowHeight) endPoint:CGPointMake((i+1)*kLineDistance, 0)];
        [currentLayer addSublayer:horizontalLineLayer];
        
        CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime+1 fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
        
        [horizontalLineLayer addAnimation:strokeEndAni forKey:@"strokeEnd"];

    }
    
    //水平方向直线加动画
    {
    CAShapeLayer *verticalOneLayer = [self creatLineShapeWithStartPoint:CGPointMake(0, kLineDistance) endPoint:CGPointMake(kAVWindowWidth, kLineDistance)];
    [currentLayer addSublayer:verticalOneLayer];
    
    CAShapeLayer *verticalTwoLayer = [self creatLineShapeWithStartPoint:CGPointMake(kAVWindowWidth, 2*kLineDistance) endPoint:CGPointMake(0, 2*kLineDistance)];
    [currentLayer addSublayer:verticalTwoLayer];
    
    CAShapeLayer *verticalThreeLayer = [self creatLineShapeWithStartPoint:CGPointMake(0, 3*kLineDistance) endPoint:CGPointMake(kAVWindowWidth, 3*kLineDistance)];
    [currentLayer addSublayer:verticalThreeLayer];

    CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime+1 fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
    [verticalOneLayer addAnimation:strokeEndAni forKey:@"strokeEnd"];
    [verticalTwoLayer addAnimation:strokeEndAni forKey:@"strokeEnd"];
    [verticalThreeLayer addAnimation:strokeEndAni forKey:@"strokeEnd"];
    }

    //7个白色小块layer，由于position没规律，所以没用for循环
    AVBasicLayer *shadowBlockOneLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(2.5*kLineDistance, kLineDistance/2) duration:duration beginTime:beginTime+1.1];
    [currentLayer addSublayer:shadowBlockOneLayer];
    
    AVBasicLayer *shadowBlockTwoLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(kLineDistance/2, kLineDistance*2.5) duration:duration beginTime:beginTime+1.2];
    [currentLayer addSublayer:shadowBlockTwoLayer];

    AVBasicLayer *shadowBlockThreeLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(2.5*kLineDistance, kLineDistance*2.5) duration:duration beginTime:beginTime+1.3];
    [currentLayer addSublayer:shadowBlockThreeLayer];
    
    AVBasicLayer *shadowBlockFourLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(1.5*kLineDistance, kLineDistance*3.5) duration:duration beginTime:beginTime+1.3];
    [nextLayer addSublayer:shadowBlockFourLayer];
    
    AVBasicLayer *shadowBlockFiveLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(2.5*kLineDistance, kLineDistance*1.5) duration:duration beginTime:beginTime+1.4];
    [currentLayer addSublayer:shadowBlockFiveLayer];
    
    AVBasicLayer *shadowBlockSixLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(0.5*kLineDistance, kLineDistance*0.5) duration:duration beginTime:beginTime+1.5];
    [currentLayer addSublayer:shadowBlockSixLayer];
    
    AVBasicLayer *shadowBlockSevenLayer = [self creatShadowWhiteBlockWithPosition:CGPointMake(1.5*kLineDistance, kLineDistance*1.5) duration:duration beginTime:beginTime+1.4];
    [currentLayer addSublayer:shadowBlockSevenLayer];
    
}


//创建结束动画白色块layer
- (AVBasicLayer *)creatShadowWhiteBlockWithPosition:(CGPoint)position duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime{

    CGFloat kLineDistance = kAVWindowWidth/4;
    AVBasicLayer *shadowBlockLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kLineDistance, kLineDistance) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor];
    shadowBlockLayer.opacity = 0;
    shadowBlockLayer.position = position;
    CABasicAnimation *blockOpacityAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime];
    
    [shadowBlockLayer addAnimation:blockOpacityAni forKey:@"opacityAni"];
    return shadowBlockLayer;

}

//创建结束动画直线layer
- (CAShapeLayer *)creatLineShapeWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:startPoint];
    [linePath addLineToPoint:endPoint];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    lineLayer.lineWidth = KDefaultLineWidth;
    
    return lineLayer;
}



- (void)showOriginalAndWhiteFilterSceneAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 2;
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(-kAVWindowWidth/2, 0, 3*kAVWindowWidth, kAVWindowHeight)];
    bgLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:bgLayer];

    AVBasicLayer *oneLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 300, kAVWindowHeight) withImage:[UIImage imageNamed:@"0.png"]];
    UIImage *oneImageBlackWhite = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"0.png"]
                                                          filterType:AVImageFilterBlackWhite
                                                          blurRadius:20];
    
    oneLayer.blurLayer.frame = oneLayer.bounds;
    oneLayer.blurLayer.contents = (id)oneImageBlackWhite.CGImage;
    oneLayer.position = CGPointMake(250, kAVWindowCenter.y);
    [bgLayer addSublayer:oneLayer];
    
    
    AVBasicLayer *twoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 300, kAVWindowHeight) withImage:[UIImage imageNamed:@"0.png"]];
    twoLayer.position  = CGPointMake(550, kAVWindowCenter.y);
    [bgLayer addSublayer: twoLayer];
    
    AVBasicLayer *threeLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 300, kAVWindowHeight) withImage:[UIImage imageNamed:@"0.png"]];
    UIImage *threeImageBlackWhite = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"0.png"]
                                                          filterType:AVImageFilterBlackWhite
                                                          blurRadius:20];
    
    threeLayer.blurLayer.frame = threeLayer.bounds;
    threeLayer.blurLayer.contents = (id)threeImageBlackWhite.CGImage;
    threeLayer.position = CGPointMake(850, kAVWindowCenter.y);
    [bgLayer addSublayer:threeLayer];
    
    AVBasicLayer *fourLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 300, kAVWindowHeight) withImage:[UIImage imageNamed:@"0.png"]];
    fourLayer.position  = CGPointMake(550, kAVWindowCenter.y);
    [bgLayer addSublayer: twoLayer];
    
    CGPoint startPoint = kAVWindowCenter;
    CGPoint endPoint = CGPointMake(150, kAVWindowCenter.y);
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:startPoint] toValue:[NSValue valueWithCGPoint:endPoint] propertyName:kAVBasicAniPosition];
    [bgLayer addAnimation:moveAni forKey:@"moveAni"];
}


#define kLineWidth 3

//从中间到两边
- (void)AVAniOneLineWhiteGridCenterToBothSide{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CGFloat duration      = 1.6;
    
    CGFloat moveDuration      = 0.7;

    CGFloat oneLayerSizeX = 170;
    CGFloat twoLayerSizeX = 60;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer:nextLayer];
    nextLayer.mask = nextLayer.maskLayer;
    
    
    CGRect bgLayerRect = CGRectMake(-kLineWidth, -kLineWidth,kAVWindowWidth+(kLineWidth*2), kAVWindowHeight+(2*kLineWidth));
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:bgLayerRect];
    bgLayer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor;
    bgLayer.position = kAVWindowCenter;
    [nextLayer addSublayer:bgLayer];
    
    NSArray *keyTime = @[@0,@0.2,@0.5,@.8,@1];
    NSArray *values = @[@1,@0.8,@0.5,@0.3,@0];
    CAKeyframeAnimation *bgLayerOpacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:moveDuration withBeginTime:moveDuration*0.6 propertyName:@"opacity" values:values keyTimes:keyTime];
    
    NSArray *moveKeyTimes = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *moveValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0, kAVWindowHeight+20)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(2*kLineWidth),kAVWindowHeight+20)],
                              ];
    CAKeyframeAnimation *moveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:kAVBasicAniBounds values:moveValues keyTimes:moveKeyTimes];
    
    CAAnimationGroup *bgGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:moveDuration*2 withBeginTime:beginTime aniArr:@[bgLayerOpacityAni,moveAni]];
    [bgLayer addAnimation:bgGroupAni forKey:@"bgGroupAni"];
    

    CGRect oneLayerRect = CGRectMake(oneLayerSizeX, -kLineWidth, kAVWindowWidth-(2*oneLayerSizeX), kAVWindowHeight+(2*kLineWidth));
    CALayer *oneLayer = [self creatBroadLineLayerFrame:oneLayerRect];
    [nextLayer addSublayer:oneLayer];
    CAAnimationGroup *oneLayerAni = [self OpenFromCenterToLeftRightWithDuration:moveDuration beginTime:beginTime+0.2 moveWidth:kAVWindowWidth-(2*oneLayerSizeX)];
    [oneLayer addAnimation:oneLayerAni forKey:@"oneLayerAni"];

    
    CGRect twoLayerRect = CGRectMake(twoLayerSizeX, -kLineWidth, kAVWindowWidth-(2*twoLayerSizeX), kAVWindowHeight+(2*kLineWidth));
    CALayer *twoLayer = [self creatBroadLineLayerFrame:twoLayerRect];
    [nextLayer addSublayer:twoLayer];
    CAAnimationGroup *twoLayerAni = [self OpenFromCenterToLeftRightWithDuration:moveDuration beginTime:beginTime+0.1 moveWidth:kAVWindowWidth-(2*twoLayerSizeX)];
    [twoLayer addAnimation:twoLayerAni forKey:@"twoLayerAni"];
    

    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0, kAVWindowHeight+20)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(2*kLineWidth),kAVWindowHeight+20)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-kLineWidth, -kLineWidth,kAVWindowWidth+(kLineWidth*2), kAVWindowHeight+(2*kLineWidth));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = kLineWidth;
    [nextLayer addSublayer: lineLayer];
    [lineLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    [nextLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"nextBounrdsSpringAni"];
    

}

- (CAAnimationGroup *)OpenFromCenterToLeftRightWithDuration:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime moveWidth:(CGFloat)width{

    NSArray *opacityKeyTime = @[@0,@0.5,@0.8,@1];
    NSArray *values = @[@1,@0.6,@0.3,@0];
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:@"opacity" values:values keyTimes:opacityKeyTime];
    
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0, kAVWindowHeight+20)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, width,kAVWindowHeight+20)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration*2 withBeginTime:beginTime aniArr:@[opacityAni,leftRightMoveAni]];
    
    return groupAni;
}

//从左右到中间
- (void)AVAniOneLineWhiteGridBothSideToCenter{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;

   // CGFloat duration      = 1.6;
    CGFloat moveDuration      = 0.7;
    
    CGFloat halfWith = ((kAVWindowWidth+(2*kLineWidth))/2);
    
    CGFloat vat =  ((kAVWindowWidth+(2*kLineWidth))/2) / moveDuration;
    
    CGFloat subTime = (kAVWindowWidth/2)/vat;
    
    CGFloat oneLayerSizeX = 70;
    CGFloat twoLayerSizeX = 140;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"0"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:nextLayer];
    
    
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;

    //白色半透明Layer
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
    [nextLayer addSublayer:bgLayer];
    
    //第1个白色边框Layer
    CGRect oneLayerRect = CGRectMake(-oneLayerSizeX, -kLineWidth, kAVWindowWidth+(2*oneLayerSizeX), kAVWindowHeight+(2*kLineWidth));
    CALayer *oneLayer = [self creatBroadLineLayerFrame:oneLayerRect];
    [nextLayer addSublayer:oneLayer];
    
    //第2个白色边框Layer
    CGRect twoLayerRect = CGRectMake(-twoLayerSizeX, -kLineWidth, kAVWindowWidth+(2*twoLayerSizeX), kAVWindowHeight+(2*kLineWidth));
    CALayer *twoLayer = [self creatBroadLineLayerFrame:twoLayerRect];
    [nextLayer addSublayer:twoLayer];
    
    //白色半透明Layer动画
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] opacityClose:moveDuration withBeginTime:beginTime+0.7];
    [bgLayer addAnimation:opacityAni forKey:@"opacity"];
    
    //第1个白色边框Layer动画
    CAAnimationGroup *oneLayerAni = [self flodFromOutToCenterWithDurtion:moveDuration+0.2 beginTime:beginTime+0.2 moveWidth:kAVWindowWidth];
    [oneLayer addAnimation:oneLayerAni forKey:@"oneLayerAni"];
    
    //第2个白色边框Layer动画
    CAAnimationGroup *twoLayerAni = [self flodFromOutToCenterWithDurtion:moveDuration+0.5 beginTime:beginTime+0.2 moveWidth:twoLayer.width];
    [twoLayer addAnimation:twoLayerAni forKey:@"twoLayerAni"];
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(2*kLineWidth), kAVWindowHeight+20)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0,kAVWindowHeight+20)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-kLineWidth, -kLineWidth,kAVWindowWidth+(kLineWidth*2), kAVWindowHeight+(2*kLineWidth));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = kLineWidth;
    [nextLayer addSublayer: lineLayer];
    
    [lineLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    {
        CABasicAnimation *leftCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:subTime
                                                                                      withBeginTime:beginTime
                                                                                          fromValue:CGPointMake(0, kAVWindowCenter.y)
                                                                                            toValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];
        AVBottomLayer *leftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth/2,kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
        leftLayer.anchorPoint = CGPointMake(1, 0.5);
        [nextLayer.maskLayer addSublayer: leftLayer];
        [leftLayer addAnimation:leftCenterAni forKey:@"moveNextCenterAni"];
    }
    
    {
        CABasicAnimation *rightCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:subTime
                                                                                      withBeginTime:beginTime
                                                                                          fromValue:CGPointMake(kAVWindowWidth, kAVWindowCenter.y)
                                                                                            toValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];
        AVBottomLayer *rightLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(kAVWindowWidth, 0, kAVWindowWidth/2,kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
        rightLayer.anchorPoint = CGPointMake(0, 0.5);
        [nextLayer.maskLayer addSublayer: rightLayer];
        [rightLayer addAnimation:rightCenterAni forKey:@"moveNextCenterAni"];
    }
    
    
}

- (CALayer *)creatBroadLineLayerFrame:(CGRect)frame{

    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = frame;
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = 6;
    return lineLayer;
}

- (CAAnimationGroup *)flodFromOutToCenterWithDurtion:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime moveWidth:(CGFloat)width{
    
    NSArray *opacityKeyTime = @[@0,@0.3,@0.5,@0.8,@1];
    NSArray *values = @[@1,@0.8,@0.6,@0.3,@0];
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1 withBeginTime:0 propertyName:@"opacity" values:values keyTimes:opacityKeyTime];
    
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, width, kAVWindowHeight+20)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0,kAVWindowHeight+20)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[opacityAni,leftRightMoveAni]];
    
    return groupAni;
    
}

#define kTrans3DSceneTextFontValue 25
#define kTrans3DSceneTextFont [UIFont systemFontOfSize:kTrans3DSceneTextFontValue]
#define kTopLinePathHeight 10  //path尖角的高度
#define kTrans3DSceneTextInterval 6 //文字间隙
#define kTrans3DSceneTextColor  [UIColor whiteColor]
- (void)trans3DSceneTextAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CGFloat duration = 1.5;
    
    AVBasicLayer  *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *imageLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth-200, kAVWindowWidth-200) withImage:[UIImage imageNamed:@"1.png"]];
    imageLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:imageLayer];
    
    NSString *sceneText = @"爱我看完紧迫而";
    CGSize broadSize = [sceneText textBroadSizeWithFont:kTrans3DSceneTextFont maxSize:CGSizeMake(kAVWindowWidth-200, MAXFLOAT) interval:kTrans3DSceneTextInterval isDefluatWidth:YES];
    
    //文字背景layer
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+kTopLinePathHeight)];
    bgLayer.position = CGPointMake(kAVWindowCenter.x, imageLayer.bottom+broadSize.height/2+10);
    [currentLayer addSublayer:bgLayer];
    
    //上面白线layer
    UIBezierPath *topLinePath = [self drawRowPathWithBounds:CGRectMake(0, 0, kAVWindowWidth-200, kTopLinePathHeight)];
    AVShapeBaseLayer *topLineLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth-200, kTopLinePathHeight) bezierPath:topLinePath fillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor] lineWidth:2];
    [bgLayer addSublayer:topLineLayer];
    
    //字体layer
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width-2*kTrans3DSceneTextInterval, broadSize.height-2*kTrans3DSceneTextInterval) intText:sceneText textFont:kTrans3DSceneTextFont textColor:kTrans3DSceneTextColor];
    textLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2+(kTrans3DSceneTextFontValue*kTextFontOffsetFactor2)+kTrans3DSceneTextInterval/2);
    [bgLayer addSublayer:textLayer];
    
    //下面白线layer
    AVBottomLayer *bottomLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth-200, 2) bgColor:[UIColor whiteColor].CGColor];
    bottomLineLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height-1);
    [bgLayer addSublayer:bottomLineLayer];
    
    //动画
    NSArray *values = @[@(0),@(0.25),@(0.5),@(1),@(1),@(1),@(1),@(0.5),@(0.25),@(0)];
    NSArray *keyTime = @[@0,@(0.1),@(0.2),@(0.3),@(0.4),@(0.5),@(0.6),@(0.7),@(0.8),@1];
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:@"opacity" values:values keyTimes:keyTime];
    [bgLayer addAnimation:opacityAni forKey:@"opacityAni"];

}

- (UIBezierPath *)drawRowPathWithBounds:(CGRect)bounds{

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, bounds.size.height)];
    
    [path addLineToPoint:CGPointMake(bounds.size.width/2-6, bounds.size.height)];
    
    [path addLineToPoint:CGPointMake(bounds.size.width/2, 0)];
    
    [path addLineToPoint:CGPointMake(bounds.size.width/2+6, bounds.size.height)];
    [path addLineToPoint:CGPointMake(bounds.size.width, bounds.size.height)];
    
    return path;

}

#define ktrans3DTitleFontValue 25
#define ktrans3DTitleFont [UIFont fontWithName:@"SnellRoundhand-Bold" size:ktrans3DTitleFontValue]


- (void)trans3DSceneTitleAni{

    
    AVBasicLayer  *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *imageLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth-200, kAVWindowWidth-200) withImage:[UIImage imageNamed:@"1.png"]];
    imageLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:imageLayer];
    
    AVBasicLayer *shadowLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth-200, kAVWindowWidth-200) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
    shadowLayer.position = CGPointMake(imageLayer.width/2, imageLayer.height/2);
    [imageLayer addSublayer:shadowLayer];

    NSString *sceneText = @"爱我看完紧迫而方法计算积分iPhone放视频覅";
    CGSize broadSize = [sceneText textBroadSizeWithFont:ktrans3DTitleFont maxSize:CGSizeMake(kAVWindowWidth-200, MAXFLOAT) interval:kTrans3DSceneTextInterval isDefluatWidth:YES];
    
    //文字背景layer 高度加20是4条线的高度
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+20)];
    bgLayer.position = CGPointMake(imageLayer.width/2, imageLayer.height/2);
    [imageLayer addSublayer:bgLayer];
    //上面第一条线
    {
    UIBezierPath *oneTopLinePath = [UIBezierPath bezierPath];
    [oneTopLinePath moveToPoint:CGPointMake(0, 6)];
    [oneTopLinePath addLineToPoint:CGPointMake(bgLayer.width/2-6, 6)];
    [oneTopLinePath addLineToPoint:CGPointMake(bgLayer.width/2, 1)];
    [oneTopLinePath addLineToPoint:CGPointMake(bgLayer.width/2+6, 6)];
    [oneTopLinePath addLineToPoint:CGPointMake(bgLayer.width, 6)];
    CAShapeLayer *oneTopLineLayer = [CAShapeLayer layer];
    oneTopLineLayer.path = oneTopLinePath.CGPath;
    oneTopLineLayer.fillColor = [UIColor clearColor].CGColor;
    oneTopLineLayer.strokeColor = [UIColor whiteColor].CGColor;
    oneTopLineLayer.lineWidth = 1;
    [bgLayer addSublayer:oneTopLineLayer];
    }
    
    //上面第二条线
    {
    UIBezierPath *twoTopLinePath = [UIBezierPath bezierPath];
    [twoTopLinePath moveToPoint:CGPointMake(0, 12)];
    [twoTopLinePath addLineToPoint:CGPointMake(bgLayer.width/2-6, 12)];
    [twoTopLinePath addLineToPoint:CGPointMake(bgLayer.width/2, 7)];
    [twoTopLinePath addLineToPoint:CGPointMake(bgLayer.width/2+6, 12)];
    [twoTopLinePath addLineToPoint:CGPointMake(bgLayer.width, 12)];
    CAShapeLayer *twoTopLineLayer = [CAShapeLayer layer];
    twoTopLineLayer.path = twoTopLinePath.CGPath;
    twoTopLineLayer.fillColor = [UIColor clearColor].CGColor;
    twoTopLineLayer.strokeColor = [UIColor whiteColor].CGColor;
    twoTopLineLayer.lineWidth = 1;
    [bgLayer addSublayer:twoTopLineLayer];
    }
    
    //字体layer
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width-2*kTrans3DSceneTextInterval, broadSize.height-2*kTrans3DSceneTextInterval) intText:sceneText textFont:ktrans3DTitleFont textColor:kTrans3DSceneTextColor];
    textLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2+(ktrans3DTitleFontValue*kTextFontOffsetFactor2)+kTrans3DSceneTextInterval/2);
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
    
    //下面第二条线
    {
    UIBezierPath *TwoBottomLinePath = [UIBezierPath bezierPath];
    [TwoBottomLinePath moveToPoint:CGPointMake(0, bgLayer.height-1)];
    [TwoBottomLinePath addLineToPoint:CGPointMake(bgLayer.width, bgLayer.height-1)];
    CAShapeLayer *twoBottomLineLayer = [CAShapeLayer layer];
    twoBottomLineLayer.path = TwoBottomLinePath.CGPath;
    twoBottomLineLayer.fillColor = [UIColor clearColor].CGColor;
    twoBottomLineLayer.strokeColor = [UIColor whiteColor].CGColor;
    twoBottomLineLayer.lineWidth = 1;
    [bgLayer addSublayer:twoBottomLineLayer];
    }
}

/*
 
 //    UIColor *oneColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
 //    UIColor *twoColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
 //    UIColor *threeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
 //    NSArray *colorList = @[(id)oneColor.CGColor,(id)threeColor.CGColor,(id)twoColor.CGColor,(id)threeColor.CGColor,(id)oneColor.CGColor];
 //    NSArray *locationList = @[@0.1,@0.3,@0.5,@0.7,@0.9];
 //    AVBasicGradientLayer *shadowLayer = [[AVBasicGradientLayer alloc] initWithFrame:kAVRectWindow colorsList:colorList locationList:locationList startPoint:startPoint endPoint:endPoint];
 //    shadowLayer.opacity = 0;
 //    [currentLayer addSublayer:shadowLayer];
 //    NSArray *values = @[@0.0,@1.0,@1.0,@0.0];
 //    NSArray *timeList = @[@0.1,@0.2,@0.9,@1,];
 //    CAKeyframeAnimation *shadowOpacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniOpacity values:values keyTimes:timeList];
 //
 //    CABasicAnimation *moveBgAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:0 fromValue:@[@0.0,@0.1,@0.2,@0.3,@0.4] toValue:@[@0.6,@0.7,@0.8,@0.9,@1] propertyName:@"locations"];
 //    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime+moveDuration*2 aniArr:@[shadowOpacityAni,moveBgAni]];
 //    [shadowLayer addAnimation:groupAni forKey:@"groupAni"];
 
 */



/*
 CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
 
 AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
 vContentRect:kAVRectWindow
 withImage:[UIImage imageNamed:@"1.png"]];
 [homeLayer addSublayer: currentLayer];
 
 AVBasicTextLayer *opacityCloseLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, 150, 100) intText:@"上传分享" textFont:[UIFont systemFontOfSize:25] textColor:[UIColor redColor]];
 opacityCloseLayer.position = kAVWindowCenter;
 [currentLayer addSublayer:opacityCloseLayer];
 opacityCloseLayer.opacity = 1;
 
 NSArray *closekeyTime = @[@0,@0.2,@0.8,@1];
 NSArray *closeValue = @[@(1),@(0),@(0),@(1)];
 CAKeyframeAnimation *closeOpacityAni = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
 closeOpacityAni.values = closeValue;
 closeOpacityAni.keyTimes = closekeyTime;
 closeOpacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 closeOpacityAni.repeatCount = MAXFLOAT;
 closeOpacityAni.removedOnCompletion = NO;
 closeOpacityAni.duration = 8.0;
 closeOpacityAni.beginTime = beginTime;
 [opacityCloseLayer addAnimation:closeOpacityAni forKey:@"closeOpacity"];
 
 AVBasicTextLayer *opacityOpenLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, 200, 100) intText:@"微信好友分享" textFont:[UIFont systemFontOfSize:25] textColor:[UIColor redColor]];
 opacityOpenLayer.position = kAVWindowCenter;
 [currentLayer addSublayer:opacityOpenLayer];
 opacityOpenLayer.opacity = 0;
 
 NSArray *openKeyTime = @[@0,@0.2,@0.8,@1];
 NSArray *openValue = @[@(0),@(1),@(1),@(0)];
 CAKeyframeAnimation *openOpacityAni = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
 openOpacityAni.values = openValue;
 openOpacityAni.keyTimes = openKeyTime;
 openOpacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 openOpacityAni.repeatCount = MAXFLOAT;
 openOpacityAni.removedOnCompletion = NO;
 openOpacityAni.duration = 8.0;
 openOpacityAni.beginTime = beginTime;
 [opacityOpenLayer addAnimation:openOpacityAni forKey:@"closeOpacity"];
 */


- (void)textGradientLayer{
    
    CGFloat duration = 2;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer:currentLayer];
    
    
    UIColor *oneColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
    UIColor *twoColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    //    UIColor *threeColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    NSArray *colorList =@[(id)oneColor,(id)twoColor,(id)oneColor];
    //  @[(id)oneColor.CGColor,(id)threeColor.CGColor,(id)twoColor.CGColor,(id)threeColor.CGColor,(id)oneColor.CGColor];
    NSArray *locationList = @[@0.1,@0.5,@0.9];
    //    @[@0.1,@0.3,@0.5,@0.7,@0.9];
    AVBasicGradientLayer *shadowLayer = [[AVBasicGradientLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight) colorsList:colorList locationList:locationList startPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1, 0.5)];
    //    shadowLayer.opacity = 0;
    [currentLayer addSublayer:shadowLayer];
    //    NSArray *values = @[@0.0,@1.0,@1.0,@0.0];
    //    NSArray *timeList = @[@0.1,@0.2,@0.9,@1,];
    //    CAKeyframeAnimation *shadowOpacityAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0 propertyName:kAVBasicAniOpacity values:values keyTimes:timeList];
    //
    //    CABasicAnimation *moveBgAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:0 fromValue:@[@0.1,@0.2,@0.3] toValue:@[@0.8,@0.9,@1] propertyName:@"locations"];
    //    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr:@[shadowOpacityAni,moveBgAni]];
    //    [shadowLayer addAnimation:groupAni forKey:@"locations"];
    
    
    
    //    UIColor *oneColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
    //    UIColor *twoColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    //    NSArray *colorList = @[(id)oneColor.CGColor,(id)twoColor.CGColor,(id)oneColor.CGColor];
    //    NSArray *locationList = @[@0.2,@0.5,@0.8];
    //    AVBasicGradientLayer *shadowLayer = [[AVBasicGradientLayer alloc] initWithFrame:kAVRectWindow colorsList:colorList locationList:locationList startPoint:startPoint endPoint:endPoint];
    //    [currentLayer addSublayer:shadowLayer];
    //    CABasicAnimation *moveBgAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime fromValue:@[@0,@0,@0.0] toValue:@[@0.8,@1,@1] propertyName:@"locations"];
    //    [shadowLayer addAnimation:moveBgAni forKey:@"locations"];
    
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
