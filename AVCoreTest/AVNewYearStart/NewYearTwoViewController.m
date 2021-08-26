//
//  NewYearTwoViewController.m
//  AVCoreTest
//
//  Created by wanghaifei on 2018/1/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NewYearTwoViewController.h"
#import "AVFundation.h"
#import "AVPlayTextLayer.h"
#include <math.h>

#define AVLineWith           kAVCeilfY(27)
#define kAVCenterContent  CGRectMake(CGRectGetMidX(kAVRectWindow)-244, CGRectGetMidY(kAVRectWindow)-175/2,488, 175)
#define kCenterImageHeight  175
#define kCenterImageWitdth  488

#define kPillarImageHeight  169
#define kPillarImageWidth  27

#define kAVPillarContentRect  CGRectMake(CGRectGetMidX(kAVRectWindow)-27/2, CGRectGetMidY(kAVRectWindow)-175/2,27, 169)

@interface NewYearTwoViewController ()

@end

@implementation NewYearTwoViewController
{
    
        CALayer * homeLayer;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    homeLayer = [CALayer layer];
    
    homeLayer.frame = CGRectMake( 0, 100, kAVWindowWidth, kAVWindowHeight);
    
    homeLayer.backgroundColor = [UIColor yellowColor].CGColor;
    
    CGFloat scaleValue = self.view.frame.size.width/kAVWindowWidth;
    
    [homeLayer setValue:[NSNumber numberWithFloat:scaleValue] forKeyPath:@"transform.scale"];
    
    homeLayer.position =  self.view.center;
    
    [self.view.layer addSublayer: homeLayer];
    
    homeLayer.masksToBounds = YES;
    
//    [self addContent];
    
    [self moveToLeft];
}

-(void)moveToLeft
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 3;

    AVBasicLayer *backgroundLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                           vContentRect:kAVRectWindow
                                                              withImage:[UIImage imageNamed:@"bgNewYear.png"]];
    
    [homeLayer addSublayer: backgroundLayer];
    
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:kAVPillarContentRect
                                                     vContentRect:CGRectMake(0, 0, kPillarImageWidth, kPillarImageHeight)
     
                                                        withImage:[UIImage imageNamed:@"youSide"]];
    //左边的bar
    {
        
        [homeLayer addSublayer:leftLayer];

        CGPoint startCenterPointLeftOne = CGPointMake(CGRectGetMidX(kAVRectWindow) -kPillarImageWidth , CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint startCenterPointLeftTwo = CGPointMake(CGRectGetMidX(kAVRectWindow) -kPillarImageWidth-10 , CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint startCenterPointLeftThree = CGPointMake(CGRectGetMidX(kAVRectWindow) -kPillarImageWidth-30, CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint startCenterPointLeftfouth = CGPointMake(CGRectGetMidX(kAVRectWindow) -kPillarImageWidth -50, CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint endCenterPointLeftfifth = CGPointMake(CGRectGetMidX(kAVRectWindow)-kPillarImageWidth -100, CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint endCenterPointLeftSixth =CGPointMake(CGRectGetMinX(kAVRectWindow)+52 , CGRectGetMidY(kAVRectWindow)-175/2);
        
        NSArray *leftValues = @[[NSValue valueWithCGPoint:startCenterPointLeftOne],
                            [NSValue valueWithCGPoint:startCenterPointLeftTwo],
                            [NSValue valueWithCGPoint:startCenterPointLeftThree],
                            [NSValue valueWithCGPoint:startCenterPointLeftfouth],
                            [NSValue valueWithCGPoint:endCenterPointLeftfifth],
                            [NSValue valueWithCGPoint:endCenterPointLeftSixth],
                            ];
        
        NSArray *leftTimes = @[ [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:0.2],
                            [NSNumber numberWithFloat:0.45],
                            [NSNumber numberWithFloat:0.6],
                            [NSNumber numberWithFloat:0.9],
                            [NSNumber numberWithFloat:1],
                            ];
       
        leftLayer.anchorPoint = CGPointMake(0.0, 0.0);
        
        
        CAKeyframeAnimation * leftPositionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:leftValues keyTimes:leftTimes];

        [leftLayer addAnimation:leftPositionAni forKey:@"moveCenter1"];

    }
    
    AVBasicLayer *rightLayer = [[AVBasicLayer alloc] initWithFrame:kAVPillarContentRect
                                                     vContentRect:CGRectMake(0, 0, 27, kPillarImageHeight)
                                                        withImage:[UIImage imageNamed:@"youSide"]];

    {
        [homeLayer addSublayer:rightLayer];
        
        rightLayer.anchorPoint = CGPointMake(0.0, 0.0);
        
        CGPoint startCenterPointRightOne = CGPointMake(CGRectGetMidX(kAVRectWindow) , CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint startCenterPointRightTwo = CGPointMake(CGRectGetMidX(kAVRectWindow)+10 , CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);

        CGPoint startCenterPointRightThree = CGPointMake(CGRectGetMidX(kAVRectWindow) +30, CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);

        CGPoint startCenterPointRightfouth = CGPointMake(CGRectGetMidX(kAVRectWindow) +50, CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        CGPoint endCenterPointRightfifth = CGPointMake(CGRectGetMidX(kAVRectWindow) +100, CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);

        CGPoint endCenterPointRightSixth =CGPointMake(CGRectGetMaxX(kAVRectWindow)-kPillarImageWidth-52 , CGRectGetMidY(kAVRectWindow)-kCenterImageHeight/2);
        
        NSArray *values = @[[NSValue valueWithCGPoint:startCenterPointRightOne],
                            [NSValue valueWithCGPoint:startCenterPointRightTwo],
                            [NSValue valueWithCGPoint:startCenterPointRightThree],
                            [NSValue valueWithCGPoint:startCenterPointRightfouth],
                            [NSValue valueWithCGPoint:endCenterPointRightfifth],
                            [NSValue valueWithCGPoint:endCenterPointRightSixth],
                            ];
        
        NSArray *times = @[ [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:0.2],
                            [NSNumber numberWithFloat:0.45],
                            [NSNumber numberWithFloat:0.6],
                            [NSNumber numberWithFloat:0.9],
                            [NSNumber numberWithFloat:1],
                            ];
        
       
        CAKeyframeAnimation * rightPositionAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:values keyTimes:times];
        
            [rightLayer addAnimation:rightPositionAni forKey:@"moveCenter2"];

    }
    
    AVBasicLayer *centerLayer = [[AVBasicLayer alloc] initWithFrame:kAVCenterContent
                                                     vContentRect:CGRectMake(0, 0, kCenterImageWitdth, kCenterImageHeight)
                                                        withImage:[UIImage imageNamed:@"Bg_Welcome_Content"]];

    
    //添加文字
    {
        [homeLayer addSublayer:centerLayer];

        NSString *text = @"2018 Vcore 要牛逼";

        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentCenter;

        NSDictionary * attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,
                                    NSParagraphStyleAttributeName,[UIFont fontWithName:@"Helvetica-Bold" size:20.0],NSFontAttributeName,
                                    [UIColor yellowColor],NSForegroundColorAttributeName, nil];


        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributesDic];

        //计算文本的高度
        CGRect labelRect = [attributedString boundingRectWithSize:homeLayer.bounds.size
                                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];

        AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc]  initWithFrame: CGRectMake( centerLayer.frame.size.width/2-100, ceilf(180)/2-20, 200, ceilf(180)) attributeStringText:attributedString];


        [centerLayer addSublayer: textLayer];


        centerLayer.mask = centerLayer.maskLayer;////????????  开启蒙版 看不到图片

        NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.2],
                             [NSNumber numberWithFloat:0.45],
                             
                             [NSNumber numberWithFloat:0.6],
                             [NSNumber numberWithFloat:0.9],
                             
                             [NSNumber numberWithFloat:1],
                             ];

        NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kCenterImageHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 20, kCenterImageHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 60,  kCenterImageHeight)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  100, kCenterImageHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  200, kCenterImageHeight)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  kCenterImageWitdth, kCenterImageHeight)],
                              ];;

        CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];

        [centerLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"anim"];

    }


}

-(void)addContent
{
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    
    AVBasicLayer *backgroundLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                           vContentRect:kAVRectWindow
                                                              withImage:[UIImage imageNamed:@"bgNewYear.png"]];
    
    
    [homeLayer addSublayer: backgroundLayer];
    

    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVCenterContent
                                                     vContentRect:CGRectMake(0, 0, 488, kCenterImageHeight)
                                                        withImage:[UIImage imageNamed:@"Bg_Welcome_Content"]];
    
    
    [homeLayer addSublayer:nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;////????????  开启蒙版 看不到图片
    
    NSArray *moveKeyTime = @[
                             [NSNumber numberWithFloat:0],
                             [NSNumber numberWithFloat:0.2],
                             [NSNumber numberWithFloat:0.45],
                             
                             [NSNumber numberWithFloat:0.6],
                             [NSNumber numberWithFloat:0.9],
                             
                             [NSNumber numberWithFloat:1],
                             ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kCenterImageHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 2, kCenterImageHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 2,  kCenterImageHeight)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  100, kCenterImageHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  100, kCenterImageHeight)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  488, kCenterImageHeight)],
                              ];;
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5.2 withBeginTime:beginTime propertyName:kAVBasicAniBounds values:centerValues keyTimes:moveKeyTime];
    
    [nextLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"anim"];
    
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
