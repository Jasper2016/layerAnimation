//
//  CircleFriendsViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/9/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CircleFriendsViewController.h"

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

#define kLineWidth 6

@interface CircleFriendsViewController ()

@end

@implementation CircleFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self circleFriend];
}
//v:垂直 H:水平
- (void)circleFriend{
    
    UIImage *firstImage = [UIImage imageNamed:@"desktop.png"];

    AVBasicLayer *firstLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:firstImage];
    
    [homeLayer addSublayer:firstLayer];
    
    CGFloat offsetX = kHDScreenWidth/3;
    CGFloat offsetY = kHDScreenHight/3;
    
    for (NSInteger index = 1; index < 3; index++) {
        
        CGPoint HFromePoint = CGPointMake(0, index*offsetY);
        CGPoint HToPoint    = CGPointMake(kHDScreenWidth, index*offsetY);
        CGPoint VFomePoint  = CGPointMake(offsetX*index, 0);
        CGPoint VToPoint    = CGPointMake(offsetX*index, kHDScreenHight);
        
        CAShapeLayer *HLineLayer = [self createLineWithFromPoint:HFromePoint toPoint:HToPoint];
        CAShapeLayer *VLineLayer = [self createLineWithFromPoint:VFomePoint toPoint:VToPoint];
        [homeLayer addSublayer:HLineLayer];
        [homeLayer addSublayer:VLineLayer];
    }
    
    CGRect photoLayerRect = CGRectMake(0, 0, offsetX, offsetY);
    //one
    UIImage *oneImage = [UIImage imageNamed:@"yoona.png"];
    CGPoint onePosition = CGPointMake(offsetX*0.5, offsetY*0.5);
    AVBasicLayer *oneLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                   position:onePosition
                                               contentImage:oneImage];
    [firstLayer addSublayer:oneLayer];
    
    //two
    UIImage *twoImage = [UIImage imageNamed:@"london.png"];
    CGPoint twoPosition = CGPointMake(offsetX*1.5, offsetY*0.5);
    AVBasicLayer *twoLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                   position:twoPosition
                                               contentImage:twoImage];
    [firstLayer addSublayer:twoLayer];
    
    //three
    UIImage *threeImage = [UIImage imageNamed:@"cat.png"];
    CGPoint threePosition = CGPointMake(offsetX*2.5, offsetY*0.5);
    AVBasicLayer *threeLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                   position:threePosition
                                               contentImage:threeImage];
    [firstLayer addSublayer:threeLayer];

    //four
    UIImage *fourImage = [UIImage imageNamed:@"bg1.png"];
    CGPoint fourPosition = CGPointMake(offsetX*0.5, offsetY*1.5);
    AVBasicLayer *fourLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                     position:fourPosition
                                                 contentImage:fourImage];
    [firstLayer addSublayer:fourLayer];
    
    //five
    UIImage *fiveImage = [UIImage imageNamed:@"bg2.png"];
    CGPoint fivePosition = CGPointMake(offsetX*1.5, offsetY*1.5);
    AVBasicLayer *fiveLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                    position:fivePosition
                                                contentImage:fiveImage];
    [firstLayer addSublayer:fiveLayer];
    
    //six
    UIImage *sixImage = [UIImage imageNamed:@"yoona2.png"];
    CGPoint sixPosition = CGPointMake(offsetX*2.5, offsetY*1.5);
    AVBasicLayer *sixLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                    position:sixPosition
                                                contentImage:sixImage];
    [firstLayer addSublayer:sixLayer];
    
    //senve
    UIImage *senveImage = [UIImage imageNamed:@"0.png"];
    CGPoint senvePosition = CGPointMake(offsetX*0.5, offsetY*2.5);
    AVBasicLayer *senveLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                    position:senvePosition
                                                contentImage:senveImage];
    [firstLayer addSublayer:senveLayer];
    
    //eight
    UIImage *eightImage = [UIImage imageNamed:@"1.png"];
    CGPoint eightPosition = CGPointMake(offsetX*1.5, offsetY*2.5);
    AVBasicLayer *eightLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                    position:eightPosition
                                                contentImage:eightImage];
    [firstLayer addSublayer:eightLayer];
    
    //nine
    UIImage *nineImage = [UIImage imageNamed:@"2.png"];
    CGPoint ninePosition = CGPointMake(offsetX*2.5, offsetY*2.5);
    AVBasicLayer *nineLayer = [self createPhotoLayerWithRect:photoLayerRect
                                                    position:ninePosition
                                                contentImage:nineImage];
    [firstLayer addSublayer:nineLayer];
}

- (AVBasicLayer *)createPhotoLayerWithRect:(CGRect)rect
                                  position:(CGPoint)position
                              contentImage:(UIImage *)contentImage{

    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:rect withImage:contentImage];
    photoLayer.position = position;
    
    return photoLayer;

}

- (CAShapeLayer *)createLineWithFromPoint:(CGPoint)fromPoint
                                       toPoint:(CGPoint)toPoint{
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:fromPoint];
    [linePath addLineToPoint:toPoint];
    CAShapeLayer *linelayer = [CAShapeLayer layer];
    linelayer.path = linePath.CGPath;
    linelayer.lineWidth = kLineWidth;
    linelayer.fillColor = [UIColor clearColor].CGColor;
    linelayer.strokeColor = [UIColor whiteColor].CGColor;
    return linelayer;
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
