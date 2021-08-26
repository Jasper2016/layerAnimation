//
//  Test7ViewController.m
//  AVCoreTest
//
//  Created by mac on 2017/2/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Test7ViewController.h"
#import "AVFundation.h"
#import "AVConstant.h"
#import "AVPlayTextLayer.h"
#import "NSString+AVCore.h"
#import "NSString+Additions.h"
#import "UIBezierPath+BasicShapes.h"
#import "AVShapeBaseLayer.h"
#import "AVBasicGradientLayer.h"

#import "AVBasicGradientLayer.h"

#import "CABlurLayer.h"

#import "NSString+Additions.h"

#import "CAMultiColorLayer.h"

#define kBorderWith  kAVCeilfY(22)

#define kOffsetX      kAVCeilfY(11)

#define kLookScaleInRadio   1.2

#define kLookScaleOutRadio   0.8

#define kDescTextOffsetX    30
#define kDefultFontValue    27

#define kDefalutTextFont  [UIFont systemFontOfSize:kDefultFontValue]

#define kBoldTextFont  [UIFont boldSystemFontOfSize:kDefultFontValue]


#define  kDefalutInterval  10
#define  kDefalutLineHeight 4
#define kDefalutBottomOffset 20



@interface Test7ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@end

@implementation Test7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
      homeLayer.masksToBounds = YES;
   // [self roraionAndRadio];

    //[self AVSceneTextStaticFresh];

//    [self AVSceneTextStaticFresh];

//    [self testDotLine];
//    [self testGradient];

    
   // [self AVSceneTextSimpleOnly];
    
  //  [self AVSceneTextCommonFade];
    
//    [self AVSceneTextBlackBGLineMove];

//    [self BlurEffect];
//    [self twoLineText];
//    [self openTextBgLayer];
//    [self AVSceneTextLawnPhoto];
    
  //  [self repTextFhcrt];
    
    [self squareSizeShow];
    
    //[self addWhteLove];
}

-(void)addWhteLove
{
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBottomLayer *lineOneLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(kOffsetX, kOffsetX, currentLayer.frame.size.width-(2*kOffsetX), currentLayer.frame.size.height-(2*kOffsetX))];
    lineOneLayer.borderColor = [[UIColor whiteColor]colorWithAlphaComponent:0.6].CGColor;
    lineOneLayer.borderWidth = 4;
    [currentLayer addSublayer: lineOneLayer];
    
    AVBottomLayer *lineTwoLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(kOffsetX, kOffsetX, lineOneLayer.frame.size.width-(2*kOffsetX), lineOneLayer.frame.size.height-(2*kOffsetX))];
    lineTwoLayer.borderColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5].CGColor;
    lineTwoLayer.borderWidth = 2;
    
    [lineOneLayer addSublayer: lineTwoLayer];

}

-(void)repTextFhcrt
{
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    
    CGRect labelRect = [text boundingRectWithSize:homeLayer.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:70] } context:nil];
    
    
    
    CATextLayer *textLayer = [CATextLayer layer];
    [textLayer setString:text];
    [textLayer setForegroundColor:[UIColor redColor].CGColor];
    [textLayer setFrame:labelRect];
    [textLayer setFont:CFBridgingRetain([UIFont fontWithName:@"HelveticaNeue" size:70.0].fontName)];
    [textLayer setAlignmentMode:kCAAlignmentCenter];
    [textLayer setFontSize:70.0];
    textLayer.masksToBounds = YES;
    textLayer.position = CGPointMake(CGRectGetMidX(homeLayer.bounds), CGRectGetMidY(homeLayer.bounds));
    [homeLayer addSublayer:textLayer];
    
    homeLayer.backgroundColor = [UIColor blueColor].CGColor;
}

- (void)AVSceneTextLawnPhoto{

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"floatPhotoBroadBg"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vBorderImage:[UIImage imageNamed:@"Photoframe"] vContentRect:CGRectMake(90, 90, 430, 430) vContentImage:[UIImage imageNamed:@"1"] isBorderFront:YES];
    photoLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y-kDefalutBottomOffset/2);
    [currentLayer addSublayer:photoLayer];
 
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    CGSize textBgSize = [text textBroadSizeWithFont:kDefalutTextFont maxSize:CGSizeMake(500, MAXFLOAT) interval:kDefalutInterval isDefluatWidth:YES isDefaultHeight:NO];
    AVBasicLayer *textBgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, textBgSize.width, textBgSize.height) withImage:[UIImage imageNamed:@"floatPhotoBroadTextBg"]];
    textBgLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-textBgSize.height/2-kDefalutBottomOffset/2);
    [currentLayer addSublayer:textBgLayer];

    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, textBgSize.width-2*kDefalutInterval, textBgSize.height-2*kDefalutInterval) intText:text textFont:kDefalutTextFont textColor:[UIColor whiteColor]];
    textLayer.position = CGPointMake(textBgLayer.width/2, textBgLayer.height/2+(kDefultFontValue*kTextFontOffsetFactor2));
    [textBgLayer addSublayer:textLayer];
}
- (void)openTextBgLayer{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    UIFont *font = [UIFont boldSystemFontOfSize:27];
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(currentLayer.width, MAXFLOAT) interval:15 isDefluatWidth:YES isDefaultHeight:NO];
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0,0, broadSize.width, broadSize.height) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor];
    
    bgLayer.position = CGPointMake(bgLayer.position.x, bgLayer.height);
    bgLayer.anchorPoint = CGPointMake(0.5, 1);
    [currentLayer addSublayer:bgLayer];
    
    CABasicAnimation *boundAni = [[AVBasicRouteAnimate defaultInstance] customBasic:5
                                                                      withBeginTime:beginTime
                                                                          fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 0, bgLayer.height)]
                                                                            toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, bgLayer.width, bgLayer.height)]
                                                                       propertyName:kAVBasicAniBounds];
    [bgLayer addAnimation: boundAni forKey:@"kAVBasicAniPosition"];
    
    AVBasicLayer *textBgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight-(broadSize.height/2), broadSize.width, broadSize.height) bgColor:[UIColor clearColor].CGColor];
    textBgLayer.anchorPoint = CGPointMake(0.5, 1);
    [currentLayer addSublayer:textBgLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, broadSize.width-30, broadSize.height-30) intText:text textFont:font textColor:[UIColor whiteColor]];
    [textBgLayer addSublayer:textLayer];
    
    NSArray *boundKeyTime = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:0.1],
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:1],
                              ];
    
    NSArray *boundValues = @[
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,broadSize.height)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,broadSize.height)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,0)],
                             ];
    
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:1
                                                                   withBeginTime:beginTime+0.6                                                                  propertyName:kAVBasicAniBounds
                                                                          values:boundValues keyTimes:boundKeyTime];
    
    [textBgLayer addAnimation: boundsAni forKey:@"boundsAni"];
    

}

-(void)AVSceneTextBlackBGLineMove
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CFTimeInterval mvoeDuration = 5.0f;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,600, 600) vContentRect: CGRectMake(0, 0,600, 600) withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *sceneDescString = @"01 因为身在大学，所以经常写关于大学生活的文章，分享自己的经历时，常常收到这样的读者留言：如果我的大学可以重新来过";
    
//    UIFont *defultFont = [UIFont systemFontOfSize:kDefultFontValue];
    
    CGSize broadSize = [sceneDescString textBroadSizeWithFont:kDefalutTextFont
                                                      maxSize:CGSizeMake(kAVWindowWidth-kDescTextOffsetX*2, MAXFLOAT)
                                                     interval:kDefalutInterval
                                               isDefluatWidth:YES isDefaultHeight:NO];
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight-broadSize.height/2,kAVWindowWidth, broadSize.height)
                                                          bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
    bgLayer.anchorPoint= CGPointMake(0.5, 1);
    bgLayer.masksToBounds = YES;
    [currentLayer addSublayer: bgLayer];
    
    AVBottomLayer *topWhiteLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,bgLayer.width, 1)
                                                                bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor];
    [bgLayer addSublayer: topWhiteLayer];

    
    NSArray *boundKeyTime = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:0.1],
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:1],
                              ];
    
    NSArray *boundValues = @[
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,broadSize.height)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,broadSize.height)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,0)],
                             ];
    
    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:mvoeDuration
                                                                   withBeginTime:beginTime
                                                                    propertyName:kAVBasicAniBounds
                                                                          values:boundValues keyTimes:boundKeyTime];
    
    [bgLayer addAnimation: boundsAni forKey:@"boundsAni"];
    
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, bgLayer.height-(kDefalutInterval*2))
                                                                intText:sceneDescString textFont:kDefalutTextFont
                                                              textColor:[UIColor whiteColor]];
    [textLayer openTextDefultShadow];
    
    textLayer.position = CGPointMake(currentLayer.position.x, textLayer.position.y+(kDefultFontValue*kTextFontOffsetFactor2)+kDefalutInterval);

    [bgLayer addSublayer: textLayer];
    

}

-(void)AVSceneTextCommonFade
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,600, 600) vContentRect: CGRectMake(0, 0,600, 600) withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *sceneDescString = @"是觉得试剂瓶谁家婆紧迫接";
    
    //UIFont *defultFont = [UIFont systemFontOfSize:kDefultFontValue];
    
    CGSize broadSize = [sceneDescString textBroadSizeWithFont:kDefalutTextFont
                                                      maxSize:CGSizeMake(kAVWindowWidth-kDescTextOffsetX*2, MAXFLOAT)
                                                     interval:kDefalutInterval
                                               isDefluatWidth:YES isDefaultHeight:NO];
    CGFloat broadHeight = ceil(broadSize.height);
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, currentLayer.height-broadHeight,currentLayer.height, broadHeight) bgColor:[UIColor clearColor].CGColor];
    [currentLayer addSublayer: bgLayer];
    
    NSArray *colorsList = @[
                            (id)[UIColor clearColor].CGColor,
                            (id)[[UIColor blackColor]colorWithAlphaComponent:0.60].CGColor,
                            ];
    
    NSArray *locationList = @[
                              [NSNumber numberWithFloat:0.0f],
                              [NSNumber numberWithFloat:1.0f],
                              ];
    
    
    AVBasicGradientLayer *textBgLayer = [[AVBasicGradientLayer alloc] initWithFrame:bgLayer.bounds colorsList:colorsList locationList:locationList
                                                                         startPoint:CGPointMake(0.5, 0) endPoint:CGPointMake(0.5, 1)];
                                         
     [bgLayer addSublayer: textBgLayer];
    
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, bgLayer.height-(kDefalutInterval*2))
                                                                intText:sceneDescString textFont:kDefalutTextFont
                                                              textColor:[UIColor whiteColor]];
    [textLayer openTextDefultShadow];
    
    textLayer.position = CGPointMake(currentLayer.position.x, textLayer.position.y+(kDefultFontValue*kTextFontOffsetFactor2)+kDefalutInterval);
    
    [textLayer addAni:0.35 beginTime:beginTime aniFactor:AVArtAniTextFadeInOut];
    
    [bgLayer addSublayer:textLayer];
}

-(void)AVSceneTextSimpleOnly
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,600, 600) vContentRect: CGRectMake(0, 0,600, 600) withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *sceneDescString = @"是觉得试剂瓶谁家婆紧迫接";
    
    //UIFont *defultFont = [UIFont systemFontOfSize:kDefultFontValue];
    
    
    
    CGSize broadSize = [sceneDescString textBroadSizeWithFont:kDefalutTextFont
                                                      maxSize:CGSizeMake(kAVWindowWidth-kDescTextOffsetX*2, MAXFLOAT)
                                                     interval:0
                                               isDefluatWidth:NO isDefaultHeight:NO];
    CGFloat broadHeight = ceil(broadSize.height);
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadHeight)
                                                                intText:sceneDescString textFont:kDefalutTextFont
                                                              textColor:[UIColor whiteColor]];
   // textLayer.backgroundColor = [UIColor redColor].CGColor;
    
    textLayer.position = CGPointMake(currentLayer.position.x, currentLayer.height-textLayer.position.y+(kDefultFontValue*kTextFontOffsetFactor2));
    
    [textLayer addAni:0.35 beginTime:beginTime aniFactor:AVArtAniTextFadeInOut];
    
    [currentLayer addSublayer:textLayer];
}

- (void)twoLineText{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆";
    UIFont *font = [UIFont systemFontOfSize:27];
    
    
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(kAVWindowWidth-40, MAXFLOAT) interval:10 isDefluatWidth:YES isDefaultHeight:NO];
    AVBasicLayer *textBgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, broadSize.height) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor];
    textBgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-textBgLayer.position.y-textBgLayer.height/2);
    [currentLayer addSublayer:textBgLayer];
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, textBgLayer.width, textBgLayer.height) bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor];
    bgLayer.position = CGPointMake(textBgLayer.width/2, textBgLayer.height/2);
    [textBgLayer addSublayer:bgLayer];
    
    AVBasicLayer *topLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, kDefalutLineHeight) bgColor:[UIColor whiteColor].CGColor];
    topLineLayer.position = CGPointMake(textBgLayer.width/2, kDefalutLineHeight/2);
    [textBgLayer addSublayer:topLineLayer];
    AVBasicLayer *bottomLineLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, broadSize.width, kDefalutLineHeight) bgColor:[UIColor whiteColor].CGColor];
    bottomLineLayer.position = CGPointMake(textBgLayer.width/2, textBgLayer.height-kDefalutLineHeight/2);
    [textBgLayer addSublayer:bottomLineLayer];
    
    
    textBgLayer.mask = textBgLayer.maskLayer;
    CGPoint startPosition = CGPointMake(-(textBgLayer.width/2), textBgLayer.height/2);
    CGPoint nextPosition = CGPointMake(textBgLayer.width/2, textBgLayer.height/2);
    CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime fromValue:startPosition toValue:nextPosition];
    [textBgLayer.maskLayer addAnimation: moveAni forKey:@"moveAni"];
    
    
    bgLayer.mask = bgLayer.maskLayer;
    CGPoint start = CGPointMake(-(textBgLayer.width/2), textBgLayer.height/2);
    CGPoint next = CGPointMake(textBgLayer.width/2, textBgLayer.height/2);
    CABasicAnimation *Ani = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.4 withBeginTime:beginTime+0.3 fromValue:start toValue:next];
    [bgLayer.maskLayer addAnimation: Ani forKey:@"moveAni"];
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, textBgLayer.width-(2*15), textBgLayer.height-2*15) intText:text textFont:font textColor:[UIColor whiteColor]];
    textLayer.position = CGPointMake(textBgLayer.width/2, textBgLayer.height/2);
    [textBgLayer addSublayer:textLayer];
    [textLayer addAni:0.5 beginTime:beginTime+0.2 aniFactor:AVArtAniTextPlay];
}

- (void)BlurEffect{

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *coverLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight-100-30, kAVWindowWidth, 100) bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
    [currentLayer addSublayer:coverLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    UIFont *font = [UIFont systemFontOfSize:27];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, (coverLayer.bounds.size.width-2*15), (coverLayer.bounds.size.height-2*15)) intText:text textFont:font textColor:[UIColor whiteColor]];
    [textLayer configShadowColor:[[UIColor blackColor] colorWithAlphaComponent:1] shadowOpacity:1 shadowOffset:CGSizeMake((coverLayer.bounds.size.width-(2*15)), (coverLayer.bounds.size.height-(2*15)))];
    [coverLayer addSublayer:textLayer];
}

- (AVBasicLayer *)blurTextLayerWithCutWidth:(CGFloat)width
                    currentLayer:(AVBasicLayer *)rootLayer
                            text:(NSString *)text
                            font:(UIFont *)font
                        interval:(NSInteger)interval{

    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(width, MAXFLOAT) interval:15 isDefluatWidth:YES isDefaultHeight:NO];
    CGFloat broadHeight = ceil(broadSize.height);
    UIImage *renderImage = [self renderImageInLayer:rootLayer renderRect:CGRectMake(0,rootLayer.bounds.size.height-broadHeight, broadSize.width, broadHeight)];
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:renderImage filterType:AVImageFilterGaussianBlur blurRadius:10];
    
    AVBasicLayer *blurLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, rootLayer.bounds.size.height-broadHeight-30, broadSize.width, broadHeight) withImage:filterImage];
    return blurLayer;
}


- (AVBasicLayer *)blurBgTextLayerWithLayer:(CALayer *)rootLayer
                                       text:(NSString *)text
                                       font:(UIFont *)font
                                   interval:(NSInteger)interval
{
    
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(rootLayer.width, MAXFLOAT) interval:interval isDefluatWidth:YES isDefaultHeight:NO];
    CGFloat broadHeight = ceil(broadSize.height);
    UIImage *renderImage = [self renderImageInLayer:rootLayer renderRect:CGRectMake(0,rootLayer.bounds.size.height-broadHeight, broadSize.width, broadHeight)];
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:renderImage filterType:AVImageFilterGaussianBlur blurRadius:10];
    AVBasicLayer *blurLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, rootLayer.bounds.size.height-broadHeight-interval, broadSize.width, broadHeight) withImage:filterImage];
    return blurLayer;
}


- (AVBasicLayer *)blurTextLayerWithCutWidth:(CGFloat)width
                               currentLayer:(CALayer *)rootLayer
                                       text:(NSString *)text
                                       font:(UIFont *)font
                                   interval:(NSInteger)interval
                                outInterval:(NSInteger)outInterval
{
    
//    CGFloat radio = 400/kAVWindowWidth;
    
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(width, MAXFLOAT) interval:interval isDefluatWidth:YES isDefaultHeight:NO ];
    CGFloat broadHeight = ceil(broadSize.height);
    UIImage *renderImage = [self renderImageInLayer:rootLayer renderRect:CGRectMake(0,rootLayer.bounds.size.height-broadHeight, broadSize.width, broadHeight)];
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:renderImage filterType:AVImageFilterGaussianBlur blurRadius:10];
    
    AVBasicLayer *blurLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, rootLayer.bounds.size.height-broadHeight-outInterval, broadSize.width, broadHeight) withImage:filterImage];
    return blurLayer;
}


-(void)AVSceneTextStaticFresh
{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,600, 600) vContentRect: CGRectMake(0, 0,600, 600) withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];

    
    CGFloat radio = currentLayer.width/kAVWindowWidth;
    
    CGFloat offset = kDefalutInterval*radio;
    
    NSString *sceneDescString = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    
    UIFont *defultFont = [UIFont systemFontOfSize:kDefultFontValue*radio];
    
    AVBasicLayer *blurBgLayer = [self blurBgTextLayerWithLayer:currentLayer text:sceneDescString font:defultFont interval:offset];
    
    [currentLayer addSublayer:blurBgLayer];

    
    AVShapeBaseLayer *dotLineLayer = [[AVShapeBaseLayer alloc] initWithFrame:blurBgLayer.bounds
                                                                  bezierPath:[UIBezierPath squareShape:blurBgLayer.bounds] fillColor:[UIColor clearColor] strokeColor:UIColorFromRGB(0x008409) lineWidth:2];
    dotLineLayer.lineDashPattern = @[[NSNumber numberWithFloat:8],
                                     [NSNumber numberWithFloat:4]];
    [blurBgLayer addSublayer:dotLineLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, 0, (blurBgLayer.width-2*offset), (blurBgLayer.height-2*offset))
                                                                  intText:sceneDescString
                                                                 textFont:defultFont
                                                                textColor:UIColorFromRGB(0x008409)];

    textLayer.position = CGPointMake(blurBgLayer.width/2, (blurBgLayer.height/2)+ (kDefultFontValue*0.215));
    
    // [textLayer setValue:[NSNumber numberWithFloat:radio] forKeyPath:@"transform.scale"];
    
    [dotLineLayer addSublayer:textLayer];
    

}


- (void)testMove
{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    UIFont *font = [UIFont systemFontOfSize:27];
    
    AVBasicLayer *blurLayer = [self blurTextLayerWithCutWidth:kAVWindowWidth currentLayer:currentLayer text:text font:font interval:15];
    [currentLayer addSublayer:blurLayer];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, (blurLayer.bounds.size.width-2*15), (blurLayer.bounds.size.height-2*15)) intText:text textFont:font textColor:[UIColor whiteColor]];
    
    [blurLayer addSublayer:textLayer];
    
}

- (void)testBluer2
{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    UIFont *font = [UIFont systemFontOfSize:27];
    
    AVBasicLayer *blurLayer = [self blurTextLayerWithCutWidth:kAVWindowWidth currentLayer:currentLayer text:text font:font interval:15];
    [currentLayer addSublayer:blurLayer];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, (blurLayer.bounds.size.width-2*15), (blurLayer.bounds.size.height-2*15)) intText:text textFont:font textColor:[UIColor whiteColor]];
    
    [blurLayer addSublayer:textLayer];
    
}

- (void)testBluer
{
   CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
//    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
//    UIFont *font = [UIFont systemFontOfSize:27];
    
    CABlurLayer *blurLayer = [CABlurLayer layer];
    
    blurLayer.frame = CGRectMake(0,500,kAVWindowWidth, 100);
    blurLayer.duartionBlur = 0.0f;
    [currentLayer addSublayer:blurLayer];
    
    AVBottomLayer *blureLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0,500,kAVWindowWidth, 100)];
    CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blur setDefaults];
    blureLayer.backgroundFilters = [NSArray arrayWithObject:blur];
    
    [blurLayer addSublayer:blureLayer];
    
    CABasicAnimation *arcToFullAni = [[AVBasicRouteAnimate alloc] customBasic:2 withBeginTime:beginTime
                                                                    fromValue:@(0) toValue:@(1)
                                                                 propertyName:@"duartionBlur"];
    
    [blurLayer addAnimation:arcToFullAni forKey:@"sdfg"];


}

- (void)testDotLine{
    
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    UIFont *font = [UIFont systemFontOfSize:27];
    
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) interval:15 isDefluatWidth:YES isDefaultHeight:NO];
    CGFloat broadHeight = ceil(broadSize.height);
    
    UIImage *renderImage = [self renderImageInLayer:currentLayer renderRect:CGRectMake(0,kAVWindowHeight-broadHeight-30, broadSize.width, broadHeight)];
    
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:renderImage filterType:AVImageFilterGaussianBlur blurRadius:10];
    
    AVBasicLayer *blurLayer = [[AVBasicLayer alloc] initWithFrame: CGRectMake(0,kAVWindowHeight-broadHeight-30, broadSize.width, broadHeight)
                                                        withImage:filterImage];
    
    [currentLayer addSublayer:blurLayer];
    
    AVShapeBaseLayer *dotLineLayer = [[AVShapeBaseLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight-broadHeight-30, broadSize.width, broadHeight)
                                                                  bezierPath:[UIBezierPath squareShape:CGRectMake(0, 0, broadSize.width, broadHeight)] fillColor:[UIColor clearColor] strokeColor:UIColorFromRGB(0x008409) lineWidth:2];
    dotLineLayer.lineDashPattern = @[[NSNumber numberWithFloat:8],
                                     [NSNumber numberWithFloat:4]];
    [currentLayer addSublayer:dotLineLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, (broadSize.width-2*15), (broadHeight-2*15)) intText:text textFont:font textColor:UIColorFromRGB(0x008409)];
    [blurLayer addSublayer:textLayer];
    
}

- (void)testGradient{

    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"shu.png"]];
    [homeLayer addSublayer:currentLayer];
    UIFont *font = [UIFont systemFontOfSize:25];
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    CGSize broadSize = [text textBroadSizeWithFont:font maxSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) interval:15 isDefluatWidth:YES isDefaultHeight:NO] ;
    CGColorRef clearColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0].CGColor;
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    CGColorRef fristColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor;
    CGColorRef secondColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
    NSArray *rightColorList = @[(__bridge id)clearColor,
                                (__bridge id)secondColor,
                                (__bridge id)fristColor,
                                (__bridge id)whiteColor,
                                (__bridge id)fristColor,
                                (__bridge id)secondColor,
                                (__bridge id)clearColor];
    NSArray *rightLocationList = @[@(0.01),@(0.05f),@(0.16f),@(0.5f),@(0.84f),@(0.93f),@(0.99f)
                                   ];
    CAGradientLayer *gradiendLayer = [CAGradientLayer layer];
    gradiendLayer.frame = CGRectMake(0, kAVWindowHeight-broadSize.height-20, kAVWindowWidth, broadSize.height);
    gradiendLayer.colors = rightColorList;
    gradiendLayer.locations = rightLocationList;
    gradiendLayer.startPoint = CGPointMake(0, 0.5);
    gradiendLayer.endPoint = CGPointMake(1, 0.5);
    [currentLayer addSublayer:gradiendLayer];

    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, kAVWindowWidth-30, broadSize.height-30) intText:text textFont:font textColor:[UIColor blackColor]];
    [gradiendLayer addSublayer:textLayer];
}

- (void)testGradientLayer{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow vContentRect:kAVRectWindow withImage:[UIImage imageNamed:@"1"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBasicLayer *coverLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor];
    [currentLayer addSublayer:coverLayer];
    
    NSString *text = @"是觉得试剂瓶谁家婆紧迫接生婆瑟吉欧DPS建瓯盘谁家婆紧迫";
    UIFont *font = [UIFont systemFontOfSize:27];
    AVBasicLayer *blurLayer = [self blurTextLayerWithCutWidth:kAVWindowWidth currentLayer:currentLayer text:text font:font interval:15];
    AVBasicLayer *topLineLayer = [self topLineLayerWithRect:CGRectMake(0, 0, kAVWindowWidth, 16)];
    AVBasicLayer *bottomLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight-((blurLayer.height+topLineLayer.height)/2), kAVWindowWidth, blurLayer.height+topLineLayer.height)];
    CGRect frame = blurLayer.frame;
    frame.origin.y = topLineLayer.height/2;
    blurLayer.frame = frame;
    [bottomLayer addSublayer:blurLayer];
    [bottomLayer addSublayer:topLineLayer];
    bottomLayer.anchorPoint = CGPointMake(0.5, 1);
    [currentLayer addSublayer:bottomLayer];
    NSArray *boundKeyTime = @[
                            [NSNumber numberWithFloat:0],
                            [NSNumber numberWithFloat:0.1],
                            [NSNumber numberWithFloat:0.9],
                            [NSNumber numberWithFloat:1],
                            ];

    NSArray *boundValues = @[
                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,blurLayer.height)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,blurLayer.height)],
                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,0)],
                           ];

    CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:4
                                                                 withBeginTime:beginTime+0.7                                                                  propertyName:kAVBasicAniBounds
                                                                        values:boundValues keyTimes:boundKeyTime];
  
  [bottomLayer addAnimation: boundsAni forKey:@"boundsAni"];
    
    AVBasicLayer *textBgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, kAVWindowHeight-blurLayer.height/2, blurLayer.width, blurLayer.height)];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(15, 20, (blurLayer.width-2*15), (blurLayer.height-2*15)) intText:text textFont:font textColor:[UIColor whiteColor]];
    [textLayer configShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.5] shadowOpacity:1 shadowOffset:CGSizeMake((blurLayer.width-2*15), (blurLayer.height-2*15))];
    textBgLayer.anchorPoint = CGPointMake(0.5, 1);
    [textBgLayer addSublayer:textLayer];
    [currentLayer addSublayer:textBgLayer];
    NSArray *textBoundKeyTime = @[
                              [NSNumber numberWithFloat:0],
                              [NSNumber numberWithFloat:0.1],
                              [NSNumber numberWithFloat:0.9],
                              [NSNumber numberWithFloat:1],
                              ];
    
    NSArray *textBoundValues = @[
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,blurLayer.height)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,blurLayer.height)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,0)],
                             ];
    
    CAKeyframeAnimation *textBoundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:4
                                                                   withBeginTime:beginTime+0.5                                                                  propertyName:kAVBasicAniBounds
                                                                          values:textBoundValues keyTimes:textBoundKeyTime];
    
    [textBgLayer addAnimation: textBoundsAni forKey:@"boundsAni"];

}

- (AVBasicLayer *)topLineLayerWithRect:(CGRect)rect{

    AVBasicLayer *topLineLayer = [[AVBasicLayer alloc] initWithFrame:rect];
    AVBasicLayer *flowerLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake((rect.size.width-32)/2, (rect.size.height-13)/2, 32, 13) withImage:[UIImage imageNamed:@"flower@2x.png"]];
    [topLineLayer addSublayer:flowerLayer];
    
    NSArray *leftColorList = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor];
    NSArray *leftLocationList = @[[NSNumber numberWithFloat:0.0],
                              [NSNumber numberWithFloat:0.18],
                              [NSNumber numberWithFloat:1.0]];
    AVBasicGradientLayer *leftGradiend = [[AVBasicGradientLayer alloc] initWithFrame:CGRectMake(0, (rect.size.height-1)/2, rect.size.width/2-20, 1) colorsList:leftColorList locationList:leftLocationList startPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1, 0.5)];
    [topLineLayer addSublayer:leftGradiend];
    
    NSArray *rightColorList = @[(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[UIColor clearColor].CGColor];
    NSArray *rightLocationList = @[
//                              [NSNumber numberWithFloat:0.0],
                              [NSNumber numberWithFloat:0.82],
                              [NSNumber numberWithFloat:1.0]];
    AVBasicGradientLayer *rightGradiend = [[AVBasicGradientLayer alloc] initWithFrame:CGRectMake(rect.size.width/2+20, (rect.size.height-1)/2, rect.size.width/2-20, 1) colorsList:rightColorList locationList:rightLocationList startPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1, 0.5)];
    
    [topLineLayer addSublayer:rightGradiend];
    
    return topLineLayer;
}

- (UIImage *)renderImageInLayer:(CALayer *)bgLayer renderRect:(CGRect)renderRect
{
    UIGraphicsBeginImageContext(renderRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // center image
    CGContextTranslateCTM(context,0, -renderRect.origin.y);
    [bgLayer renderInContext:context];

    UIImage *renderImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return renderImage;
}

- (void)roraionAndRadio
{
    CALayer *photoLayer = [self horizontalSizeShow2];
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame: homeLayer.bounds withImage:nil];
    
    
    [bgLayer.contentLayer addSublayer:photoLayer ];
    //bgLayer.contentLayer = photoImage;
    
    [homeLayer addSublayer: bgLayer];
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    CGRect startArea = kAVRectWindow;
    
    CGRect endArea =  kCGRectInArea(startArea, 100, 50);
    
    CAAnimationGroup *allAni = [[AVSceneAnimateCamera alloc] cameraMoveAnglePath:7 withBeginTime:beginTime startArea:startArea startAngle:130 endArea:endArea endAngle:60 windowArea:kAVRectWindow];
    
  //  [bgLayer.contentLayer addAnimation: allAni forKey:@"sale"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)squareSizeShow
{
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame: homeLayer.bounds];
    
    [homeLayer addSublayer: bgLayer];
    
    AVBasicLayer *birdLayer2 = [self itemLayer: [UIImage imageNamed:@"1"]
                                       postion:CGPointMake(460, 120)
                                         angle:20  isRect:NO];
    [bgLayer addSublayer: birdLayer2];
    
    AVBasicLayer *birdLayer1 = [self itemLayer: [UIImage imageNamed:@"0"]
                                       postion:CGPointMake(150, 100)
                                         angle:-16 isRect:NO];
    [bgLayer addSublayer: birdLayer1];
    
    
    AVBasicLayer *birdLayer3 = [self itemLayer: [UIImage imageNamed:@"2"]
                                       postion:CGPointMake(140, 480)
                                         angle:10 isRect:NO];
    [bgLayer addSublayer: birdLayer3];
    
    
    
    AVBasicLayer *birdLayer4 = [self itemLayer: [UIImage imageNamed:@"3"]
                                       postion:CGPointMake(480, 480)
                                         angle:-20 isRect:NO];
    [bgLayer addSublayer: birdLayer4];
    
    
    UIImage *filterImage = [UIImage imageNamed:@"0"];
    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(100, 100, 400, 400) borderColor:[UIColor whiteColor] borderWith:kBorderWith withImage:filterImage];
    
    [bgLayer addSublayer:photoLayer];
    
    
    AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-kAVCeilfY(50), -kAVCeilfY(50), kAVCeilfY(700), kAVCeilfY(700)) withImage:[UIImage imageNamed:@"memoriesMask"]];
    [bgLayer addSublayer: maskLayer];
    
    
//    UIGraphicsBeginImageContext(bgLayer.bounds.size);
//
//    [bgLayer renderInContext:UIGraphicsGetCurrentContext()];
//
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//
//    UIGraphicsEndImageContext();
//
//    self.testImageView.image = image;
}

- (CALayer *)horizontalSizeShow2
{
    CALayer *bgLayer = [[CALayer alloc] init];
    bgLayer.frame = kAVRectWindow;
 //   bgLayer.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4].CGColor;
    
    bgLayer.masksToBounds =YES;
    
    [homeLayer addSublayer: bgLayer];
    
    AVBasicLayer *birdLayer2 = [self itemLayer: [UIImage imageNamed:@"1"]
                                       postion:CGPointMake(kAVCeilfX(450), kAVCeilfY(90))
                                         angle:18 isRect:YES];
    [bgLayer addSublayer: birdLayer2];

    AVBasicLayer *birdLayer1 = [self itemLayer: [UIImage imageNamed:@"0"]
                                       postion:CGPointMake(kAVCeilfY(235), kAVCeilfY(100))
                                         angle:-16 isRect:YES];
    [bgLayer addSublayer: birdLayer1];
    

    AVBasicLayer *birdLayer3 = [self itemLayer: [UIImage imageNamed:@"2"]
                                       postion:CGPointMake(kAVCeilfX(150), kAVCeilfY(480))
                                         angle:-10 isRect:YES];
    [bgLayer addSublayer: birdLayer3];
    
    

    AVBasicLayer *birdLayer4 = [self itemLayer: [UIImage imageNamed:@"3"]
                                       postion:CGPointMake(kAVCeilfX(485), kAVCeilfY(500))
                                         angle:-20 isRect:YES];
    [bgLayer addSublayer: birdLayer4];


    UIImage *filterImage = [UIImage imageNamed:@"shu"];
    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth -kAVCeilfY(700))/2, (kAVWindowHeight -kAVCeilfY(460))/2, kAVCeilfY(700), kAVCeilfY(460)) borderColor:[UIColor whiteColor] borderWith:kBorderWith withImage:filterImage];
    
  //  AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake((kAVWindowWidth -kAVCeilfY(374))/2, (kAVWindowHeight -kAVCeilfY(560))/2, kAVCeilfY(374), kAVCeilfY(560)) borderColor:[UIColor whiteColor] borderWith:kBorderWith withImage:filterImage];
    
   // [photoLayer setValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(5)] forKeyPath:@"transform.rotation.z"];
    
    photoLayer.contentLayer.allowsEdgeAntialiasing = YES;
    photoLayer.allowsEdgeAntialiasing = YES;
    
    [bgLayer addSublayer:photoLayer];
    
    AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-kAVCeilfX(50), -kAVCeilfY(50), kAVCeilfX(700), kAVCeilfY(700)) withImage:[UIImage imageNamed:@"1080pmaster"]];
   // [bgLayer addSublayer: maskLayer];

    return bgLayer;
    
}


/*
- (CALayer *)horizontalSizeShow
{
    CALayer *bgLayer = [[CALayer alloc] init];
    bgLayer.frame = kAVRectWindow;
    
    AVBasicLayer *birdLayer2 = [self itemLayer: [UIImage imageNamed:@"1"]
                                       postion:CGPointMake(kAVCeilfY(460), kAVCeilfY(120))
                                         angle:28];
    [bgLayer addSublayer: birdLayer2];
    
    AVBasicLayer *birdLayer1 = [self itemLayer: [UIImage imageNamed:@"0"]
                                       postion:CGPointMake(kAVCeilfY(150), kAVCeilfY(100))
                                         angle:-16];
    [bgLayer addSublayer: birdLayer1];
    
    
    AVBasicLayer *birdLayer3 = [self itemLayer: [UIImage imageNamed:@"2"]
                                       postion:CGPointMake(kAVCeilfY(140), kAVCeilfY(480))
                                         angle:10];
    [bgLayer addSublayer: birdLayer3];
    
    
    
    AVBasicLayer *birdLayer4 = [self itemLayer: [UIImage imageNamed:@"3"]
                                       postion:CGPointMake(kAVCeilfY(480), kAVCeilfY(480))
                                         angle:-20];
    [bgLayer addSublayer: birdLayer4];
    
    
    UIImage *filterImage = [UIImage imageNamed:@"heng3"];
    AVBasicLayer *photoLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(kAVCeilfX(50), kAVCeilfY(100), kAVCeilfX(500), kAVCeilfY(400)) borderColor:[UIColor whiteColor] borderWith:kBorderWith withImage:filterImage];
    
    photoLayer.contentLayer.allowsEdgeAntialiasing = YES;
    photoLayer.allowsEdgeAntialiasing = YES;
    
    [bgLayer addSublayer:photoLayer];
    
    AVBottomLayer *maskLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(-kAVCeilfX(50), -kAVCeilfY(50), kAVCeilfX(700), kAVCeilfY(700)) withImage:[UIImage imageNamed:@"memoriesMask"]];
    [bgLayer addSublayer: maskLayer];

    
    return bgLayer;
    
}*/

-(AVBasicLayer *)itemLayer:(UIImage *)contendImage postion:(CGPoint)postion angle:(CGFloat)angle isRect:(BOOL)isRect
{
    UIImage *filterImage = [[AVFilterPhoto alloc] filterGPUImage:contendImage filterType:AVImageFilterBlackWhite];
    
    
    CGRect rect =isRect? CGRectMake(0, 0, kAVCeilfY(600), kAVCeilfY(450)):CGRectMake(0, 0, kAVCeilfY(400), kAVCeilfY(400));
    
    AVBasicLayer *fristLayer = [[AVBasicLayer alloc] initWithFrame:rect borderColor:[UIColor whiteColor] borderWith:kBorderWith withImage:filterImage];
    fristLayer.position = postion;
    
    fristLayer.contentLayer.allowsEdgeAntialiasing = YES;
    fristLayer.allowsEdgeAntialiasing = YES;
    
    [fristLayer setValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(angle)] forKeyPath:@"transform.rotation.z"];
    
    return fristLayer;
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
