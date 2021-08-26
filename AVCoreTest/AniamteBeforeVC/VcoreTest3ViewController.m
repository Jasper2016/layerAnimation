//
//  VcoreTest3ViewController.m
//  AVCoreTest
//
//  Created by gemin on 15/11/25.
//  Copyright © 2015年 mac. All rights reserved.
//

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

#define AVLineWith          kAVCeilfY(5)

#define kLineMoveSize   kAVCeilfY(2)

#define kMoveDistanceOffset    220


#define kRectangleRadio(x)    (x*0.625)


#define KCameraPathStartArea    @"StartArea"

#define KCameraPathEndArea      @"EndArea"

@implementation VcoreTest3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
    
//    [self maskLineBlurStart];
    
//    [self maskLineBlurSecond];
    
//    [self maskLineBlurThrid];

    
//    [self lineArtFourSquare];
    
    [self camreaPath];
    
  //  [self camreaThreePath];
    
  //  [self camreaNotHasPath];
    
//    [self testMask];
    
    //开始镜头
    [self smoothLineStart];
    
    //[self AVTSmoothLineSlashToBothSide];
    
//     [self AVTSmoothLineCenterToRightLeft];

 //   [self AVTSmoothLineBottomToTop];
}

/*
-(void)AVTSmoothLineStart
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    UIImage *origalImage = [UIImage imageNamed:@"1.png"];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:3];
    
    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithblueLayerBefore:kAVRectWindow
                                                                vContentRect:kAVRectWindow
                                                                 origalImage:origalImage
                                                                   blueImage:imageBlur];
    
    [currentLayer addSublayer: firstLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(15, 20, broadSize.width-30, broadSize.height-30)
                                                                   intText:dateString
                                                                  textFont:[UIFont fontWithName:@"SnellRoundhand" size:51]
                                                                 textColor:[UIColor whiteColor]];
    
    
    
    textLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y+kTitleIntervel);
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
    
    CGFloat offset = textSize.width+kFashionWeedEndLineExtreWidth;
    
    AVBottomLayer *onelineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, offset, kLineStartWidth) bgColor:[UIColor whiteColor].CGColor];
    onelineLayer.allowsEdgeAntialiasing = YES;
    onelineLayer.position = kAVWindowCenter;
    [currentLayer addSublayer:onelineLayer];
    onelineLayer.mask = onelineLayer.maskLayer;
    
    AVBottomLayer *twolineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, offset, kLineStartWidth) bgColor:[UIColor whiteColor].CGColor];
    twolineLayer.position = kAVWindowCenter;
    twolineLayer.allowsEdgeAntialiasing = YES;
    [currentLayer addSublayer:twolineLayer];
    twolineLayer.mask = twolineLayer.maskLayer;
    
    CGPoint point1 = CGPointMake(offset*1.5, kLineStartWidth/2);
    CGPoint point2 = CGPointMake(offset/2, kLineStartWidth/2);
    CGPoint point3 = CGPointMake(-offset/2, kLineStartWidth/2);
    CGRect rect1 = CGRectMake(0, 0, offset, kLineStartWidth);
    CGRect rect2 = CGRectMake(0, 0, 0, kLineStartWidth);
    CGFloat trans1 = DEGREES_TO_RADIANS(0);
    CGFloat trans2 = DEGREES_TO_RADIANS(45);
    CGFloat trans3 = DEGREES_TO_RADIANS(-45);
    CGFloat moveOffset = textSize.height/2;
    //第一个线动画
    {
        
        CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration/6 withBeginTime:beginTime fromValue:point3 toValue:point2 propertyName:@"position"];
        
        [onelineLayer.maskLayer addAnimation:positionAni forKey:@"positionAni"];
        
        CAAnimationGroup *transAni = [self lineTransAniWithFromTrans:trans2 toTrans:trans1
                                                        fromPosition:kAVWindowCenter
                                                          toPosition:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y-moveOffset)
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
                                                        fromPosition:kAVWindowCenter
                                                          toPosition:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y+moveOffset)
                                                            duration:duration
                                                           beginTime:beginTime];
        
        [twolineLayer addAnimation:transAni forKey:@"transAni"];
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:duration/5 withBeginTime:beginTime+duration fromValue:[NSValue valueWithCGRect:rect1] toValue:[NSValue valueWithCGRect:rect2] propertyName:@"bounds"];
        [twolineLayer.maskLayer addAnimation:boundsAni forKey:@"boundsAni"];
    }
}
*/
 
-(void)AVTSmoothLineSlashToBothSide
{
    
    CGFloat offsetValue = kAVWindowWidth*3/2;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.maskLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    nextLayer.maskLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.2],
                             [NSNumber numberWithFloat:0.45],
                             
                             [NSNumber numberWithFloat:0.6],
                             [NSNumber numberWithFloat:0.9],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, AVLineWith,  0)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, AVLineWith,  kAVWindowHeight+(offsetValue*2))],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, AVLineWith,  kAVWindowHeight+(offsetValue*2))],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVCeilfY(320*kAVDiagonalSlope), kAVWindowHeight+(offsetValue*2))],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVCeilfY(320*kAVDiagonalSlope), kAVWindowHeight+(offsetValue*2))],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(offsetValue*2),kAVWindowHeight+(offsetValue*2))],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5.2 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    
    [nextLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-offsetValue, -offsetValue,kAVWindowWidth+(offsetValue*2), kAVWindowHeight+(offsetValue*2));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = AVLineWith;
    lineLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    [homeLayer addSublayer: lineLayer];
    
    [lineLayer addAnimation: leftRightMoveAni forKey:@"ds"];
    
}


-(NSDictionary *)rectMoveXYByNoAwareStruct:(CGRect)contendRect{
        
        CGRect startArea = CGRectZero;
        
        CGRect endArea = CGRectZero;
        
        CGFloat startX = 0, startY = 0;
    
        CGFloat imageTop = 0,imageLeft = 0;
    
        if (contendRect.size.width> contendRect.size.height) {
            
            imageLeft =(kAVWindowWidth - contendRect.size.width)/2;
            
            if ((contendRect.size.width- kAVWindowWidth)> kMoveDistanceOffset) {
                
                startX = (contendRect.size.width-kMoveDistanceOffset-kAVWindowWidth)/2;
                
                startArea = CGRectMake(startX+imageLeft, 0, kAVWindowWidth, kAVWindowHeight);
                
                endArea = CGRectMake(startX+kMoveDistanceOffset+imageLeft, 0, kAVWindowWidth, kAVWindowHeight);
            }else{
                
                startArea = CGRectMake(imageLeft, 0, kAVWindowWidth, kAVWindowHeight);
                
                endArea = CGRectMake(contendRect.size.width-kAVWindowWidth+imageLeft, 0, kAVWindowWidth, kAVWindowHeight);
            }
            
            return @{ KCameraPathStartArea:[NSValue valueWithCGRect:startArea],
                      KCameraPathEndArea:   [NSValue valueWithCGRect:endArea],
                      };
            
        }else{
            
            imageTop =(kAVWindowHeight - contendRect.size.height)/2;
            
            if ((contendRect.size.height- kAVWindowHeight)> kMoveDistanceOffset) {
                
                
                startY = (contendRect.size.height-kMoveDistanceOffset-kAVWindowHeight)/2;
                
                startArea = CGRectMake(0, startY+imageTop, kAVWindowWidth, kAVWindowHeight);
                
                endArea = CGRectMake(0, startY+kMoveDistanceOffset+imageTop, kAVWindowWidth, kAVWindowHeight);
            }else{
                
                startArea = CGRectMake(0, imageTop, kAVWindowWidth, kAVWindowHeight);
                
                endArea = CGRectMake(0, contendRect.size.height-kAVWindowWidth+imageTop, kAVWindowWidth, kAVWindowHeight);
            }
            
            return  @{ KCameraPathStartArea:[NSValue valueWithCGRect:startArea],
                       KCameraPathEndArea:   [NSValue valueWithCGRect:endArea],
                       };
            
            
        }
}

-(void)smoothLineStart
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    CGFloat duration = 0.4f;
    
    CGFloat startDuration = 0.3f;
    
     CGFloat keepDuration = 1.8f;
    
    CGFloat offsetX = kAVCeilfX(100.0f);
    CGFloat offsetY = kAVCeilfY(100.0f);
    beginTime +=0.5;
    UIBezierPath *rightUpPath = [UIBezierPath bezierPath];
    [rightUpPath moveToPoint:CGPointMake(offsetX, 2*offsetY)];
    [rightUpPath addLineToPoint:CGPointMake(kAVWindowWidth-2*offsetX, offsetY)];
    CAShapeLayer *rightUpPathLayer = [CAShapeLayer layer];
    rightUpPathLayer.path = rightUpPath.CGPath;
    rightUpPathLayer.fillColor = [UIColor clearColor].CGColor;
    rightUpPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    rightUpPathLayer.lineWidth = kLineMoveSize;
    [currentLayer addSublayer:rightUpPathLayer];
    NSNumber *rightUpFromeValue = @1;
    NSNumber *rightUpToValue = @0;
    
    CABasicAnimation *rightUpStrokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:0 fromValue:rightUpFromeValue toValue:rightUpToValue propertyName:@"strokeStart"];
    
    CABasicAnimation *rightUpStrokeEndAni1 = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:keepDuration-startDuration fromValue:rightUpFromeValue toValue:rightUpToValue propertyName:@"strokeEnd"];
    
    CAAnimationGroup *topAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:keepDuration withBeginTime:beginTime aniArr: @[rightUpStrokeEndAni,rightUpStrokeEndAni1]];
    
    [rightUpPathLayer addAnimation:topAniGroup forKey:nil];
    
    
    UIBezierPath *leftUpPath = [UIBezierPath bezierPath];
    [leftUpPath moveToPoint:CGPointMake(2*offsetX, offsetY)];
    [leftUpPath addLineToPoint:CGPointMake(kAVWindowWidth-offsetX, 2*offsetY)];
    CAShapeLayer *leftUpPathLayer = [CAShapeLayer layer];
    leftUpPathLayer.path = leftUpPath.CGPath;
    leftUpPathLayer.fillColor = [UIColor clearColor].CGColor;
    leftUpPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    leftUpPathLayer.lineWidth = kLineMoveSize;
    [currentLayer addSublayer:leftUpPathLayer];
    NSNumber *leftUpFromeValue = @0;
    NSNumber *leftUpToValue = @1;
    CABasicAnimation *leftUpStrokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:0 fromValue:leftUpFromeValue toValue:leftUpToValue propertyName:@"strokeEnd"];
    
    CABasicAnimation *leftUpStrokeEndAni1 = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:keepDuration-startDuration fromValue:leftUpFromeValue toValue:leftUpToValue propertyName:@"strokeStart"];
    
    CAAnimationGroup *leftUpAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:keepDuration withBeginTime:beginTime+0.25 aniArr: @[leftUpStrokeEndAni,leftUpStrokeEndAni1]];
    
    [leftUpPathLayer addAnimation:leftUpAniGroup forKey:nil];
    
    
    UIBezierPath *rightDownPath = [UIBezierPath bezierPath];
    [rightDownPath moveToPoint:CGPointMake(offsetX, kAVWindowHeight-2*offsetY)];
    [rightDownPath addLineToPoint:CGPointMake(kAVWindowWidth-2*offsetX, kAVWindowHeight-offsetY)];
    CAShapeLayer *rightDownPathLayer = [CAShapeLayer layer];
    rightDownPathLayer.path = rightDownPath.CGPath;
    rightDownPathLayer.fillColor = [UIColor clearColor].CGColor;
    rightDownPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    rightDownPathLayer.lineWidth = kLineMoveSize;
    [currentLayer addSublayer:rightDownPathLayer];
    CABasicAnimation *rightDownStrokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:0 fromValue:leftUpFromeValue toValue:leftUpToValue propertyName:@"strokeEnd"];
    
    CABasicAnimation *rightDownStrokeEndAni1 = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:keepDuration-startDuration fromValue:leftUpFromeValue toValue:leftUpToValue propertyName:@"strokeStart"];
    
    CAAnimationGroup *lrightDownAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:keepDuration withBeginTime:beginTime+0.25 aniArr: @[rightDownStrokeEndAni,rightDownStrokeEndAni1]];
    
    [rightDownPathLayer addAnimation:lrightDownAniGroup forKey:nil];
    
    
    
    UIBezierPath *leftDownPath = [UIBezierPath bezierPath];
    [leftDownPath moveToPoint:CGPointMake(kAVWindowWidth-offsetX, kAVWindowHeight-2*offsetY)];
    [leftDownPath addLineToPoint:CGPointMake(2*offsetX, kAVWindowHeight-offsetY)];
    CAShapeLayer *leftDownPathLayer = [CAShapeLayer layer];
    leftDownPathLayer.path = leftDownPath.CGPath;
    leftDownPathLayer.fillColor = [UIColor clearColor].CGColor;
    leftDownPathLayer.strokeColor = [UIColor whiteColor].CGColor;
    leftDownPathLayer.lineWidth = kLineMoveSize;
    [currentLayer addSublayer:leftDownPathLayer];
    CABasicAnimation *leftDownStrokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:0 fromValue:rightUpFromeValue toValue:rightUpToValue propertyName:@"strokeStart"];

    CABasicAnimation *leftDownStrokeEndAni1 = [[AVBasicRouteAnimate defaultInstance] customBasic:startDuration withBeginTime:keepDuration-startDuration fromValue:leftUpToValue toValue:leftUpFromeValue propertyName:@"strokeEnd"];
    
    CAAnimationGroup *leftDownDownAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:keepDuration withBeginTime:beginTime+0.35 aniArr: @[leftDownStrokeEndAni,leftDownStrokeEndAni1]];
    
    [leftDownPathLayer addAnimation:leftDownDownAniGroup forKey:nil];
    
    
    
    
    CGFloat textLayerWidth = 500;
    CGFloat textLayerHeight = 150;
    
   // NSDictionary *inputDic = [artParameters objectForKey: kAVSceneAniStartParmKey];
//    
//    NSString *titleString = [AVDicKeyValueUnit dicNSStringValue:inputDic key:kAVWiddingThemeKey defaultValue:@""];
    
    //    if (titleString ) {

    
            CGFloat top = (kAVWindowHeight-textLayerHeight)/2+40;
    
            CGFloat left = (kAVWindowWidth-textLayerWidth)/2;
    
    AVBasicTextLayer *titleLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(left, top, textLayerWidth, textLayerHeight) intText:@"D游戏引擎高端实战培训" textFont:[UIFont systemFontOfSize:40]  textColor:[UIColor whiteColor]];

    
    
            [currentLayer addSublayer: titleLayer];
    
            titleLayer.mask = titleLayer.maskLayer;
    
    // top line
    NSArray *topKeyTime = @[
                            [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:0.01],
                            
                            [NSNumber numberWithFloat:0.35],
                            
                             [NSNumber numberWithFloat:0.8],
                            
                            [NSNumber numberWithFloat:1],
                            ];
    
    NSArray *topCenterValues = @[
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  textLayerHeight)],
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, 50, textLayerHeight)],
                                 
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, textLayerWidth,textLayerHeight)],
                                 
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, textLayerWidth,textLayerHeight)],
                                 
                                [NSValue valueWithCGRect:CGRectMake(0, 0, 0,textLayerHeight)],
                                 ];
    
    CAKeyframeAnimation *topBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1.6 withBeginTime:beginTime+0.4 propertyName:kAVBasicAniBounds values:topCenterValues keyTimes:topKeyTime];
    
    [titleLayer.maskLayer addAnimation:topBoundsAni forKey:@"df"];
    
    //    }
}

-(void)testMask
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(10,200, 300, 100);
    lineLayer.backgroundColor = [UIColor whiteColor].CGColor;
   // lineLayer.borderWidth = AVLineWith;
    [homeLayer addSublayer: lineLayer];
    
    
    CALayer *maskeLayer = [CALayer layer];
    maskeLayer.frame = lineLayer.bounds;
    maskeLayer.backgroundColor = [UIColor blackColor].CGColor;
    
    [lineLayer setMask: maskeLayer];
    
    
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(0, 50)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth, 50)],
                              ];
    
    CAKeyframeAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniPosition values:centerValues keyTimes:moveKeyTime];
    
    [maskeLayer addAnimation:centerMoveAni forKey:@"bounrdsSpringAni"];
}


-(void)AVTSmoothLineBottomToTop
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 4;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
    
    nextLayer.maskLayer.frame = CGRectMake(0,kAVWindowHeight, kAVWindowWidth, kAVWindowHeight+(AVLineWith*2));
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.3],
                             [NSNumber numberWithFloat:0.82],
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowHeight)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, -AVLineWith)],
                              ];
    
    CAKeyframeAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime+0.5 propertyName:kAVBasicAniPosition values:centerValues keyTimes:moveKeyTime];
    
    [nextLayer.maskLayer addAnimation:centerMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(0,kAVWindowHeight, kAVWindowWidth, AVLineWith);
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = AVLineWith;
    [homeLayer addSublayer: lineLayer];
    
    lineLayer.anchorPoint = CGPointMake(0.5, 0);
    
    [lineLayer addAnimation: centerMoveAni forKey:@"ds"];
}

#define kDistanceWith        80

-(void)camreaPath
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    UIImage *shuImage =[UIImage imageNamed:@"2222"];//desktop
    
    FaceDetectDTO *faceDTO = [[FaceDetectManager sharedFaceDetectManager] faceDetect:shuImage windowRect:kAVRectWindow];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:faceDTO.contendRect
                                                        withImage:shuImage];

    currentLayer.contentLayer.contentsGravity = kCAGravityResizeAspect;
    
    [homeLayer addSublayer: currentLayer];
    currentLayer.backgroundColor =[UIColor redColor].CGColor;
    
    CGRect endArt = [AVRectUnit rectFromCenterByFaceAwareStruct:faceDTO.faceAwareStruct
                                                  oneFaceStruct:faceDTO.faceStruct1];
    
    CAAnimationGroup *cameraMoveAni = [[AVSceneAnimateCamera defaultInstance] cameraMovePath:duration withBeginTime:beginTime startArea:endArt endArea: CGRectMake(0, 0,kHDScreenHight, kHDScreenHight) windowArea:kAVRectWindow];

    [currentLayer.contentLayer addAnimation:cameraMoveAni forKey:@"cameraMoveAni"];
    
}


-(void)camreaNotHasPath
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 5;
    
    UIImage *shuImage =[UIImage imageNamed:@"cat"];
    
    FaceDetectDTO *faceDTO = [[FaceDetectManager sharedFaceDetectManager] faceDetect:shuImage windowRect:kAVRectWindow];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:faceDTO.contendRect
                                                           withImage:shuImage];
    
    [homeLayer addSublayer: currentLayer];
    
    CGRect endArea = [AVRectUnit rectFromCenterByNoAwareStruct:faceDTO.contendRect];
    
    CGRect startArea =kAVRectWindow;
    
    //CGRect endArea =[[faceRectDic objectForKey:KCameraPathEndArea] CGRectValue];
    
    CAAnimationGroup *cameraMoveAni = [[AVSceneAnimateCamera defaultInstance] cameraMovePath:duration withBeginTime:beginTime startArea:startArea endArea:endArea windowArea:kAVRectWindow];
    
    currentLayer.contentLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [currentLayer.contentLayer addAnimation:cameraMoveAni forKey:@"cameraMoveAni"];
    
}

-(void)camreaThreePath
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 5;
    
    UIImage *shuImage =[UIImage imageNamed:@"0.png"];
    
    FaceDetectDTO *faceDTO = [[FaceDetectManager sharedFaceDetectManager] faceDetect:shuImage windowRect:kAVRectWindow];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:faceDTO.contendRect
                                                           withImage:shuImage];
    
    [homeLayer addSublayer: currentLayer];
    currentLayer.backgroundColor =[UIColor redColor].CGColor;
    
    CGRect secodArea = [AVRectUnit rectFromCenterByFaceAwareStruct:faceDTO.faceAwareStruct
                                                  oneFaceStruct:faceDTO.faceStruct2];
    
    CGRect endArea = [AVRectUnit rectFromCenterByFaceAwareStruct:faceDTO.faceAwareStruct
                                                  oneFaceStruct:faceDTO.faceStruct1];
    
    CAAnimationGroup *thressMoreAni = [[AVSceneAnimateCamera defaultInstance] cameraMoveThreePath:duration withBeginTime:beginTime startArea:kAVRectWindow secondArea:secodArea  endArea:endArea windowArea:kAVRectWindow];
    
    [currentLayer.contentLayer addAnimation:thressMoreAni forKey:@"cameraMoveAni"];
    
}


-(void)maskLineRightToLeft
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.maskLayer.anchorPoint = CGPointMake(0, 0.5);
    
    nextLayer.maskLayer.frame = CGRectMake(0,-AVLineWith, kAVWindowWidth+(AVLineWith*2), kAVWindowHeight+(AVLineWith*2));
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             
                             [NSNumber numberWithFloat:0.3],
                             [NSNumber numberWithFloat:0.82],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth, kAVWindowCenter.y)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(-AVLineWith,kAVWindowCenter.y)],
                              ];
    
    CAKeyframeAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniPosition values:centerValues keyTimes:moveKeyTime];
    
    [nextLayer.maskLayer addAnimation:centerMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(kAVWindowWidth,-AVLineWith, AVLineWith, kAVWindowHeight+(AVLineWith*2));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = AVLineWith;
    [homeLayer addSublayer: lineLayer];
    
    lineLayer.anchorPoint = CGPointMake(0, 0.5);
    
    [lineLayer addAnimation: centerMoveAni forKey:@"ds"];
    
}


#define kLineMoveSize       2

-(void)testGroup
{
    CGFloat offsetXY = 10;
    
    CGFloat endMoveOffset = 50;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"3.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat lineWith  = 150; //kAVWindowWidth-(offsetXY*2);
    
    
    AVBottomLayer  *topLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(100, 500, lineWith, kLineMoveSize)
                                                                bgColor:[UIColor whiteColor].CGColor];
    
    topLineLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    
    topLineLayer.anchorPoint = CGPointMake(1, 0.5);
    
    [currentLayer addSublayer: topLineLayer];
    
    
    
    // top line
    NSArray *topKeyTime = @[
                            [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:0.01],
                            
                             [NSNumber numberWithFloat:0.3],
                            
                             [NSNumber numberWithFloat:0.7],
                            
                            [NSNumber numberWithFloat:1],
                            ];
    
    NSArray *topCenterValues = @[
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kLineMoveSize)],
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, 50, kLineMoveSize)],
                                 
                                 [NSValue valueWithCGRect:CGRectMake(0, 0, 150,kLineMoveSize)],
                                 
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, 150,kLineMoveSize)],
                                 
                                  [NSValue valueWithCGRect:CGRectMake(0, 0, 0,kLineMoveSize)],
                                 ];
    
    CAKeyframeAnimation *topBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2 withBeginTime:0 propertyName:kAVBasicAniBounds values:topCenterValues keyTimes:topKeyTime];
    
    CABasicAnimation *topMoveCenter = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4*2 withBeginTime:0
                                                                                  fromValue:CGPointMake(100, 500) toValue:CGPointMake(250, 350)];
    
    CABasicAnimation *opacityClose = [[AVBasicRouteAnimate defaultInstance] opacityClose:0.1 withBeginTime:2];
    
    CAAnimationGroup *topAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2.1 withBeginTime:beginTime+0.5 aniArr: @[topBoundsAni,topMoveCenter,opacityClose]];
    

    [topLineLayer addAnimation:topAniGroup forKey:@"boundsAni"];
}

-(void)lineArtFourSquare
{
    CGFloat offsetXY = 80;
    
     CGFloat endMoveOffset = 50;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"3.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    CGFloat lineWith  = kAVWindowWidth-(offsetXY*2);
    
    
    
    // top line
    NSArray *topKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.01],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *topCenterValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kLineMoveSize)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 150, kLineMoveSize)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, lineWith,kLineMoveSize)],
                              ];
    
    CAKeyframeAnimation *topBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:0 propertyName:kAVBasicAniBounds values:topCenterValues keyTimes:topKeyTime];
    
    CABasicAnimation *topMoveCenter = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:1
                                                                                    fromValue:CGPointMake(kAVWindowCenter.x, offsetXY) toValue:CGPointMake(-endMoveOffset, offsetXY)];
    
    CABasicAnimation *opacityClose = [[AVBasicRouteAnimate defaultInstance] opacityClose:0.1 withBeginTime:1.3];
    
    CAAnimationGroup *topAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime+0.5 aniArr: @[topBoundsAni,topMoveCenter,opacityClose]];
    
    
    
    AVBottomLayer  *topLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(offsetXY, offsetXY, lineWith, kLineMoveSize)
                                                                bgColor:[UIColor whiteColor].CGColor];

    [currentLayer addSublayer: topLineLayer];
    
    [topLineLayer addAnimation:topAniGroup forKey:@"boundsAni"];
    
    //right  line
    NSArray *rightKeyTime = @[
                            [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:0.01],
                            
                            [NSNumber numberWithFloat:1],
                            ];
    
    NSArray *rightCenterValues = @[
                                 [NSValue valueWithCGRect:CGRectMake(0, 0,kLineMoveSize, 0)],
                                 [NSValue valueWithCGRect:CGRectMake(0, 0,kLineMoveSize, 150)],
                                 
                                 [NSValue valueWithCGRect:CGRectMake(0, 0,kLineMoveSize, lineWith)],
                                 ];
    
    CAKeyframeAnimation *rightBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:0 propertyName:kAVBasicAniBounds values:rightCenterValues keyTimes:rightKeyTime];
    
    CABasicAnimation *rightMoveCenter = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:1
                                                                                  fromValue:CGPointMake(kAVWindowWidth-offsetXY, kAVWindowCenter.y) toValue:CGPointMake(kAVWindowWidth-offsetXY, -endMoveOffset)];
    
    CAAnimationGroup *rightAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2 withBeginTime:beginTime+0.6 aniArr: @[rightBoundsAni,rightMoveCenter,opacityClose]];
    
    AVBottomLayer  *rightLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(kAVWindowWidth-offsetXY, offsetXY, kLineMoveSize, lineWith)
                                                                bgColor:[UIColor whiteColor].CGColor];
    
    [currentLayer addSublayer: rightLineLayer];
    
    [rightLineLayer addAnimation:rightAniGroup forKey:@"boundsAni"];
    
    
    //bottom line
    NSArray *bottomKeyTime = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:0.01],
                              
                              [NSNumber numberWithFloat:1],
                              ];
    
    NSArray *bottomCenterValues = @[
                                   [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kLineMoveSize)],
                                   [NSValue valueWithCGRect:CGRectMake(0, 0, 150, kLineMoveSize)],
                                   
                                   [NSValue valueWithCGRect:CGRectMake(0, 0, lineWith,kLineMoveSize)],
                                   ];
    
    CAKeyframeAnimation *bottomBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:0 propertyName:kAVBasicAniBounds values:bottomCenterValues keyTimes:bottomKeyTime];
    
    CABasicAnimation *bottomMoveCenter = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:1
                                                                                    fromValue:CGPointMake( kAVWindowCenter.x,kAVWindowHeight-offsetXY) toValue:CGPointMake(kAVWindowWidth+endMoveOffset, kAVWindowHeight-offsetXY)];
    
    CAAnimationGroup *bottomAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2 withBeginTime:beginTime+0.7 aniArr: @[bottomBoundsAni,bottomMoveCenter,opacityClose]];
    
    
    AVBottomLayer  *bottomLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(offsetXY, kAVWindowHeight-offsetXY, lineWith, kLineMoveSize)
                                                                  bgColor:[UIColor whiteColor].CGColor];
    
    [currentLayer addSublayer: bottomLineLayer];
    
    [bottomLineLayer addAnimation:bottomAniGroup forKey:@"boundsAni"];
    
    
    //left line
    NSArray *leftKeyTime = @[
                               [NSNumber numberWithFloat:0],
                               [NSNumber numberWithFloat:0.01],
                               
                               [NSNumber numberWithFloat:1],
                               ];
    
    NSArray *leftCenterValues = @[
                                  [NSValue valueWithCGRect:CGRectMake(0, 0,kLineMoveSize, 0)],
                                  [NSValue valueWithCGRect:CGRectMake(0, 0,kLineMoveSize, 150)],
                                  
                                  [NSValue valueWithCGRect:CGRectMake(0, 0,kLineMoveSize, lineWith)],
                                    ];
    
    
    CAKeyframeAnimation *leftBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:0.4 withBeginTime:0 propertyName:kAVBasicAniBounds values:leftCenterValues keyTimes:leftKeyTime];
    
    CABasicAnimation *leftMoveCenter = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:1
                                                                                     fromValue:CGPointMake(offsetXY, kAVWindowCenter.y) toValue:CGPointMake(offsetXY, kAVWindowHeight+endMoveOffset)];
    
    CAAnimationGroup *leftAniGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2 withBeginTime:beginTime+0.8 aniArr: @[leftBoundsAni,leftMoveCenter,opacityClose]];
    
    
    AVBottomLayer  *leftLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(offsetXY, offsetXY, kLineMoveSize, lineWith)
                                                                   bgColor:[UIColor whiteColor].CGColor];
    
    [currentLayer addSublayer: leftLineLayer];
    
    [leftLineLayer addAnimation:leftAniGroup forKey:@"boundsAni"];
}

-(void)maskLineBlurStart
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    UIImage *origalImage = [UIImage imageNamed:@"gril.png"];

    

    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:6];
    
    
    AVBasicLayer *blurBothLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                         vContentRect:kAVRectWindow
                                                            withImage:imageBlur];
    
    [homeLayer addSublayer: blurBothLayer];
    

    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:origalImage];
    
    [homeLayer addSublayer: currentLayer];
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:1],
                             [NSNumber numberWithFloat:1.2],
                             
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5 withBeginTime:beginTime  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    [currentLayer.contentLayer addAnimation:scaleAni forKey:@"sdf"];
    
    [blurBothLayer.contentLayer addAnimation:scaleAni forKey:@"sdf"];
    
    
    
    currentLayer.mask = currentLayer.maskLayer;
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.1],
                             
                             [NSNumber numberWithFloat:0.4],
                             [NSNumber numberWithFloat:0.8],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth/2,  0)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+20, AVLineWith)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVWindowWidth+20, 250)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVWindowWidth+20, 250)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+20,kAVWindowHeight+20)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1.2 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    
    //leftRightMoveAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];
    
    [currentLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-AVLineWith, -AVLineWith,kAVWindowWidth+(AVLineWith*2), kAVWindowHeight+(AVLineWith*2));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = AVLineWith;
    [homeLayer addSublayer: lineLayer];
    
    [lineLayer addAnimation: leftRightMoveAni forKey:@"ds"];
    
}


-(void)AVTSmoothLineCenterToRightLeft
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
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.2],
                             [NSNumber numberWithFloat:0.45],
                             
                             [NSNumber numberWithFloat:0.6],
                             [NSNumber numberWithFloat:0.9],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, AVLineWith,  0)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, AVLineWith,  kAVWindowHeight+(AVLineWith*2))],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, AVLineWith,  kAVWindowHeight+(AVLineWith*2))],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVCeilfX(300), kAVWindowHeight+(AVLineWith*2))],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVCeilfX(300), kAVWindowHeight+(AVLineWith*2))],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+(AVLineWith*2),kAVWindowHeight+(AVLineWith*2))],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime+0.5 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    
    //leftRightMoveAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];
    
    [nextLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-AVLineWith, -AVLineWith,kAVWindowWidth+(AVLineWith*2), kAVWindowHeight+(AVLineWith*2));
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = AVLineWith;
    [homeLayer addSublayer: lineLayer];
    
    [lineLayer addAnimation: leftRightMoveAni forKey:@"ds"];
    
}

//-(void)maskLineRightToLeft
//{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
//    
//    CGFloat duration = 2;
//    
//    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
//                                                        vContentRect:kAVRectWindow
//                                                           withImage:[UIImage imageNamed:@"0.png"]];
//    
//    
//    [homeLayer addSublayer: currentLayer];
//    
//    
//    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
//                                                     vContentRect:kAVRectWindow
//                                                        withImage:[UIImage imageNamed:@"1.png"]];
//    
//    
//    [homeLayer addSublayer: nextLayer];
//    
//    nextLayer.mask = nextLayer.maskLayer;
//    
//    nextLayer.maskLayer.anchorPoint = CGPointMake(0, 0.5);
//    
//    nextLayer.maskLayer.frame = CGRectMake(0,-AVLineWith, kAVWindowWidth+(AVLineWith*2), kAVWindowHeight+(AVLineWith*2));
//    
//    NSArray *moveKeyTime = @[
//                             [NSNumber numberWithFloat:0],
//                             
//                             [NSNumber numberWithFloat:0.3],
//                             [NSNumber numberWithFloat:0.82],
//                             
//                             [NSNumber numberWithFloat:1],
//                             ];
//    
//    NSArray *centerValues = @[
//                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth, kAVWindowCenter.y)],
//                              
//                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
//                              [NSValue valueWithCGPoint:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)],
//                              
//                              [NSValue valueWithCGPoint:CGPointMake(-AVLineWith,kAVWindowCenter.y)],
//                              ];
//    
//    CAKeyframeAnimation *centerMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniPosition values:centerValues keyTimes:moveKeyTime];
//    
//    [nextLayer.maskLayer addAnimation:centerMoveAni forKey:@"bounrdsSpringAni"];
//    
//    CALayer *lineLayer = [CALayer layer];
//    lineLayer.frame = CGRectMake(kAVWindowWidth,-AVLineWith, AVLineWith, kAVWindowHeight+(AVLineWith*2));
//    lineLayer.borderColor = [UIColor whiteColor].CGColor;
//    lineLayer.borderWidth = AVLineWith;
//    [homeLayer addSublayer: lineLayer];
//    
//    lineLayer.anchorPoint = CGPointMake(0, 0.5);
//    
//    [lineLayer addAnimation: centerMoveAni forKey:@"ds"];
//    
//    
//}

-(void)maskLineBlur2
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;

    CGFloat duration = 2;

    UIImage *origalImage = [UIImage imageNamed:@"3.png"];

    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:4];
    
    
    AVBasicLayer *blurBothLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:imageBlur];
    
    [homeLayer addSublayer: blurBothLayer];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:origalImage];
    
    [homeLayer addSublayer: currentLayer];

    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:1],
                             [NSNumber numberWithFloat:1.2],

                             ];

    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];


    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5 withBeginTime:beginTime  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;

    [currentLayer.contentLayer addAnimation:scaleAni forKey:@"sdf"];
    
    [blurBothLayer.contentLayer addAnimation:scaleAni forKey:@"sdf"];
    
    

    currentLayer.mask = currentLayer.maskLayer;

    NSArray *moveKeyTime = @[
                         [NSNumber numberWithFloat:0],

                         [NSNumber numberWithFloat:0.4],
                         [NSNumber numberWithFloat:0.7],

                         [NSNumber numberWithFloat:1],
                         ];

    NSArray *centerValues = @[
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.04f, 0.0f, 1.0f)],
                              
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.04f, 0.45f, 1.0f)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.04f, 0.45f, 1.0f)],
                              
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.04f, 1.04f, 1.0f)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:3 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniTransform values:centerValues keyTimes:moveKeyTime];

//    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:1 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];

    //leftRightMoveAni.timingFunction = [CAMediaTimingFunction easeInOutCenterQuick];

    [currentLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];

    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-10, -10,kAVWindowWidth+20, kAVWindowHeight+20);
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = 5;
    [homeLayer addSublayer: lineLayer];

    [lineLayer addAnimation: leftRightMoveAni forKey:@"ds"];

}


-(void)maskLineBlur
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    UIImage *origalImage = [UIImage imageNamed:@"3.png"];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:origalImage
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:4];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                        origalImage:origalImage
                                                           blueImage:imageBlur];
    
    [homeLayer addSublayer: currentLayer];
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:1],
                             [NSNumber numberWithFloat:1.2],
                             
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5 withBeginTime:beginTime  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;

    [currentLayer.blurLayer addAnimation:scaleAni forKey:@"sdf"];
    
    currentLayer.contentLayer.mask = currentLayer.maskLayer;
    
    NSArray *moveKeyTime = @[
                         [NSNumber numberWithFloat:0],
                         
                         [NSNumber numberWithFloat:0.4],
                         [NSNumber numberWithFloat:0.7],
                         
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+20,  0)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVWindowWidth+20, 250)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,kAVWindowWidth+20, 250)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth+20,kAVWindowHeight+20)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:3 withBeginTime:beginTime+0.5 propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
   // leftRightMoveAni.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [currentLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.frame = CGRectMake(-10, -10,kAVWindowWidth+20, kAVWindowHeight+20);
    lineLayer.borderColor = [UIColor whiteColor].CGColor;
    lineLayer.borderWidth = 5;
    [currentLayer addSublayer: lineLayer];
    
    [lineLayer addAnimation: leftRightMoveAni forKey:@"ds"];
    
}

-(void)maskBrothTransim2
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    [homeLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;
    
    nextLayer.maskLayer.anchorPoint = CGPointMake(0.0, 0.0);
    
    AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight)
                                                       withImage:[UIImage imageNamed:@"allKuang"]];
    
    gitLayer.anchorPoint = CGPointMake(0.0, 0.0);
    [nextLayer addSublayer: gitLayer];
    
    CGPoint startCenterPoint = CGPointMake(kAVWindowWidth, kAVWindowHeight);
    
    CGPoint endCenterPoint =CGPointMake(0, 0);
    
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startCenterPoint toValue:endCenterPoint];
    
    moveCenter1.timingFunction = [CAMediaTimingFunction easeInOutQuad];
    
    //
    [nextLayer.maskLayer addAnimation:moveCenter1 forKey:@"opacityOpen"];
    //
    
    
    [gitLayer addAnimation:moveCenter1 forKey:@"opacityOpen"];
    
    
    
    AVBasicLayer *dingdingLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(280, -55, 130, 100)
                                                            withImage:[UIImage imageNamed:@"ringring"]];
    
    [gitLayer addSublayer: dingdingLayer];
    
    dingdingLayer.anchorPoint = CGPointMake(0.5, 0.0);
    
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.5],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSNumber numberWithFloat:M_1_PI],
                              [NSNumber numberWithFloat:M_1_PI/4],
                              
                              [NSNumber numberWithFloat:M_1_PI],
                              
                              ];
    
    CAKeyframeAnimation *ralueAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2 withBeginTime:0
                                                                             propertyName:kAVBasicAniRotationZ values:centerValues keyTimes:keyTime];
    
    ralueAni.repeatCount = 1000;
    
    dingdingLayer.opacity =0;
    
    CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:2000 withBeginTime:beginTime+2 aniArr: @[opacityOpen,ralueAni]];
    
    
    [dingdingLayer addAnimation:animationGroup forKey:@"moveCenter1"];
    
}


-(void)maskBrothTransim
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 1;
    
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    [homeLayer addSublayer: nextLayer];
    
    
    
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
