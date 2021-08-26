//
//  VcoreTest4ViewController.m
//  AVCoreTest
//
//  Created by gemin on 15/11/25.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "VcoreTest4ViewController.h"

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

#import "GeometryGradientLayer.h"

#import "AVShapeBaseLayer.h"

#import "AVCirleShapeLayer.h"

#import "AVChartColorLayer.h"

#import "aTestView.h"


#define kBridWith       160

#define kBridoffsetY        16

#define kArtYellowColor    UIColorFromRGBAlpha(0xffcb00, 1)

#define kArtBlueAlphaColor     [[UIColor greenColor] colorWithAlphaComponent:0.5]

#define kArtRedColor   [[UIColor redColor] colorWithAlphaComponent:0.5]

#define kArtBlueColor    [UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5]


@interface VcoreTest4ViewController ()

@end

@implementation VcoreTest4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
    
    //[self threeSceneTration];
    
   // [self testMaskeTration];
    
//   [self upAndDownMaskClose];

   //[self endSceneTrastiom];

   // [[UIColor blueColor] colorWithAlphaComponent:0.5]
    
   // [self endTransoinSub2];
    

//    [self AVSTShapeGeometryRotateTwoCircles];
    
   // [self endArtTransoin3];
    
    
    

    
   [self AVSTShapeGeometryMoreARCRoundShow];
    
    //[self AVSceneTransiteAirplaneDownToUp];
    
  //  [self AVSTShapeGeometryRotateTwoCirclesEnd];
    
 //   [self AVSTShapeGeometryRotateXYArtMask];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)upAndDownMaskClose
{
    
    CGFloat barSize = 50;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 3;
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    
    nextLayer.mask = nextLayer.maskLayer;
    
    
    AVBottomLayer *filterColorLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                                bgColor:kArtBlueAlphaColor.CGColor];
    
    [currentLayer addSublayer: filterColorLayer];
    
    CABasicAnimation *opacityOpenAni = [[AVBasicRouteAnimate alloc] opacityOpen:duration withBeginTime:beginTime];
    filterColorLayer.opacity= 0.0f;
    [filterColorLayer addAnimation:opacityOpenAni forKey:@"dfs"];
    
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    AVBottomLayer *downMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth/2, kAVWindowHeight+100)
                                                              bgColor:[UIColor blackColor].CGColor];
    
    downMaskLayer.anchorPoint = CGPointMake(1.0, 0);
    
    downMaskLayer.position = CGPointMake(0, kAVWindowHeight/2);
    
    [nextLayer.maskLayer addSublayer: downMaskLayer];
    
    
    AVBottomLayer *downArtLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, barSize, kAVWindowHeight+100)
                                                                bgColor:[kArtYellowColor colorWithAlphaComponent:0.8].CGColor];
    
    downArtLayer.anchorPoint = CGPointMake(1.0, 0);
    
    downArtLayer.position = CGPointMake(0, kAVWindowHeight/2);
    
    downArtLayer.masksToBounds = NO;
    
    downArtLayer.shadowColor = kArtYellowColor.CGColor;
    
     downArtLayer.shadowOffset = CGSizeMake(-8.0f, 0.0f);
    
    downArtLayer.shadowOpacity = 0.6;

    
    [homeLayer addSublayer: downArtLayer];
    
    
    
    NSArray * keyTime = @[
                          [NSNumber numberWithFloat:0],
                          [NSNumber numberWithFloat:1.0],
                          
                          ];
    
    NSArray *scaleValues = @[
                             
                             [NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)],
                             [NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)],
                             ];
    
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime  propertyName:kAVBasicAniRotationZ values:scaleValues keyTimes:keyTime];
    
    scaleAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [downMaskLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    [downArtLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    
    NSArray *downkeyTime = @[
                         [NSNumber numberWithFloat:0],
                         
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  barSize,  kAVWindowHeight+100)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0, kAVWindowHeight+100)],
                              ];
    
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:centerValues keyTimes:downkeyTime];
    
    boundsAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [downArtLayer addAnimation:boundsAni forKey:@"leftRightMoveAni"];
    
    
    
    AVBottomLayer *upMaskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth/2, kAVWindowHeight+100)
                                                                bgColor:[UIColor blackColor].CGColor];
    
    upMaskLayer.anchorPoint = CGPointMake(0, 1.0);
    
    upMaskLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
    
    [nextLayer.maskLayer addSublayer: upMaskLayer];
    
    
    AVBottomLayer *upArtLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, barSize, kAVWindowHeight+100)
                                                               bgColor:[kArtYellowColor colorWithAlphaComponent:0.8].CGColor];
    
    upArtLayer.anchorPoint = CGPointMake(0.0, 1.0);
    
    upArtLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
    
    upArtLayer.masksToBounds = NO;
    
    upArtLayer.shadowColor = kArtYellowColor.CGColor;
    
    upArtLayer.shadowOffset = CGSizeMake(8.0f, 0.0f);
    
    upArtLayer.shadowOpacity = 0.6;
    
    [homeLayer addSublayer: upArtLayer];

    
    [upMaskLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    [upArtLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    [upArtLayer addAnimation:boundsAni forKey:@"leftRightMoveAni"];
}

-(void)endArtTransoin3
{
    CGFloat offset = 0;
    
    CGRect widownRect = kCGRectOutArea(kAVRectWindow, offset, offset);
    
    
    CGPoint faceCenter = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 3;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:shuImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
//    [nextLayer setMask: nextLayer.maskLayer];
//    
//    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    
    // shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    
//    UIBezierPath *startPath = [UIBezierPath bezierPath];
//    
//     [startPath addArcWithCenter:CGPointMake((CGRectGetWidth(widownRect))/2,(CGRectGetWidth(widownRect))/2) radius:100.0 startAngle:0.0 endAngle:M_PI clockwise:YES];
//    
//    
//     [[UIColor blueColor] setStroke];
//    
//     [startPath stroke];
    
//    UIBezierPath *startPath = [UIBezierPath bezierPathWithArcCenter: CGPointMake((CGRectGetWidth(widownRect))/2,(CGRectGetWidth(widownRect))/2)
//                                                             radius:(CGRectGetWidth(widownRect))/2
//                                                         startAngle:DEGREES_TO_RADIANS(90)
//                                                           endAngle:DEGREES_TO_RADIANS(180)
//                                                          clockwise:YES];
//    
//    startPath.lineWidth = 5.0;
//    startPath.lineCapStyle = kCGLineCapButt; //线条拐角
//    startPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
   // [startPath stroke];
    
      //  [startPath closePath];
    
    shapeLayer.frame = widownRect;
    
    shapeLayer.position = faceCenter;
    
     shapeLayer.lineWidth = 30;
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.backgroundColor = kArtRedColor.CGColor; //  [[UIColor yellowColor] colorWithAlphaComponent:0.8].CGColor;
    
    //shapeLayer.path = startPath.CGPath;
    
    [homeLayer addSublayer: shapeLayer];
    
    
    CATransform3D starttransformThree = CATransform3DIdentity;
    
    CATransform3D endtransformThree = CATransform3DMakeRotation(DEGREES_TO_RADIANS(180), 1, 1, 0);
    
    //  tempLayer.transform = starttransform;
    
//    CABasicAnimation *saleToThree = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime fromValue:starttransformThree toValue:endtransformThree];
//    
//    [currentLayer addAnimation:saleToThree forKey:@""];
    
    
//    
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    layer.name = @"Radius";
//    CGFloat lineWidth =  10;
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = lineWidth;
//    path.lineCapStyle = kCGLineCapButt;
//    CGPoint center = CGPointMake(widownRect.size.width/2, widownRect.size.height/2);
//    CGFloat radius = (widownRect.size.width - lineWidth)/2;
//    
//    CGFloat startAngle = -((float)M_PI)/7; //
//    CGFloat endAngle = ((float)M_PI)-startAngle ;
//    
//    [[UIColor whiteColor] set];
//    
//    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
//    
//    [path stroke];
//    
//    [path closePath];
//    
//    [homeLayer addSublayer: layer];
    
 }


-(void)AVSTShapeGeometryRotateXYArtMask
{

    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 10;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:shuImage];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    AVBasicLayer *beforColorLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:kArtRedColor.CGColor];
    
    beforColorLayer.opacity = 0.0f;
    
    [currentLayer addSublayer: beforColorLayer];
    
    CABasicAnimation *openInAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime];
    
    [beforColorLayer addAnimation: openInAni forKey:@"oepnId"];
    
    
    
    CGFloat offset = 100;
    
    CGRect widownRect = kCGRectOutArea(kAVRectWindow, offset, offset);
    
    
    CGPoint faceCenter = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
    
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    
    [startPath moveToPoint:CGPointMake(-offset, -offset)];
    
    [startPath addQuadCurveToPoint:CGPointMake(widownRect.size.width+offset, widownRect.size.height+offset)
                      controlPoint:CGPointMake(-(offset*2+30), widownRect.size.height+(offset*2+30))];
    
    [startPath addLineToPoint:CGPointMake(-offset, widownRect.size.height)];
    
    
    [startPath closePath];
    
    UIBezierPath *endPath = [UIBezierPath bezierPath];
    
    [endPath moveToPoint:CGPointMake(-offset, -offset)];
    
    [endPath addQuadCurveToPoint:CGPointMake(widownRect.size.width+offset, widownRect.size.height+offset)
                      controlPoint:CGPointMake(widownRect.size.width+(offset*2), -(offset*2+30))];
    
    [endPath addLineToPoint:CGPointMake(-offset, widownRect.size.height)];
    
    [endPath closePath];
    
    AVShapeBaseLayer *shapeLayer = [[AVShapeBaseLayer alloc] initWithFrame:widownRect bezierPath:startPath fillColor:[UIColor yellowColor]];
    
    shapeLayer.position = faceCenter;
    
    [homeLayer addSublayer: shapeLayer];
    
    CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:kAVBasicAniPath];
    
    [shapeLayer addAnimation: strokeEndAni forKey:@"ds"];
    
    nextLayer.mask= shapeLayer;
    
}


-(void)endTransoinSub2
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    CGRect faceRect = CGRectMake(0, 0,850, 850);
    
    CGFloat startAngle = 0, endAngle = 360;
        
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        
        [bezierPath moveToPoint: kAVWindowCenter];
        
        [bezierPath addArcWithCenter:kAVWindowCenter
                              radius:(CGRectGetWidth(faceRect))/2
                          startAngle:DEGREES_TO_RADIANS(startAngle)
                            endAngle:DEGREES_TO_RADIANS(endAngle)
                           clockwise:YES];
        
        
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        
        shapeLayer.frame = faceRect;
        
        shapeLayer.fillColor = [[UIColor orangeColor]colorWithAlphaComponent:0.6].CGColor;
        
        shapeLayer.path = bezierPath.CGPath;
        
        [homeLayer addSublayer: shapeLayer];
    
    
    CABasicAnimation *arcToFullAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:duration withBeginTime:beginTime fromValue:0 toValue:1 propertyName:kAVShapeStrokeEnd];
    
    [shapeLayer addAnimation: arcToFullAni forKey:@"ds"];
    
      //  CAKeyframeAnimation *arcToFullAni = [[AVBasicRouteAnimate alloc] customKeyframePath:duration withBeginTime:beginTime propertyName:kAVBasicAniPath path:(CGMutablePathRef)bezierPath.CGPath];
    
   // [shapeLayer addAnimation:arcToFullAni  forKey:@"arcToFullAni"];
    
     AVBasicTextLayer *textBarLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(0, 30,460, 50)
                                                                       intText:@"革命的胜利需要新娘"
                                                                      textFont:[UIFont systemFontOfSize:37]
                                                                     textColor:[UIColor whiteColor]];
    
    
    
    NSString *str = @"0xffffff";
    
    unsigned long red = strtoul([str UTF8String],0,16);
    
    AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,460, 100)
                                                               bgColor:UIColorFromRGBAlpha(red, 1.0f).CGColor];
    

    [textBgLayer addSublayer: textBarLayer];
    
    textBgLayer.position= kAVWindowCenter;
    
    [homeLayer addSublayer: textBgLayer];
    
    NSArray * keyTime = @[
                             [NSNumber numberWithFloat:0],
                             
                              [NSNumber numberWithFloat:1.0],
                             
                             ];
    
    NSArray *scaleValues = @[
                         
                         [NSNumber numberWithFloat:DEGREES_TO_RADIANS(5)],
                         
                         [NSNumber numberWithFloat:DEGREES_TO_RADIANS(-5)],
                         ];
    
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:beginTime  propertyName:kAVBasicAniRotationZ values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
        scaleAni.autoreverses=YES;
    scaleAni.repeatCount = 20;
      //  scaleAni.fillMode=kCAFillModeForwards;
    
    [textBgLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
}


-(void)endTransoinSub1
{
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    CGRect faceRect = CGRectMake(0, 0,850, 850);
    
    
    NSArray *colostLisgt =@[
                            [[UIColor redColor]colorWithAlphaComponent:0.6],
                            [[UIColor greenColor]colorWithAlphaComponent:0.6],
                            [[UIColor orangeColor]colorWithAlphaComponent:0.6],
                            [[UIColor yellowColor]colorWithAlphaComponent:0.6],
                            [[UIColor magentaColor]colorWithAlphaComponent:0.6],
                            ];
    
    CGFloat startAngle = 0, endAngle = 72;
    
    for (NSInteger index = 0; index <[colostLisgt count]; index++) {
        
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        
        [bezierPath moveToPoint: kAVWindowCenter];
        
        [bezierPath addArcWithCenter:kAVWindowCenter
                              radius:(CGRectGetWidth(faceRect))/2
                          startAngle:DEGREES_TO_RADIANS(startAngle)
                            endAngle:DEGREES_TO_RADIANS(endAngle)
                           clockwise:YES];
        
        
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        
        UIColor *temColor = colostLisgt[index];
        
        shapeLayer.frame = faceRect;
        
      //  shapeLayer.position = kAVWindowCenter;
        
        shapeLayer.fillColor = temColor.CGColor;
        
        shapeLayer.path = bezierPath.CGPath;
        
        [homeLayer addSublayer: shapeLayer];
        
        startAngle  = endAngle;
        
        endAngle +=72;
    }

}

-(void)AVSTShapeGeometryRotateTwoCircles
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.5;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:shuImage];
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    CGRect arcRect = CGRectMake(0, 0,850, 850);
    
    NSArray *colostLisgt =@[
                            [[UIColor redColor]colorWithAlphaComponent:0.7],
                            [[UIColor greenColor]colorWithAlphaComponent:0.7],
                            [[UIColor orangeColor]colorWithAlphaComponent:0.7],
                            [[UIColor yellowColor]colorWithAlphaComponent:0.7],
                            [[UIColor magentaColor]colorWithAlphaComponent:0.7],
                            ];
    
    CGFloat startAngle = 0, endAngle = 72;
    
    
    
    AVBottomLayer *bgartLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor clearColor].CGColor];
    
    [currentLayer addSublayer: bgartLayer];
    
    for (NSInteger index = 0; index <[colostLisgt count]; index++) {
        
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        
        [bezierPath moveToPoint: kAVWindowCenter];
        
        [bezierPath addArcWithCenter:kAVWindowCenter
                              radius:(CGRectGetWidth(arcRect))/2
                          startAngle:DEGREES_TO_RADIANS(startAngle)
                            endAngle:DEGREES_TO_RADIANS(endAngle)
                           clockwise:YES];
        
        
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        
        UIColor *temColor = colostLisgt[index];
        
        shapeLayer.frame = arcRect;
        
        //  shapeLayer.position = kAVWindowCenter;
        
        shapeLayer.fillColor = temColor.CGColor;
        
        shapeLayer.path = bezierPath.CGPath;
        
        [bgartLayer addSublayer: shapeLayer];
        
        startAngle  = endAngle;
        
        endAngle +=72;
        
    }
    
    
    AVCirleShapeLayer  *maskLayer = [[AVCirleShapeLayer alloc] initWithFrame:arcRect fillColor:[UIColor blackColor]];
    
    maskLayer.position = kAVWindowCenter;
    
    bgartLayer.mask = maskLayer;
    
    //[nextLayer.maskLayer addSublayer: maskLayer];
    
    CABasicAnimation *startAngleAin = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1 withBeginTime:beginTime fromValue:0 toValue:1 propertyName:@"startAngle"];
    
    [maskLayer addAnimation: startAngleAin forKey:@"DFS"];
    
    AVCirleShapeLayer  *maskLayer2 = [[AVCirleShapeLayer alloc] initWithFrame:arcRect fillColor:[UIColor blackColor]];
    
    maskLayer2.backgroundColor = [UIColor clearColor].CGColor;
    
    maskLayer2.position = kAVWindowCenter;
    
    CABasicAnimation *startAngleAin2 = [[AVBasicRouteAnimate defaultInstance] customCGFloat:0.8 withBeginTime:beginTime+0.6 fromValue:0 toValue:1 propertyName:@"startAngle"];
    
    [maskLayer2 addAnimation: startAngleAin2 forKey:@"DFS"];
    
    [nextLayer.maskLayer addSublayer: maskLayer2];
}

-(void)AVSTShapeGeometryRotateTwoCirclesEnd
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:shuImage];
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBottomLayer *beforeImageLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"0.png"]];
    
    [currentLayer addSublayer: beforeImageLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    CGRect arcRect = CGRectMake(0, 0,850, 850);
    
    NSArray *colostLisgt =@[
                            [[UIColor redColor]colorWithAlphaComponent:0.6],
                            [[UIColor greenColor]colorWithAlphaComponent:0.6],
                            [[UIColor orangeColor]colorWithAlphaComponent:0.6],
                            [[UIColor yellowColor]colorWithAlphaComponent:0.6],
                            [[UIColor magentaColor]colorWithAlphaComponent:0.6],
                            ];
    
    CGFloat startAngle = 0, endAngle = 72;
    
    
    
    AVBottomLayer *bgartLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor clearColor].CGColor];
    
    [nextLayer addSublayer: bgartLayer];
    
    for (NSInteger index = 0; index <[colostLisgt count]; index++) {
        
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        
        [bezierPath moveToPoint: kAVWindowCenter];
        
        [bezierPath addArcWithCenter:kAVWindowCenter
                              radius:(CGRectGetWidth(arcRect))/2
                          startAngle:DEGREES_TO_RADIANS(startAngle)
                            endAngle:DEGREES_TO_RADIANS(endAngle)
                           clockwise:YES];
        
        
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        
        UIColor *temColor = colostLisgt[index];
        
        shapeLayer.frame = arcRect;
        
        //  shapeLayer.position = kAVWindowCenter;
        
        shapeLayer.fillColor = temColor.CGColor;
        
        shapeLayer.path = bezierPath.CGPath;
        
        [bgartLayer addSublayer: shapeLayer];
        
        startAngle  = endAngle;
        
        endAngle +=72;
    
    }
    
    
    AVCirleShapeLayer  *maskLayer = [[AVCirleShapeLayer alloc] initWithFrame:arcRect fillColor:[UIColor blackColor]];
    
    maskLayer.position = kAVWindowCenter;
    
    [nextLayer.maskLayer addSublayer: maskLayer];
    
    CABasicAnimation *startAngleAin = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1.2 withBeginTime:beginTime fromValue:0 toValue:1 propertyName:@"startAngle"];
    
    [maskLayer addAnimation: startAngleAin forKey:@"DFS"];
    
    
    CABasicAnimation *rotateCenterAni = [[AVBasicRouteAnimate defaultInstance] rotationZ:4 withBeginTime:beginTime fromValue:0 toValue:200];
    
    [bgartLayer addAnimation:rotateCenterAni forKey:@"rotateCenterAni"];
    

    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:arcRect bgColor:[UIColor blackColor].CGColor];
    bgLayer.position = kAVWindowCenter;
    [homeLayer addSublayer: bgLayer];
    

    AVCirleShapeLayer  *maskLayer2 = [[AVCirleShapeLayer alloc] initWithFrame:arcRect fillColor:[UIColor blackColor]];
    
    maskLayer2.backgroundColor = [UIColor clearColor].CGColor;
    
  //  maskLayer2.position = kAVWindowCenter;
    
    CABasicAnimation *startAngleAin2 = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1.0 withBeginTime:beginTime+2 fromValue:0 toValue:1 propertyName:@"startAngle"];
    
    [maskLayer2 addAnimation: startAngleAin2 forKey:@"DFS"];
    
    [bgLayer addAnimation:rotateCenterAni forKey:@"moveCenter1"];
    
//    
    bgLayer.mask =  maskLayer2;
}

-(void)threeTransoin3
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:shuImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CGRect faceRect = kCGRectFromCenter(kAVWindowCenter, 350);
    
    CGPoint faceCenter = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y);
    
    AVCirleShapeLayer  *maskLayer = [[AVCirleShapeLayer alloc] initWithFrame:faceRect fillColor:[UIColor blackColor]];
    
    [nextLayer.maskLayer addSublayer: maskLayer];
    
    maskLayer.position = faceCenter;
    
    CABasicAnimation *startAngleAin = [[AVBasicRouteAnimate defaultInstance] customCGFloat:duration withBeginTime:beginTime fromValue:0 toValue:1 propertyName:@"startAngle"];
    
    [maskLayer addAnimation: startAngleAin forKey:@"DFS"];
    
    
    UIBezierPath *shapePath = [UIBezierPath bezierPathWithArcCenter: CGPointMake((CGRectGetWidth(faceRect))/2,(CGRectGetWidth(faceRect))/2)
                                                               radius:(CGRectGetWidth(faceRect))/2
                                                           startAngle:DEGREES_TO_RADIANS(0)
                                                             endAngle:DEGREES_TO_RADIANS(360)
                                                            clockwise:NO];

    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    
   // shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    
    shapeLayer.frame = faceRect;
    
    shapeLayer.position = faceCenter;
    
    shapeLayer.lineWidth = 30;
        
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.8].CGColor;

    shapeLayer.path = shapePath.CGPath;
    
    [homeLayer addSublayer: shapeLayer];

    CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:duration withBeginTime:beginTime fromValue:0 toValue:1 propertyName:kAVShapeStrokeEnd];
    
    [shapeLayer addAnimation: strokeEndAni forKey:@"ds"];
    
    
}

-(void)endTransoin
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 4;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:shuImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    

    [nextLayer setMask: nextLayer.maskLayer];
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CGFloat radius = 300;
    
   //  UIBezierPath *startPath =  [UIBezierPath bezierPathWithOvalInRect:kAVRectWindow];
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithArcCenter:kAVWindowCenter
                                                             radius:radius
                                                         startAngle:DEGREES_TO_RADIANS(0)
                                                           endAngle:DEGREES_TO_RADIANS(360)
                                                          clockwise:YES];

    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter: kAVWindowCenter
                                                           radius:radius
                                                       startAngle:DEGREES_TO_RADIANS(0)
                                                         endAngle:DEGREES_TO_RADIANS(360)
                                                        clockwise:YES];
    
    [startPath addLineToPoint:kAVWindowCenter];
    [startPath closePath];
    
    [endPath addLineToPoint:kAVWindowCenter];
    [endPath closePath];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = startPath.CGPath;
    shapeLayer.frame =kAVRectWindow;
    
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    
 //   CABasicAnimation *arcToFullAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:duration withBeginTime:beginTime fromValue:0 toValue:1 propertyName:@"path"];
    
    CAKeyframeAnimation *arcToFullAni = [[AVBasicRouteAnimate alloc] customKeyframePath:duration withBeginTime:beginTime propertyName:kAVBasicAniPath path:(CGMutablePathRef)startPath.CGPath];

//    CABasicAnimation *arcToFullAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:kAVBasicAniPath];
    
    [shapeLayer addAnimation:arcToFullAni forKey:@"se"];
    

    [nextLayer.maskLayer addSublayer:shapeLayer];
//
    
  //  [nextLayer  addSublayer: maskLayer];
    
    
}

-(void)testMaskeTration
{
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:shuImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    
    
    AVBottomLayer *subMaskLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColor clearColor].CGColor];
    
    [nextLayer.maskLayer setMask: subMaskLayer];
    
    
    CAShapeLayer  *maskLayer =  [self createShape:NO shapeType:AVSTShapeGeometryFiveStarToFull];
    
    [subMaskLayer addSublayer:maskLayer];
    
        AVBottomLayer *testLayer = [[AVBottomLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColor clearColor].CGColor];
  
    [subMaskLayer addSublayer: testLayer];
}



-(void)threeSceneTration
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 4;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:shuImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    CGFloat moveDuation = 1;
    
    [nextLayer setMask: nextLayer.maskLayer];
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[[UIColor redColor] colorWithAlphaComponent:0.5].CGColor];
    
    bgLayer.opacity = 0.0f;
    
    [currentLayer addSublayer: bgLayer];
    
    CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime];
    
    [bgLayer addAnimation: openIn forKey:@"oepnId"];
    
    NSArray *centerList = @[
                            [NSValue valueWithCGPoint:CGPointMake(300, 220)],
                            [NSValue valueWithCGPoint:CGPointMake(100, 120)],
                            [NSValue valueWithCGPoint:CGPointMake(500, 480)]];
    
    
    for (NSInteger dinex =0; dinex < 2; dinex++) {
        
        CAShapeLayer  *bothLayer = [self createShape:YES shapeType:AVSTShapeGeometryFiveStarToFull];
        
        bothLayer.position = [centerList[dinex] CGPointValue];
        
        
        CAShapeLayer  *maskLayer =  [self createShape:NO shapeType:AVSTShapeGeometryFiveStarToFull];
        
        maskLayer.position = [centerList[dinex] CGPointValue];
        
        if (dinex>0) {
            
            [homeLayer addSublayer: bothLayer];
            
            [nextLayer.maskLayer addSublayer:maskLayer];
        }else{
            
            [homeLayer addSublayer: bothLayer];
            
            [nextLayer.maskLayer addSublayer:maskLayer];
        }

        
        CATransform3D starttransform = CATransform3DMakeScale(0.0, 0.0, 1.0);
        
        CATransform3D endtransform = CATransform3DMakeScale(1.4, 1.4, 1.0);
        
        //  tempLayer.transform = starttransform;
        
        CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] transform3D:moveDuation withBeginTime:beginTime+(dinex*0.2) fromValue:starttransform toValue:endtransform];
        
        [maskLayer addAnimation: saleToOne forKey:@"sale"];
        
        [bothLayer addAnimation: saleToOne forKey:@"sale"];
        
    }
    
}

-(CAShapeLayer *)createShape:(BOOL)isBorder shapeType:(NSInteger)transiteFactor
{
    CAShapeLayer  *shapeLayer =nil;
    
    CGFloat offsetY = 0;
    
    UIBezierPath *shapePath =nil;
    
    switch (transiteFactor ) {
        case AVSTShapeGeometryFiveStarToFull:
        {
            offsetY = -56;
            shapePath = [UIBezierPath stars:1 shapeInFrame:kAVRectWindow];
            break;
        }
            
        case AVSTShapeGeometryLoveHeartToFull:
        {
            offsetY = 32;
            shapePath = [UIBezierPath heartShape:kAVRectWindow];
            break;
        }
        default:
            break;
    }
    
    
    shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame = kAVRectWindow;
    
    shapeLayer.lineWidth = 32;
    
    shapeLayer.top +=offsetY;
    
    if (isBorder ==YES) {
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.8].CGColor;
    }else{
        
        shapeLayer.fillColor = [UIColor blackColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5].CGColor;
    }
    
    shapeLayer.path = shapePath.CGPath;
    
    return shapeLayer;
}


-(void)AVSceneTransiteAirplaneDownToUp
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
    CGFloat duration = 1.5;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];

    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:shuImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    
    //addd
    AVBasicLayer *currentBeforeLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:kArtRedColor.CGColor];
    
    [currentLayer addSublayer: currentBeforeLayer];
    currentBeforeLayer.opacity = 0;
    
    CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration/2 withBeginTime:beginTime];
    [currentBeforeLayer addAnimation: openIn forKey:@"oepnId"];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.maskLayer.backgroundColor = [UIColor clearColor].CGColor;

    
    //START
    CGPoint startPoint = CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
    
    CGPoint endCenterPoint = CGPointMake(kAVWindowCenter.x, -kAVWindowHeight-500);
    
    
    AVBottomLayer *artBGLayer = [[AVBottomLayer alloc] initWithFrame:nextLayer.bounds bgColor:[UIColor clearColor].CGColor];
    
    artBGLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
    
    [homeLayer addSublayer: artBGLayer];
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:0 fromValue:startPoint toValue:endCenterPoint];
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:1],
                             [NSNumber numberWithFloat:1.3],
                             
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];

    CAAnimationGroup *leftAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,scaleAni]];
    
    
    [artBGLayer addAnimation:leftAniGroup forKey:@"moveCenter1"];
    
    [nextLayer.maskLayer addAnimation:leftAniGroup forKey:@"moveCenter1"];
    
    CAShapeLayer *geometryLayer1 = [[AVShapeBaseLayer alloc] initWithFrame:currentLayer.bounds
                                                                 slidePath:[UIBezierPath geometryVStroke:nextLayer.bounds startXOffset:200 upSlideLength:40]
                                                                 fillColor:kArtYellowColor];
    
    
    geometryLayer1.anchorPoint = CGPointMake(0.5f, 0.0f);
    
    geometryLayer1.position = startPoint;
    
    [artBGLayer addSublayer: geometryLayer1];
    
    
    CAShapeLayer *geometryLayer2 = [[AVShapeBaseLayer alloc] initWithFrame:currentLayer.bounds
                                                                 slidePath:[UIBezierPath geometryVStroke:nextLayer.bounds startXOffset:200 upSlideLength:80]
                                                                 fillColor:kArtYellowColor];
    
    
    geometryLayer2.anchorPoint = CGPointMake(0.5f, 0.0f);
    
    geometryLayer2.position = CGPointMake(kAVWindowCenter.x, startPoint.y+ 150);
    
    [artBGLayer addSublayer: geometryLayer2];
    
    
    CAShapeLayer *geometryLayer3 = [[AVShapeBaseLayer alloc] initWithFrame:currentLayer.bounds
                                                                 slidePath:[UIBezierPath geometryVStroke:nextLayer.bounds startXOffset:200 upSlideLength:80]
                                                                 fillColor:kArtYellowColor];
    
    
    geometryLayer3.anchorPoint = CGPointMake(0.5f, 0.0f);
    
    geometryLayer3.position = CGPointMake(kAVWindowCenter.x, startPoint.y+ 300);;
    
    [artBGLayer addSublayer: geometryLayer3];
    
    // mask
    CAShapeLayer *geomeMaskLayer1 = [[AVShapeBaseLayer alloc] initWithFrame:currentLayer.bounds
                                                                 slidePath:[UIBezierPath geometryVStroke:nextLayer.bounds startXOffset:200 upSlideLength:150]
                                                                 fillColor:kArtYellowColor];
    
    
    geomeMaskLayer1.anchorPoint = CGPointMake(0.5f, 0.0f);
    
    geomeMaskLayer1.position = CGPointMake(kAVWindowCenter.x, startPoint.y+ 40);
    
    [nextLayer.maskLayer addSublayer: geomeMaskLayer1];
    
    
    CAShapeLayer *geomeMaskLayer2 = [[AVShapeBaseLayer alloc] initWithFrame:currentLayer.bounds
                                                                  slidePath:[UIBezierPath homeVStroke:nextLayer.bounds startXOffset:200 upSlideLength:200]
                                                                  fillColor:kArtYellowColor];
    
    
    geomeMaskLayer2.anchorPoint = CGPointMake(0.5f, 0.0f);
    
    geomeMaskLayer2.position = CGPointMake(kAVWindowCenter.x, startPoint.y+ 380);
    
    [nextLayer.maskLayer addSublayer: geomeMaskLayer2];
    
    
}

#define startXOffset     100

#define twoShaperlength     60

#define threeShaperlength     50

#define colorBarShaperlength     200

#define fourShaperlength     (320+startXOffset+100)

-(void)startTestScene
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    UIImage *shuImage =[UIImage imageNamed:@"shu.png"];
    
    UIImage *origalImage = [UIImage imageNamed:@"gril.png"];
    
    
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilterYanHong
                                                    blurRadius:6];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CALayer *maskLayer = [CALayer layer];
    
    maskLayer.frame = currentLayer.bounds;
    
    maskLayer.anchorPoint = CGPointMake(0.0f, 0.5f);
    
    maskLayer.position=CGPointMake(currentLayer.frame.size.width, currentLayer.frame.size.height/2);
    
    maskLayer.backgroundColor  =[UIColor clearColor].CGColor;
    
    [nextLayer setMask: maskLayer];
    
    
    CAShapeLayer *geometryLayer1 = [CAShapeLayer layer];
    
    geometryLayer1.frame = CGRectMake(0, 0, startXOffset+twoShaperlength, currentLayer.frame.size.height);
    
    geometryLayer1.path = [self geometryStroke:currentLayer upSlideLength:twoShaperlength];
    
    geometryLayer1.fillColor = [UIColor colorWithRed:244 green:188 blue:39 alpha:1].CGColor;
    
    [homeLayer addSublayer: geometryLayer1];
    
    geometryLayer1.anchorPoint = CGPointMake(0.0f, 0.5f);
    
    geometryLayer1.position = maskLayer.position;
    
    return;
    
    
    CAShapeLayer *geometryLayer2 = [CAShapeLayer layer];
    
    geometryLayer2.frame =  CGRectMake(0, 0, startXOffset+twoShaperlength, currentLayer.frame.size.height);
    
    geometryLayer2.path = [self geometryStroke:currentLayer upSlideLength:twoShaperlength];
    
    geometryLayer2.fillColor = [UIColor whiteColor].CGColor;
    
    [maskLayer addSublayer: geometryLayer2];
    
    geometryLayer2.anchorPoint = CGPointMake(0.0f, 0.5f);
    
    geometryLayer2.position = CGPointMake(twoShaperlength, currentLayer.frame.size.height/2);
    
    
    GeometryGradientLayer *geometryLayer3 = [[GeometryGradientLayer alloc] initWithFrame: CGRectMake(0, 0, startXOffset+colorBarShaperlength, currentLayer.frame.size.height)];
    
    geometryLayer3.shapeLayer.path = [self geometryColorBarStroke:currentLayer upSlideLength:colorBarShaperlength];
    
    geometryLayer3.colorBarDirection = radientColorBarLeftToRight;
    
    geometryLayer3.colors = @[ (id)UIColorFromRGBAlpha(0xb45921, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0xb31921, 0.8f).CGColor,
                               (id)UIColorFromRGBAlpha(0xb31921, 0.8f).CGColor,
                               (id)UIColorFromRGBAlpha(0xd67a51, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0xd67a51, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                               
                               (id)UIColorFromRGBAlpha(0x4f8c91, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4f8c91, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0xdc642f, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0xdc642f, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4b6a7e, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4b6a7e, 1.0f).CGColor,
                               
                               (id)[[UIColor brownColor] colorWithAlphaComponent:1.0].CGColor,
                               (id)[[UIColor brownColor] colorWithAlphaComponent:1.0].CGColor,
                               (id)UIColorFromRGBAlpha(0x4b6a4e, 0.9f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4b6a4e, 0.9f).CGColor,
                               (id)[[UIColor grayColor] colorWithAlphaComponent:0.9].CGColor,
                               (id)[[UIColor grayColor] colorWithAlphaComponent:0.9].CGColor,
                               
                               (id)UIColorFromRGBAlpha(0x4f8c91, 0.8f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4f8c91, 0.9f).CGColor,
                               (id)UIColorFromRGBAlpha(0xdc642f, 0.9f).CGColor,
                               (id)UIColorFromRGBAlpha(0xdc642f, 0.8f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4b6a7e, 0.87f).CGColor,
                               (id)UIColorFromRGBAlpha(0x4b6a7e, 0.87f).CGColor,
                               
                               (id)UIColorFromRGBAlpha(0xb31921, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0xb31921, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0xd67a51, 0.9f).CGColor,
                               (id)UIColorFromRGBAlpha(0xd67a51, 0.9f).CGColor,
                               (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                               (id)UIColorFromRGBAlpha(0x664e66, 1.0f).CGColor,
                               
                               ];
    
    NSMutableArray *locations =[[NSMutableArray alloc] init];
    for (NSInteger index = 1; index < 17; index++) {
        
        NSNumber *item1 = [NSNumber numberWithFloat:0.01f*5*index];
        
        NSNumber *item2 = [NSNumber numberWithFloat:0.01f*5*index];
        
        [locations addObject: item1]; [locations addObject:item2];
    }
    
    geometryLayer3.locations = locations;
    
    [geometryLayer1 addSublayer: geometryLayer3];
    
    geometryLayer3.anchorPoint = CGPointMake(0.0f, 0.5);
    
    geometryLayer3.position = CGPointMake(2*twoShaperlength, currentLayer.position.y);
    
    
    // continute color bar
    NSArray *colorList = @[
                           (id)[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor,
                           (id)[[UIColor orangeColor] colorWithAlphaComponent:0.3].CGColor,
                           (id)[[UIColor redColor] colorWithAlphaComponent:0.2].CGColor,
                           (id)[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor,
                           (id)[[UIColor redColor] colorWithAlphaComponent:0.4].CGColor,
                           ];
    
    
    for (NSInteger index=0; index< 3; index++) {
        
        CAShapeLayer *geometrySubLayer = [CAShapeLayer layer];
        
        geometrySubLayer.frame = CGRectMake(0, 0, startXOffset+threeShaperlength, currentLayer.frame.size.height);
        
        CGFloat length = threeShaperlength;
        
        if (index==2) {
            length = threeShaperlength+30;
        }
        
        geometrySubLayer.path = [self geometryStroke:currentLayer upSlideLength:length];
        
        geometrySubLayer.fillColor =(__bridge CGColorRef)([colorList objectAtIndex:index]);
        
        [geometryLayer1 addSublayer: geometrySubLayer];
        
        geometrySubLayer.anchorPoint = CGPointMake(0.0f, 0.5);
        
        geometrySubLayer.position =CGPointMake(geometryLayer3.position.x+120+(index*threeShaperlength), geometryLayer3.position.y);
    }
    
    
    CAShapeLayer *geometryLayer5 = [CAShapeLayer layer];
    
    geometryLayer5.frame = currentLayer.bounds;
    
    geometryLayer5.path = [self geometryColorBarStroke:currentLayer upSlideLength:fourShaperlength];
    
    geometryLayer5.fillColor = [UIColor whiteColor].CGColor;
    
    [maskLayer addSublayer: geometryLayer5];
    
    geometryLayer5.anchorPoint = CGPointMake(0.0f, 0.5);
    
    geometryLayer5.position =CGPointMake(geometryLayer3.position.x+150+(3*threeShaperlength), geometryLayer3.position.y);
    
    
    for (NSInteger index=3; index< 5; index++) {
        
        CAShapeLayer *geometrySubLayer = [CAShapeLayer layer];
        
        geometrySubLayer.frame = CGRectMake(0, 0, startXOffset+threeShaperlength, currentLayer.frame.size.height);
        
        CGFloat length = twoShaperlength;
        
        if (index ==4) {
            length = 90;
        }
        
        geometrySubLayer.path = [self geometryStroke:currentLayer upSlideLength:length];
        
        geometrySubLayer.fillColor =(__bridge CGColorRef)([colorList objectAtIndex:index]);
        
        [geometryLayer1 addSublayer: geometrySubLayer];
        
        geometrySubLayer.anchorPoint = CGPointMake(0.0f, 0.5);
        
        //geometrySubLayer.position =CGPointMake(0, geometryLayer3.position.y);
        
        geometrySubLayer.position =CGPointMake(geometryLayer3.position.x+150+((index)*threeShaperlength), geometryLayer3.position.y);
    }
    
    CGPoint nextPosition = CGPointMake(-660, currentLayer.frame.size.height/2);
    
    
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime toValue: nextPosition];
    
    [geometryLayer1 addAnimation: moveAni forKey:@"moveAni"];
    
    [maskLayer addAnimation: moveAni forKey:@"moveAni"];
}

-(CGPathRef) geometryStroke:(CALayer *)currentLayer upSlideLength: (CGFloat)slideLength
{
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    
    CGFloat upStartLength = startXOffset;
    
    CGFloat upSlideLength = slideLength;
    
    // Set the starting point of the shape.
    [startPath moveToPoint:CGPointMake(upStartLength, 0)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength ,0)];
    
    [startPath addLineToPoint:CGPointMake(upSlideLength, currentLayer.frame.size.height/2)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength, currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength, currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(0, currentLayer.frame.size.height/2)];
    
    [startPath closePath];
    
    return  startPath.CGPath;
    
}

-(void)secondTranstiom
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 3;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    
}


-(void)AVSTShapeGeometryMoreARCRoundShow
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1.5;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];


    [homeLayer addSublayer: currentLayer];
    


    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];


    [homeLayer addSublayer: nextLayer];
    
    NSLog(@"%@------------masklayer",nextLayer.maskLayer);
    nextLayer.mask = nextLayer.maskLayer;
    NSLog(@"%@------------masklayer",nextLayer.mask);


    nextLayer.maskLayer.backgroundColor  =[UIColor clearColor].CGColor;
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5].CGColor];

    [currentLayer addSublayer: bgLayer];
    bgLayer.opacity = 0;

    CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration/3 withBeginTime:beginTime];

    [bgLayer addAnimation: openIn forKey:@"oepnId"];
//
    NSArray *lineWidthList = @[
                               [NSNumber numberWithInteger:kAVCeilfX(152)],
                               [NSNumber numberWithInteger:kAVCeilfX(61)],
                               [NSNumber numberWithInteger:kAVCeilfX(67)],
                               [NSNumber numberWithInteger:kAVCeilfX(176)],
                               ];
    
    NSArray *frameList = @[
                           [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(kAVCeilfX(651)), kAVLeftOffset(kAVCeilfX(648)), kAVCeilfX(704), kAVCeilfX(704))],
                           [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(kAVCeilfX(499)), kAVLeftOffset(kAVCeilfX(590)), kAVCeilfX(504), kAVCeilfX(504))],
                           [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(kAVCeilfX(504)), kAVLeftOffset(kAVCeilfX(502)), kAVCeilfX(400), kAVCeilfX(400))],
                           [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(kAVCeilfX(611)), kAVLeftOffset(kAVCeilfX(180)), kAVCeilfX(176), kAVCeilfX(176))],
                           ];
    
    for (NSInteger index =0; index <4 ; index++) {
        //for (NSInteger index =1; index <2; index++) {

        NSValue *sideValue  = [frameList objectAtIndex:index]; CGRect roundFrame = [sideValue CGRectValue];

        NSNumber *lineValue = [lineWidthList objectAtIndex:index]; NSInteger toWidth = [lineValue integerValue];

        CAShapeLayer  *bothLayer = [self createRoundShape:YES roundRect:roundFrame lineWidth:kAVCeilfY(10) ];
//
//        [currentLayer addSublayer: bothLayer];

        CAShapeLayer  *maskLayer =  [self createRoundShape:NO roundRect:roundFrame lineWidth:kAVCeilfY(10)];

        [nextLayer.maskLayer addSublayer: maskLayer];

        if (index !=2) {
            CATransform3D rotate45s = CATransform3DMakeRotation(M_PI_2*index, 0, 0, 1);

//            bothLayer.transform =rotate45s;
            maskLayer.transform =rotate45s;
        }

        CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:0.9 withBeginTime:0 fromValue:0 toValue:1 propertyName:kAVShapeStrokeEnd];

        CABasicAnimation *lineWidthAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1 withBeginTime:0.2 fromValue:5 toValue:toWidth propertyName:@"lineWidth"];
        lineWidthAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

        CABasicAnimation *lineWidthAni2 = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1 withBeginTime:0.2 fromValue:0 toValue:toWidth propertyName:@"lineWidth"];
        lineWidthAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];


        CAAnimationGroup *animationGroup1 = [[AVBasicRouteAnimate defaultInstance] groupAni:1.2 withBeginTime:beginTime aniArr: @[strokeEndAni,lineWidthAni]];


        CAAnimationGroup *animationGroup2 = [[AVBasicRouteAnimate defaultInstance] groupAni:1.2 withBeginTime:beginTime+ 0.12 aniArr: @[strokeEndAni,lineWidthAni2]];

//        [bothLayer addAnimation: animationGroup1 forKey:@"sale"];

//        [maskLayer addAnimation: animationGroup2 forKey:@"sale"];

    }
}

-(CAShapeLayer *)createRoundShape:(BOOL)isBorder roundRect:(CGRect)roundFrame lineWidth:(float)width
{
    CAShapeLayer  *shapeLayer =nil;
    
    UIBezierPath *shapePath =nil;
    
    shapePath = [UIBezierPath circularShape:roundFrame];
    
    shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame = roundFrame;
    
    shapeLayer.lineWidth = width;
    
    shapeLayer.lineCap = kCALineCapRound; //设置线头的样式为圆的
    shapeLayer.lineJoin = kCALineJoinRound; //设置线段转折点的样式
    
    if (isBorder ==YES) {
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.9].CGColor;
        
        shapeLayer.lineWidth = width;
    }else{
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
        
        shapeLayer.lineWidth = width-kAVCeilfX(10);
    }
    
    shapeLayer.path = shapePath.CGPath;
    
    return shapeLayer;
}

-(CAShapeLayer *)createShape:(BOOL)isBorder lineWidth:(float)width
{
    CAShapeLayer  *shapeLayer =nil;
    
    CGFloat offsetY = 0;
    
    UIBezierPath *shapePath =nil;
    
    shapePath = [UIBezierPath circularShape:kAVRectWindow];
    
    shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame = kAVRectWindow;
    
    shapeLayer.lineWidth = width;
    
    shapeLayer.top +=offsetY;
    
    if (isBorder ==YES) {
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.9].CGColor;
    }else{
        
        shapeLayer.fillColor = [UIColor blackColor].CGColor;
        
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    }
    
    shapeLayer.path = shapePath.CGPath;
    
    return shapeLayer;
}


-(CGPathRef) geometryColorBarStroke:(CALayer *)currentLayer upSlideLength: (CGFloat)slideLength
{
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    
    CGFloat upStartLength = startXOffset;
    
    CGFloat upSlideLength = slideLength;
    
    // Set the starting point of the shape.
    [startPath moveToPoint:CGPointMake(upStartLength, 0)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength ,0)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength+upSlideLength , currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(upStartLength, currentLayer.frame.size.height)];
    
    [startPath addLineToPoint:CGPointMake(0, currentLayer.frame.size.height/2)];
    
    [startPath closePath];
    
    return  startPath.CGPath;
    
}



#pragma mark -- 获取路径
- (CGPathRef )getAnimationOnePath{
    
    // 画出这个圆的路径
    // clockwise:是否是顺时针
    // startAngle: 起始角度
    // endAngle :终点角度
    UIBezierPath *ciclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(300/2,300/2) radius:0.8*kDeviceWidth/2 startAngle:M_PI * 3 / 2 endAngle:M_PI * 7 / 2 clockwise:YES];
    return ciclePath.CGPath;
}


#pragma mark -- 默认的动画
- (CAAnimationGroup *)AnimationOne{
    
    // 第一个满圆旋转动画
    
    CABasicAnimation *aniamtion1 = [CABasicAnimation animation];
    aniamtion1.keyPath = @"strokeEnd";
    aniamtion1.fromValue = @0;
    aniamtion1.toValue = @1;
    //    aniamtion1.removedOnCompletion = YES;
    aniamtion1.duration = 1.5;
    aniamtion1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    // 第二个檫除路径路径动画
    CABasicAnimation *aniamtion2 = [CABasicAnimation animation];
    aniamtion2.keyPath = @"strokeStart";
    aniamtion2.fromValue = @0;
    aniamtion2.toValue = @1;
    aniamtion2.duration = 1.5;
    aniamtion2.beginTime = 1.5;
    //    aniamtion1.removedOnCompletion = YES;
    aniamtion2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    // 最后合并到动画组当前去
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations =@[aniamtion1,aniamtion2];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode = kCAFillModeForwards;
    group.duration = 3;
    group.repeatCount = MAXFLOAT;
    return group;
    
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
