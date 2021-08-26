//
//  CorporateCompanyTextViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/6/1.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CorporateCompanyTextViewController.h"

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

#import "AVTextFontConstant.h"

@interface CorporateCompanyTextViewController ()

@end

@implementation CorporateCompanyTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    homeLayer.masksToBounds = YES;
    
    [self textSceneDescAni];
    
  //  [self textSceneTitleAni];
    
//    [self broadLineAnimate];
   // [self textSceneDescAni];
//    [self testLineAni];

}

#define kShowHouseShowTitleFontValue 30
#define kShowHouseShowTitleFont  [UIFont fontWithName:@"SnellRoundhand-Bold" size:30]// [UIFont boldSystemFontOfSize:30]
//距离底部的值
#define KBeginTextOffsetY 210
#define kCorporateDefaultWidth (kAVWindowWidth-120)
//开始拐点值
#define kBeginTriangleBreakPointValue 30
//屋顶顶点值
#define kBeginTriangleRowPointValue 90

#define kSHouseSTitleInterval 15

#define kBeginRoofTriangleHeight 30

- (void)textSceneTitleAni{
    
    CGFloat mvoeDuration = 0.9;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    NSString *text = @"王江波的爱情故事";
    CGSize broadSize = [text textBroadSizeWithFont:kShowHouseShowTitleFont maxSize:CGSizeMake(kCorporateDefaultWidth, MAXFLOAT) interval:kSHouseSTitleInterval isDefluatWidth:YES isDefaultHeight:NO];
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+kBeginRoofTriangleHeight)];
    bgLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-KBeginTextOffsetY);
    bgLayer.anchorPoint = CGPointMake(0.5, 0);
    bgLayer.opacity = 0.0f;
    [currentLayer addSublayer:bgLayer];
    
    UIBezierPath *maskPath = [UIBezierPath roofMaksTriangleShape:bgLayer.bounds breakPointValue:kBeginTriangleBreakPointValue rowPointValue:kBeginTriangleRowPointValue];
    AVShapeBaseLayer *maskLayer = [[AVShapeBaseLayer alloc] initWithFrame:bgLayer.bounds bezierPath:maskPath fillColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
    maskLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2+kDefalutLineHeight);
    [bgLayer addSublayer:maskLayer];
    
    UIBezierPath *topLinePath = [UIBezierPath roofTriangleShape:CGRectMake(0, 0, broadSize.width, kBeginRoofTriangleHeight) breakPointValue:kBeginTriangleBreakPointValue rowPointValue:kBeginTriangleRowPointValue];
    AVShapeBaseLayer *topLineLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, kBeginRoofTriangleHeight) bezierPath:topLinePath fillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor] lineWidth:kDefalutLineHeight];
    topLineLayer.position = CGPointMake(bgLayer.width/2, kBeginRoofTriangleHeight/2+kDefalutLineHeight);
    [bgLayer addSublayer:topLineLayer];

    
    NSArray *nextBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:1],
                                  ];
    NSArray *nextBoundCenterValues = @[
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, bgLayer.width,  kBeginRoofTriangleHeight)],
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, bgLayer.width,  kBeginRoofTriangleHeight)],
                                       [NSValue valueWithCGRect:CGRectMake(0, 0, bgLayer.width,bgLayer.height)],
                                       ];
    CAKeyframeAnimation *boundsNextAni = [[AVBasicRouteAnimate alloc] customKeyframe:mvoeDuration-0.3 withBeginTime:0 propertyName:kAVBasicAniBounds values:nextBoundCenterValues keyTimes:nextBoundKeyTime];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.3 withBeginTime:0];
    
    CAAnimationGroup *topGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:mvoeDuration withBeginTime:beginTime aniArr:@[boundsNextAni,opacityOpenAni]];
    
    [bgLayer addAnimation:topGroupAni forKey:@"kAVBasicAniPosition"];
    
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width-(2*kSHouseSTitleInterval), broadSize.height-(2*kSHouseSTitleInterval)) intText:text textFont:kShowHouseShowTitleFont textColor:[UIColor whiteColor]];

    textLayer.position = CGPointMake(bgLayer.width/2, (bgLayer.height+kBeginRoofTriangleHeight)/2+(kShowHouseShowTitleFontValue*kTextFontOffsetFactor2));
    textLayer.alignmentMode = kCAAlignmentLeft;
    [bgLayer addSublayer:textLayer];
    
    AVBasicLayer *bottomLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, kDefalutLineHeight) bgColor:[UIColor whiteColor].CGColor];
    bottomLineLayer.opacity = 0;
    bottomLineLayer.position = CGPointMake(kAVWindowCenter.x, bgLayer.bottom);
    bottomLineLayer.anchorPoint = CGPointMake(0.5, 0);
    [currentLayer addSublayer:bottomLineLayer];
    
    NSArray *lineBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:1],
                                  ];
    NSArray *lineBoundCenterValues = @[
                                       [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, bgLayer.top+kBeginRoofTriangleHeight)],
                                       [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, bgLayer.top+kBeginRoofTriangleHeight)],
                                       [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, bgLayer.bottom)],
                                       ];
    CAKeyframeAnimation *lineBoundsNextAni = [[AVBasicRouteAnimate alloc] customKeyframe:mvoeDuration-0.3 withBeginTime:0 propertyName:kAVBasicAniPosition values:lineBoundCenterValues keyTimes:lineBoundKeyTime];

    CABasicAnimation *lineOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.3 withBeginTime:0];

    CAAnimationGroup *lineGroupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:mvoeDuration withBeginTime:beginTime aniArr:@[lineOpenAni,lineBoundsNextAni]];
    
    [bottomLineLayer addAnimation:lineGroupAni forKey:@"kAVBasicAniPosition"];
    
    AVBasicLayer *shadowCoverLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor];
    [currentLayer addSublayer:shadowCoverLayer];
}

//镜头中间字幕三角path高度
#define kMiddleRoofTriangleHeight 15
//镜头中间字幕三角path开始拐点
#define kMiddleTriangleBreakPointValue 15
//镜头中间字幕三角path顶点
#define kMiddleTriangleRowPointValue 30
//镜头中间字幕底部距离
#define kMiddleTextOffsetY 100
- (void)textSceneDescAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat mvoeDuration = 0.35;
    
    NSString *sceneDescString = @"你都傲娇地偶尔发你了烦恼武汉佛前";
    
    CGSize broadSize = [sceneDescString textBroadSizeWithFont:kDefalutTextFont maxSize:CGSizeMake(kCorporateDefaultWidth, MAXFLOAT) interval:kDefalutInterval isDefluatWidth:YES isDefaultHeight:YES];
    
    CGRect bgLayerRect = CGRectMake(0, 0, broadSize.width, broadSize.height);
    CGPoint layerPosition = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-kMiddleTextOffsetY);
    AVBasicLayer *bgLayer = [self creatMaskAndLineTriangleLayerWithFrame:bgLayerRect
             position:layerPosition
        breakPointValue:kMiddleTriangleBreakPointValue
        rowPointValue:kMiddleTriangleRowPointValue
       triangleHeight:kMiddleRoofTriangleHeight];
    [currentLayer addSublayer:bgLayer];
    
    AVBasicLayer *bottomLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, kDefalutLineHeight) bgColor:[UIColor whiteColor].CGColor];
    bottomLineLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height);
    [bgLayer addSublayer:bottomLineLayer];
    
    bgLayer.mask = bgLayer.maskLayer;
    CGPoint startPosition = CGPointMake(-(bgLayer.width/2), bgLayer.height/2);
    CGPoint nextPosition = CGPointMake(bgLayer.width/2, bgLayer.height/2);
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:mvoeDuration withBeginTime:beginTime fromValue:startPosition toValue:nextPosition];
    [bgLayer.maskLayer addAnimation: moveAni forKey:@"moveAni"];
    
    
    AVBasicLayer *textBgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+kMiddleRoofTriangleHeight-kDefalutLineHeight)];
    textBgLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-kMiddleTextOffsetY);
    [currentLayer addSublayer:textBgLayer];
    
    UIBezierPath *textMaskPath = [UIBezierPath roofMaksTriangleShape:CGRectMake(0, 0, broadSize.width, broadSize.height+kMiddleRoofTriangleHeight-kDefalutLineHeight)
        breakPointValue:kMiddleTriangleBreakPointValue
          rowPointValue:kMiddleTriangleRowPointValue];
    AVShapeBaseLayer *textMaskLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+kMiddleRoofTriangleHeight-kDefalutLineHeight) bezierPath:textMaskPath fillColor:[[UIColor blackColor] colorWithAlphaComponent:0.2]];
    textMaskLayer.position = CGPointMake(textBgLayer.width/2, textBgLayer.height/2+kDefalutLineHeight);
    [textBgLayer addSublayer:textMaskLayer];
    
    textBgLayer.mask = textBgLayer.maskLayer;
    CGPoint startTextPosition = CGPointMake(-(textBgLayer.width/2), textBgLayer.height/2);
    CGPoint nextTextPosition = CGPointMake(textBgLayer.width/2, textBgLayer.height/2);
    CABasicAnimation *textMoveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:mvoeDuration withBeginTime:beginTime+0.35 fromValue:startTextPosition toValue:nextTextPosition];
    [textBgLayer.maskLayer addAnimation:textMoveAni forKey:@"moveAni"];
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, bgLayer.width-(2*kDefalutInterval), textBgLayer.height-2*kDefalutInterval) intText:sceneDescString textFont:kDefalutTextFont textColor:[UIColor whiteColor]];
    textLayer.position = CGPointMake(textBgLayer.width/2, (textBgLayer.height/2+kMiddleRoofTriangleHeight+(kDefultFontValue*kTextFontOffsetFactor2)));
    [textBgLayer addSublayer:textLayer];
    textLayer.alignmentMode = kCAAlignmentLeft;
    [textLayer addAni:mvoeDuration beginTime:beginTime+0.35 aniFactor:AVArtAniTextPlay];
    
}

- (AVBasicLayer *)creatMaskAndLineTriangleLayerWithFrame:(CGRect)frame
                                            position:(CGPoint)position
                                           breakPointValue:(CGFloat)breakPoint
                                             rowPointValue:(CGFloat)rowPoint
                                       triangleHeight:(CGFloat)height{
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+height)];
    bgLayer.position = position;
    
    UIBezierPath *maskPath = [UIBezierPath roofMaksTriangleShape:CGRectMake(0, 0, frame.size.width, frame.size.height+height) breakPointValue:breakPoint rowPointValue:rowPoint];
    AVShapeBaseLayer *maskLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+height) bezierPath:maskPath fillColor:[[UIColor blackColor] colorWithAlphaComponent:0.4]];
    maskLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2+kDefalutLineHeight);
    [bgLayer addSublayer:maskLayer];
    
    UIBezierPath *topLinePath = [UIBezierPath roofTriangleShape:CGRectMake(0, 0, frame.size.width, height) breakPointValue:breakPoint rowPointValue:rowPoint];
    AVShapeBaseLayer *topLineLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, height) bezierPath:topLinePath fillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor] lineWidth:kDefalutLineHeight];
    topLineLayer.position = CGPointMake(bgLayer.width/2, height/2+kDefalutLineHeight);
    [bgLayer addSublayer:topLineLayer];
    
    return bgLayer;
}



- (void)broadLineAnimate{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"floatPhotoBroadBg.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat duration = 3;
    CGFloat leftUpOffsetX = 30;
    CGFloat leftUpOffsetY = 30;
    
    CGFloat leftDownOffsetX = 30;
    CGFloat leftDownOffsetY = kAVWindowHeight-30;
    
    CGFloat rightUpOffsetX = kAVWindowWidth-30;
    CGFloat rightUpOffsetY = 30;
    
    CGFloat rightDownOffsetX = kAVWindowWidth-30;
    CGFloat rightDownOffsetY = kAVWindowHeight-30;
    
    CGFloat lineWidth = (kAVWindowWidth-60)/2;
    CGFloat lineHeight = (kAVWindowHeight-60)/2;
    //vertical垂直   Horizontal水平
    
     CAShapeLayer *leftUpHorizontalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(leftUpOffsetX, leftUpOffsetY) addLinePoint:CGPointMake(leftUpOffsetX, lineHeight) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:leftUpHorizontalLayer];
    
    CAShapeLayer *leftUpVerticalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(leftUpOffsetX, leftUpOffsetY) addLinePoint:CGPointMake(lineWidth, leftUpOffsetY) beginTime:beginTime duration:duration];
   [currentLayer addSublayer:leftUpVerticalLayer];
    
    CAShapeLayer *leftDownHorizontalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(leftDownOffsetX, leftDownOffsetY) addLinePoint:CGPointMake(leftUpOffsetY, lineHeight) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:leftDownHorizontalLayer];
    
    CAShapeLayer *leftDownVerticalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(leftDownOffsetX, leftDownOffsetY) addLinePoint:CGPointMake(lineWidth, leftDownOffsetY) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:leftDownVerticalLayer];
    
    CAShapeLayer *rightUpHorizontalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(rightUpOffsetX, rightUpOffsetY) addLinePoint:CGPointMake(rightUpOffsetX, lineHeight) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:rightUpHorizontalLayer];
    
    CAShapeLayer *rightUpVerticalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(rightUpOffsetX, rightUpOffsetY) addLinePoint:CGPointMake(lineWidth, rightUpOffsetY) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:rightUpVerticalLayer];
    
    CAShapeLayer *rightDownHorizontalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(rightDownOffsetX, rightDownOffsetY) addLinePoint:CGPointMake(rightDownOffsetY, lineHeight) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:rightDownHorizontalLayer];
    
    CAShapeLayer *rightDownVerticalLayer = [self creatLineLayerWithMoveToPoint:CGPointMake(rightDownOffsetX, rightDownOffsetY) addLinePoint:CGPointMake(lineWidth, rightDownOffsetY) beginTime:beginTime duration:duration];
    [currentLayer addSublayer:rightDownVerticalLayer];
}

- (CAShapeLayer *)creatLineLayerWithMoveToPoint:(CGPoint)movePoint
                                   addLinePoint:(CGPoint)toPoint
                                      beginTime:(CFTimeInterval)beginTime
                                       duration:(CFTimeInterval)duration{

    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:movePoint];
    [linePath addLineToPoint:toPoint];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    lineLayer.lineWidth = 3;
    NSArray *nextBoundKeyTime = @[
                                  [NSNumber numberWithFloat:0],
                                  [NSNumber numberWithFloat:0.3],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:1],
                                  ];
    NSArray *nextBoundCenterValues = @[@0, @(1), @(1),@(0.0)];
    CAKeyframeAnimation *boundsNextAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:@"strokeEnd" values:nextBoundCenterValues keyTimes:nextBoundKeyTime];
    [lineLayer addAnimation:boundsNextAni forKey:@"boundsNextAni"];
    return lineLayer;
}

- (void)testLineAni{
    
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"floatPhotoBroadBg.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(30, 30)];
    [linePath addLineToPoint:CGPointMake(30, 200)];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    lineLayer.lineWidth = 3;
    [currentLayer addSublayer:lineLayer];
    
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 1.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeBoth;
    pathAnima.removedOnCompletion = NO;
    
//    [[AVBasicRouteAnimate defaultInstance] customBasic:1 withBeginTime:0 fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
//
    
    CABasicAnimation *pathAnima1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima1.duration = 1.0f;
    pathAnima1.beginTime = 2.0f;
    pathAnima1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima1.fromValue = [NSNumber numberWithFloat:1.0f];
    pathAnima1.toValue = [NSNumber numberWithFloat:0.0f];
    pathAnima1.fillMode = kCAFillModeBoth;
    pathAnima1.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[pathAnima,pathAnima1];
    group.duration = 3;
    group.beginTime = 0;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeBoth;
    [lineLayer addAnimation:group forKey:@"strokeEndAnimation"];
    
//    CABasicAnimation *strokeStratAni = [[AVBasicRouteAnimate defaultInstance] customBasic:1 withBeginTime:1 fromValue:@(1) toValue:@(0) propertyName:@"strokeEnd"];
//    CAAnimationGroup *lineAni = [[AVBasicRouteAnimate defaultInstance] groupAni:3 withBeginTime:0 aniArr:@[strokeEndAni,strokeStratAni]];
//    [lineLayer addAnimation:lineAni forKey:@"lineAniStrokeEnd"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
{
 NSArray *strokeValueList = @[@0,@1,@1,@0];
 NSArray *timeList = @[@0,@3,@4,@7];
 CAKeyframeAnimation *lineStrokeAni = [CAKeyframeAnimation animation];
 lineStrokeAni.keyPath = @"strokeEnd";
 lineStrokeAni.values = strokeValueList;
 lineStrokeAni.keyTimes = timeList;
 lineStrokeAni.removedOnCompletion = NO;
 lineStrokeAni.fillMode = kCAFillModeForwards;
 lineStrokeAni.duration = 7.0f;
 //    lineStrokeAni.timingFunction
 [lineLayer addAnimation:lineStrokeAni forKey:nil];
 AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+kMiddleRoofTriangleHeight)];
 bgLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-100);
 [currentLayer addSublayer:bgLayer];
 
 UIBezierPath *maskPath = [UIBezierPath roofMaksTriangleShape:CGRectMake(0, 0, broadSize.width, broadSize.height+kMiddleRoofTriangleHeight) breakPoint:15 rowPoint:30];
 AVShapeBaseLayer *maskLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height+kMiddleRoofTriangleHeight) bezierPath:maskPath fillColor:[[UIColor blackColor] colorWithAlphaComponent:0.4]];
 maskLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2+kDefalutLineHeight);
 [bgLayer addSublayer:maskLayer];
 
 UIBezierPath *topLinePath = [UIBezierPath roofTriangleShape:CGRectMake(0, 0, broadSize.width, kMiddleRoofTriangleHeight) breakPoint:15 rowPoint:30];
 AVShapeBaseLayer *topLineLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, kMiddleRoofTriangleHeight) bezierPath:topLinePath fillColor:[UIColor clearColor] strokeColor:[UIColor whiteColor] lineWidth:kDefalutLineHeight];
 topLineLayer.position = CGPointMake(bgLayer.width/2, kMiddleRoofTriangleHeight/2+kDefalutLineHeight);
 [bgLayer addSublayer:topLineLayer];
 
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
