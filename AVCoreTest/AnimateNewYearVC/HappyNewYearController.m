//
//  HappyNewYearController.m
//  AVCoreTest
//
//  Created by yinshengqi on 2018/1/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HappyNewYearController.h"

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

@interface HappyNewYearController ()

@end

@implementation HappyNewYearController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startAnimate];
//    [self transAni];
//    [self textShowAni];
    // Do any additional setup after loading the view.
}

- (void)textShowAni{
    

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2.png"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *title = @"新年到了,祝你新年心想事成,事事如意,一切顺意";
    VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
    textModel.textContent = title;
    textModel.textFontName = @"Helvetica-Bold";
    textModel.textFontSize = 35;
    textModel.textFontColor = UIColorFromRGB(0xfff000);
    
    AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
    CGSize textSize = [helper boundingRectTextModel:textModel photoDesc:title areaSize:CGSizeMake(kAVWindowWidth-140, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
    
    CGFloat textLanternWidth = 60;
    CGFloat textLanternHeight = 70;
    
    CGFloat broadWidth = textSize.width+30+textLanternWidth;
    CGFloat broadHeight = MAX(textSize.height+20, 90);
    
    UIColor *oneColor = UIColorFromRGB(0xff0000);
    UIColor *twoColor = UIColorFromRGB(0xF08080);
    NSArray *colorList = @[(id)oneColor.CGColor,(id)oneColor.CGColor,(id)twoColor.CGColor];
    NSArray *locations = @[@(0.0),@(0.4),@(1.0)];
    
    CGFloat offsetY = 24;
    
    AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor clearColor].CGColor];
    textBgLayer.masksToBounds = NO;
    textBgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-offsetY-broadHeight/2);
    [homeLayer addSublayer:textBgLayer];
    
    
    CAGradientLayer *gradiendLayer = [CAGradientLayer layer];
    gradiendLayer.frame = CGRectMake(20, 0, broadWidth-20, broadHeight);
    gradiendLayer.colors = colorList;
    gradiendLayer.locations = locations;
    gradiendLayer.startPoint = CGPointMake(0, 0.5);
    gradiendLayer.endPoint = CGPointMake(1, 0.5);
    gradiendLayer.borderColor = UIColorFromRGB(0xfff000).CGColor;
    gradiendLayer.borderWidth = 4;
    [textBgLayer addSublayer:gradiendLayer];
    
    AVBottomLayer *lanterLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, textLanternWidth, textLanternHeight) withImage:[UIImage imageNamed:@"textLanternIcon"]];
    lanterLayer.masksToBounds = NO;
    lanterLayer.position = CGPointMake(textLanternWidth/2, broadHeight/3);
    [textBgLayer addSublayer:lanterLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:textModel];
    textLayer.position = CGPointMake(broadWidth*0.55, broadHeight/2);
    textLayer.alignmentMode = kCAAlignmentLeft;
    [textBgLayer addSublayer:textLayer];
    
    AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeight) bgColor:[UIColor blackColor].CGColor];
    textBgLayer.mask = maskLayer;
    
    CGPoint startPoint = CGPointMake(-broadWidth/2, broadHeight/2);
    CGPoint endPoint = CGPointMake(broadWidth/2, broadHeight/2);
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGPoint:startPoint] toValue:[NSValue valueWithCGPoint:endPoint] propertyName:@"position"];
    [maskLayer addAnimation:positionAni forKey:@"positionAni"];
    
}

- (void)startAnimate{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 2;
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"newYearBgIcon"]];
    [homeLayer addSublayer:bgLayer];
    
    AVBottomLayer *broadLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"broadBgIcon"]];
    [bgLayer addSublayer:broadLayer];
    
    //花
    {
        CGFloat flowerWidth = 135;
        CGFloat flowerHeight = 120;
        CGFloat offsetX = 100;
        
        AVBottomLayer *leftFlowerLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, flowerWidth, flowerHeight) withImage:[UIImage imageNamed:@"rightFlowerIcon"]];
        leftFlowerLayer.position = CGPointMake(offsetX+flowerWidth/2, flowerHeight/2);
        [bgLayer addSublayer:leftFlowerLayer];
        
        
        AVBottomLayer *rightFlowerLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, flowerWidth, flowerHeight) withImage:[UIImage imageNamed:@"leftFlowerIcon"]];
        rightFlowerLayer.position = CGPointMake(kAVWindowWidth-offsetX-flowerWidth/2, flowerHeight/2);
        [bgLayer addSublayer:rightFlowerLayer];
        
    }
    
    //福字
    {
        //52 86
        AVBottomLayer *fuLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 52, 86) withImage:[UIImage imageNamed:@"fuziIcon"]];
        fuLayer.position = CGPointMake(kAVWindowWidth/2, 64);
        [bgLayer addSublayer:fuLayer];
    }
    
    //吉
    {
        //178
        AVBottomLayer *jiLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 178, 178) withImage:[UIImage imageNamed:@"dogHappyIcon"]];
        jiLayer.position = CGPointMake(kAVWindowWidth/2, 200);
        [bgLayer addSublayer:jiLayer];
        
    }
    
    //四个灯笼
    NSArray *points = [self lanterPositions];
    NSArray *rects = [self lanterRectList];
    NSArray *imageNames = [self lanternImageNameList];
    for (NSInteger index = 0; index < rects.count; index++) {
        
        CGRect rect = [rects[index] CGRectValue];
        CGPoint position = [points[index] CGPointValue];
        NSString *imageName = imageNames[index];
        
        AVBottomLayer *lanternLayer = [[AVBottomLayer alloc] initWithFrame:rect withImage:[UIImage imageNamed:imageName]];
        lanternLayer.anchorPoint = CGPointMake(0.5, 0);
        lanternLayer.position = position;
        lanternLayer.masksToBounds = NO;
        [bgLayer addSublayer:lanternLayer];
        
        CAKeyframeAnimation *transAni = [self creatLanternAni:beginTime duration:moveDuration];
        [lanternLayer addAnimation:transAni forKey:@"curveAni"];
    }

    //标题文字
    {
        CGFloat barWidth = 30;
        CGFloat barPointY = 385;
        
        NSString *title = @"事业有成 步步高升";
        VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
        textModel.textContent = title;
        textModel.textFontName = @"PingFangSC-Regular";
        textModel.textFontSize = 46;
        textModel.textFontColor = UIColorFromRGB(0xfff000);
        
        AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
        CGSize textSzie = [helper boundingRectTextModel:textModel photoDesc:title areaSize:CGSizeMake(430, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        CGFloat broadWidth = textSzie.width+50;
        CGFloat broadHeigth = textSzie.height+30;
        
        UIImage *textBgImage = [UIImage imageNamed:@"textBgIcon"];
        
        NSLog(@"imageHeight=%1.f",textBgImage.size.height);
        NSLog(@"broadHeigth=%1.f",broadHeigth);
        
        AVBottomLayer *textBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, 300) withImage:textBgImage];
        textBgLayer.position = CGPointMake(kAVWindowWidth/2, barPointY);
        textBgLayer.masksToBounds = NO;
        textBgLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [bgLayer addSublayer:textBgLayer];
        
        NSLog(@"broadHeigth=%1.f",broadHeigth);
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, broadWidth, broadHeigth)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = maskPath.CGPath;
        maskLayer.fillColor = [UIColor blackColor].CGColor;
        maskLayer.strokeColor = [UIColor clearColor].CGColor;
//        textBgLayer.mask = maskLayer;
        
//        AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, broadWidth, broadHeigth) bgColor:[UIColor blackColor].CGColor];
//        maskLayer.masksToBounds = NO;
//        textBgLayer.mask = maskLayer;
        
        CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 0, broadHeigth)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0,  broadWidth, broadHeigth)] propertyName:kAVBasicAniBounds];
//        [textBgLayer.maskLayer addAnimation:boundsAni forKey:@"boundsAni"];
        
        CGFloat barHeight = broadHeigth+130;
        
        AVBottomLayer *leftBarLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, barWidth, barHeight) withImage:[UIImage imageNamed:@"leftBarIcon"]];
        leftBarLayer.masksToBounds = NO;
        [bgLayer addSublayer:leftBarLayer];

        CABasicAnimation *leftPositionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration
            withBeginTime:beginTime
                fromValue:CGPointMake((kAVWindowWidth-barWidth)/2, barPointY)
                  toValue:CGPointMake(textBgLayer.left-barWidth/2, barPointY)
             propertyName:@"position"];
        [leftBarLayer addAnimation:leftPositionAni forKey:@"positionAni"];

        AVBottomLayer *rightBarLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, barWidth, barHeight) withImage:[UIImage imageNamed:@"rightBarIcon"]];
        rightBarLayer.masksToBounds = NO;
        [bgLayer addSublayer:rightBarLayer];

        CABasicAnimation *rightPositionAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration
         withBeginTime:beginTime
             fromValue:CGPointMake((kAVWindowWidth+barWidth)/2, barPointY)
               toValue:CGPointMake(textBgLayer.right+barWidth/2, barPointY)
          propertyName:@"position"];
        [rightBarLayer addAnimation:rightPositionAni forKey:@"positionAni"];
        
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSzie.width, textSzie.height) text:helper.attributedString textModel:textModel];
        textLayer.position = CGPointMake(broadWidth/2, broadHeigth/2);
        [textBgLayer addSublayer:textLayer];
        
    }
    // 鱼
    {
        CGFloat fishWidth = 80;
        CGFloat fishHeight = 55;
        CGFloat offsetX = 98;
        CGFloat offsetY = 19;
        AVBottomLayer *leftFish = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, fishWidth, fishHeight) withImage:[UIImage imageNamed:@"leftFishIcon"]];
        leftFish.position = CGPointMake(offsetX+fishWidth/2, kAVWindowHeight- offsetY-fishHeight/2);
        [bgLayer addSublayer:leftFish];
        
        AVBottomLayer *rightFish = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, fishWidth, fishHeight) withImage:[UIImage imageNamed:@"rightFishIcon"]];
        rightFish.position = CGPointMake(kAVWindowWidth-offsetX-fishWidth/2, kAVWindowHeight-offsetY-fishHeight/2);
        [bgLayer addSublayer:rightFish];
    }
    
}

- (NSArray *)lanternImageNameList{
    
    NSArray *list = @[@"bigLanternIcon",
                      @"smallLanternIcon",
                      @"smallLanternIcon",
                      @"bigLanternIcon"];
    return list;
}

- (NSArray *)lanterPositions{
    
    CGFloat bigLanternWidth = 150;
    CGFloat smallLanterWidth = 100;
    CGFloat extraOffset = 20;
    
    CGPoint onePoint = CGPointMake((bigLanternWidth+extraOffset)/2-5, extraOffset);
    CGPoint twoPoint = CGPointMake(bigLanternWidth+extraOffset+smallLanterWidth/2, extraOffset);
    CGPoint threePoint = CGPointMake(kAVWindowWidth-bigLanternWidth-extraOffset-smallLanterWidth/2, extraOffset);
    CGPoint fourPoint = CGPointMake(kAVWindowWidth-(bigLanternWidth+extraOffset)/2+5, extraOffset);
    
    NSArray *list = @[[NSValue valueWithCGPoint:onePoint],
                      [NSValue valueWithCGPoint:twoPoint],
                      [NSValue valueWithCGPoint:threePoint],
                      [NSValue valueWithCGPoint:fourPoint]];
    
    return list;
}

- (NSArray *)lanterRectList{
    
    CGFloat bigLanternWidth = 150;
    CGFloat smallLanterWidth = 100;
    CGRect bigRect = CGRectMake(0, 0, bigLanternWidth, bigLanternWidth);
    CGRect samllRect = CGRectMake(0, 0, smallLanterWidth, smallLanterWidth);
    NSArray *list = @[[NSValue valueWithCGRect:bigRect],
                      [NSValue valueWithCGRect:samllRect],
                      [NSValue valueWithCGRect:samllRect],
                      [NSValue valueWithCGRect:bigRect]];
    return list;
}

- (CAKeyframeAnimation *)creatLanternAni:(CFTimeInterval)beginTime
                                duration:(CFTimeInterval)duration{
    
    
    CGFloat trans1 = DEGREES_TO_RADIANS(0);
    CGFloat trans2 = DEGREES_TO_RADIANS(20);
    CGFloat trans3 = DEGREES_TO_RADIANS(-20);
    
    NSArray *values = @[[NSNumber numberWithFloat:trans1],
                        [NSNumber numberWithFloat:trans2],
                        [NSNumber numberWithFloat:trans3],
                        [NSNumber numberWithFloat:trans1]];
    NSArray *times = @[@(0.0),@(0.3),@(0.6),@(0.9)];
    
    CAKeyframeAnimation *transAni = [[AVBasicRouteAnimate alloc] customKeyframe:duration
         withBeginTime:beginTime
          propertyName:@"transform.rotation.z"
                values:values
              keyTimes:times];
    
    return transAni;
}

- (void)transAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 3;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"cat"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"yoona2"]];
                            
    [homeLayer addSublayer:nextLayer];
    
    {
        AVBottomLayer *topBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2) withImage:[UIImage imageNamed:@"transBgTopImage"]];
        topBgLayer.position = CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*0.25);
        [homeLayer addSublayer:topBgLayer];
        
        CGPoint onePoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.25);
        CGPoint twoPoint = CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*0.25);
        
        NSArray *loactions = @[[NSValue valueWithCGPoint:twoPoint],
                               [NSValue valueWithCGPoint:onePoint],
                               [NSValue valueWithCGPoint:onePoint],
                               [NSValue valueWithCGPoint:twoPoint]
                               ];
        NSArray *times = @[@"0.0",@"0.33",@"0.66",@"1.0"];
        
        CAKeyframeAnimation *topTransAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:0 propertyName:@"position" values:loactions keyTimes:times];
        topTransAni.fillMode = kCAFillModeRemoved;
//        [topBgLayer addAnimation:ani forKey:@"ani"];
        
        CAKeyframeAnimation *ani2 = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:moveDuration+2 propertyName:@"position" values:loactions keyTimes:times];
        ani2.fillMode = kCAFillModeRemoved;
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration*2+2 withBeginTime:beginTime aniArr:@[topTransAni,ani2]];
        [topBgLayer addAnimation:groupAni forKey:@"ani"];
        
//        CABasicAnimation *openAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:0 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.25) toValue:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*0.25) propertyName:@"position"];
//
//        CABasicAnimation *closeAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:moveDuration fromValue:CGPointMake(kAVWindowWidth/2, -kAVWindowHeight*0.25) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.25) propertyName:@"position"];
//
//        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[openAni,closeAni]];
//        [topBgLayer addAnimation:groupAni forKey:@"groupAni"];
        
    }
    
    {
        AVBottomLayer *downBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight/2) withImage:[UIImage imageNamed:@"transBgDownImage"]];
        downBgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75);
        [homeLayer addSublayer:downBgLayer];
        
        CGPoint onePoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75);
        CGPoint twoPoint = CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.25);
        
        NSArray *loactions = @[[NSValue valueWithCGPoint:onePoint],
                               [NSValue valueWithCGPoint:twoPoint],
                               [NSValue valueWithCGPoint:twoPoint],
                               [NSValue valueWithCGPoint:onePoint]];
        NSArray *times = @[@"0.0",@"0.25",@"0.75",@"1.0"];
        
        CAKeyframeAnimation *ani = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"position" values:loactions keyTimes:times];
//        [downBgLayer addAnimation:ani forKey:@"ani"];
    
//        CABasicAnimation *openAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:0 fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.25) propertyName:@"position"];
//
//        CABasicAnimation *closeAni = [[AVBasicRouteAnimate alloc] customCGPoint:moveDuration withBeginTime:moveDuration fromValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*1.25) toValue:CGPointMake(kAVWindowWidth/2, kAVWindowHeight*0.75) propertyName:@"position"];
//
//        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[openAni,closeAni]];
//        [downBgLayer addAnimation:groupAni forKey:@"groupAni"];
    }
    
}

- (CAShapeLayer *)broadLineShapeLayer{
    
    CGFloat offset = 15;
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(offset, offset)];
    [linePath addLineToPoint:CGPointMake(kAVWindowWidth-offset, offset)];
    [linePath addLineToPoint:CGPointMake(kAVWindowWidth-offset, kAVWindowHeight-offset)];
    [linePath addLineToPoint:CGPointMake(offset, kAVWindowHeight-offset)];
    [linePath closePath];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.strokeColor = UIColorFromRGB(0xfff000).CGColor;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.lineWidth = kAVCeilfX(3);
    return lineLayer;
    
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
