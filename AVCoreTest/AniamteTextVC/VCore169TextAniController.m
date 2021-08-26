//
//  VCore169TextAniController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/9/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCore169TextAniController.h"

#import "VcoreTest3ViewController.h"

#import "AVFundation.h"
#import "GifAnimationLayer.h"

#import "HotBasicAnimate.h"

#import "AVMediaComposionCommand.h"

#import "JNWSpringAnimation.h"

#import "AVFilterPhoto.h"

#import "LineMaskLayer.h"

#import "FaceDetectManager.h"

#import "AVRectUnit.h"

#import "AVTextAttributedHelper.h"

@interface VCore169TextAniController ()

@end

@implementation VCore169TextAniController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self fashionWeekendStart];
    [self AVArtSLMoreLineShuttleToSquare];
    // Do any additional setup after loading the view.
}

//#define kTitleIntervel  kAVCeilf(20)
//#define kFashionWeedEndTitleWidth kAVCeilf(380)
//#define kFashionWeedEndLineExtreWidth kAVCeilf(80)

- (void)fashionWeekendStart{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 3.0f;
    
    UIImage *origalImage = [UIImage imageNamed:@"desktop.png"];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:3];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage
                                                                   blueImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat titleIntervel = kAVCeilfY(30);//20
    CGFloat titleWidth = kAVCeilfX(380);
    CGFloat extreWidth = kAVCeilfX(80);
    CGFloat lineHeight = kAVCeilfY(3);
    NSLog(@"%.1d",(kHDScreenWidth/600));
    VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
    textModel.textContent = @"的建安票";
    textModel.textFontName = @"PingFangSC-Regular";
    textModel.textFontSize = (kHDScreenWidth/600)*37;
    textModel.textFontColor = [UIColor whiteColor];
    
    AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
    CGSize textSize = [helper boundingRectTextModel:textModel
                                          photoDesc:textModel.textContent
                                           areaSize:CGSizeMake(titleWidth, MAXFLOAT)
                                       isEqualWidth:YES isEqualHeight:NO];
    
    textSize.height = textSize.height+2*titleIntervel;
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0,
                                                                                              0,
                                                                                              textSize.width,
                                                                                              textSize.height)
                                   
                                                                              text:helper.attributedString
                                                                         textModel:textModel];
    textLayer.position = CGPointMake(kHDScreenWidth/2, kHDScreenHight/2+titleIntervel);
    textLayer.mask = textLayer.maskLayer;
    [currentLayer addSublayer:textLayer];
    
    //文字layer动画
    {
        CGRect fromRect = CGRectMake(0, 0, 0, textSize.height);
        CGRect toRect = CGRectMake(0, 0, textSize.width, textSize.height);
        CABasicAnimation *textLayerAni = [[AVBasicRouteAnimate alloc] customBasic:0.5 withBeginTime:beginTime+duration*0.35 fromValue:[NSValue valueWithCGRect:fromRect] toValue:[NSValue valueWithCGRect:toRect] propertyName:@"bounds"];
        [textLayer.maskLayer addAnimation:textLayerAni forKey:@"textLayerAni"];
        
        CABasicAnimation *opactiyAni = [[AVBasicRouteAnimate alloc] opacityClose:duration/5 withBeginTime:beginTime+duration];
        [textLayer addAnimation:opactiyAni forKey:@"opactiyAni"];
    }
    
    CGFloat offset = textSize.width+extreWidth;
    
    AVBottomLayer *onelineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, offset, lineHeight) bgColor:[UIColor whiteColor].CGColor];
    onelineLayer.allowsEdgeAntialiasing = YES;
    onelineLayer.position = CGPointMake(kHDScreenWidth/2, kHDScreenHight/2);
    [currentLayer addSublayer:onelineLayer];
    onelineLayer.mask = onelineLayer.maskLayer;
    
    AVBottomLayer *twolineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, offset, lineHeight) bgColor:[UIColor whiteColor].CGColor];
    twolineLayer.position = CGPointMake(kHDScreenWidth/2, kHDScreenHight/2);
    twolineLayer.allowsEdgeAntialiasing = YES;
    [currentLayer addSublayer:twolineLayer];
    twolineLayer.mask = twolineLayer.maskLayer;
    
    CGPoint point1 = CGPointMake(offset*1.5, lineHeight/2);
    CGPoint point2 = CGPointMake(offset/2, lineHeight/2);
    CGPoint point3 = CGPointMake(-offset/2, lineHeight/2);
    CGRect rect1 = CGRectMake(0, 0, offset, lineHeight);
    CGRect rect2 = CGRectMake(0, 0, 0, lineHeight);
    CGFloat trans1 = DEGREES_TO_RADIANS(0);
    CGFloat trans2 = DEGREES_TO_RADIANS(45);
    CGFloat trans3 = DEGREES_TO_RADIANS(-45);
    CGFloat moveOffset = textSize.height/2;
    //第一个线动画
    {
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration/6 withBeginTime:beginTime fromValue:point3 toValue:point2 propertyName:@"position"];
        
        [onelineLayer.maskLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CAAnimationGroup *transAni = [self lineTransAniWithFromTrans:trans2 toTrans:trans1
                                                        fromPosition:CGPointMake(kHDScreenWidth/2, kHDScreenHight/2)
                                                          toPosition:CGPointMake(kHDScreenWidth/2, kHDScreenHight/2-moveOffset)
                                                            duration:duration
                                                           beginTime:beginTime];
        
        [onelineLayer addAnimation:transAni forKey:@"transAni"];
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:duration/5 withBeginTime:beginTime+duration fromValue:[NSValue valueWithCGRect:rect1] toValue:[NSValue valueWithCGRect:rect2] propertyName:@"bounds"];
        
        [onelineLayer.maskLayer addAnimation:boundsAni forKey:@"boundsAni"];
        
    }
    
    //第二个线动画
    {
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration/6 withBeginTime:beginTime fromValue:point1 toValue:point2 propertyName:@"position"];
        
        [twolineLayer.maskLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CAAnimationGroup *transAni = [self lineTransAniWithFromTrans:trans3 toTrans:trans1
                                                        fromPosition:CGPointMake(kHDScreenWidth/2, kHDScreenHight/2)
                                                          toPosition:CGPointMake(kHDScreenWidth/2, kHDScreenHight/2+moveOffset)
                                                            duration:duration
                                                           beginTime:beginTime];
        
        [twolineLayer addAnimation:transAni forKey:@"transAni"];
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:duration/5 withBeginTime:beginTime+duration fromValue:[NSValue valueWithCGRect:rect1] toValue:[NSValue valueWithCGRect:rect2] propertyName:@"bounds"];
        [twolineLayer.maskLayer addAnimation:boundsAni forKey:@"boundsAni"];
        
    }
}

- (CAAnimationGroup *)lineTransAniWithFromTrans:(CGFloat)fromTrans
                                        toTrans:(CGFloat)toTrans
                                        fromPosition:(CGPoint)fromPosition
                                        toPosition:(CGPoint)toPosition
                                        duration:(NSTimeInterval)duration
                                        beginTime:(NSTimeInterval)beginTime{
    
    NSArray *oneTransValuse = @[[NSNumber numberWithFloat:fromTrans],
                                [NSNumber numberWithFloat:fromTrans],
                                [NSNumber numberWithFloat:toTrans],
                                [NSNumber numberWithFloat:toTrans],
                                ];
    NSArray *oneTransTime = @[@(0.0),@(0.15),@(0.25),@(1.0)];
    
    CAKeyframeAnimation *oneTransAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                     withBeginTime:0
                                                                      propertyName:kAVBasicAniRotationZ
                                                                            values:oneTransValuse
                                                                          keyTimes:oneTransTime];
    
    NSArray *positionValuse = @[[NSValue valueWithCGPoint:fromPosition],
                                [NSValue valueWithCGPoint:fromPosition],
                                [NSValue valueWithCGPoint:toPosition],
                                [NSValue valueWithCGPoint:toPosition]
                                ];
    NSArray *positionTimes = @[@(0.0),@(0.25),@(0.4),@(1.0)];
    
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
                                                                     withBeginTime:0
                                                                      propertyName:@"position"
                                                                            values:positionValuse
                                                                          keyTimes:positionTimes];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[oneTransAni,positionAni]];
    
    return groupAni;
    
}


//菱形
- (void)AVArtSLMoreLineShuttleToSquare
{
    
    UIImage *origalImage = [UIImage imageNamed:@"desktop.png"];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:3];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                  vContentRect:kAVRectWindow
                                                                   origalImage:origalImage
                                                                     blueImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat lineHeight = kAVCeilfX(2.0);
    CGFloat durion = 0.5;
    CGFloat durionSpace = 0.1;
    CGFloat groupDur = 2.5;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    for (int i = 0; i < 2; i++) {
        //左下角线条
        UIBezierPath *leftDownMovePath = [UIBezierPath bezierPath];
        [leftDownMovePath moveToPoint:CGPointMake(kHDScreenWidth*(0.5-i*0.25), kHDScreenHight)];
        [leftDownMovePath addLineToPoint:CGPointMake(0,kHDScreenHight*(0.5+i*0.25))];
        CAShapeLayer *leftDownLineLayer = [CAShapeLayer layer];
        leftDownLineLayer.path = leftDownMovePath.CGPath;
        leftDownLineLayer.lineWidth = lineHeight;
        leftDownLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        leftDownLineLayer.fillColor = [UIColor clearColor].CGColor;
        [currentLayer addSublayer:leftDownLineLayer];
        
        CABasicAnimation *leftDownLineStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *leftDownLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:1.2+i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *leftDownLineAni = [[AVBasicRouteAnimate alloc] groupAni:groupDur withBeginTime:beginTime aniArr:@[leftDownLineStrokeStar,leftDownLineStrokeEnd]];
        [leftDownLineLayer addAnimation:leftDownLineAni forKey:@"strokeGroupAni"];
        
        //右下角线条
        UIBezierPath *rightDownMovePath = [UIBezierPath bezierPath];
        [rightDownMovePath moveToPoint:CGPointMake(kHDScreenWidth, kHDScreenHight*(0.5+i*0.25))];
        [rightDownMovePath addLineToPoint:CGPointMake(kHDScreenWidth*(0.5+i*0.25),kHDScreenHight)];
        CAShapeLayer *rightDownLineLayer = [CAShapeLayer layer];
        rightDownLineLayer.path = rightDownMovePath.CGPath;
        rightDownLineLayer.lineWidth = lineHeight;
        rightDownLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        rightDownLineLayer.fillColor = [UIColor clearColor].CGColor;
        [currentLayer addSublayer:rightDownLineLayer];
        
        CABasicAnimation *rightDownLineStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *rightDownLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:1.2+i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *rightDownLineAni = [[AVBasicRouteAnimate alloc] groupAni:groupDur withBeginTime:leftDownLineAni.beginTime+durionSpace aniArr:@[rightDownLineStrokeStar,rightDownLineStrokeEnd]];
        [rightDownLineLayer addAnimation:rightDownLineAni forKey:@"strokeGroupAni"];
        
        //右上角线条
        UIBezierPath *rightUpMovePath = [UIBezierPath bezierPath];
        [rightUpMovePath moveToPoint:CGPointMake(kHDScreenWidth*(0.5+i*0.25), 0)];
        [rightUpMovePath addLineToPoint:CGPointMake(kHDScreenWidth,kHDScreenHight*(0.5-i*0.25))];
        CAShapeLayer *rightUpLineLayer = [CAShapeLayer layer];
        rightUpLineLayer.path = rightUpMovePath.CGPath;
        rightUpLineLayer.lineWidth = lineHeight;
        rightUpLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        rightUpLineLayer.fillColor = [UIColor clearColor].CGColor;
        [currentLayer addSublayer:rightUpLineLayer];

        CABasicAnimation *rightUpLineStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *rightUpLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:1.2+i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *rightUpLineAni = [[AVBasicRouteAnimate alloc] groupAni:groupDur withBeginTime:rightDownLineAni.beginTime aniArr:@[rightUpLineStrokeStar,rightUpLineStrokeEnd]];
        [rightUpLineLayer addAnimation:rightUpLineAni forKey:@"strokeGroupAni"];
        
        //左上角线条
        UIBezierPath *leftUpMovePath = [UIBezierPath bezierPath];
        [leftUpMovePath moveToPoint:CGPointMake(0, kHDScreenHight*(0.5-i*0.25))];
        [leftUpMovePath addLineToPoint:CGPointMake(kHDScreenWidth*(0.5-i*0.25),0)];
        CAShapeLayer *leftUpLineLayer = [CAShapeLayer layer];
        leftUpLineLayer.path = leftUpMovePath.CGPath;
        leftUpLineLayer.lineWidth = lineHeight;
        leftUpLineLayer.strokeColor = [UIColor whiteColor].CGColor;
        leftUpLineLayer.fillColor = [UIColor clearColor].CGColor;
        [currentLayer addSublayer:leftUpLineLayer];

        CABasicAnimation *leftUpLineStrokeStar = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeStart"];
        CABasicAnimation *leftUpLineStrokeEnd = [[AVBasicRouteAnimate alloc] customBasic:durion-i*0.2 withBeginTime:1.2+i fromValue:@(1.0) toValue:@(0.0) propertyName:@"strokeEnd"];
        CAAnimationGroup *leftUpLineAni = [[AVBasicRouteAnimate alloc] groupAni:groupDur withBeginTime:leftDownLineAni.beginTime aniArr:@[leftUpLineStrokeStar,leftUpLineStrokeEnd]];
        [leftUpLineLayer addAnimation:leftUpLineAni forKey:@"strokeGroupAni"];
        
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
