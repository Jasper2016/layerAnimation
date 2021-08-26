//
//  VCoreTest1ViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2017/10/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCoreTest1ViewController.h"
#import "AVConstant.h"
#import "AVBasicRouteAnimate.h"
#import "AVBasicLayer.h"
#import "AVSceneAniEnumType.h"
#import "AVFilterPhoto.h"

@interface VCoreTest1ViewController ()

@end

@implementation VCoreTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self leftUpToRightBottomAni];
//    [self rightBttomToLeftUpAni];
//    [self leftBttomToRightUpAni];
    
    [self testAni];//多组测试
}

- (void)testAni
{
    CGFloat duration = 2.0;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2.2;

    NSMutableArray *imageArr = @[@"top.png",@"cat.png",@"bg2.png"].mutableCopy;
    NSInteger count = 5;
    for (int i=0; i<count; i++) {
        BOOL disappear = i<count-2?YES:NO;
        CGFloat angle = i%2==0?M_PI/16:-M_PI/16;
        AVAniMustMoveDicype direction = 4+arc4random()%4;
        CGRect layerRect = CGRectMake(0, 0, kAVWindowWidth*3/4, kAVWindowHeight*4/5);
        CGRect currentRect = CGRectMake(kAVWindowWidth*3/40, 25, kAVWindowWidth*3/5, kAVWindowWidth*3/5);
        UIImage *originImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[i%3]]];
        UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:originImage
                                                  filterType:AVImageFilterNostalgia];
        AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:layerRect vContentRect:currentRect origalImage:originImage blueImage:filterImage];
        currentLayer.photoLayer.frame = currentLayer.contentLayer.bounds;
        currentLayer.photoLayer.opacity = 0;
        currentLayer.backgroundColor = [UIColor whiteColor].CGColor;
        currentLayer.borderColor = [UIColor whiteColor].CGColor;
        currentLayer.borderWidth = 10;
        currentLayer.cornerRadius = 6.0;
        currentLayer.contentLayer.cornerRadius = 6.0;
        currentLayer.contentLayer.masksToBounds = YES;
        [homeLayer addSublayer: currentLayer];
        
        [self sceneManyTransite:duration*0.75
                  withBeginTime:beginTime
            sceneTransiteFactor:direction
                   aniParameter:nil
                          angle:angle
                      disappear:disappear
                   currentLayer:currentLayer];
        
        beginTime = beginTime+duration;
    }
}

- (void)leftUpToRightBottomAni
{
    CGFloat duration = 2.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2.2;
    
    CGRect layerRect = CGRectMake(0, 0, kAVWindowWidth*3/4, kAVWindowHeight*4/5);
    CGRect currentRect = CGRectMake(kAVWindowWidth*3/40, 25, kAVWindowWidth*3/5, kAVWindowWidth*3/5);
    UIImage *originImage = [UIImage imageNamed:@"top.png"];
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:originImage
                                              filterType:AVImageFilterNostalgia];
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:layerRect vContentRect:currentRect origalImage:originImage blueImage:filterImage];
    currentLayer.photoLayer.frame = currentLayer.contentLayer.bounds;
    currentLayer.photoLayer.opacity = 0;
    currentLayer.backgroundColor = [UIColor whiteColor].CGColor;
    currentLayer.borderColor = [UIColor whiteColor].CGColor;
    currentLayer.borderWidth = 10;
    currentLayer.cornerRadius = 6.0;
    currentLayer.contentLayer.cornerRadius = 6.0;
    currentLayer.contentLayer.masksToBounds = YES;
    [homeLayer addSublayer: currentLayer];

    [self sceneManyTransite:duration*0.75
              withBeginTime:beginTime
        sceneTransiteFactor:AVAniMoveMustLeftUpToRightBottom
               aniParameter:nil
                      angle:M_PI/16
                  disappear:YES
               currentLayer:currentLayer];
}

- (void)rightBttomToLeftUpAni
{
    CGFloat duration = 2.0;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1.2;
    CGRect layerRect = CGRectMake(0, 0, kAVWindowWidth*3/4, kAVWindowHeight*4/5);
    CGRect currentRect = CGRectMake(kAVWindowWidth*3/40, 25, kAVWindowWidth*3/5, kAVWindowWidth*3/5);
    UIImage *originImage = [UIImage imageNamed:@"cat.png"];
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:originImage
                                              filterType:AVImageFilterNostalgia];
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:layerRect vContentRect:currentRect origalImage:originImage blueImage:filterImage];
    nextLayer.photoLayer.frame = nextLayer.contentLayer.bounds;
    nextLayer.photoLayer.opacity = 0;
    nextLayer.backgroundColor = [UIColor whiteColor].CGColor;
    nextLayer.borderColor = [UIColor whiteColor].CGColor;
    nextLayer.borderWidth = 10;
    nextLayer.cornerRadius = 6.0;
    nextLayer.contentLayer.cornerRadius = 6.0;
    nextLayer.contentLayer.masksToBounds = YES;
    [homeLayer addSublayer: nextLayer];

    [self sceneManyTransite:duration*0.75
              withBeginTime:beginTime+duration
        sceneTransiteFactor:AVAniMoveMustRightUpToLeftBottom
               aniParameter:nil
                      angle:-M_PI/16
                  disappear:NO
               currentLayer:nextLayer];
}

- (void)leftBttomToRightUpAni
{
    CGFloat duration = 2.0;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1.2;
    CGRect layerRect = CGRectMake(0, 0, kAVWindowWidth*3/4, kAVWindowHeight*4/5);
    CGRect currentRect = CGRectMake(kAVWindowWidth*3/40, 25, kAVWindowWidth*3/5, kAVWindowWidth*3/5);
    UIImage *originImage = [UIImage imageNamed:@"bg2.png"];
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:originImage
                                              filterType:AVImageFilterNostalgia];
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initBeforBlueWithFrame:layerRect vContentRect:currentRect origalImage:originImage blueImage:filterImage];
    nextLayer.photoLayer.frame = nextLayer.contentLayer.bounds;
    nextLayer.photoLayer.opacity = 0;
    nextLayer.backgroundColor = [UIColor whiteColor].CGColor;
    nextLayer.borderColor = [UIColor whiteColor].CGColor;
    nextLayer.borderWidth = 10;
    nextLayer.cornerRadius = 6.0;
    nextLayer.contentLayer.cornerRadius = 6.0;
    nextLayer.contentLayer.masksToBounds = YES;
    [homeLayer addSublayer: nextLayer];
    
    [self sceneManyTransite:duration*0.75
              withBeginTime:beginTime+2*duration
        sceneTransiteFactor:AVAniMoveMustLeftBottomToRightUp
               aniParameter:nil
                      angle:M_PI/16
                  disappear:NO
               currentLayer:nextLayer];
}


/**
 动效

 @param duration 动画时长
 @param beginTime 开始时间
 @param transiteFactor 方向
 @param aniParameter 特殊处理参数
 @param angle 旋转角度
 @param disappear 是否在第三张出现的时候消失（除最后两张设置NO外，均为YES）
 @param currentLayer 图层
 */
-(void)sceneManyTransite:(CFTimeInterval)duration
           withBeginTime:(CFTimeInterval)beginTime
     sceneTransiteFactor:(NSInteger)transiteFactor
            aniParameter:(NSDictionary *)aniParameter
                   angle:(CGFloat)angle
               disappear:(BOOL)disappear
            currentLayer:(AVBasicLayer *)currentLayer
{
    CGPoint currentStartCenter =  kAVWindowCenter;
    CGPoint currentEndCenter =  kAVWindowCenter;
    CGFloat offset = 5;
    CAMediaTimingFunction *timingFunction = [aniParameter objectForKey:@"timingFunction"];
    if (!timingFunction){
        
        timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            currentStartCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            currentStartCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            currentStartCenter = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustBottomToTop:
        {
            currentStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustLeftBottomToRightUp:
        {
            currentLayer.transform = CATransform3DRotate(currentLayer.transform, angle, 0, 0, 1);
            currentStartCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            currentEndCenter = CGPointMake(kAVWindowCenter.x+offset, kAVWindowCenter.y-offset);
            break;
        }
           
        case AVAniMoveMustRightUpToLeftBottom:
        {
            currentLayer.transform = CATransform3DRotate(currentLayer.transform, angle, 0, 0, 1);
            currentStartCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, -kAVWindowCenter.y);
            currentEndCenter = CGPointMake(kAVWindowCenter.x-offset, kAVWindowCenter.y+offset);

            break;
        }

        case AVAniMoveMustRightBottomToLeftUp:
        {
            currentLayer.transform = CATransform3DRotate(currentLayer.transform, angle, 0, 0, 1);
            currentStartCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            currentEndCenter = CGPointMake(kAVWindowCenter.x-offset, kAVWindowCenter.y-offset);

            break;
        }

        case AVAniMoveMustLeftUpToRightBottom:
        {
            currentLayer.transform = CATransform3DRotate(currentLayer.transform, angle, 0, 0, 1);
            currentStartCenter = CGPointMake(-kAVWindowCenter.x, -kAVWindowCenter.y);
            currentEndCenter = CGPointMake(kAVWindowCenter.x+offset, kAVWindowCenter.y+offset);
            break;
        }

        default:
            break;
            
    }
    
    currentLayer.position = currentStartCenter;
    
    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration
                                                                     withBeginTime:beginTime
                                                                         fromValue:currentStartCenter
                                                                           toValue:kAVWindowCenter];
    currentMoveAni.timingFunction = timingFunction;
    currentMoveAni.fillMode=  kCAFillModeBoth;
    
    if (!CGPointEqualToPoint(currentEndCenter, kAVWindowCenter)) {
        currentMoveAni.duration = 0.7*duration;
        CABasicAnimation *endMoveAni = [[AVBasicRouteAnimate alloc]
                                        moveXYCenterTo:0.3*duration
                                                                     withBeginTime:beginTime+0.7*duration
                                                                         fromValue:kAVWindowCenter
                                                                           toValue:currentEndCenter];
        endMoveAni.timingFunction = timingFunction;
        endMoveAni.fillMode=  kCAFillModeForwards;
        [currentLayer addAnimation:endMoveAni forKey:@"endMoveAni"];
    }
    [currentLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
    CABasicAnimation *opacityAni2 = [[AVBasicRouteAnimate alloc] opacityOpen:0.25*duration withBeginTime:beginTime+0.75*duration];
    [currentLayer.photoLayer addAnimation:opacityAni2 forKey:@"opacityAni2"];
    
    if (disappear) {
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] opacityClose:duration withBeginTime:beginTime+2.5*duration];
        [currentLayer addAnimation:opacityAni forKey:@"opacityAni"];
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
