//
//  VcoreTest8ViewController.m
//  AVCoreTest
//
//  Created by yinshengqi on 17/4/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VcoreTest8ViewController.h"
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

#import "CAMediaTimingFunction+AdditionalEquations.h"

#import "CAMultiColorLayer.h"

#import "AVPlayTextLayer.h"

#import "AVShapeBaseLayer.h"

#import "AVTimeLineLayer.h"

#import "AVTimeLineColorConstant.h"

#import "AVBasicGradientLayer.h"

#import "UIImage+BoxBlur.h"

#import "UIImage+ImageEffects.h"

#import "AVBasicTextLayer.h"

#import "AVTimeLineTextLayer.h"

#import "NSString+Additions.h"

#define kCirPointBorderColor      UIColorFromRGBAlpha(0xf19ec2 ,0.75)

#define kTextFont           [UIFont systemFontOfSize:23]

#define kPointOpacityDuration   0.4

@interface VcoreTest8ViewController (){

    AVBottomLayer  *blurBGLayer;
    
    BOOL _isHasText;
    NSInteger _photoTextCount;
}
@end

@implementation VcoreTest8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isHasText = YES;
    _photoTextCount = 1;
    homeLayer.backgroundColor = [UIColor whiteColor].CGColor;
    CATransform3D sublayerTransform = CATransform3DIdentity;
    sublayerTransform.m34 = -1.0 / 1000;
    self.view.layer.sublayerTransform = sublayerTransform;
    homeLayer.masksToBounds = YES;

//    [self AVSAniTimeLineVerticalFourPointPhotoAndText];//yes
//        [self AVSAniTimeLineVerticalTwoPointPhotoAndText];///yes
//        [self AVSAniTimeLineVerticalOneLineInLeft];
//        [self AVSAniTimeLineBottomPhotoAndTopText];
        [self AVSAniTimeLineEndPhotoAndText];
    
}


#pragma mark - 
#pragma mark - point&&photo
- (void)createPhotoAndPointWithCenter:(CGPoint)center
                           photoImage:(UIImage *)photoImage
                          vBorderRect:(CGRect)vBorderRect
                            borderDic:(AVBorderRrrowDicType)borderDic
                            rootLayer:(AVBottomLayer *)rootLayer
                            beginTime:(CFTimeInterval)beginTime
{
    //point
    {
    AVShapeBaseLayer *pointLayer1 = [self createPointWithCenter: center
                                                      beginTime:beginTime];
    [rootLayer addSublayer: pointLayer1];
    }
    
    //photo
    {
    AVTimeLineLayer *photoLayer1 = [[AVTimeLineLayer alloc] initWithCenter:center vContentRect:kAVRectWindow size:CGSizeMake(vBorderRect.size.width, vBorderRect.size.height) withImage:photoImage borderDic:borderDic];
    [rootLayer addSublayer: photoLayer1];
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:beginTime+0.2 fromValue:0 toValue: photoLayer1.radio];
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    [photoLayer1 addAnimation:saleToAni1 forKey:@"scaleAni"];
    }
}

#pragma mark -
#pragma mark - point&&text
- (void)creatTextAndPointWithPosition:(CGPoint)position
                         photoContent:(NSString *)photoContent
                             textFont:(UIFont *)font
                          textBgWidth:(CGFloat)width
                       isDefaultWidth:(BOOL)isDefaultWidth
                            borderDir:(AVBorderRrrowDicType)borderDir
                            rootLayer:(AVBottomLayer *)rootLayer
                            beginTime:(CFTimeInterval)beginTime{
    //point
    {
    AVShapeBaseLayer *pointLayer1 = [self createPointWithCenter:position
                                                      beginTime:beginTime];
    [rootLayer addSublayer: pointLayer1];
    }
    //text
    {
    AVTimeLineTextLayer *textLayer = [[AVTimeLineTextLayer alloc] initWithPosition:position size:CGSizeMake(width, MAXFLOAT) withText:photoContent font:font isDefluatWidth:isDefaultWidth interval:15 borderDic:borderDir];
        
    [rootLayer addSublayer:textLayer];
    CABasicAnimation *borderAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:beginTime];
    textLayer.opacity= 0.0f;
    [textLayer addAnimation:borderAni forKey:@"dfs"];
    }
}

#pragma mark -
#pragma mark - draw Line
- (void)createLineWithFrame:(CGRect)frame
                        position:(CGPoint)position
                     anchorPoint:(CGPoint)anchorPoint
                         bgColor:(UIColor*)color
                        duration:(CFTimeInterval)duration
                       beginTime:(CFTimeInterval)beginTime
                       rootLayer:(AVBottomLayer *)rootLayer
{
    AVBottomLayer *lineLayer = [self creatLineWithFrame:frame position:position anchorPoint:anchorPoint bgColor:color];
    [rootLayer addSublayer:lineLayer];
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, frame.size.width,  0)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, frame.size.width,  frame.size.height)]
                                                        propertyName:kAVBasicAniBounds];
    [lineLayer addAnimation: boundAni forKey:@"kAVBasicAniPosition"];
}


#pragma mark -
#pragma mark - AVBottomLayer
-(AVBottomLayer *)creatLineWithFrame:(CGRect)frame position:(CGPoint)position anchorPoint:(CGPoint)anchorPoint bgColor:(UIColor*)color
{
    AVBottomLayer *longLineLayer = [[AVBottomLayer alloc] initWithFrame: frame
                                                                bgColor:color.CGColor];
    
    longLineLayer.position = position;
    longLineLayer.anchorPoint = anchorPoint;
    
    return longLineLayer;
}


#pragma mark -
#pragma mark - AVShapeBaseLayer
-(AVShapeBaseLayer *)createPointWithCenter:(CGPoint)position beginTime:(CFTimeInterval)beginTime
{
    AVShapeBaseLayer *pointLayer1 = [[AVShapeBaseLayer  alloc] initWithFrame:CGRectMake(0, 0, 15, 15)
                                                                  bezierPath:[UIBezierPath circularShape: CGRectMake(0, 0, 15, 15)]
                                                                   fillColor: kCirPointFillColor
                                                                 strokeColor:kCirPointBorderColor
                                                                   lineWidth:5];
    pointLayer1.position = position;
    
    CABasicAnimation *opacityOpenAni1 = [[AVBasicRouteAnimate alloc] opacityOpen:kPointOpacityDuration withBeginTime:beginTime];
    pointLayer1.opacity= 0.0f;
    [pointLayer1 addAnimation:opacityOpenAni1 forKey:@"dfs"];
    
    return pointLayer1;
}

#pragma mark -
#pragma mark - AVTimeLineLayer
- (AVTimeLineLayer *)createPhotoLayerWithRect:(CGRect)rect
                                    photoImage:(NSString *)imageName
                                  broadRowDir:(AVBorderRrrowDicType)rowDir
                                     position:(CGPoint)position
                                    beginTime:(CFTimeInterval)time {

    AVTimeLineLayer *photoLayer = [[AVTimeLineLayer alloc] initWithCenter:position vContentRect:kAVRectWindow size:CGSizeMake(rect.size.width, rect.size.height) withImage:[UIImage imageNamed:imageName] borderDic:rowDir];
    CABasicAnimation *saleToAni1 = [[AVBasicRouteAnimate defaultInstance] scaleTo:1 withBeginTime:time fromValue:0 toValue: photoLayer.radio];
    saleToAni1.timingFunction = [CAMediaTimingFunction easeOutBack];
    [photoLayer addAnimation:saleToAni1 forKey:@"scaleAni"];
    return photoLayer;
}



#pragma mark -
#pragma mark - AVTimeLineTextLayer
- (AVTimeLineTextLayer *)createTextLayerWithText:(NSString *)text
                                        textFont:(UIFont *)font
                                     textBgWidth:(CGFloat)width
                                  isDefulatWidth:(BOOL)isDefulatWidth
                                    textPosition:(CGPoint)position
                                rowDirect:(AVBorderRrrowDicType)direct
                                       beginTime:(CFTimeInterval)time{
    
    AVTimeLineTextLayer *textLayer = [[AVTimeLineTextLayer alloc] initWithPosition:position size:CGSizeMake(width, MAXFLOAT) withText:text font:font isDefluatWidth:isDefulatWidth interval:10 borderDic:direct];

    CABasicAnimation *borderAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.4 withBeginTime:time];
    textLayer.opacity= 0.0f;
    [textLayer addAnimation:borderAni forKey:@"dfs"];
    return textLayer;
}



- (void)AVSAniTimeLineVerticalFourPointPhotoAndText{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:15];
    
    AVBottomLayer *BGLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                        withImage:imageBlur];
    
    [aniBgLayer addSublayer: BGLayer];
    
    [self createLineWithFrame:CGRectMake(0, 20, kTimeLineWith, kAVWindowHeight)
                     position:CGPointMake(kAVWindowCenter.x, kAVWindowHeight)
                  anchorPoint:CGPointMake(0.5, 1)
                      bgColor:kTimeLineColor duration:1.0f
                    beginTime:beginTime
                    rootLayer:aniBgLayer];
    // photo1
    [self createPhotoAndPointWithCenter:CGPointMake(kAVWindowCenter.x, 380)
                             photoImage:[UIImage imageNamed:@"1.png"]
                            vBorderRect:CGRectMake(0, 0, 270, 270)
                              borderDic:AVBorderRrrowDicLeft
                              rootLayer:aniBgLayer
                              beginTime:beginTime + 0.5];
    
    //图似乎也流行起来使视图似乎也流行起来模糊背景视中心的毛玻璃效果起来使得模
    NSString *titles1 = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来模糊背景视图似乎也流行起来";
    if (titles1){
        [self creatTextAndPointWithPosition:CGPointMake(kAVWindowCenter.x, 520)
                               photoContent:titles1
                                   textFont:kTextFont
                                textBgWidth:270
                             isDefaultWidth:NO
                                  borderDir:AVBorderRrrowDicRight
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime + 0.5];
    }
    
    
    [self createPhotoAndPointWithCenter:CGPointMake(kAVWindowCenter.x, 240)
                             photoImage:[UIImage imageNamed:@"2.png"]
                            vBorderRect:CGRectMake(0, 0, 270, 270)
                              borderDic:AVBorderRrrowDicRight
                              rootLayer:aniBgLayer
                              beginTime:beginTime + 1];
    
    NSString *titles2 = @"dsafghjkllkjhgfds";
    if (titles2){
        [self creatTextAndPointWithPosition:CGPointMake(kAVWindowCenter.x, 100)
                               photoContent:titles2
                                   textFont:kTextFont
                                textBgWidth:270
                                isDefaultWidth:NO
                                  borderDir:AVBorderRrrowDicLeft
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime + 1];
    }
    
}

- (void)AVSAniTimeLineVerticalTwoPointPhotoAndText{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    UIImage *imageBlur = [[AVFilterPhoto alloc] filterGPUImage:[UIImage imageNamed:@"1.png"]
                                                    filterType:AVImageFilteriOS7GaussianBlur
                                                    blurRadius:15];
    
    AVBottomLayer *BGLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                        withImage:imageBlur];
    
    [aniBgLayer addSublayer: BGLayer];
    
    [self createLineWithFrame:CGRectMake(0, 20, kTimeLineWith, kAVWindowHeight)
                     position:CGPointMake(kAVWindowCenter.x, kAVWindowHeight)
                  anchorPoint:CGPointMake(0.5, 1)
                      bgColor:kTimeLineColor
                     duration:0.5f
                    beginTime:beginTime
                    rootLayer:aniBgLayer];
    
    [self createPhotoAndPointWithCenter:CGPointMake(kAVWindowCenter.x, 450)
                             photoImage:[UIImage imageNamed:@"1.png"]
                            vBorderRect:CGRectMake(0, 0, 270, 270)
                              borderDic:AVBorderRrrowDicLeft
                              rootLayer:aniBgLayer
                              beginTime:beginTime+0.5];
    
    NSString *titles1 = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来模糊背景视图似乎也流行起来";
    if (titles1){
        [self creatTextAndPointWithPosition:CGPointMake(kAVWindowCenter.x, 450)
                               photoContent:titles1
                                   textFont:kTextFont
                                textBgWidth:270
                             isDefaultWidth:NO
                                  borderDir:AVBorderRrrowDicRight
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime + 0.5];
    }
    
    
    [self createPhotoAndPointWithCenter:CGPointMake(kAVWindowCenter.x, 150)
                             photoImage:[UIImage imageNamed:@"2.png"]
                            vBorderRect:CGRectMake(0, 0, 270, 270)
                              borderDic:AVBorderRrrowDicRight
                              rootLayer:aniBgLayer
                              beginTime:beginTime+1];
    
    NSString *titles2 = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来模糊背景视图似乎也流行起来";
    if (titles2){
        [self creatTextAndPointWithPosition:CGPointMake(kAVWindowCenter.x, 150)
                               photoContent:titles2
                                   textFont:kTextFont
                                textBgWidth:270
                             isDefaultWidth:NO
                                  borderDir:AVBorderRrrowDicLeft
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime + 1];
    }
    
}

-(void)AVSAniTimeLineVerticalOneLineInLeft
{
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    [homeLayer addSublayer: aniBgLayer];
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
    [self createLineWithFrame:CGRectMake(20, 0, kTimeLineWith, kAVWindowHeight)
                     position:CGPointMake(40, kAVWindowCenter.y)
                  anchorPoint:CGPointMake(0.5, 0.5)
                      bgColor:kTimeLineColor
                     duration:0.4
                    beginTime:beginTime
                    rootLayer:aniBgLayer];
    
    if (_isHasText) {
        
        [self createPhotoAndPointWithCenter:CGPointMake(40, 240)
                                 photoImage:[UIImage imageNamed:@"1.png"]
                                vBorderRect:CGRectMake(0, 0, 480, 480)
                                  borderDic:AVBorderRrrowDicLeft
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime+0.3];
         NSString *text = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来模糊背景视图似乎也流行起来";
        [self creatTextAndPointWithPosition:CGPointMake(40, 240)
                               photoContent:text
                                   textFont:[UIFont systemFontOfSize:27]
                                textBgWidth:480
                             isDefaultWidth:NO
                                  borderDir:AVBorderRrrowDicLeft
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime+0.6];
        
    }else{
        
        [self createPhotoAndPointWithCenter:CGPointMake(40, kAVWindowCenter.y)
                                 photoImage:[UIImage imageNamed:@"1.png"]
                                vBorderRect:CGRectMake(0, 0, 480, 480)
                                  borderDic:AVBorderRrrowDicLeft
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime+0.3];
    }
    
}

- (void)AVSAniTimeLineBottomPhotoAndTopText{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;
    
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: aniBgLayer];
    
    [self createLineWithFrame:CGRectMake(20, 0, kTimeLineWith, kAVWindowHeight)
                     position:CGPointMake(560, kAVWindowCenter.y)
                  anchorPoint:CGPointMake(0.5, 0.5)
                      bgColor:kTimeLineColor
                     duration:0.4f
                    beginTime:beginTime
                    rootLayer:aniBgLayer];
    
    if (_isHasText) {
       
        [self createPhotoAndPointWithCenter:CGPointMake(560, 370)
                                 photoImage:[UIImage imageNamed:@"1.png"]
                                vBorderRect:CGRectMake(0, 0, 480, 480)
                                  borderDic:AVBorderRrrowDicRight
                                  rootLayer:aniBgLayer
                                  beginTime:beginTime+0.3];
        NSString *text = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来";
        AVTimeLineTextLayer *timeLineTextLayer = [self createTextLayerWithText:text
                                                                      textFont:[UIFont systemFontOfSize:27] textBgWidth:480
                                                  isDefulatWidth:NO
                                            textPosition:CGPointMake(kAVWindowCenter.x+4, 120) rowDirect:AVBorderRrrowDicBottom beginTime:beginTime+1.2];
        [aniBgLayer addSublayer:timeLineTextLayer];
    }else{
    
       [self createPhotoAndPointWithCenter:CGPointMake(560, kAVWindowCenter.y)
                                photoImage:[UIImage imageNamed:@"1.png"]
                               vBorderRect:CGRectMake(0, 0, 480, 480)
                                 borderDic:AVBorderRrrowDicRight
                                 rootLayer:aniBgLayer
                                 beginTime:beginTime+0.3];
    }
    
}

- (void)createStrokeBroadStartWithRect:(CGRect)rect
                                  text:(NSString *)text
                              textFont:(UIFont *)font
                              duration:(CFTimeInterval)duration
                             beginTime:(CFTimeInterval)time
                             textColor:(UIColor *)color
                             rootlayer:(AVBottomLayer *)rootLayer
                            {
    
    AVShapeBaseLayer *shapeLayer = [[AVShapeBaseLayer  alloc] initWithFrame:rect
                                                                 bezierPath:[UIBezierPath squareShape:rect]
                                                                  fillColor: [UIColor clearColor]
                                                                strokeColor:UIColorFromRGB(0xa07454)
                                                                  lineWidth:4];
    
    [rootLayer addSublayer: shapeLayer];
    CABasicAnimation *strokeStartAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration withBeginTime:time fromValue:@(0) toValue:@(1) propertyName:@"strokeEnd"];
    [shapeLayer addAnimation: strokeStartAni forKey:@"strokeStartAni"];
    //seond
    CGFloat textHeight = rect.size.height-font.pointSize*0.43;
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, (rect.size.height-textHeight)/2, rect.size.width, textHeight) intText:text textFont:font textColor:color];
    [shapeLayer addSublayer: textLayer];
    [textLayer addAni:3.0f beginTime:time aniFactor:AVArtAniTextFadeInOut];
}

- (void)AVSAniTimeLineEndPhotoAndText{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    AVBottomLayer *aniBgLayer = [[AVBottomLayer alloc] initWithFrame: kAVRectWindow
                                                             bgColor:[UIColor clearColor].CGColor];
    [homeLayer addSublayer: aniBgLayer];
    
    NSString *titleString = @"End";
    UIFont *textFont = [UIFont systemFontOfSize:25];
    CGSize pathSize = [titleString textBroadSizeWithFont:textFont maxSize:CGSizeMake(100, MAXFLOAT) interval:0 isDefluatWidth:YES isDefaultHeight:NO];
    
    CGRect pathFrame = CGRectMake((kAVWindowWidth-pathSize.width)/2, 20, pathSize.width, pathSize.height);
    
    [self createStrokeBroadStartWithRect:pathFrame
                                    text:titleString
                                textFont:textFont
                                duration:0.8f
                               beginTime:beginTime
                               textColor:UIColorFromRGB(0xa07454)
                               rootlayer:aniBgLayer];
    
    
    [self createLineWithFrame:CGRectMake(0, 0, kTimeLineWith, 30)
                     position:CGPointMake(kAVWindowCenter.x, pathFrame.size.height+35)
                  anchorPoint:CGPointMake(0.5, 0.5)
                      bgColor:UIColorFromRGB(0xa07454)
                     duration:0.3f
                    beginTime:beginTime+0.5
                    rootLayer:aniBgLayer];
    
    if (_isHasText) {

        AVTimeLineLayer *photoLayer = [self createPhotoLayerWithRect:CGRectMake(0, 0, 400, 400)
                                                          photoImage:@"1.png"
                                                         broadRowDir:AVBorderRrrowDicNone
                                                            position:CGPointMake(kAVWindowCenter.x, pathFrame.size.height+235) beginTime:beginTime+0.8];
        [aniBgLayer addSublayer:photoLayer];
        //text
        NSString *text = @"控制中心的毛玻璃效果使得模糊背景视图似乎也流行起来";
        AVTimeLineTextLayer *timeLineTextLayer = [self createTextLayerWithText:text
                                                                      textFont:[UIFont systemFontOfSize:27] textBgWidth:408
                                            isDefulatWidth:YES
                                            textPosition:CGPointMake(kAVWindowCenter.x+kWithPointInterval/2-3,pathFrame.size.height+430)
                                                                     rowDirect:AVBorderRrrowDicUp beginTime:beginTime+0.9];
        [homeLayer addSublayer:timeLineTextLayer];
    }else{
        
        AVTimeLineLayer *photoLayer = [self createPhotoLayerWithRect:CGRectMake(0, 0, 480, 480)
                                                          photoImage:@"1.png"
                                                         broadRowDir:AVBorderRrrowDicNone
                                                            position:CGPointMake(kAVWindowCenter.x, pathFrame.size.height+235) beginTime:beginTime+0.8];
        [aniBgLayer addSublayer:photoLayer];

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
