//
//  StileViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2017/11/23.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "StileViewController.h"
#import "AVConstant.h"
#import "AVBasicRouteAnimate.h"
#import "AVBasicLayer.h"

@interface StileViewController ()

@end

@implementation StileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    homeLayer.backgroundColor = [UIColor clearColor].CGColor;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1.2;//开始时间
    CFTimeInterval duration = 2.5;//动画总时长
    BOOL round = NO;//圆形或方形
    [self testStileAnimation:[UIImage imageNamed:@"top.png"]
                 secondImage:[UIImage imageNamed:@"5.png"]
                  thirdImage:[UIImage imageNamed:@"cat.png"]
                       round:round
                   beginTime:beginTime
                    duration:duration];
}

- (void)testStileAnimation:(UIImage *)firstImage
               secondImage:(UIImage *)secondImage
                thirdImage:(UIImage *)thirdImage
                     round:(BOOL)round
                 beginTime:(CFTimeInterval)beginTime
                  duration:(CFTimeInterval)duration
{
    duration = duration/2.5;
    CATransform3D minusTrans = CATransform3DMakeRotation(-M_PI/10.0, 0, 0, 1);
    CATransform3D plusTrans = CATransform3DMakeRotation(M_PI/10.0, 0, 0, 1);
    CGFloat Xspace = kAVCeilfX(50);
    CGFloat Yspace = kAVCeilfY(50);
    {
        //第一幅图动效
        AVBasicLayer *bottomLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow];
        bottomLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [homeLayer addSublayer:bottomLayer];
        
        AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow];
        [firstLayer setValue:[NSNumber numberWithFloat:1.2] forKeyPath:@"transform.scale"];
        firstLayer.backgroundColor = [UIColor clearColor].CGColor;
        [homeLayer addSublayer:firstLayer];
        
        CAShapeLayer *wShapeLayer = [self createMaskShapeLayer:0
                          outterRadius:kAVWindowWidth*0.65
                                 round:round
                           innerHeight:0
                          outterHeight:kAVWindowHeight*0.65];
        wShapeLayer.fillColor = [UIColor whiteColor].CGColor;
        [firstLayer addSublayer:wShapeLayer];
        
        CAShapeLayer *sShapeLayer = [self createMaskShapeLayer:0
                              outterRadius:kAVWindowWidth*0.125+1
                                     round:round
                               innerHeight:0
                              outterHeight:kAVWindowHeight*0.125+1];
        
        CAShapeLayer *nShapeLayer = [self createMaskShapeLayer:kAVWindowWidth*0.125
                      outterRadius:MIN(kAVWindowWidth*0.25, kAVWindowHeight*0.5*1.2)+1
                             round:round
                       innerHeight:kAVWindowHeight*0.125
                      outterHeight:MIN(kAVWindowHeight*0.25, kAVWindowHeight*0.5*1.2)+1];
        
        CAShapeLayer *lShapeLayer = [self createMaskShapeLayer:MIN(kAVWindowWidth*0.25, kAVWindowHeight*0.5*1.2)
                      outterRadius:kAVWindowWidth*0.65+1
                             round:round
                       innerHeight:MIN(kAVWindowHeight*0.25, kAVWindowHeight*0.5*1.2)
                      outterHeight:kAVWindowHeight*0.65+1];
        
        AVBasicLayer *sFirstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:firstImage];
        sFirstLayer.mask = sShapeLayer;
        [firstLayer addSublayer: sFirstLayer];
        
        AVBasicLayer *nFirstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:firstImage];
        nFirstLayer.mask = nShapeLayer;
        [firstLayer addSublayer: nFirstLayer];
        
        AVBasicLayer *lFirstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:firstImage];
        lFirstLayer.mask = lShapeLayer;
        [firstLayer addSublayer: lFirstLayer];
        
        [self aniShapeLayer:sShapeLayer
                innerRadius:0
                   toRadius:kAVWindowWidth*0.125-Xspace
                      round:round
                innerHeight:0
                   toHeight:kAVWindowHeight*0.125-Yspace
                  beginTime:beginTime
                   durition:duration];
        [self aniShapeLayer:nShapeLayer
                innerRadius:kAVWindowWidth*0.125
                   toRadius:MIN(kAVWindowWidth*0.25, kAVWindowHeight*0.5*1.2)-Xspace
                      round:round
                innerHeight:kAVWindowHeight*0.125
                   toHeight:MIN(kAVWindowHeight*0.25, kAVWindowHeight*0.5*1.2)-Yspace
                  beginTime:beginTime+0.8*duration
                   durition:duration];
        CABasicAnimation *minusAni = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime fromValue:CATransform3DIdentity toValue:minusTrans];
        CABasicAnimation *plusAni = [[AVBasicRouteAnimate defaultInstance] transform3D:1.3*duration withBeginTime:beginTime+0.7*duration fromValue:CATransform3DIdentity toValue:plusTrans];
        CABasicAnimation *plusAni2 = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime+1.0*duration fromValue:CATransform3DIdentity toValue:plusTrans];

        [sFirstLayer.contentLayer addAnimation:minusAni forKey:@"ani_3D"];
        [nFirstLayer.contentLayer addAnimation:plusAni forKey:@"ani_3D"];
        [lFirstLayer.contentLayer addAnimation:plusAni2 forKey:@"ani_3D"];
    }
    
    {
        //第二幅图动效
        CAShapeLayer *shapeLayer = [self createMaskShapeLayer:0
                                 outterRadius:1.1
                                        round:round
                                    innerHeight:0
                                   outterHeight:0.6];
        CAShapeLayer *sShapeLayer = [self createMaskShapeLayer:0
                          outterRadius:kAVWindowWidth*0.125+1
                                 round:round
                           innerHeight:0
                          outterHeight:kAVWindowHeight*0.125+1];
        CAShapeLayer *nShapeLayer = [self createMaskShapeLayer:kAVWindowWidth*0.125
                  outterRadius:MIN(kAVWindowWidth*0.25, kAVWindowHeight*0.5*1.2)+1
                         round:round
                     innerHeight:kAVWindowHeight*0.125 outterHeight:MIN(kAVWindowHeight*0.25, kAVWindowHeight*0.5*1.2)+1];
        
        AVBasicLayer *secondLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow];
        [secondLayer setValue:[NSNumber numberWithFloat:1.2] forKeyPath:@"transform.scale"];
        secondLayer.backgroundColor = [UIColor clearColor].CGColor;
        secondLayer.mask = shapeLayer;
        [homeLayer addSublayer: secondLayer];
        
        AVBasicLayer *sSecondLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:secondImage];
        sSecondLayer.mask = sShapeLayer;
        [secondLayer addSublayer:sSecondLayer];
        
        AVBasicLayer *nSecondLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:secondImage];
        nSecondLayer.mask = nShapeLayer;
        [secondLayer addSublayer:nSecondLayer];
        
        [self aniShapeLayer:shapeLayer
                innerRadius:0
                   toRadius:MIN(kAVWindowWidth*0.25, kAVWindowHeight*0.5*1.2)
                      round:round
                innerHeight:0
                   toHeight:MIN(kAVWindowHeight*0.25, kAVWindowHeight*0.5*1.2)
                  beginTime:beginTime+0.3*duration
                   durition:duration];
        
        CABasicAnimation *minusAni = [[AVBasicRouteAnimate defaultInstance] transform3D:0.8*duration withBeginTime:beginTime+0.3*duration fromValue:minusTrans toValue:CATransform3DIdentity];
        CABasicAnimation *plusAni = [[AVBasicRouteAnimate defaultInstance] transform3D:0.8*duration withBeginTime:beginTime+0.5*duration fromValue:plusTrans toValue:CATransform3DIdentity];
        
        [sSecondLayer.contentLayer addAnimation:minusAni forKey:@"ani_3D"];
        [nSecondLayer.contentLayer addAnimation:plusAni forKey:@"ani_3D"];
    }

    {
        //第三幅图动效
        CAShapeLayer *sShapeLayer = [self createMaskShapeLayer:0
                                                  outterRadius:1.1
                                                         round:round
                                     innerHeight:0
                                    outterHeight:0.6];
        CAShapeLayer *nShapeLayer = [self createMaskShapeLayer:kAVWindowWidth*0.24
                      outterRadius:kAVWindowWidth*0.24
                             round:round
                       innerHeight:kAVWindowHeight*0.24
                      outterHeight:kAVWindowHeight*0.24];
        CAShapeLayer *lShapeLayer = [self createMaskShapeLayer:kAVWindowWidth*0.65
                    outterRadius:kAVWindowWidth*0.65
                           round:round
                       innerHeight:kAVWindowHeight*0.65
                      outterHeight:kAVWindowHeight*0.65];
        
        AVBasicLayer *tBottomLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow];
        tBottomLayer.backgroundColor = [UIColor clearColor].CGColor;
        tBottomLayer.masksToBounds = YES;
        [homeLayer addSublayer: tBottomLayer];
        
        AVBasicLayer *thirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow];
        [thirdLayer setValue:[NSNumber numberWithFloat:1.2] forKeyPath:@"transform.scale"];
        thirdLayer.backgroundColor = [UIColor clearColor].CGColor;
        [tBottomLayer addSublayer: thirdLayer];
        
        AVBasicLayer *sThirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:thirdImage];
        sThirdLayer.mask = sShapeLayer;
        [thirdLayer addSublayer:sThirdLayer];
        
        AVBasicLayer *nThirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:thirdImage];
        [nThirdLayer setValue:0 forKey:@"opacity"];
        nThirdLayer.mask = nShapeLayer;
        [thirdLayer addSublayer:nThirdLayer];
        
        AVBasicLayer *lThirdLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:thirdImage];
        lThirdLayer.mask = lShapeLayer;
        [thirdLayer addSublayer:lThirdLayer];
        
        [self aniShapeLayer:sShapeLayer
                innerRadius:0
                   toRadius:kAVWindowWidth*0.25
                      round:round
                innerHeight:0
                   toHeight:kAVWindowHeight*0.25
                  beginTime:beginTime+1*duration
                   durition:duration];
        
        [self aniShapeLayer:nShapeLayer
                innerRadius:kAVWindowWidth*0.24
                   toRadius:kAVWindowWidth*0.32
                      round:round
                innerHeight:kAVWindowHeight*0.24
                   toHeight:kAVWindowHeight*0.32
                  beginTime:beginTime+1*duration
                   durition:duration];
        
        [self aniShapeLayer:lShapeLayer
                innerRadius:kAVWindowWidth*0.31
                   toRadius:kAVWindowWidth*0.65
                      round:round
                innerHeight:kAVWindowHeight*0.31
                   toHeight:kAVWindowHeight*0.65
                  beginTime:beginTime+1*duration
                   durition:1*duration];
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:beginTime+1.2*duration];
        [nThirdLayer addAnimation:opacityAni forKey:@"opacityAni"];
        
        
        CABasicAnimation *minusAni = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime+1*duration fromValue:minusTrans toValue:CATransform3DIdentity];
        CABasicAnimation *plusAni = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime+1*duration fromValue:plusTrans toValue:CATransform3DIdentity];
        
        [sThirdLayer.contentLayer addAnimation:minusAni forKey:@"ani_3D"];
        [nThirdLayer.contentLayer addAnimation:plusAni forKey:@"ani_3D"];
        [lThirdLayer.contentLayer addAnimation:plusAni forKey:@"ani_3D"];

        CABasicAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:0.5*duration withBeginTime:beginTime+2*duration fromValue:1.2 toValue:1.25];
        [thirdLayer addAnimation:scaleAni forKey:@"scaleAni"];
    }
 
}

- (CAShapeLayer *)createMaskShapeLayer:(CGFloat)innerRadius
                          outterRadius:(CGFloat)outterRadius
                                 round:(BOOL)round
                           innerHeight:(CGFloat)innerHeight
                          outterHeight:(CGFloat)outterHeight
{
    CAShapeLayer *pShapeLayer = [CAShapeLayer layer];
    pShapeLayer.fillColor = [UIColor blackColor].CGColor;
    [homeLayer addSublayer:pShapeLayer];
    UIBezierPath *pPath,*pOtherPath;
    if (round) {
        pPath = [UIBezierPath bezierPathWithArcCenter:kAVWindowCenter radius:outterRadius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI *2 clockwise:YES];
        pOtherPath = [UIBezierPath bezierPathWithArcCenter:kAVWindowCenter radius:innerRadius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI *2 clockwise:YES];
    }else{
        pOtherPath = [UIBezierPath bezierPathWithRect:CGRectMake(kAVWindowCenter.x-innerRadius, kAVWindowCenter.y-innerHeight, innerRadius*2, innerHeight*2)];
        pPath = [UIBezierPath bezierPathWithRect:CGRectMake(kAVWindowCenter.x-outterRadius, kAVWindowCenter.y-outterHeight, outterRadius*2, outterHeight*2)];
    }

    [pPath appendPath:pOtherPath];
    pShapeLayer.path = pPath.CGPath;
    //重点
    pShapeLayer.fillRule = kCAFillRuleEvenOdd;
    return pShapeLayer;
}

- (void)aniShapeLayer:(CAShapeLayer *)shapeLayer
          innerRadius:(CGFloat)innerRadius
             toRadius:(CGFloat)toRadius
                round:(BOOL)round
          innerHeight:(CGFloat)innerHeight
             toHeight:(CGFloat)toHeight
            beginTime:(CFTimeInterval)beginTime
             durition:(CFTimeInterval)durition
{
    UIBezierPath *pPath,*pOtherPath;
    if (round) {
        pPath = [UIBezierPath bezierPathWithArcCenter:kAVWindowCenter radius:toRadius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI *2 clockwise:YES];
        pOtherPath = [UIBezierPath bezierPathWithArcCenter:kAVWindowCenter radius:innerRadius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI *2 clockwise:YES];
    }else{
        pPath = [UIBezierPath bezierPathWithRect:CGRectMake(kAVWindowCenter.x-toRadius, kAVWindowCenter.y-toHeight, toRadius*2, toHeight*2)];
        pOtherPath = [UIBezierPath bezierPathWithRect:CGRectMake(kAVWindowCenter.x-innerRadius, kAVWindowCenter.y-innerHeight, innerRadius*2, innerHeight*2)];
    }
    [pPath appendPath:pOtherPath];
    CABasicAnimation *pathAni = [[AVBasicRouteAnimate defaultInstance] customBasic:durition withBeginTime:beginTime fromValue:(__bridge id)(shapeLayer.path) toValue:(__bridge id)(pPath.CGPath) propertyName:@"path"];
    [shapeLayer addAnimation:pathAni forKey:@"path_ani"];
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
