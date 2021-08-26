//
//  RecordYearsViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 2017/11/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RecordYearsViewController.h"

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

#import <CoreText/CoreText.h>

#define kCircleBgWidth 250

@interface RecordYearsViewController ()

@property (nonatomic, strong) AVTextAttributedHelper *helper;

@end

@implementation RecordYearsViewController

- (AVTextAttributedHelper *)helper{
    
    if (!_helper) {
        
        _helper = [[AVTextAttributedHelper alloc] init];
    }
    
    return _helper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self circleSubtitle];
//    [self threeMaskMove];
//    [self testScale];
//    [self transScaleToCenter];
    [self circelMaskScaleAni];
//    [self ThreeQuadrilateralRightTransform];
//    [self ThreeQuadrilateralLeftTransform];
//    [self oneLine];
//    [self fiveMaskMoveAni];
//    [self test];
//    [self centerOpenAndToRadiusCrose];
//    [self upToLeftAndDownToRight];
    // Do any additional setup after loading the view.
    
//    [self testLayer];
    
//    [self smallScaleTest];
    
//    [self testTwoPhoto];
}

- (void)testTwoPhoto{
    
    NSString *oneStr = nil;
    NSString *twoStr = nil;
    NSString *threeStr = nil;
    
    NSString *str =@"我们不一样，每个人都有不同的境遇";
    
    oneStr = [str substringToIndex:5];
    
    
    
    NSRange range = NSMakeRange(5, 2);
    twoStr = [str substringWithRange:range];
    NSRange threeRange = NSMakeRange(7, 5);
    threeStr = [str substringWithRange:threeRange];
    
    NSLog(@"one=%@\ntwo=%@\nthree=%@\nlength = %lu",oneStr,twoStr,threeStr, (unsigned long)str.length);
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;
    
    AVBasicLayer *onePhotoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 300, 300) withImage:[UIImage imageNamed:@"heng4"]];
    onePhotoLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:onePhotoLayer];
    
    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] scaleTo:moveDuration withBeginTime:beginTime fromValue:1 toValue:1.2];
    [onePhotoLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    CABasicAnimation *onePhotoOpacityAni = [[AVBasicRouteAnimate alloc] customCGFloat:moveDuration withBeginTime:beginTime+moveDuration fromValue:1 toValue:0 propertyName:@"opacity"];
    [onePhotoLayer addAnimation:onePhotoOpacityAni forKey:@"onePhotoOpacityAni"];
    
    AVBasicLayer *twoPhotoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 300, 300) withImage:[UIImage imageNamed:@"yoona2"]];
    twoPhotoLayer.position = kAVWindowCenter;
    [homeLayer addSublayer:twoPhotoLayer];
    
    CAKeyframeAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"opacity" values:@[@(0),@(0),@(1),@(0)] keyTimes:@[@(0.0),@(0.25),@(0.75),@(1.0)]];
    [twoPhotoLayer addAnimation:opacityAni forKey:@"opacityAni"];
    
}

- (void)smallScaleTest{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    
    [homeLayer addSublayer:bgLayer];
    
    AVBottomLayer *whiteLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 300, 60) bgColor:[UIColor whiteColor].CGColor];
    whiteLayer.allowsEdgeAntialiasing = YES;
    whiteLayer.shouldRasterize = YES;
    whiteLayer.position = kAVWindowCenter;
    [bgLayer addSublayer:whiteLayer];
    
    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customCGFloat:moveDuration withBeginTime:beginTime fromValue:0.7 toValue:1.0 propertyName:@"transform.scale"];
    [whiteLayer addAnimation:scaleAni forKey:@"scaleAni"];
}

- (void)testLayer{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 4;
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    
    [homeLayer addSublayer:bgLayer];
    
    CGRect centerRect = CGRectMake(kAVWindowWidth/2, kAVWindowHeight/2, 0, 0);
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(centerRect, -200, -200)];
    
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(centerRect, -100, -100)];
    
    CAShapeLayer *maskShape = [CAShapeLayer layer];
    maskShape.path = endPath.CGPath;
    [maskShape setValue:[NSNumber numberWithFloat:2.0] forKeyPath:@"transform.scale"];
//    [maskShape setValue:[NSNumber numberWithFloat:2.0] forKey:@"transform.scale"];
    maskShape.fillColor = [UIColor blackColor].CGColor;
    maskShape.strokeColor = [UIColor clearColor].CGColor;
    bgLayer.mask = maskShape;
//
//    CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:@"path"];
//    [maskShape addAnimation:pathAni forKey:@"pathAni"];
    
//    AVBasicLayer *redLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 400, 400) bgColor:[UIColor redColor].CGColor];
//    [bgLayer addSublayer:redLayer];
//
//    AVBottomLayer *whiteLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 200, 200) bgColor:[UIColor whiteColor].CGColor];
//    [bgLayer addSublayer:whiteLayer];
//    
//    AVBasicLayer *copyLayer = [[AVBasicLayer alloc] init];
//    
//    for (CALayer *subLayer in bgLayer.sublayers) {
//
//        if ([subLayer isKindOfClass:[AVBasicLayer class]]) {
//
////            copyLayer = (AVBasicLayer *)[subLayer copy];
//            copyLayer = (AVBasicLayer *)subLayer;
//        }
//    }
//    
//    copyLayer.backgroundColor = [UIColor brownColor].CGColor;
////    copyLayer.frame = CGRectMake(400, 400, 100, 100);
////    [homeLayer addSublayer:copyLayer];
}


- (void)circleSubtitle{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 4;
    
    AVBottomLayer *currentLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    {
        AVBottomLayer *leftCircleLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kCircleBgWidth, kCircleBgWidth) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
        leftCircleLayer.cornerRadius = kCircleBgWidth/2;
        leftCircleLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
        [currentLayer addSublayer:leftCircleLayer];
        leftCircleLayer.mask = leftCircleLayer.maskLayer;
        leftCircleLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
        leftCircleLayer.maskLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(-30), 0, 0, 1);
        
        AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kCircleBgWidth/2, kCircleBgWidth) bgColor:[UIColor blackColor].CGColor];
        [leftCircleLayer.maskLayer addSublayer:maskLayer];
        
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake((kAVWindowWidth+kCircleBgWidth*0.8)/2, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [leftCircleLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(-kCircleBgWidth/4, kCircleBgWidth/2) toValue:CGPointMake(kCircleBgWidth/4, kCircleBgWidth/2) propertyName:@"position"];
        [maskLayer addAnimation:maskAni forKey:@"maskAni"];
    }

    {
        
        AVBottomLayer *rightCircleLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kCircleBgWidth, kCircleBgWidth) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
        rightCircleLayer.position = kAVWindowCenter;
        rightCircleLayer.cornerRadius = kCircleBgWidth/2;
        [currentLayer addSublayer:rightCircleLayer];
        rightCircleLayer.mask = rightCircleLayer.maskLayer;
        rightCircleLayer.maskLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(-30), 0, 0, 1);
        rightCircleLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
        
        
        AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kCircleBgWidth/2, kCircleBgWidth) bgColor:[UIColor blackColor].CGColor];
        [rightCircleLayer.maskLayer addSublayer:maskLayer];
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake((kAVWindowWidth-kCircleBgWidth*0.8)/2, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        [rightCircleLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kCircleBgWidth*1.25, kCircleBgWidth/2) toValue:CGPointMake(kCircleBgWidth*0.75, kCircleBgWidth/2) propertyName:@"position"];
        [maskLayer addAnimation:maskAni forKey:@"maskAni"];
    }
}


- (void)threeMaskMove{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.2;
    
    CGFloat kMaskLayerWidth = (kAVWindowWidth/3+10);
    CGFloat startOffset = 400;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLeftLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    nextLeftLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight);
    [homeLayer addSublayer:nextLeftLayer];
    nextLeftLayer.mask = nextLeftLayer.maskLayer;
    nextLeftLayer.maskLayer.frame = CGRectMake(0, 0, kMaskLayerWidth, kAVWindowHeight);
    nextLeftLayer.maskLayer.position = CGPointMake(kMaskLayerWidth/2, kAVWindowHeight);
    
    AVBasicLayer *nextCenterLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    nextCenterLayer.position = CGPointMake(kAVWindowWidth/2, 0);
    [homeLayer addSublayer:nextCenterLayer];
    nextCenterLayer.mask = nextCenterLayer.maskLayer;
    nextCenterLayer.maskLayer.frame = CGRectMake(0, 0, kMaskLayerWidth, kAVWindowHeight);
    nextCenterLayer.maskLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight);
    
    AVBasicLayer *nextRightLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:nextRightLayer];
    nextRightLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight);
    nextRightLayer.mask = nextRightLayer.maskLayer;
    nextRightLayer.maskLayer.frame = CGRectMake(0, 0, kMaskLayerWidth, kAVWindowHeight);
    nextRightLayer.maskLayer.position = CGPointMake(kAVWindowWidth-kMaskLayerWidth/2, kAVWindowHeight);
    
    {
        
        nextLeftLayer.opacity = 0.0;
        nextCenterLayer.opacity = 0.0;
        nextRightLayer.opacity = 0.0;
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.25 withBeginTime:beginTime];
        
        [nextLeftLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
        [nextRightLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
        [nextCenterLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    }
    beginTime += 0.2;
    //left
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+startOffset) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)];
        
        [nextLeftLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskLayerAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kMaskLayerWidth/2, 0) toValue:CGPointMake(kMaskLayerWidth/2, kAVWindowCenter.y)];
        
        [nextLeftLayer.maskLayer addAnimation:maskLayerAni forKey:@"maskLlayerAni"];
    }
    
    //center
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth/2, -startOffset) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)];
        
        [nextCenterLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskLayerAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kMaskLayerWidth + kMaskLayerWidth/2, kAVWindowHeight) toValue:CGPointMake(kMaskLayerWidth + kMaskLayerWidth/2, kAVWindowCenter.y)];
        
        [nextCenterLayer.maskLayer addAnimation:maskLayerAni forKey:@"maskLlayerAni"];

    }
    
    //right
    {
        
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+startOffset) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)];
        
        [nextRightLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskLayerAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth - kMaskLayerWidth/2,0) toValue:CGPointMake(kAVWindowWidth - kMaskLayerWidth/2, kAVWindowCenter.y)];
        
        [nextRightLayer.maskLayer addAnimation:maskLayerAni forKey:@"maskLlayerAni"];
        
    }
    beginTime += moveDuration;
    //sacle
    {
        
        CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime fromScaleValue:1.2];
        
        [nextLeftLayer addAnimation:saleOutAni forKey:@"sacleAni"];
        [nextCenterLayer addAnimation:saleOutAni forKey:@"sacleAni"];
        [nextRightLayer addAnimation:saleOutAni forKey:@"sacleAni"];
    }
}

- (void)testScale{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:nextLayer];
//    nextLayer.mask = nextLayer.maskLayer;
//    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    CGFloat offsetRadius = 80;
    CGFloat maxOffserRadius = 260;
    
    for (NSInteger index = 0; index < 2; index++) {
        
        AVBottomLayer *nextMaskLayer = [[AVBottomLayer alloc] initWithFrame:nextLayer.bounds withImage:[UIImage imageNamed:@"yoona2.png"]];
        [nextLayer.contentLayer addSublayer:nextMaskLayer];
        nextMaskLayer.mask = nextMaskLayer.maskLayer;
        nextMaskLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
     
        UIBezierPath *circlePath = [UIBezierPath bezierPath];
        [circlePath addArcWithCenter:CGPointMake(kAVWindowWidth/2 , kAVWindowHeight/2) radius:maxOffserRadius-(index*offsetRadius) startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        
        circleLayer.path = circlePath.CGPath;
        circleLayer.fillColor = [UIColor blackColor].CGColor;
        circleLayer.strokeColor = [UIColor clearColor].CGColor;
        [nextMaskLayer.maskLayer addSublayer:circleLayer];
        
        //sacle
        {
            CABasicAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(1-((index+1)*0.1)) toValue:@(1) propertyName:@"transform.scale"];

            [nextMaskLayer addAnimation:sacleAni forKey:@"sacleAni"];

        }
        
    }
    
}

- (void)transScaleToCenter{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1;
    CFTimeInterval moveDuration1 = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    
    
    AVBasicLayer *nextLeftLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:nextLeftLayer];
    
    {
        
        NSString *text = @"3 D   T I T L E S";
        VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
        model.textContent = text;
        model.textFontName = @"Helvetica-Bold";
        model.textFontSize = 38;
        model.textFontColor = [UIColor blackColor];
        
        CGSize textSize = [self.helper boundingRectTextModel:model photoDesc:text areaSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
        
        CGFloat broadWidth = textSize.width+40;
        CGFloat broadHeight = textSize.height;
        
        AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth,broadHeight) bgColor:[UIColor whiteColor].CGColor];
        textBgLayer.position = kAVWindowCenter;
        [nextLeftLayer.contentLayer addSublayer:textBgLayer];
        
        AVBottomLayer *nextMaskLayer = [[AVBottomLayer alloc] initWithFrame:nextLeftLayer.bounds withImage:[UIImage imageNamed:@"heng4.png"]];
        [nextLeftLayer.contentLayer addSublayer:nextMaskLayer];
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
        textLayer.position = kAVWindowCenter;
        nextMaskLayer.mask = textLayer;
        
    }
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"transform.scale" values:@[@(0),@(1.1)] keyTimes:@[@(0),@(1.1)]];

    [nextLeftLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    CAKeyframeAnimation *photoSacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration1 withBeginTime:beginTime+moveDuration*1.1 propertyName:@"transform.scale" values:@[@(1),@(1.2),@(1.4)] keyTimes:@[@(0.0),@(0.01),@(1.0)]];
    
    [nextLeftLayer.contentLayer addAnimation:photoSacleAni forKey:@"saleOutAni"];

}

- (CATextLayer *)createTextLayerWithText:(NSString *)text
                                   frame:(CGRect)frame
                                position:(CGPoint)position
                                fontName:(UIFont *)font
                               textColor:(UIColor *)textColor
{
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.frame = frame;
    textLayer.position = position;
    textLayer.string = text;
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.backgroundColor = [UIColor clearColor].CGColor;
    textLayer.foregroundColor = textColor.CGColor;
    return textLayer;
}

//四边形转场
- (void)ThreeQuadrilateralRightTransform{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1;
    CFTimeInterval moveDuration2 = 1.2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    //添加文字
    {
        VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
        model.textContent = @"F U L L H D";
        model.textFontName = @"Helvetica-Bold";
        model.textFontSize = 40;
        model.textFontColor = [UIColor whiteColor];
        
        AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
        CGSize textSize = [helper boundingRectTextModel:model photoDesc:model.textContent areaSize:CGSizeMake(260, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        CGFloat broadWidth = (textSize.width+60);
        CGFloat broadHeight = (textSize.height+18);
        
        AVBottomLayer *textBGLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
        textBGLayer.position = kAVWindowCenter;
        textBGLayer.borderColor = [UIColor whiteColor].CGColor;
        textBGLayer.borderWidth = 6;
        [nextLayer.contentLayer addSublayer:textBGLayer];
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:model];
        textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
        [textBGLayer addSublayer:textLayer];
        
        CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] scaleTo:AVScaleSlowDuration withBeginTime:beginTime+0.4 fromValue:0.8 toValue:1.1];
        [textBGLayer addAnimation:scaleAni forKey:@"scaleAni"];
    }
    
    CGFloat endOffsetX = 360;
    CGFloat middelOffset = 20;
    //leftPathAni
    
    {
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, 0)];
        [startPath addLineToPoint:CGPointMake(0, 0)];
        [startPath closePath];

        UIBezierPath *middlePath = [UIBezierPath bezierPath];
        [middlePath moveToPoint:CGPointMake(0, 0)];
        [middlePath addLineToPoint:CGPointMake(middelOffset*2, 0)];
        [middlePath addLineToPoint:CGPointMake(0, middelOffset*2)];
        [middlePath closePath];


        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(0, 0)];
        [endPath addLineToPoint:CGPointMake(endOffsetX, 0)];
        [endPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        [endPath closePath];

        CAShapeLayer *triangelShape = [CAShapeLayer layer];
        triangelShape.path = endPath.CGPath;
        triangelShape.fillColor = [UIColor blackColor].CGColor;
        triangelShape.strokeColor = [UIColor clearColor].CGColor;
        [nextLayer.maskLayer addSublayer:triangelShape];

        NSArray *location = @[(id)startPath.CGPath,(id)middlePath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.2),@(1.0)];

        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"path" values:location keyTimes:times];
        [triangelShape addAnimation:pathAni forKey:@"pathAni"];

    }
    
    //centerPathAni
    {

        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake((kAVWindowWidth+endOffsetX)/2, middelOffset)];
        [startPath addLineToPoint:CGPointMake((kAVWindowWidth-endOffsetX)/2, kAVWindowHeight)];
        [startPath closePath];

        UIBezierPath *middelPath = [UIBezierPath bezierPath];
        [middelPath moveToPoint:CGPointMake((kAVWindowWidth+endOffsetX-middelOffset*1.5)/2, middelOffset)];
        [middelPath addLineToPoint:CGPointMake((kAVWindowWidth+endOffsetX+middelOffset*1.5)/2, middelOffset)];
        [middelPath addLineToPoint:CGPointMake((kAVWindowWidth-endOffsetX+middelOffset*1.5)/2, kAVWindowHeight)];
        [middelPath addLineToPoint:CGPointMake((kAVWindowWidth-endOffsetX-middelOffset*1.5)/2, kAVWindowHeight)];
        [middelPath closePath];

        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(endOffsetX, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth-endOffsetX, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        [endPath closePath];

        CAShapeLayer *rectangelShape = [CAShapeLayer layer];
        rectangelShape.path = endPath.CGPath;
        rectangelShape.fillColor = [UIColor blackColor].CGColor;
        rectangelShape.strokeColor = [UIColor clearColor].CGColor;
        [nextLayer.maskLayer addSublayer:rectangelShape];

        NSArray *location = @[(id)startPath.CGPath,(id)middelPath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.2),@(1.0)];
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"path" values:location keyTimes:times];
        [rectangelShape addAnimation:pathAni forKey:@"pathAni"];
    }
    
    {

        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, 0)];
        [startPath addLineToPoint:CGPointMake(0, 0)];
        [startPath closePath];

        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake((kAVWindowWidth-endOffsetX), kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [endPath closePath];

        UIBezierPath *middlePath = [UIBezierPath bezierPath];
        [middlePath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [middlePath addLineToPoint:CGPointMake(kAVWindowWidth-middelOffset*2, kAVWindowHeight)];
        [middlePath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight - middelOffset*2)];
        [middlePath closePath];

        CAShapeLayer *triangelShape = [CAShapeLayer layer];
        triangelShape.path = endPath.CGPath;
        triangelShape.fillColor = [UIColor blackColor].CGColor;
        triangelShape.strokeColor = [UIColor clearColor].CGColor;
        [nextLayer.maskLayer addSublayer:triangelShape];

        NSArray *location = @[(id)startPath.CGPath,(id)middlePath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.2),@(1.0)];

        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"path" values:location keyTimes:times];
        [triangelShape addAnimation:pathAni forKey:@"pathAni"];
    }
    
    //contentLayerAni
    {
        
        CABasicAnimation *sacleAni = [[AVBasicRouteAnimate alloc] scaleTo:AVScaleSlowDuration withBeginTime:beginTime fromValue:1 toValue:1.2];
        [nextLayer.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
        
    }
    
}

- (void)ThreeQuadrilateralLeftTransform{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    //6*0.25
    CFTimeInterval moveDuration2 = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayer];
    nextLayer.mask = nextLayer.maskLayer;
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    {
        
        CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:beginTime propertyName:@"transform.scale" values:@[@(1),@(1),@(1.3)] keyTimes:@[@(0.0),@(0.25),@(1)]];
        
        [nextLayer.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
    }
    
    //next leftDownMask
    {
        
        UIBezierPath *originPath = [UIBezierPath bezierPath];
        [originPath moveToPoint:CGPointMake(0, 465)];
        [originPath addLineToPoint:CGPointMake(0, 465)];
        [originPath addLineToPoint:CGPointMake(135, kAVWindowHeight)];
        [originPath addLineToPoint:CGPointMake(135, kAVWindowHeight)];
        
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, 480)];
        [startPath addLineToPoint:CGPointMake(0, 450)];
        [startPath addLineToPoint:CGPointMake(150, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(120, kAVWindowHeight)];
        [startPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(0, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(0, 60)];
        [endPath addLineToPoint:CGPointMake(300, kAVWindowHeight)];
        [endPath closePath];
        
        CAShapeLayer *leftDownLayer = [CAShapeLayer layer];
        leftDownLayer.path = endPath.CGPath;
        leftDownLayer.fillColor = [UIColor blackColor].CGColor;
        [nextLayer.maskLayer addSublayer:leftDownLayer];
        
        NSArray *location = @[(id)originPath.CGPath,(id)startPath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.1),@(1.0)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2*0.25
             withBeginTime:beginTime
              propertyName:@"path"
                    values:location
                  keyTimes:times];
        
        [leftDownLayer addAnimation:pathAni forKey:@"pathAni"];
        
    }
    
    //next  centerMask
    {
        
        CGFloat offsetY = 60;
        CGFloat offsetX = 30;
        CGFloat extraOffset = 33;//tan(正切)算出来的
        
        UIBezierPath *originPath = [UIBezierPath bezierPath];
        [originPath moveToPoint:CGPointMake(150, offsetY)];
        [originPath addLineToPoint:CGPointMake(150, offsetY)];
        [originPath addLineToPoint:CGPointMake(450, kAVWindowHeight)];
        [originPath addLineToPoint:CGPointMake(450, kAVWindowHeight)];
        [originPath closePath];
        
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(150-offsetX/2, offsetY)];
        [startPath addLineToPoint:CGPointMake(150+offsetX/2, offsetY)];
        [startPath addLineToPoint:CGPointMake(450+offsetX/2, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(450-offsetX/2, kAVWindowHeight)];
        [startPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(-extraOffset+-2, 0)];
        [endPath addLineToPoint:CGPointMake(300+2, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth+extraOffset+2, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(300-2, kAVWindowHeight)];
        [endPath closePath];
        
        CAShapeLayer *centerShapeLayer = [CAShapeLayer layer];
        centerShapeLayer.path = endPath.CGPath;
        centerShapeLayer.fillColor = [UIColor blackColor].CGColor;
        [nextLayer.maskLayer addSublayer:centerShapeLayer];
        
        NSArray *location = @[(id)originPath.CGPath,(id)startPath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.1),@(1.0)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2*0.225
             withBeginTime:beginTime
              propertyName:@"path"
                    values:location
                  keyTimes:times];

        [centerShapeLayer addAnimation:pathAni forKey:@"pathAni"];
    }
    
    //next rightUpMask
    {
        
        UIBezierPath *originPath = [UIBezierPath bezierPath];
        [originPath moveToPoint:CGPointMake(465, 0)];
        [originPath addLineToPoint:CGPointMake(465, 0)];
        [originPath addLineToPoint:CGPointMake(kAVWindowWidth, 135)];
        [originPath addLineToPoint:CGPointMake(kAVWindowWidth, 135)];
        [originPath closePath];
       
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(480, 0)];
        [startPath addLineToPoint:CGPointMake(450, 0)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, 150)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, 120)];
        [startPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(kAVWindowWidth, 0)];
        [endPath addLineToPoint:CGPointMake(300, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, 540)];
        [endPath closePath];
        
        CAShapeLayer *rightUpLayer = [CAShapeLayer layer];
        rightUpLayer.path = endPath.CGPath;
        rightUpLayer.fillColor = [UIColor blackColor].CGColor;
        [nextLayer.maskLayer addSublayer:rightUpLayer];
        
        NSArray *location = @[(id)originPath.CGPath,(id)startPath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.1),@(1.0)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2*0.25
             withBeginTime:beginTime
              propertyName:@"path"
                    values:location
                  keyTimes:times];
        
        [rightUpLayer addAnimation:pathAni forKey:@"pathAni"];
    }
    
    //文字左边
    {
        CGFloat offsetY = 60;
        
        VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
        model.textContent = @"F A S T R E N D R";
        model.textFontName = @"Helvetica-Bold";
        model.textFontSize = 50;
        model.textFontColor = [UIColor whiteColor];
        
        CGSize textSize = [self.helper boundingRectTextModel:model photoDesc:model.textContent areaSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
        
        CGFloat broadHeight = textSize.height*1.5;
        
        /* 斜线点 为了算左边梯形 */
        //上面的点
        CGFloat lengthTwo = (kAVWindowHeight-broadHeight)/2-offsetY;
        CGFloat HLineWidthUp = (lengthTwo*kAVWindowWidth/2)/(kAVWindowHeight-offsetY);
        CGPoint upPoint = CGPointMake(HLineWidthUp, 0);
        //下面的点
        CGFloat lengthOne = (kAVWindowHeight+broadHeight)/2-offsetY;
        CGFloat HLineWidthDown = (lengthOne*kAVWindowWidth/2)/(kAVWindowHeight-offsetY);
        CGPoint downPoint = CGPointMake(HLineWidthDown, broadHeight);
        
        //左边
        {
            AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, broadHeight) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
            blurLayer.position = kAVWindowCenter;
            [nextLayer addSublayer:blurLayer];
            blurLayer.mask = blurLayer.maskLayer;
            blurLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(kAVWindowWidth/2, broadHeight/2);
            [blurLayer addSublayer:textLayer];
            
            UIBezierPath *leftMaskPath = [UIBezierPath bezierPath];
            [leftMaskPath moveToPoint:CGPointMake(0, 0)];
            [leftMaskPath addLineToPoint:upPoint];
            [leftMaskPath addLineToPoint:downPoint];
            [leftMaskPath addLineToPoint:CGPointMake(0, broadHeight)];
            [leftMaskPath closePath];
            
            CAShapeLayer *leftMaskLayer = [CAShapeLayer layer];
            leftMaskLayer.path = leftMaskPath.CGPath;
            leftMaskLayer.fillColor = [UIColor blackColor].CGColor;
            [blurLayer.maskLayer addSublayer:leftMaskLayer];
            
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2
                  withBeginTime:0
                   propertyName:@"transform.scale"
                         values:@[@(1),@(1),@(1.3)]
                       keyTimes:@[@(0.0),@(0.25),@(1)]];

            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration2*0.25 withBeginTime:0 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.85) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration2 withBeginTime:beginTime aniArr:@[sacleAni,positionAni]];
            
            [blurLayer addAnimation:groupAni forKey:@"groupAni"];
        }
        
        //中间
        {
            
            AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, broadHeight) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
            blurLayer.position = kAVWindowCenter;
            [nextLayer addSublayer:blurLayer];
            blurLayer.mask = blurLayer.maskLayer;
            blurLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(kAVWindowWidth/2, broadHeight/2);
            [blurLayer addSublayer:textLayer];
            
            //textLayerANi
            {
                CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration2*0.15 withBeginTime:beginTime+moveDuration2*0.0625 fromValue:CGPointMake(kAVWindowWidth/2, -textSize.height) toValue:CGPointMake(kAVWindowWidth/2, broadHeight/2) propertyName:@"position"];
                
                [textLayer addAnimation:positionAni forKey:@"positionAni"];
            }
            
            UIBezierPath *leftMaskPath = [UIBezierPath bezierPath];
            [leftMaskPath moveToPoint:CGPointMake(HLineWidthUp, 0)];
            [leftMaskPath addLineToPoint:CGPointMake(kAVWindowWidth-HLineWidthDown, 0)];
            [leftMaskPath addLineToPoint:CGPointMake(kAVWindowWidth-HLineWidthUp, broadHeight)];
            [leftMaskPath addLineToPoint:CGPointMake(HLineWidthDown, broadHeight)];
            [leftMaskPath closePath];
            
            CAShapeLayer *leftMaskLayer = [CAShapeLayer layer];
            leftMaskLayer.path = leftMaskPath.CGPath;
            leftMaskLayer.fillColor = [UIColor blackColor].CGColor;
            [blurLayer.maskLayer addSublayer:leftMaskLayer];
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:0 propertyName:@"transform.scale" values:@[@(1),@(1),@(1.3)] keyTimes:@[@(0.0),@(0.25),@(1)]];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration2*0.225 withBeginTime:0 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.15) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration2 withBeginTime:beginTime aniArr:@[sacleAni,positionAni]];
            
            [blurLayer addAnimation:groupAni forKey:@"groupAni"];
        }
        
        //right
        {
            AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, broadHeight) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
            blurLayer.position = kAVWindowCenter;
            [nextLayer addSublayer:blurLayer];
            blurLayer.mask = blurLayer.maskLayer;
            blurLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(kAVWindowWidth/2, broadHeight/2);
            [blurLayer addSublayer:textLayer];
            
            UIBezierPath *leftMaskPath = [UIBezierPath bezierPath];
            [leftMaskPath moveToPoint:CGPointMake(kAVWindowWidth, 0)];
            [leftMaskPath addLineToPoint:CGPointMake(kAVWindowWidth-HLineWidthDown, 0)];
            [leftMaskPath addLineToPoint:CGPointMake(kAVWindowWidth-HLineWidthUp, broadHeight)];
            [leftMaskPath addLineToPoint:CGPointMake(kAVWindowWidth, broadHeight)];
            [leftMaskPath closePath];
            
            CAShapeLayer *leftMaskLayer = [CAShapeLayer layer];
            leftMaskLayer.path = leftMaskPath.CGPath;
            leftMaskLayer.fillColor = [UIColor blackColor].CGColor;
            [blurLayer.maskLayer addSublayer:leftMaskLayer];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration2*0.25 withBeginTime:0 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.85) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration2 withBeginTime:0 propertyName:@"transform.scale" values:@[@(1),@(1),@(1.3)] keyTimes:@[@(0.0),@(0.25),@(1)]];
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration2 withBeginTime:beginTime aniArr:@[sacleAni,positionAni]];
            
            [blurLayer addAnimation:groupAni forKey:@"groupAni"];
            
        }
    }
}

//圆形放大遮罩
- (void)circelMaskScaleAni{
    
    CGFloat textBGCircleRadius = 260;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration =1;
    CFTimeInterval moveDuration1 = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:nextLayer];
    
    CAKeyframeAnimation *photoSacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration1 withBeginTime:beginTime+moveDuration*1.1 propertyName:@"transform.scale"
              values:@[@(1),@(1.2),@(1.4)]
            keyTimes:@[@(0.0),@(0.03),@(1.0)]];
    
    [nextLayer.contentLayer addAnimation:photoSacleAni forKey:@"photoSacleAni"];
    //circle mask Ani
    {
    
    CGRect startRect = CGRectMake(kAVWindowWidth/2, kAVWindowHeight/2, 0, 0);
        
    UIBezierPath *startCirclePath = [UIBezierPath bezierPathWithOvalInRect:startRect];

    UIBezierPath *endCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(startRect, -(kAVWindowWidth-100), -(kAVWindowHeight-100))];

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.path = endCirclePath.CGPath;
    circleLayer.fillColor = [UIColor blackColor].CGColor;
    circleLayer.strokeColor = [UIColor clearColor].CGColor;
    nextLayer.mask = circleLayer;

    CABasicAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:(id)startCirclePath.CGPath toValue:(id)endCirclePath.CGPath propertyName:@"path"];
    [circleLayer addAnimation:sacleAni forKey:@"sacleAni"];
        
    }
    {
        AVBottomLayer *circleBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, textBGCircleRadius, textBGCircleRadius) bgColor:[UIColor clearColor].CGColor];
        circleBgLayer.position = kAVWindowCenter;
        circleBgLayer.borderColor = [UIColor whiteColor].CGColor;
        circleBgLayer.borderWidth = 6;
        circleBgLayer.cornerRadius = textBGCircleRadius/2;
        circleBgLayer.masksToBounds = YES;
        [nextLayer addSublayer:circleBgLayer];
        
        CAKeyframeAnimation *ScaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration1 withBeginTime:beginTime+moveDuration*1.1 propertyName:@"transform.scale"
                  values:@[@(1),@(1.2),@(1.4)]
                keyTimes:@[@(0.0),@(0.03),@(1.0)]];
        
        [circleBgLayer addAnimation:ScaleAni forKey:@"ScaleAni"];
        CGFloat textLayerHeight = 30;
        NSString *photoDesc = @"我们不一样，每个人都有不同的境遇";
        
        NSArray *textList = [self calculateTextCount:photoDesc];
        NSString *textOne = @"";
        NSString *textTwo = @"";
        NSString *textThree = @"";
        
        
        if(textList.count == 1){
            
            textOne = textList[0];
            
//            CGSize textSize = [self.helper boundingRectTextModel: photoDesc:<#(NSString *)#> areaSize:<#(CGSize)#> isEqualWidth:<#(BOOL)#> isEqualHeight:<#(BOOL)#>]
            
        }else if (textList.count == 2){
            
            textOne = textList[0];
            textTwo = textList[1];
            
        }else{
            
            textOne = textList[0];
            textTwo = textList[1];
            textThree = textList[2];
        }
        
        CGRect textBGRect = CGRectMake(0, 0, textBGCircleRadius, textLayerHeight);
        UIFont *textFont = [UIFont fontWithName:@"Helvetica-Bold" size:28];
        
        CGPoint textOnePosition = CGPointMake(textBGCircleRadius/2, textBGCircleRadius/2-textLayerHeight*1.5);
        CATextLayer *textOneLayer = [self createTextLayerWithText:textOne frame:textBGRect
         position:textOnePosition
         fontName:textFont
        textColor:[UIColor whiteColor]];
        
        [circleBgLayer addSublayer:textOneLayer];
        
        CGPoint textTwoPosition = CGPointMake(textBGCircleRadius/2, textBGCircleRadius/2);
        CATextLayer *textTwoLayer = [self createTextLayerWithText:textTwo frame:textBGRect
         position:textTwoPosition
         fontName:textFont
        textColor:[UIColor whiteColor]];
        
        [circleBgLayer addSublayer:textTwoLayer];
        
        CGPoint textThreePosition = CGPointMake(textBGCircleRadius/2, textBGCircleRadius/2+textLayerHeight*1.7);
        CATextLayer *textThreeLayer = [self createTextLayerWithText:textThree frame:textBGRect
           position:textThreePosition
           fontName:textFont
          textColor:[UIColor whiteColor]];
        
        [circleBgLayer addSublayer:textThreeLayer];
        
        //textOneAni
        {
            CGPoint currentPoint = [[textOneLayer valueForKey:@"position"] CGPointValue];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration1 withBeginTime:0 fromValue:currentPoint toValue:CGPointMake(textBGCircleRadius/2, textBGCircleRadius/2-textLayerHeight*1.9) propertyName:@"position"];

            CABasicAnimation *textScaleAni = [[AVBasicRouteAnimate alloc] scaleTo:moveDuration1 withBeginTime:0 fromValue:0.8 toValue:1.2];
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration1 withBeginTime:beginTime+moveDuration*1.11 aniArr:@[positionAni,textScaleAni]];
            [textOneLayer addAnimation:groupAni forKey:@"groupAni"];
        }
        
        CABasicAnimation *textScaleAni = [[AVBasicRouteAnimate alloc] scaleTo:moveDuration1 withBeginTime:beginTime+moveDuration*1.11 fromValue:1 toValue:1.3];
        
        [textTwoLayer addAnimation:textScaleAni forKey:@"textScaleAni"];
        
        {
            CGPoint currentPoint = [[textThreeLayer valueForKey:@"position"] CGPointValue];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration1 withBeginTime:0 fromValue:currentPoint toValue:CGPointMake(textBGCircleRadius/2, textBGCircleRadius/2+textLayerHeight*2.2) propertyName:@"position"];
            
            CABasicAnimation *textScaleAni = [[AVBasicRouteAnimate alloc] scaleTo:moveDuration1 withBeginTime:0 fromValue:0.8 toValue:1.2];
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration1 withBeginTime:beginTime+moveDuration*1.11 aniArr:@[positionAni,textScaleAni]];
            [textThreeLayer addAnimation:groupAni forKey:@"groupAni"];
        }
    }
    
}

- (void)oneLine{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.5;

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *whiteLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor whiteColor].CGColor];
    [currentLayer addSublayer:whiteLayer];
    
    AVBottomLayer *maskCurrentLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.bounds withImage:[UIImage imageNamed:@"yoona2.png"]];
    [currentLayer addSublayer:maskCurrentLayer];
    maskCurrentLayer.mask = maskCurrentLayer.maskLayer;
    maskCurrentLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
   
    CGFloat offset = 30;
    //current left
    {
        UIBezierPath *currentLeftPath = [UIBezierPath bezierPath];
        [currentLeftPath moveToPoint:CGPointMake(0, -offset)];
        [currentLeftPath addLineToPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight)];
        [currentLeftPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        [currentLeftPath closePath];
        
        UIBezierPath *currentEndPath = [UIBezierPath bezierPath];
        [currentEndPath moveToPoint:CGPointMake(0, kAVWindowHeight)];
        [currentEndPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        
        CAShapeLayer *currentLeftMaskLayer = [CAShapeLayer layer];
        currentLeftMaskLayer.path = currentEndPath.CGPath;
        currentLeftMaskLayer.fillColor = [UIColor blackColor].CGColor;
        currentLeftMaskLayer.strokeColor = [UIColor clearColor].CGColor;
        [maskCurrentLayer.maskLayer addSublayer:currentLeftMaskLayer];
        
        CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime+moveDuration*0.5 fromValue:(id)currentLeftPath.CGPath toValue:(id)currentEndPath.CGPath propertyName:@"path"];
        [currentLeftMaskLayer addAnimation:pathAni forKey:@"pathAni"];
        
    }
    
    //current center
    {
        UIBezierPath *currentCenterPath = [UIBezierPath bezierPath];
        [currentCenterPath moveToPoint:CGPointMake(0, 0)];
        [currentCenterPath addLineToPoint:CGPointMake(kAVWindowWidth/2, 0)];
        [currentCenterPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [currentCenterPath addLineToPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight)];
        [currentCenterPath closePath];
        
        UIBezierPath *middelPath = [UIBezierPath bezierPath];
        [middelPath moveToPoint:CGPointMake(0, 0)];
        [middelPath addLineToPoint:CGPointMake(kAVWindowWidth/2-offset, 0)];
        [middelPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [middelPath addLineToPoint:CGPointMake(kAVWindowWidth/2+offset, kAVWindowHeight)];
        [middelPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(kAVWindowWidth/4, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth/2-offset, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth*0.75, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth/2+offset, kAVWindowHeight)];
        [endPath closePath];
        
        
        CAShapeLayer *currentCenterMaskLayer = [CAShapeLayer layer];
        currentCenterMaskLayer.path = endPath.CGPath;
        currentCenterMaskLayer.fillColor = [UIColor blackColor].CGColor;
        currentCenterMaskLayer.strokeColor = [UIColor clearColor].CGColor;
        [maskCurrentLayer.maskLayer addSublayer:currentCenterMaskLayer];
        
        NSArray *location = @[(id)currentCenterPath.CGPath,(id)middelPath.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.5),@(1.0)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime+moveDuration*0.5
             propertyName:@"path"
                   values:location
                 keyTimes:times];
        [currentCenterMaskLayer addAnimation:pathAni forKey:@"pathAni"];
        
    }
    
    //current right
    {
        
        UIBezierPath *currentRightPath = [UIBezierPath bezierPath];
        [currentRightPath moveToPoint:CGPointMake(kAVWindowWidth/2, 0)];
        [currentRightPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [currentRightPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight+offset)];
        [currentRightPath closePath];
        
        UIBezierPath *currentEndPath = [UIBezierPath bezierPath];
        [currentEndPath moveToPoint:CGPointMake(kAVWindowWidth, 0)];
        [currentEndPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        
        CAShapeLayer *currentRightMaskLayer = [CAShapeLayer layer];
        currentRightMaskLayer.path = currentEndPath.CGPath;
        currentRightMaskLayer.fillColor = [UIColor blackColor].CGColor;
        currentRightMaskLayer.strokeColor = [UIColor clearColor].CGColor;
        [maskCurrentLayer.maskLayer addSublayer:currentRightMaskLayer];
        
        CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime+moveDuration*0.5 fromValue:(id)currentRightPath.CGPath toValue:(id)currentEndPath.CGPath propertyName:@"path"];
        [currentRightMaskLayer addAnimation:pathAni forKey:@"pathAni"];
        
    }
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:nextLayer];
    nextLayer.mask = nextLayer.maskLayer;
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    CGFloat extraRadiues = 100;
    //next left
    {
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath addArcWithCenter:CGPointMake(0, 0) radius:(kAVWindowHeight+extraRadiues)/2 startAngle:DEGREES_TO_RADIANS(-270) endAngle:DEGREES_TO_RADIANS(-290) clockwise:NO];
        
        CAShapeLayer *leftMaskLayer = [CAShapeLayer layer];
        leftMaskLayer.path = endPath.CGPath;
        leftMaskLayer.fillColor = [UIColor clearColor].CGColor;
        leftMaskLayer.strokeColor = [UIColor blackColor].CGColor;
        leftMaskLayer.lineWidth = (kAVWindowHeight+extraRadiues);
        [nextLayer.maskLayer addSublayer:leftMaskLayer];
        
        CABasicAnimation *strokeAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
        [leftMaskLayer addAnimation:strokeAni forKey:@"strokeAni"];
    }
    
    //next center
    {
        CGFloat offsetY = 60;
        CGFloat offsetX = 20;
        CGFloat endOffsetX = 216;//600*tan20°
        CGFloat middleOffserX = 100;
        
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(kAVWindowWidth/2, offsetY)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth/2, offsetY)];
        
        UIBezierPath *middlePath = [UIBezierPath bezierPath];
        [middlePath moveToPoint:CGPointMake(kAVWindowWidth/2-offsetX, offsetY)];
        [middlePath addLineToPoint:CGPointMake(kAVWindowWidth/2+offsetX, offsetY)];
        [middlePath addLineToPoint:CGPointMake(kAVWindowWidth/2+offsetX, kAVWindowHeight-offsetY)];
        [middlePath addLineToPoint:CGPointMake(kAVWindowWidth/2-offsetX, kAVWindowHeight-offsetY)];
        [middlePath closePath];
        
        UIBezierPath *middlePath2 = [UIBezierPath bezierPath];
        [middlePath2 moveToPoint:CGPointMake(kAVWindowWidth/2-middleOffserX, 0)];
        [middlePath2 addLineToPoint:CGPointMake(kAVWindowWidth/2, 0)];
        [middlePath2 addLineToPoint:CGPointMake(kAVWindowWidth/2+middleOffserX, kAVWindowHeight)];
        [middlePath2 addLineToPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight)];
        [middlePath2 closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(0, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth-endOffsetX, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(endOffsetX, kAVWindowHeight)];
        [endPath closePath];
        
        CAShapeLayer *middelMaskLayer = [CAShapeLayer layer];
        middelMaskLayer.path = endPath.CGPath;
        middelMaskLayer.fillColor = [UIColor blackColor].CGColor;
        middelMaskLayer.strokeColor = [UIColor clearColor].CGColor;
        [nextLayer.maskLayer addSublayer:middelMaskLayer];
        
        NSArray *pathList = @[(id)startPath.CGPath,(id)middlePath.CGPath,(id)middlePath2.CGPath,(id)endPath.CGPath];
        NSArray *times = @[@(0.0),@(0.2),@(0.6),@(1)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"path" values:pathList keyTimes:times];
        [middelMaskLayer addAnimation:pathAni forKey:@"pathAni"];
        

    }
    
    //next right
    {
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath addArcWithCenter:CGPointMake(kAVWindowWidth, kAVWindowHeight) radius:(kAVWindowHeight+extraRadiues)/2 startAngle:DEGREES_TO_RADIANS(-90) endAngle:DEGREES_TO_RADIANS(-110) clockwise:NO
         ];
        
        CAShapeLayer *rightMaskLayer = [CAShapeLayer layer];
        rightMaskLayer.path = endPath.CGPath;
        rightMaskLayer.fillColor = [UIColor clearColor].CGColor;
        rightMaskLayer.strokeColor = [UIColor blackColor].CGColor;
        rightMaskLayer.lineWidth = (kAVWindowHeight+extraRadiues);
        [nextLayer.maskLayer addSublayer:rightMaskLayer];
        
        CABasicAnimation *strokeAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
        [rightMaskLayer addAnimation:strokeAni forKey:@"strokeAni"];
        
    }
    
    //文字
    {
        VCAnimateTextModel *topModel = [[VCAnimateTextModel alloc] init];
        topModel.textContent = @"H  E  L  P";
        topModel.textFontName = @"Helvetica-Bold";
        topModel.textFontSize = 60;
        topModel.textFontColor = [UIColor whiteColor];
        
        AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
        CGSize textSize = [helper boundingRectTextModel:topModel photoDesc:topModel.textContent areaSize:CGSizeMake(kAVWindowWidth/2, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:topModel];
        textLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2-offset);
        [nextLayer.contentLayer addSublayer:textLayer];
        
        VCAnimateTextModel *downModel = [[VCAnimateTextModel alloc] init];
        downModel.textContent = @"P  D  F";
        downModel.textFontName = @"Helvetica-Bold";
        downModel.textFontSize = 24;
        downModel.textFontColor = [UIColor blackColor];
        
        AVTextAttributedHelper *downHelper = [[AVTextAttributedHelper alloc] init];
        
        CGSize downTextSize = [downHelper boundingRectTextModel:downModel photoDesc:downModel.textContent areaSize:CGSizeMake(kAVWindowWidth/2-3*offset, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        CGFloat broadWidth = downTextSize.width;
        CGFloat broadHeight = downTextSize.height;
        
        AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth,broadHeight) bgColor:[UIColor whiteColor].CGColor];
        textBgLayer.position = CGPointMake(kAVWindowWidth/2, textLayer.bottom+broadHeight/2);
        [nextLayer.contentLayer addSublayer:textBgLayer];

        AVBottomLayer *nextMaskLayer = [[AVBottomLayer alloc] initWithFrame:nextLayer.bounds withImage:[UIImage imageNamed:@"heng4.png"]];
        [nextLayer.contentLayer addSublayer:nextMaskLayer];
        
        AVBasicTextLayer *downTextLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, downTextSize.width, downTextSize.height) text:downHelper.attributedString textModel:downModel];
        downTextLayer.position = CGPointMake(kAVWindowWidth/2, textLayer.bottom+broadHeight/2);
        nextMaskLayer.mask = downTextLayer;
    }
    
    {
        
        CABasicAnimation *photoLayerAni = [[AVBasicRouteAnimate alloc] scaleTo:AVScaleSlowDuration withBeginTime:beginTime fromValue:1 toValue:1.2];
        
        [nextLayer.contentLayer addAnimation:photoLayerAni forKey:@"photoLayerAni"];
        
    }

}
//当前斜着从中间打开，next从两角关闭
- (void)centerOpenAndToRadiusCrose{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;
    
    AVBottomLayer *bgWhiteLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor whiteColor].CGColor];
    [homeLayer addSublayer:bgWhiteLayer];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    currentLayer.mask = currentLayer.maskLayer;
    currentLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    //currentLeftMask
    {
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, 0)];
        [startPath addLineToPoint:CGPointMake(450, 0)];
        [startPath addLineToPoint:CGPointMake(150, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        [startPath closePath];
        
        UIBezierPath *leftEndPath = [UIBezierPath bezierPath];
        [leftEndPath moveToPoint:CGPointMake(0, 0)];
        [leftEndPath addLineToPoint:CGPointMake(300, 0)];
        [leftEndPath addLineToPoint:CGPointMake(50, kAVWindowHeight)];
        [leftEndPath addLineToPoint:CGPointMake(0, kAVWindowHeight)];
        [leftEndPath closePath];
        
        CAShapeLayer *leftShapeLayer = [CAShapeLayer layer];
        leftShapeLayer.path = leftEndPath.CGPath;
        leftShapeLayer.fillColor = [UIColor blackColor].CGColor;
        leftShapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [currentLayer.maskLayer addSublayer:leftShapeLayer];
        
        CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.68 withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)leftEndPath.CGPath propertyName:@"path"];
        [leftShapeLayer addAnimation:pathAni forKey:@"pathAni"];
        
    }
    
    //current right mask
    {
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(150, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(450, 0)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [startPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(300, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(550, 0)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, 0)];
        [endPath closePath];
        
        CAShapeLayer *leftShapeLayer = [CAShapeLayer layer];
        leftShapeLayer.path = endPath.CGPath;
        leftShapeLayer.fillColor = [UIColor blackColor].CGColor;
        leftShapeLayer.strokeColor = [UIColor clearColor].CGColor;
        [currentLayer.maskLayer addSublayer:leftShapeLayer];
        
        CABasicAnimation *pathAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.68 withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:@"path"];
        [leftShapeLayer addAnimation:pathAni forKey:@"pathAni"];
    
    }
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayer];
    nextLayer.mask = nextLayer.maskLayer;
    nextLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
    
    //nextLeftMask
    {
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(0, 0)];
        [startPath addLineToPoint:CGPointMake(0, 0)];
        
        UIBezierPath *centerPath = [UIBezierPath bezierPath];
        [centerPath moveToPoint:CGPointMake(0, 0)];
        [centerPath addLineToPoint:CGPointMake(300, 0)];
        [centerPath addLineToPoint:CGPointMake(0, kAVWindowHeight+120)];
        [centerPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(0, 0)];
        [endPath addLineToPoint:CGPointMake(452, 0)];
        [endPath addLineToPoint:CGPointMake(0, kAVWindowHeight+300)];
        [endPath closePath];
        
        CAShapeLayer *leftShape = [CAShapeLayer layer];
        leftShape.path = endPath.CGPath;
        leftShape.fillColor = [UIColor blackColor].CGColor;
        [nextLayer.maskLayer addSublayer:leftShape];
        
        NSArray *locations = @[(id)startPath.CGPath,
                               (id)centerPath.CGPath,
                               (id)centerPath.CGPath,
                               (id)endPath.CGPath];
        NSArray *times = @[@(0.0),
                           @(0.68),
                           @(0.7),
                           @(1.0)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"path" values:locations keyTimes:times];
        [leftShape addAnimation:pathAni forKey:@"pathAni"];
    }
    
    //nextRightMask
    {
        
        UIBezierPath *startPath = [UIBezierPath bezierPath];
        [startPath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [startPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        
        UIBezierPath *centerPath = [UIBezierPath bezierPath];
        [centerPath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [centerPath addLineToPoint:CGPointMake(300, kAVWindowHeight)];
        [centerPath addLineToPoint:CGPointMake(kAVWindowWidth, -120)];
        [centerPath closePath];
        
        UIBezierPath *endPath = [UIBezierPath bezierPath];
        [endPath moveToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(148, kAVWindowHeight)];
        [endPath addLineToPoint:CGPointMake(kAVWindowWidth, -300)];
        [endPath closePath];
        
        CAShapeLayer *leftShape = [CAShapeLayer layer];
        leftShape.path = endPath.CGPath;
        leftShape.fillColor = [UIColor blackColor].CGColor;
        [nextLayer.maskLayer addSublayer:leftShape];
        
        NSArray *locations = @[(id)startPath.CGPath,
                               (id)centerPath.CGPath,
                               (id)centerPath.CGPath,
                               (id)endPath.CGPath];
        NSArray *times = @[@(0.0),
                           @(0.68),
                           @(0.7),
                           @(1.0)];
        
        CAKeyframeAnimation *pathAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"path" values:locations keyTimes:times];
        [leftShape addAnimation:pathAni forKey:@"pathAni"];
    }
    
    
    //text
    {
        
        VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
        model.textContent = @"AFTER EFFECTS";
        model.textFontName = @"Helvetica-Bold";
        model.textFontSize = 50;
        model.textFontColor = [UIColor whiteColor];
        
        AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
        CGSize textSize = [helper boundingRectTextModel:model photoDesc:model.textContent areaSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
        
        CGFloat broadHeight = textSize.height+16;
        
        AVBottomLayer *blurLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, broadHeight) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
        blurLayer.position = kAVWindowCenter;
        [nextLayer addSublayer:blurLayer];
        
        AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, textSize.width, broadHeight) bgColor:[UIColor clearColor].CGColor];
        textBgLayer.position = CGPointMake(kAVWindowWidth/2, broadHeight/2);
        [blurLayer addSublayer:textBgLayer];
        {
            
            AVBasicTextLayer *textLeftLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:model];
            textLeftLayer.position = CGPointMake(textSize.width/2, broadHeight/2);
            [textBgLayer addSublayer:textLeftLayer];
            textLeftLayer.mask = textLeftLayer.maskLayer;
            textLeftLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
            
            AVBottomLayer *textMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, textSize.width/2, textSize.height) bgColor:[UIColor blackColor].CGColor];
            [textLeftLayer.maskLayer addSublayer:textMaskLayer];
            
            CGPoint point1 = CGPointMake(textSize.width, broadHeight/2);
            CGPoint point2 = CGPointMake(textSize.width/2, broadHeight/2);
            
            NSArray *locaitions =@[[NSValue valueWithCGPoint:point1],
                                   [NSValue valueWithCGPoint:point1],
                                   [NSValue valueWithCGPoint:point2]];
            NSArray *times = @[@(0.0),@(0.75),@(1.0)];
            
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"position" values:locaitions keyTimes:times];
        
            [textLeftLayer addAnimation:positionAni forKey:@"positionAni"];
        
            CGPoint point3 = CGPointMake(-textSize.width/4, broadHeight/2);
            CGPoint point4 = CGPointMake(textSize.width/4, broadHeight/2);
            
            NSArray *values = @[[NSValue valueWithCGPoint:point3],
                                [NSValue valueWithCGPoint:point3],
                                [NSValue valueWithCGPoint:point4]];
            
            CAKeyframeAnimation *maskAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];

            [textMaskLayer addAnimation:maskAni forKey:@"maskAni"];
            
        }
        
        
        {
            AVBasicTextLayer *textRightLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:model];
            textRightLayer.position = CGPointMake(kAVWindowWidth/2, broadHeight/2);
            [textBgLayer addSublayer:textRightLayer];
            textRightLayer.mask = textRightLayer.maskLayer;
            textRightLayer.mask.backgroundColor = [UIColor clearColor].CGColor;
            
            AVBottomLayer *textMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, textSize.width/2, textSize.height) bgColor:[UIColor blackColor].CGColor];
            [textRightLayer.maskLayer addSublayer:textMaskLayer];
            
            CGPoint point1 = CGPointMake(0, broadHeight/2);
            CGPoint point2 = CGPointMake(textSize.width/2, broadHeight/2);
            
            NSArray *locaitions =@[[NSValue valueWithCGPoint:point1],
                                   [NSValue valueWithCGPoint:point1],
                                   [NSValue valueWithCGPoint:point2]];
            NSArray *times = @[@(0.0),@(0.75),@(1.0)];
            
            CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"position" values:locaitions keyTimes:times];
            
            [textRightLayer addAnimation:positionAni forKey:@"positionAni"];
            
            CGPoint point3 = CGPointMake(textSize.width*1.25, broadHeight/2);
            CGPoint point4 = CGPointMake(textSize.width*0.75, broadHeight/2);
            
            NSArray *values = @[[NSValue valueWithCGPoint:point3],
                                [NSValue valueWithCGPoint:point3],
                                [NSValue valueWithCGPoint:point4]];
            
            CAKeyframeAnimation *maskAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"position" values:values keyTimes:times];
            
            [textMaskLayer addAnimation:maskAni forKey:@"maskAni"];
            
        }
    }
}

- (void)fiveMaskMoveAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 6;
    
    CGFloat kMaskWidthOne = 110;
    CGFloat KMaskWidthTwo = (kAVWindowWidth-2*kMaskWidthOne)/3+10;
    CGFloat startOffset = 400;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    //one
    AVBasicLayer *nextLayerOne = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerOne];

    AVBottomLayer *oneLayerMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kMaskWidthOne, kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
    nextLayerOne.mask = oneLayerMask;
    //one Ani
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
            withBeginTime:beginTime
                fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+startOffset)
                  toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)
             propertyName:@"position"];
        [nextLayerOne addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
            withBeginTime:beginTime
                fromValue:CGPointMake(kMaskWidthOne/2, 0)
                  toValue:CGPointMake(kMaskWidthOne/2, kAVWindowHeight/2)
             propertyName:@"position"];
        [oneLayerMask addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //two
    AVBasicLayer *nextLayerTwo = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerTwo];
    
    AVBottomLayer *twoLayerMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, KMaskWidthTwo, kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
    twoLayerMask.position = CGPointMake(kMaskWidthOne+KMaskWidthTwo*0.5, kAVWindowHeight/2);
    nextLayerTwo.mask = twoLayerMask;
    //two Ani
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kAVWindowWidth/2, -startOffset)
                   toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)
              propertyName:@"position"];
        [nextLayerTwo addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kMaskWidthOne+KMaskWidthTwo*0.5, kAVWindowHeight)
                   toValue:CGPointMake(kMaskWidthOne+KMaskWidthTwo*0.5, kAVWindowHeight/2)
              propertyName:@"position"];
        [twoLayerMask addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //three
    AVBasicLayer *nextLayerThree = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerThree];
    
    AVBottomLayer *threeLayerMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, KMaskWidthTwo, kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
    threeLayerMask.position = CGPointMake(kMaskWidthOne+KMaskWidthTwo*1.5, kAVWindowHeight/2);
    nextLayerThree.mask = threeLayerMask;
    
    //three Ani
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+startOffset)
                   toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)
              propertyName:@"position"];
        [nextLayerThree addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kMaskWidthOne+KMaskWidthTwo*1.5, 0)
                   toValue:CGPointMake(kMaskWidthOne+KMaskWidthTwo*1.5, kAVWindowHeight/2)
              propertyName:@"position"];
        [threeLayerMask addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //four
    AVBasicLayer *nextLayerFour = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerFour];

    AVBottomLayer *fourLayerMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, KMaskWidthTwo, kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
     fourLayerMask.position = CGPointMake(kMaskWidthOne+KMaskWidthTwo*2.5, kAVWindowHeight/2);
    nextLayerFour.mask = fourLayerMask;
    
    //fourAni
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kAVWindowWidth/2, -startOffset)
                   toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)
              propertyName:@"position"];
        [nextLayerFour addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kMaskWidthOne+KMaskWidthTwo*2.5, kAVWindowHeight)
                   toValue:CGPointMake(kMaskWidthOne+KMaskWidthTwo*2.5, kAVWindowHeight/2)
              propertyName:@"position"];
        [fourLayerMask addAnimation:maskAni forKey:@"maskAni"];
    }
    
    //five
    AVBasicLayer *nextLayerFive = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerFive];
    
    AVBottomLayer *fiveLayerMask = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, KMaskWidthTwo, kAVWindowHeight) bgColor:[UIColor blackColor].CGColor];
    fiveLayerMask.position = CGPointMake(kAVWindowWidth-kMaskWidthOne/2, kAVWindowHeight/2);
    nextLayerFive.mask = fiveLayerMask;
    
    //five Ani
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight+startOffset)
                   toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)
              propertyName:@"position"];
        [nextLayerFive addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.3
             withBeginTime:beginTime
                 fromValue:CGPointMake(kAVWindowWidth-kMaskWidthOne/2, 0)
                   toValue:CGPointMake(kAVWindowWidth-kMaskWidthOne/2, kAVWindowHeight/2)
              propertyName:@"position"];
        [fiveLayerMask addAnimation:maskAni forKey:@"maskAni"];
    }
    
    
    //文字
    {
        
        CGFloat kLineHeiht = 2;
        
        VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
        model.textContent = @"N O  P L U G I N S";
        model.textFontName = @"Helvetica-Bold";
        model.textFontSize = 40;
        model.textFontColor = [UIColor whiteColor];
        
        CGSize textSize = [self.helper boundingRectTextModel:model photoDesc:model.textContent areaSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
        
        CGFloat broadHeight = textSize.height+10;
        CGFloat broadWidth = textSize.width+18;
        
        {
            AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
            textBgLayer.masksToBounds = YES;
            textBgLayer.position = kAVWindowCenter;
            [nextLayerOne addSublayer:textBgLayer];
            
            AVBottomLayer *upLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            [textBgLayer addSublayer:upLineLayer];
            
            AVBottomLayer *downLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            downLineLayer.position = CGPointMake(broadWidth/2, broadHeight-kLineHeiht/2);
            [textBgLayer addSublayer:downLineLayer];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
            [textBgLayer addSublayer:textLayer];
            
            CGPoint fromPoint = CGPointMake(broadWidth/2, -broadHeight/2);
            CGPoint toPoint = CGPointMake(broadWidth/2, broadHeight/2);
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.15 withBeginTime:beginTime+moveDuration*0.15
                                                                             fromValue:fromPoint
                                                                               toValue:toPoint
                                                                          propertyName:@"position"];
            
            [textLayer addAnimation:positionAni forKey:@"positionAni"];
            
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"transform.scale" values:@[@(1),@(1),@(1.2)] keyTimes:@[@(0.0),@(0.3),@(1)]];
            
            [textBgLayer addAnimation:sacleAni forKey:@"sacleAni"];
        
        }
        
        
        //left
        {
         
            AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
            textBgLayer.masksToBounds = YES;
            textBgLayer.position = kAVWindowCenter;
            [nextLayerTwo addSublayer:textBgLayer];
            
            AVBottomLayer *upLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            [textBgLayer addSublayer:upLineLayer];
            
            AVBottomLayer *downLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            downLineLayer.position = CGPointMake(broadWidth/2, broadHeight-kLineHeiht/2);
            [textBgLayer addSublayer:downLineLayer];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
            [textBgLayer addSublayer:textLayer];
            
            CGPoint fromPoint = CGPointMake(broadWidth/2, -broadHeight/2);
            CGPoint toPoint = CGPointMake(broadWidth/2, broadHeight/2);
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.15 withBeginTime:beginTime+moveDuration*0.15
                    fromValue:fromPoint
                      toValue:toPoint
                 propertyName:@"position"];
            
            [textLayer addAnimation:positionAni forKey:@"positionAni"];
            
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"transform.scale" values:@[@(1),@(1),@(1.2)] keyTimes:@[@(0.0),@(0.3),@(1)]];
            
            [textBgLayer addAnimation:sacleAni forKey:@"sacleAni"];
            
        }
        
        //center
        {
           
            AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
            textBgLayer.masksToBounds = YES;
            textBgLayer.position = kAVWindowCenter;
            [nextLayerThree addSublayer:textBgLayer];
            
            AVBottomLayer *upLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            [textBgLayer addSublayer:upLineLayer];
            
            AVBottomLayer *downLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            downLineLayer.position = CGPointMake(broadWidth/2, broadHeight-kLineHeiht/2);
            [textBgLayer addSublayer:downLineLayer];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
            [textBgLayer addSublayer:textLayer];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.15 withBeginTime:beginTime+moveDuration*0.15        fromValue:CGPointMake(broadWidth/2, broadHeight*1.5) toValue:CGPointMake(broadWidth/2, broadHeight/2) propertyName:@"position"];
            [textLayer addAnimation:positionAni forKey:@"positionAni"];
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration
                 withBeginTime:beginTime
                  propertyName:@"transform.scale"
                        values:@[@(1),@(1),@(1.2)]
                      keyTimes:@[@(0.0),@(0.3),@(1)]];
            [textBgLayer addAnimation:sacleAni forKey:@"sacleAni"];
        }
        
        //right
        {
            
            AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
            textBgLayer.masksToBounds = YES;
            textBgLayer.position = kAVWindowCenter;
            [nextLayerFour addSublayer:textBgLayer];
            
            AVBottomLayer *upLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            [textBgLayer addSublayer:upLineLayer];
            
            AVBottomLayer *downLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            downLineLayer.position = CGPointMake(broadWidth/2, broadHeight-kLineHeiht/2);
            [textBgLayer addSublayer:downLineLayer];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
            [textBgLayer addSublayer:textLayer];
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.15 withBeginTime:beginTime+moveDuration*0.15 fromValue:CGPointMake(broadWidth/2, -broadHeight/2) toValue:CGPointMake(broadWidth/2, broadHeight/2) propertyName:@"position"];
            [textLayer addAnimation:positionAni forKey:@"positionAni"];
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration
                 withBeginTime:beginTime
                  propertyName:@"transform.scale"
                        values:@[@(1),@(1),@(1.2)]
                      keyTimes:@[@(0.0),@(0.3),@(1)]];
            [textBgLayer addAnimation:sacleAni forKey:@"sacleAni"];
        }
        
        {
            
            AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
            textBgLayer.masksToBounds = YES;
            textBgLayer.position = kAVWindowCenter;
            [nextLayerFive addSublayer:textBgLayer];
            
            AVBottomLayer *upLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            [textBgLayer addSublayer:upLineLayer];
            
            AVBottomLayer *downLineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, kLineHeiht) bgColor:[UIColor whiteColor].CGColor];
            downLineLayer.position = CGPointMake(broadWidth/2, broadHeight-kLineHeiht/2);
            [textBgLayer addSublayer:downLineLayer];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
            [textBgLayer addSublayer:textLayer];
            
            CGPoint fromPoint = CGPointMake(broadWidth/2, -broadHeight/2);
            CGPoint toPoint = CGPointMake(broadWidth/2, broadHeight/2);
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration*0.15 withBeginTime:beginTime+moveDuration*0.15
                                                                             fromValue:fromPoint
                                                                               toValue:toPoint
                                                                          propertyName:@"position"];
            
            [textLayer addAnimation:positionAni forKey:@"positionAni"];
            
            
            CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"transform.scale" values:@[@(1),@(1),@(1.2)] keyTimes:@[@(0.0),@(0.3),@(1)]];
            
            [textBgLayer addAnimation:sacleAni forKey:@"sacleAni"];
            
        }
    }
    
    //scaleAni
    {
        
        CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"transform.scale" values:@[@(1),@(1),@(1.2)] keyTimes:@[@(0.0),@(0.3),@(1)]];
        [nextLayerOne.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
        [nextLayerTwo.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
        [nextLayerThree.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
        [nextLayerFour.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
        [nextLayerFive.contentLayer addAnimation:sacleAni forKey:@"sacleAni"];
    }
}

- (CAAnimationGroup *)moveAndScaleWithDuration:(CFTimeInterval)duration
                                     beginTime:(CFTimeInterval)beginTime
                                     fromPoint:(CGPoint)fromPoint
                                       toPoint:(CGPoint)toPoint{
    
    CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
          withBeginTime:0
           propertyName:@"transform.scale"
                 values:@[@(1),@(1),@(1.2)]
               keyTimes:@[@(0.0),@(0.3),@(1)]];
    
    NSArray *locations = @[[NSValue valueWithCGPoint:fromPoint],
                           [NSValue valueWithCGPoint:fromPoint],
                           [NSValue valueWithCGPoint:toPoint]];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
         withBeginTime:0
          propertyName:@"position"
                values:locations
              keyTimes:@[@(0.0),@(0.3),@(1)]];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[sacleAni,positionAni]];
    
    return groupAni;
    
}

- (void)test{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 4;
    
    AVBottomLayer *currentLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
    model.textContent = @"F A S T R E N D R";
    model.textFontName = @"PingFangSC-Ultralight";
    model.textFontSize = 50;
    model.textFontColor = [UIColor whiteColor];
    
    CGSize textSize = [self.helper boundingRectTextModel:model photoDesc:model.textContent areaSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
    textLayer.position = kAVWindowCenter;
    [currentLayer addSublayer:textLayer];
    textLayer.mask = textLayer.maskLayer;
    
    CGRect fromRect = CGRectMake(0, 0, textSize.width, 0);
    CGRect toRect = CGRectMake(0, 0, textSize.width, textSize.height);
    
    CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:kAVBasicAniBounds];
    [textLayer.maskLayer addAnimation:boundsAni forKey:@"boundsAni"];

}

- (void)upToLeftAndDownToRight{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval duration = 6;
    CFTimeInterval moveDuration = 1;
    
    CGFloat startOffset = 400;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"heng4"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayerOne = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerOne];
    
    nextLayerOne.mask = nextLayerOne.maskLayer;
    nextLayerOne.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2);
    //
    
    CAMediaTimingFunction *timingFunction =  [CAMediaTimingFunction functionWithControlPoints: 0.15 : 0.00 : 0.3 : 0.8];
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth+startOffset, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
//        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
        //[CAMediaTimingFunction functionWithControlPoints: 0.645 : 0.045 : 0.355 : 1.0]
        positionAni.timingFunction = timingFunction;
        [nextLayerOne addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(0, kAVWindowHeight/4) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/4) propertyName:@"position"];
        maskAni.timingFunction = timingFunction;
        [nextLayerOne.maskLayer addAnimation:maskAni forKey:@"maskAni"];
    }
    
    
    AVBasicLayer *nextLayerTwo = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
    [homeLayer addSublayer:nextLayerTwo];
    
    nextLayerTwo.mask = nextLayerTwo.maskLayer;
    nextLayerTwo.maskLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2);
    
    //
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(-startOffset, kAVWindowHeight/2) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2) propertyName:@"position"];
        positionAni.timingFunction = timingFunction;
        [nextLayerTwo addAnimation:positionAni forKey:@"positionAni"];
        
        CABasicAnimation *maskAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:beginTime fromValue:CGPointMake(kAVWindowWidth, kAVWindowHeight*0.75) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75) propertyName:@"position"];
        maskAni.timingFunction = timingFunction;
        [nextLayerTwo.maskLayer addAnimation:maskAni forKey:@"maskAni"];
        
    }
    
    {
        
        CABasicAnimation *saleOutAni =  [[AVBasicRouteAnimate alloc] scaleTo:4 withBeginTime:beginTime+moveDuration
                                                                   fromValue:1 toValue:1.2];
        [nextLayerOne.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        [nextLayerTwo.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    
    //文字
    {
        
        VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
        model.textContent = @"P R E S E N T S";
        model.textFontName = @"Helvetica-Bold";
        model.textFontSize = 30;
        model.textFontColor = [UIColor whiteColor];
        
        CGSize textSize = [self.helper boundingRectTextModel:model
                       photoDesc:model.textContent
                        areaSize:CGSizeMake(kAVWindowWidth-100, MAXFLOAT)
                    isEqualWidth:NO
                   isEqualHeight:NO];

        CGFloat broadWidth = textSize.width+ 60 ;
        CGFloat broadHeight = textSize.height + 10;

            //up
            {
                AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight)
                                                                          bgColor:[UIColor clearColor].CGColor];
                textBgLayer.masksToBounds = YES;
                textBgLayer.borderColor = [UIColor whiteColor].CGColor;
                textBgLayer.borderWidth = 5;
                textBgLayer.position = kAVWindowCenter;
//                [nextLayerOne addSublayer:textBgLayer];
                
                CAAnimationGroup *groupAni = [self creatSquareBroadAni:duration
                             beginTime:beginTime
                             fromPoint:CGPointMake(kAVWindowWidth/2, (kAVWindowHeight+broadHeight)/2)
                               toPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)];
                [textBgLayer addAnimation:groupAni forKey:@"groupAni"];
                
                AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
                textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
                textLayer.mask = textLayer.maskLayer;
                [textBgLayer addSublayer:textLayer];
                
                CGRect fromRect = CGRectMake(0, 0, textSize.width, 0);
                CGRect toRect = CGRectMake(0, 0, textSize.width, textSize.height);
                
                CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.3 withBeginTime:beginTime+moveDuration*0.9 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:kAVBasicAniBounds];
                
                [textLayer addAnimation:boundsAni forKey:@"boundsAni"];
            
        }
        
        //down
        {
            AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight)
                                                                      bgColor:[UIColor clearColor].CGColor];
            textBgLayer.masksToBounds = YES;
            textBgLayer.borderColor = [UIColor whiteColor].CGColor;
            textBgLayer.borderWidth = 5;
            textBgLayer.position = kAVWindowCenter;
//            [nextLayerTwo addSublayer:textBgLayer];
            
            CAAnimationGroup *groupAni = [self creatSquareBroadAni:duration
                                                         beginTime:beginTime
                                                         fromPoint:CGPointMake(kAVWindowWidth/2, (kAVWindowHeight-broadHeight)/2)
                                                           toPoint:CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2)];
            [textBgLayer addAnimation:groupAni forKey:@"groupAni"];
            
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:model];
            textLayer.position = CGPointMake(broadWidth/2, broadHeight/2);
            textLayer.mask = textLayer.maskLayer;
            [textBgLayer addSublayer:textLayer];
            
            CGRect fromRect = CGRectMake(0, 0, textSize.width, 0);
            CGRect toRect = CGRectMake(0, 0, textSize.width, textSize.height);
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration*0.3 withBeginTime:beginTime+moveDuration*0.9 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:kAVBasicAniBounds];
            
            [textLayer addAnimation:boundsAni forKey:@"boundsAni"];
            
        }
    }
}
    
- (CAAnimationGroup *)creatSquareBroadAni:(CGFloat)duration
                                beginTime:(CGFloat)beginTime
                                fromPoint:(CGPoint)fromPoint
                                toPoint:(CGPoint)toPoint{
    
    NSArray *locations = @[[NSValue valueWithCGPoint:fromPoint],
                           [NSValue valueWithCGPoint:toPoint],
                           [NSValue valueWithCGPoint:toPoint]];
    NSArray *times = @[@(0.0),@(0.6),@(1.0)];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                     withBeginTime:0
                                                                      propertyName:@"position"
                                                                            values:locations
                                                                          keyTimes:times];
    
    NSArray *values = @[@(1),@(1),@(1.2)];
    NSArray *sacleTimes = @[@(0.0),@(0.3),@(1)];
    
    CAKeyframeAnimation *sacleAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                  withBeginTime:0
                                                                   propertyName:@"transform.scale"
                                                                         values:values
                                                                       keyTimes:sacleTimes];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,sacleAni]];
    
    return groupAni;
    
}

- (NSArray *)calculateTextCount:(NSString *)textDesc{
    
    NSMutableArray *textList = [[NSMutableArray alloc] init];
    NSString *oneStr = nil;
    NSString *twoStr = nil;
    NSString *threeStr = nil;
    
    if(textDesc.length <= 4){
        
        oneStr = textDesc;
        [textList addObject:oneStr];
        
    }else if (textDesc.length <= 7){
        
        oneStr = [textDesc substringToIndex:4];
        NSRange range = NSMakeRange(4, textDesc.length-4);
        twoStr = [textDesc substringWithRange:range];
        [textList addObject:oneStr];
        [textList addObject:twoStr];
        
    }else if(textDesc.length <= 11){
        
        oneStr = [textDesc substringToIndex:4];
        NSRange twoRange = NSMakeRange(4, 3);
        twoStr = [textDesc substringWithRange:twoRange];
        NSRange threeRange = NSMakeRange(7, textDesc.length-7);
        threeStr = [textDesc substringWithRange:threeRange];
        [textList addObject:oneStr];
        [textList addObject:twoStr];
        [textList addObject:threeStr];
        
    }else{
        
        oneStr = [textDesc substringToIndex:4];
        NSRange twoRange = NSMakeRange(4, 3);
        twoStr = [textDesc substringWithRange:twoRange];
        NSRange threeRange = NSMakeRange(7, 4);
        threeStr = [textDesc substringWithRange:threeRange];
        [textList addObject:oneStr];
        [textList addObject:twoStr];
        [textList addObject:threeStr];
    }
    
    return textList;
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
