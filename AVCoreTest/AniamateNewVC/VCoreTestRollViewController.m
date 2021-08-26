//
//  VCoreTestRollViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2017/8/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCoreTestRollViewController.h"
#import "AVConstant.h"
#import "AVBasicRouteAnimate.h"
#import "AVBasicLayer.h"
#import "AVPlayTextLayer.h"
#import "AVSceneTransitEnumType.h"
#import "CAMediaTimingFunction+AdditionalEquations.h"
#import "AVSceneAniEnumType.h"
#import <CoreText/CoreText.h>
#import "AVTextAttributedHelper.h"
#import "AVFilterPhoto.h"
#import "AVBottomLayer.h"

#define kAVBorderWidth 5
#define kAVBorderColor [UIColor blackColor].CGColor

#define kAVLayerDisplayWidth (kAVWindowWidth +2*kAVBorderWidth)
#define kAVLayerDisplayHeight (kAVWindowHeight + 40)

@interface VCoreTestRollViewController ()
{
    CFTimeInterval aniTime;//!<动画开始时间
}
@end

@implementation VCoreTestRollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//   [self bottomToUpTrantiom];
//    [self longRollBottomToUpTrantiom];
 //   [self titleTextAnimation];
 //  [self longRollBottomToUpTrantiom];
 //   [self titleTextAnimation];
    
//    [self bottomToUpTrantiom];
    
//    [self testMoveBottomTranstom];
    
    [self moveColorTranstion];
}

-(void)moveColorTranstion
{
    
    CGFloat duration = 2.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.5;
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                          bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: bgLayer];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    [bgLayer addSublayer: currentLayer];
    
    
    for (NSInteger index = 1;  index < 4;  index++) {
        
        AVBasicLayer *subLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                            vContentRect:kAVRectWindow
                                                               withImage:[UIImage imageNamed:@"0.png"]];
        [bgLayer addSublayer: subLayer];
        subLayer.anchorPoint = CGPointMake(0.5, 0);
        subLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight*index);
    }
    
    for (NSInteger index = 4;  index < 8;  index++) {
        
        AVBasicLayer *subNextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
        [bgLayer addSublayer: subNextLayer];
        subNextLayer.anchorPoint = CGPointMake(0.5, 0);
        subNextLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight*index);
    }
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame: CGRectMake(0, 0,kHDScreenWidth, kHDScreenHight+ 30)
                                                     vContentRect: CGRectMake(0, 0,kHDScreenWidth, kHDScreenHight+ 30)
                                                        withImage:[UIImage imageNamed:@"2.png"]];
    [bgLayer addSublayer: nextLayer];
    nextLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y+kAVWindowHeight*8);
    
    CGPoint currentEndCenter =  CGPointMake(kAVWindowCenter.x, -(kAVWindowCenter.y+kAVWindowHeight*7));
    
    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                      fromValue:kAVWindowCenter
                                                                        toValue:currentEndCenter];
    currentMoveAni.timingFunction =  [CAMediaTimingFunction easeInOutSmallBack];
    
//    CAKeyframeAnimation *currentMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
//                                                                                  withBeginTime:beginTime
//                                                                                      fromValue:kAVWindowCenter
//                                                                                        toValue:currentEndCenter
//                                                                                           mass:8];
    
    [bgLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
    
}

-(void)testMoveBottomTranstom
{
    CGFloat duration =1.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2.5;
    
    CGPoint currentStartCenter =  CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: currentLayer];
    currentLayer.position = currentStartCenter;

    CAKeyframeAnimation *currentMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                               withBeginTime:beginTime
                                                                                   fromValue:currentStartCenter
                                                                                     toValue:kAVWindowCenter
                                                                                        mass:8];
    
//    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
//                                                                      fromValue:currentStartCenter
//                                                                        toValue:kAVWindowCenter];
    currentMoveAni.timingFunction =  [CAMediaTimingFunction easeInQuint];
    currentMoveAni.fillMode=kCAFillModeForwards;
    [currentLayer addAnimation:currentMoveAni forKey:@"kCAFillModeBackwards"];
    
    CAKeyframeAnimation *nextMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
                                                                                  withBeginTime:beginTime
                                                                                      fromValue:kAVWindowCenter
                                                                                        toValue:CGPointMake(kAVWindowCenter.x, kAVLayerDisplayHeight+kAVWindowCenter.y)
                                                                                           mass:8];
    
//    CABasicAnimation *nextMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime+duration+2
//                                                                         fromValue:kAVWindowCenter
//                                                                           toValue: CGPointMake(kAVWindowCenter.x, kAVLayerDisplayHeight+kAVWindowCenter.y)];
    nextMoveAni.timingFunction =  [CAMediaTimingFunction easeInQuint];
    nextMoveAni.fillMode=kCAFillModeForwards;
    [currentLayer addAnimation:nextMoveAni forKey:@"nextMoveAni"];
    
    
    
}

-(void)bottomToUpTrantiom
{
    CGFloat duration = 2.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2.5;
    
//    CGRect rect = CGRectMake(-kAVBorderWidth, -(kAVLayerDisplayHeight-kAVWindowHeight)/2.0, kAVLayerDisplayWidth, kAVLayerDisplayHeight);

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    currentLayer.opacity = 0;
    [homeLayer addSublayer: currentLayer];
    
    //next Layer
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"1.png"]];
    nextLayer.opacity = 0;
    [homeLayer addSublayer: nextLayer];
    
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:beginTime];
    [currentLayer addAnimation:opacityAni forKey:@"opacityAni"];
    [nextLayer addAnimation:opacityAni forKey:@"opacityAni"];
    [self sceneManyTransite:duration withBeginTime:beginTime sceneTransiteFactor:AVAniMoveMustRightToLeft aniParameter:nil currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:homeLayer];
    
//    AVBasicLayer *snageLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
//                                                     vContentRect:kAVRectWindow
//                                                        withImage:[UIImage imageNamed:@"2.png"]];
//    [homeLayer addSublayer: snageLayer];
//
//    [self sceneManyTransite:duration withBeginTime:beginTime+duration sceneTransiteFactor:AVAniMoveMustLeftToRight aniParameter:nil currentLayer:nextLayer nextLayer:snageLayer aniRootLayer:homeLayer];

    
}

-(void)sceneManyTransite:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer aniRootLayer:(CALayer *)rootLayer
{
    CGPoint nextStartCenter =  kAVWindowCenter;
    
    CGPoint currentEndCenter =  kAVWindowCenter;
    
    CAMediaTimingFunction *timingFunction =  [CAMediaTimingFunction easeInOutCubic]; // [aniParameter objectForKey:@"timingFunction"];
    if (!timingFunction){

        timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }
    
    
    
    [rootLayer addSublayer: nextLayer];
    
    switch (transiteFactor) {
        case AVAniMoveMustRightToLeft:
        {
            
            nextStartCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustLeftToRight:
        {
            nextStartCenter = CGPointMake(-kAVWindowCenter.x, kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustTopToBottom:
        {
            nextStartCenter = CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            break;
        }
            
        case AVAniMoveMustBottomToTop:
        {
            nextStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowHeight+kAVWindowCenter.y);
            
            currentEndCenter = CGPointMake(kAVWindowCenter.x,-kAVWindowCenter.y);
            break;
        }
            
        default:
            break;
            
    }
    
    nextLayer.position = nextStartCenter;
   // currentLayer.position = kAVWindowCenter;
    
//    CAKeyframeAnimation *currentMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
//                                                                               withBeginTime:beginTime
//                                                                                   fromValue:kAVWindowCenter
//                                                                                     toValue:currentEndCenter
//                                                                                        mass:4];
    
    CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                         fromValue:kAVWindowCenter
                                                                           toValue:currentEndCenter];
    currentMoveAni.timingFunction = timingFunction;
    currentMoveAni.fillMode=  kCAFillModeForwards;
    [currentLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
    
//    CAKeyframeAnimation *nextMoveAni = [[AVBasicRouteAnimate defaultInstance]springCenterAni:duration
//                                                                                  withBeginTime:beginTime
//                                                                                      fromValue:nextStartCenter
//                                                                                        toValue:kAVWindowCenter
//                                                                                           mass:4];
    
    CABasicAnimation *nextMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                      fromValue:nextStartCenter
                                                                        toValue:kAVWindowCenter];
    nextMoveAni.timingFunction = timingFunction;
    nextMoveAni.fillMode= kCAFillModeForwards;
    [nextLayer addAnimation:nextMoveAni forKey:@"nextMoveAni"];
}

-(void)bottomToUpTrantiomorg
{
    CGFloat duration = 2.0;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2.5;
    
    CGRect rect = CGRectMake(-kAVBorderWidth, -(kAVLayerDisplayHeight-kAVWindowHeight)/2.0, kAVLayerDisplayWidth, kAVLayerDisplayHeight);

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:rect
                                                        vContentRect:rect
                                                           withImage:[UIImage imageNamed:@"cat.png"]];
    currentLayer.borderWidth = kAVBorderWidth;
    currentLayer.borderColor = [UIColor blackColor].CGColor;
    
    [homeLayer addSublayer: currentLayer];
    
    //next Layer
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:rect
                                                     vContentRect:rect
                                                        withImage:[UIImage imageNamed:@"top.png"]];
    nextLayer.borderWidth = kAVBorderWidth;
    nextLayer.borderColor = [UIColor blackColor].CGColor;

    [homeLayer addSublayer: nextLayer];
    
    NSInteger transiteFactor  = AVAniMoveMustRightToLeft;  //这个值会传递过来

        
        CGPoint nextStartCenter =  kAVWindowCenter;
        
        CGPoint currentEndCenter =  kAVWindowCenter;
        
        switch (transiteFactor) {
            case AVAniMoveMustRightToLeft:
            {
                
                nextStartCenter = CGPointMake(kAVLayerDisplayWidth+kAVWindowCenter.x, kAVWindowCenter.y);
                
                currentEndCenter = CGPointMake(kAVWindowCenter.x-kAVLayerDisplayWidth, kAVWindowCenter.y);
                
                nextLayer.position= nextStartCenter;
                
                
                break;
            }
                
            case AVAniMoveMustLeftToRight:
            {
                nextStartCenter = CGPointMake(kAVWindowCenter.x-kAVLayerDisplayWidth, kAVWindowCenter.y);
                
                currentEndCenter = CGPointMake(kAVLayerDisplayWidth+kAVWindowCenter.x, kAVWindowCenter.y);
                break;
            }
                
            case AVAniMoveMustTopToBottom:
            {
                nextStartCenter = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y-kAVLayerDisplayHeight);
                
                currentEndCenter = CGPointMake(kAVWindowCenter.x, kAVLayerDisplayHeight+kAVWindowCenter.y);
                break;
            }
                
            case AVAniMoveMustBottomToTop:
            {
                nextStartCenter = CGPointMake(kAVWindowCenter.x, kAVLayerDisplayHeight+kAVWindowCenter.y);
                
                currentEndCenter = CGPointMake(kAVWindowCenter.x,kAVWindowCenter.y-kAVLayerDisplayHeight);
                break;
            }
                
            default:
                break;
                
        }
        
        
        CABasicAnimation *currentMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                             fromValue:kAVWindowCenter
                                                                               toValue:currentEndCenter];
        currentMoveAni.timingFunction =  [CAMediaTimingFunction easeInQuint];
        currentMoveAni.fillMode= kCAFillModeBackwards;
        [currentLayer addAnimation:currentMoveAni forKey:@"currentMoveAni"];
        
        
        CABasicAnimation *nextMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:duration withBeginTime:beginTime
                                                                          fromValue:nextStartCenter
                                                                            toValue:kAVWindowCenter];
        nextMoveAni.timingFunction =  [CAMediaTimingFunction easeInQuint];
        nextMoveAni.fillMode=kCAFillModeForwards;
        [nextLayer addAnimation:nextMoveAni forKey:@"nextMoveAni"];
}


- (void)longRollBottomToUpTrantiom
{
    CGFloat duration = 2.5;//动画总时长
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+0.5;

    NSInteger transiteFactor  = AVAniMoveMustBottomToTop;  //这个值会传递过来
    
    CGFloat offset_x = -kAVBorderWidth;
    CGFloat offset_y = -(kAVLayerDisplayHeight-kAVWindowHeight)/2.0;
    CGRect rect = CGRectMake(offset_x, offset_y, kAVLayerDisplayWidth, kAVLayerDisplayHeight);
    UIImage *currentImage = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                filterType:AVImageFilterNostalgia
                                                blurRadius:15];
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:beginTime];
    for (int i = 0; i<4; i++) {
        AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:rect
                                                            vContentRect:rect
                                                               withImage:currentImage];
        currentLayer.borderWidth = kAVBorderWidth;
        currentLayer.borderColor = [UIColor blackColor].CGColor;
        currentLayer.opacity = 0;
        [homeLayer addSublayer:currentLayer];
        CAKeyframeAnimation *ani = [self longRollKeyframeAnimationWithIndex:i
                                                                        dir:transiteFactor
                                                                   duration:duration
                                                                  beginTime:beginTime];
        ani.fillMode=kCAFillModeForwards;
        [currentLayer addAnimation:ani forKey:@"longRollAnimation"];
        [currentLayer addAnimation:opacityAni forKey:@"opacityAni"];
        if (i<3) {
            AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:rect
                                                             vContentRect:rect
                                                                withImage:[UIImage imageNamed:@"0.png"]];
            nextLayer.borderWidth = kAVBorderWidth;
            nextLayer.borderColor = [UIColor blackColor].CGColor;

            nextLayer.opacity = 0;
            [homeLayer addSublayer:nextLayer];
            CAKeyframeAnimation *nextMoveAni = [self longRollKeyframeAnimationWithIndex:i+4
                                                                            dir:transiteFactor
                                                                       duration:duration
                                                                      beginTime:beginTime];
            nextMoveAni.fillMode=kCAFillModeBackwards;
            [nextLayer addAnimation:nextMoveAni forKey:@"longRollAnimation"];
            [nextLayer addAnimation:opacityAni forKey:@"opacityAni"];
        }
        
    }
}

- (CAKeyframeAnimation *)longRollKeyframeAnimationWithIndex:(NSInteger)index
                                                        dir:(NSInteger)dir
                                                   duration:(NSTimeInterval)duration
                                                  beginTime:(NSTimeInterval)beginTime
{
    NSArray *times = @[@(0.0),@(0.7),@(0.9),@(1.0)];
    CGPoint center = kAVWindowCenter;
    
    CGFloat offset = 60;
    CGPoint pointOne = CGPointZero;
    CGPoint pointTwo = CGPointZero;
    CGPoint pointThree = CGPointZero;
    CGPoint pointFour = CGPointZero;

    switch (dir) {
        case AVAniMoveMustRightToLeft:
        {
            pointOne = CGPointMake(center.x+index*kAVLayerDisplayWidth, center.y);
            pointTwo = CGPointMake(center.x-(5-index)*kAVLayerDisplayWidth-offset, center.y);
            pointThree = CGPointMake(center.x-(5-index)*kAVLayerDisplayWidth+offset, center.y);
            pointFour = CGPointMake(center.x-(5-index)*kAVLayerDisplayWidth, center.y);
        }
            break;
            
        case AVAniMoveMustLeftToRight:
        {
            pointOne = CGPointMake(center.x-index*kAVLayerDisplayWidth, center.y);
            pointTwo = CGPointMake(center.x+(5-index)*kAVLayerDisplayWidth+offset, center.y);
            pointThree = CGPointMake(center.x+(5-index)*kAVLayerDisplayWidth-offset, center.y);
            pointFour = CGPointMake(center.x+(5-index)*kAVLayerDisplayWidth, center.y);
        }
            break;
            
        case AVAniMoveMustTopToBottom:
        {
            pointOne = CGPointMake(center.x, center.y-index*kAVLayerDisplayHeight+offset);
            pointTwo = CGPointMake(center.x, center.y+(5-index)*kAVLayerDisplayHeight+offset);
            pointThree = CGPointMake(center.x, center.y+(5-index)*kAVLayerDisplayHeight-offset);
            pointFour = CGPointMake(center.x, center.y+(5-index)*kAVLayerDisplayHeight);
        }
            break;
            
        case AVAniMoveMustBottomToTop:
        {
            pointOne = CGPointMake(center.x, center.y+index*kAVLayerDisplayHeight+offset);
            pointTwo = CGPointMake(center.x, center.y-(5-index)*kAVLayerDisplayHeight-offset);
            pointThree = CGPointMake(center.x, center.y-(5-index)*kAVLayerDisplayHeight+offset);
            pointFour = CGPointMake(center.x, center.y-(5-index)*kAVLayerDisplayHeight);
        }
            break;
    }
    NSArray *positionValues = @[[NSValue valueWithCGPoint:pointOne],
                                [NSValue valueWithCGPoint:pointTwo],
                                [NSValue valueWithCGPoint:pointThree],
                                [NSValue valueWithCGPoint:pointFour],
                                ];

            
    CAKeyframeAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:@"position" values:positionValues keyTimes:times];
    positionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    return positionAni;
}

-(AVBasicTextLayer *)getTextLayer
{
    NSString *textOne = @"Always Be Happy";
    NSString *textTwo = @"VCORE LIFE";
    NSString *textThree = @"IS ESSENTIAL";
    NSString *text = [NSString stringWithFormat:@"%@\n%@\n%@",textOne,textTwo,textThree];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //  paragraphStyle.lineSpacing = 1.0;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    [paragraphStyle setLineSpacing:25];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text rangeOfString:textOne].location != NSNotFound) {
        [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Zapfino" size:24.0] range:[text rangeOfString:textOne]];
    }
    if ([text rangeOfString:textTwo].location != NSNotFound) {
        [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:70.0f] range:[text rangeOfString:textTwo]];
    }
    if ([text rangeOfString:textThree].location != NSNotFound) {
        [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16.0f] range:[text rangeOfString:textThree]];
    }
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 100, kAVWindowWidth, kAVWindowHeight) attributeStringText:attributedString];
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:2.5 withBeginTime:aniTime toValue:1.2];
    positionAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [textLayer addAnimation:positionAni forKey:@"scale-ani"];

    CABasicAnimation *positionAniT = [[AVBasicRouteAnimate defaultInstance] opacityClose:2.5 withBeginTime:aniTime];
    [textLayer addAnimation:positionAniT forKey:@"scale-opacity"];
    aniTime = aniTime + 1.0;
    return textLayer;
}

- (void)titleTextAnimation
{
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                     withImage:[UIImage imageNamed:@"heng4.png"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow bgColor:[UIColor clearColor].CGColor];
    
    [currentLayer addSublayer: bgLayer];
    
    NSString *photoDesc = @"春风十里不如你 哈哈";
    VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
    model.textContent = photoDesc;
    model.textFontName = @"Helvetica-Bold";
    model.textFontSize = 40;
    model.textFontColor = [UIColor whiteColor];
    
    AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
    CGSize textSize = [helper boundingRectTextModel:model
                                          photoDesc:photoDesc
                                           areaSize:CGSizeMake(kAVWindowWidth-200, MAXFLOAT)
                                       isEqualWidth:YES
                                      isEqualHeight:NO];
    textSize.height = MAX(50, textSize.height);
    CFTimeInterval duration = 2;//动画总时长
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    {
        //素材Ani
        CGFloat top = 200;
        NSArray *startPoints = @[[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0-40, top)],
                                 [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0-46, top+6)],
                                 [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0-52, top+12)],
                                 [NSValue valueWithCGPoint:CGPointMake(2.5*kAVWindowWidth/8.0, top+50+textSize.height)],
                                 [NSValue valueWithCGPoint:CGPointMake(2.5*kAVWindowWidth/8.0, top+52+textSize.height)],
                                 [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0+40, top)],
                                 [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0+46, top+6)],
                                 [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0+52, top+12)],
                                 [NSValue valueWithCGPoint:CGPointMake(5.5*kAVWindowWidth/8.0, top+50+textSize.height)],
                                 [NSValue valueWithCGPoint:CGPointMake(5.5*kAVWindowWidth/8.0, top+52+textSize.height)],
                                 ];
        NSArray *endPoints = @[[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/4.0-60, top)],
                               [NSValue valueWithCGPoint:CGPointMake(3*kAVWindowWidth/8.0-66, top+6)],
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0-84, top+12)],
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0, top+50+textSize.height)],
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0, top+52+textSize.height)],
                               [NSValue valueWithCGPoint:CGPointMake(3*kAVWindowWidth/4.0+60, top)],
                               [NSValue valueWithCGPoint:CGPointMake(5*kAVWindowWidth/8.0+66, top+6)],
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0+84, top+12)],
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0, top+50+textSize.height)],
                               [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth/2.0, top+52+textSize.height)],
                               ];
        
        for (int i = 0; i<startPoints.count; i++) {
            CGPoint startPoint = [startPoints[i] CGPointValue];
            CGPoint endPoint = [endPoints[i] CGPointValue];
            CAShapeLayer *lineLayer =  [self createLineLayerStartPoint:startPoint
                                                              endPoint:endPoint];
            [bgLayer addSublayer:lineLayer];
            CABasicAnimation *strokeAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:beginTime fromValue:[NSNumber numberWithFloat:0.0f] toValue:[NSNumber numberWithFloat:1.0f] propertyName:@"strokeEnd"];
            strokeAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [lineLayer addAnimation:strokeAni forKey:@"strokeAnimation"];
        }
    }
    
    {//文字Ani
        
        CGFloat top = 200;
        NSString *textOne = @"Always Be Happy";
//        NSString *textTwo = @"VCORE LIFE";
        NSString *textThree = @"IS ESSENTIAL";
        NSString *textFour = @"&";
        CATextLayer *textLayerOne = [self createTextLayerWithText:textOne
                                                             font:CTFontCreateWithName(CFSTR("Zapfino"), 26.0f, NULL)];
        textLayerOne.frame = CGRectMake(0, top-60, kAVWindowWidth, 50);
        textLayerOne.fontSize = 26.0f;
        textLayerOne.string = textOne;
        [textLayerOne setValue:0 forKey:@"opacity"];
        [bgLayer addSublayer:textLayerOne];
        
        AVBasicTextLayer *textLayerTwo = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:helper.attributedString textModel:model];
        textLayerTwo.position = CGPointMake(kAVWindowWidth/2, top+textSize.height/2+30);
        [textLayerTwo setValue:0 forKey:@"opacity"];
        [bgLayer addSublayer:textLayerTwo];
        
        CATextLayer *textLayerThree = [self createTextLayerWithText:textOne
                                                               font:CTFontCreateWithName(CFSTR("Helvetica-Bold"), 22.0f, NULL)];
        textLayerThree.frame = CGRectMake(0, top+60+textSize.height, kAVWindowWidth, 30);
        textLayerThree.string = textThree;
        textLayerThree.fontSize = 22.0f;
        [textLayerThree setValue:0 forKey:@"opacity"];
        [bgLayer addSublayer:textLayerThree];
        
        CATextLayer *textLayerFour = [self createTextLayerWithText:textFour
                                                              font:CTFontCreateWithName(CFSTR("Helvetica-Bold"), 32.0f, NULL)];
        textLayerFour.frame = CGRectMake((kAVWindowWidth-40)/2, top-10, 50, 50);
        textLayerFour.string = textFour;
        textLayerFour.fontSize = 30.0f;
        [textLayerFour setValue:0 forKey:@"opacity"];
        [bgLayer addSublayer:textLayerFour];
        
        CABasicAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:duration withBeginTime:beginTime fromValue:1.3 toValue:1.0];
        scaleAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime];
        opacityAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [textLayerOne addAnimation:scaleAni forKey:@"scale-ani"];
        [textLayerOne addAnimation:opacityAni forKey:@"opacity-ani"];
        [textLayerTwo addAnimation:scaleAni forKey:@"scale-ani"];
        [textLayerTwo addAnimation:opacityAni forKey:@"opacity-ani"];
        [textLayerThree addAnimation:scaleAni forKey:@"scale-ani"];
        [textLayerThree addAnimation:opacityAni forKey:@"opacity-ani"];
        [textLayerFour addAnimation:scaleAni forKey:@"scale-ani"];
        [textLayerFour addAnimation:opacityAni forKey:@"opacity-ani"];
    }
    
    CABasicAnimation *sacleOutAni = [[AVBasicRouteAnimate alloc] customBasic:0.5 withBeginTime:beginTime+duration*0.8 fromValue:@(1) toValue:@(1.2) propertyName:@"transform.scale"];
    [bgLayer addAnimation:sacleOutAni forKey:@"sacleOutAni"];

    //文字素材层整体淡出动画
    CABasicAnimation *closeOpacityAni = [[AVBasicRouteAnimate defaultInstance] opacityClose:1 withBeginTime:beginTime+duration*1.2];
    [bgLayer addAnimation:closeOpacityAni forKey:@"closeOpacityAni"];
}

- (CATextLayer *)createTextLayerWithText:(NSString *)text
                                    font:(CFTypeRef)fontRef
{
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.string = text;
    textLayer.font = fontRef;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.backgroundColor = [UIColor clearColor].CGColor;
    return textLayer;
}

- (CAShapeLayer *)createLineLayerStartPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint
{
    UIBezierPath *shapePathOne = [UIBezierPath bezierPath];
    [shapePathOne moveToPoint:startPoint];
    [shapePathOne addLineToPoint:endPoint];
    [shapePathOne closePath]; // 添加一个结尾点和起点相同
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor colorWithWhite:1.0 alpha:0.7].CGColor;
    shapeLayer.path = shapePathOne.CGPath;
    shapeLayer.fillColor = nil; // 默认为blackColor
//    [layer addSublayer:shapeLayer];
    return shapeLayer;
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
