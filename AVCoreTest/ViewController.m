//
//  ViewController.m
//  AVCoreTest
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "ViewController.h"

#import "AVFundation.h"
#import "GifAnimationLayer.h"

#import "HotBasicAnimate.h"

#import "AVMediaComposionCommand.h"

#import "JNWSpringAnimation.h"

#import "AVPlayTextLayer.h"

#import <CoreText/CoreText.h>


#define AVLineWith           kAVCeilfY(5)

#define kLineMoveSize   kAVCeilfY(2)

#define kRectangleRadio(x)    (x*0.625)


#define KCameraPathStartArea    @"StartArea"

#define KCameraPathEndArea      @"EndArea"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    homeLayer.backgroundColor = [UIColor yellowColor].CGColor;
 //   [self oneFaceMoveEaseOut];
    
    //[self testGIF];
    
    [self performSelector:@selector(testCompVideo) withObject:nil afterDelay:1];

  //  [self bottomWuZiLeftRightMove];

    
//    [self maskBrothTransim];
    
  //  [self maskVeMaskClothCenterToBothSides];
    
    //[self playListGit];
    
   // [self moveluMerrry];

    //[self testColorText22];
    
    
   //  [self testColorText];
    
   // [self testLlayer];
    
  //  [self AVTSmoothLineSlashToBothSide];
    
    //[self camreaPath];
}

-(void)camreaPath
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 6;
    
    UIImage *shuImage =[UIImage imageNamed:@"q1"];//gril
    
    FaceDetectDTO *faceDTO = [[FaceDetectManager sharedFaceDetectManager] faceDetect:shuImage windowRect:kAVRectWindow];
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:faceDTO.contendRect
                                                           withImage:shuImage];
    
    currentLayer.contentLayer.contentsGravity = kCAGravityResizeAspectFill;
    
    [homeLayer addSublayer: currentLayer];
    currentLayer.backgroundColor =[UIColor blackColor].CGColor;
    
    CGRect endArt = CGRectZero;
    
    NSLog(@"faceDTO.faceCount= %ld", (long)faceDTO.faceCount);
    if (faceDTO.faceCount>0) {
        endArt = [AVRectUnit rectFromCenterByFaceAwareStruct:faceDTO.faceAwareStruct
                                               oneFaceStruct:faceDTO.faceStruct1];
    }else{
        endArt = [AVRectUnit rectFromCenterByNoAwareStruct:faceDTO.contendRect];
        
    }
    
    CAAnimationGroup *cameraMoveAni = [[AVSceneAnimateCamera defaultInstance] cameraMovePath:duration withBeginTime:beginTime startArea:endArt endArea: kAVRectWindow windowArea:kAVRectWindow];
    
    [currentLayer.contentLayer addAnimation:cameraMoveAni forKey:@"cameraMoveAni"];
    
}

-(void)AVTSmoothLineSlashToBothSide
{
    
    CGFloat offsetValue = kAVWindowWidth*3/2;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
   // CGFloat duration = 1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"shu.png"]];
    
    currentLayer.contentLayer.contentsGravity = kCAGravityResizeAspect;
    currentLayer.backgroundColor = [UIColor blackColor].CGColor;
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    nextLayer.contentLayer.contentsGravity = kCAGravityResizeAspect;
    nextLayer.backgroundColor = [UIColor blackColor].CGColor;
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
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  kAVCeilfY(kRectangleRadio(320)), kAVWindowHeight+(offsetValue*2))],
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  kAVCeilfY(kRectangleRadio(320)), kAVWindowHeight+(offsetValue*2))],
                              
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



-(void)WowWow
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
}

-(void)testLlayer
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat moveduration = 0.6;
    
    CGFloat showDuration = 0.4;
    
    AVBottomLayer *bgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 10, kAVWindowWidth, 300)
                                                          bgColor:[UIColor clearColor].CGColor];
    
    [homeLayer addSublayer: bgLayer];
    
    AVBottomLayer *moveBGLayer = [[AVBottomLayer alloc] initWithFrame:bgLayer.bounds
                                                              bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor];
    moveBGLayer.masksToBounds = YES;
    
    [bgLayer addSublayer: moveBGLayer];
    //moveBg
    {
        NSArray *moveBGLayerNoundsKeyTime = @[
                                   [NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:1],
                                   ];
        NSArray *moveBGLayerBoundCenterValues = @[
                                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,  0)],
                                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,  bgLayer.size.height)],
                                           ];
        
        CAKeyframeAnimation *moveBGLayerBoundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveduration withBeginTime:beginTime+showDuration propertyName:kAVBasicAniBounds values:moveBGLayerBoundCenterValues keyTimes:moveBGLayerNoundsKeyTime];
        
        [moveBGLayer addAnimation:moveBGLayerBoundsAni forKey:@"moveBGLayerBoundsAni"];
    }
    
    AVBottomLayer  *topLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0, kAVWindowWidth, kLineMoveSize)
                                                                bgColor:[UIColor whiteColor].CGColor];
    topLineLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2);
    //top line
    {
        
        [bgLayer addSublayer: topLineLayer];
        
        NSArray *boundsKeyTime = @[
                                   [NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.2],
                                   [NSNumber numberWithFloat:1],
                                   ];
        NSArray *lastBoundCenterValues = @[
                                           [NSValue valueWithCGRect:CGRectMake(0, 0, 0,  kLineMoveSize)],
                                           [NSValue valueWithCGRect:CGRectMake(0, 0, kLineMoveSize,  kLineMoveSize)],
                                           [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,  kLineMoveSize)],
                                           ];
        
        CAKeyframeAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customKeyframe:showDuration withBeginTime:0 propertyName:kAVBasicAniBounds values:lastBoundCenterValues keyTimes:boundsKeyTime];

        CABasicAnimation *topLineCenterAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                           withBeginTime:showDuration
                                                                               fromValue:CGPointMake(topLineLayer.position.x, bgLayer.height/2)
                                                                                 toValue:CGPointMake(topLineLayer.position.x, 0)];
        
        CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate alloc] groupAni:showDuration+moveduration withBeginTime:beginTime aniArr: @[boundsAni, topLineCenterAni]];
        
        [topLineLayer addAnimation:animationGroup forKey:@"animationGroup"];
    }
    
    //second line
    {
        AVBottomLayer  *bottomLineLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0, kAVWindowWidth, kLineMoveSize)
                                                                    bgColor:[UIColor whiteColor].CGColor];
        bottomLineLayer.position = CGPointMake(bgLayer.width/2, bgLayer.height/2);

        [bgLayer addSublayer: bottomLineLayer];

        bottomLineLayer.opacity =0.0f;
        CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate alloc] opacityOpen:showDuration isAnimate:NO];

        CABasicAnimation *bottomLineCenterAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                           withBeginTime:showDuration
                                                                               fromValue:CGPointMake(topLineLayer.position.x, bgLayer.height/2)
                                                                                 toValue:CGPointMake(topLineLayer.position.x, bgLayer.height)];

        CAAnimationGroup *botomAnimationGroup = [[AVBasicRouteAnimate alloc] groupAni:showDuration+moveduration withBeginTime:beginTime aniArr: @[opacityOpen, bottomLineCenterAni]];

        [bottomLineLayer addAnimation:botomAnimationGroup forKey:@"animationGroup"];
    }
    
    //text
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, (moveBGLayer.height-60)/2 ,bgLayer.width, 60)
                                                                intText:@"我有一个日本朋友在学中文"
                                                               textFont:[UIFont systemFontOfSize:30]
                                                              textColor:[UIColor whiteColor]];
    [moveBGLayer addSublayer: textLayer];
}

-(CGSize)boundingRectWithSize:(CGSize)size
                    textColor:(UIColor *)textColor
                     textFont:(UIFont *)textFont
                         text:(NSString *)text
                 isEqualWidth:(BOOL)isEqualWidth
                isEqualHeight:(BOOL)isEqualHeight
{
    if (textColor && textFont && text){
        
        
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
      //  paragraphStyle.lineSpacing = 1.0;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        
        NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,NSParagraphStyleAttributeName
                                     ,textFont,NSFontAttributeName,
                                     textColor,NSForegroundColorAttributeName, nil];
        
                attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
        
        CGSize newSize = [attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        
        newSize.height = [self heightByWidth:size.width]; //ceilf(newSize.height);
        
        CGFloat retureWidth = isEqualWidth?size.width : ceilf(newSize.width);
        
        //CGFloat retureHeight = ceilf(newSize.height + kAVTextRadio(textFont.pointSize));
        
        return CGSizeMake(retureWidth, newSize.height);
        
    }else{
        
        return size;
    }
    
}


- (CGFloat)heightByWidth:(CGFloat)width {
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CGSize targetSize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [attributedString length]), NULL, targetSize, NULL);
    CFRelease(framesetter);
    return fitSize.height;
}

-(void)testColorText22
{
    
    
    
    
    
    
    NSString *text = @"付了25块都不能制作，闪退n次，还有根本合成视频操作不了，骗钱，把我的钱退给我 15067890617 我有一";

    
    CGSize newSize = [self boundingRectWithSize:CGSizeMake(600, 600)
                                      textColor:[UIColor whiteColor]
                                       textFont:[UIFont fontWithName:@"PingFangSC-Regular" size:40.0]
                                           text:text
                                   isEqualWidth:NO
                                  isEqualHeight:NO];
    
    
    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc]  initWithFrame: CGRectMake( 0, 100, newSize.width, newSize.height)
                                                     attributeStringText:attributedString];
    
    
    [homeLayer addSublayer: textLayer];
    
    textLayer.backgroundColor = [UIColor redColor].CGColor;
    
}


-(void)testColorText
{
    NSString *text = @"我有一个日本朋友在学中文";
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary * attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,
                                    NSParagraphStyleAttributeName,[UIFont fontWithName:@"Helvetica-Bold" size:30.0],NSFontAttributeName,
                                    [UIColor purpleColor],NSForegroundColorAttributeName, nil];

    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributesDic];
    
    CGRect labelRect = [attributedString boundingRectWithSize:homeLayer.bounds.size
                                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];

    AVPlayTextLayer *textLayer = [[AVPlayTextLayer alloc]  initWithFrame: CGRectMake( 0, 100, homeLayer.size.width, ceilf(labelRect.size.height+30)) attributeStringText:attributedString];

    
    [homeLayer addSublayer: textLayer];
    
}


//wuzi
-(void)bottomWuZiLeftRightMove
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
//    
//    NSArray *keyTime = @[
//                         [NSNumber numberWithFloat:0],
//                         
//                         [NSNumber numberWithFloat:1],
//                         ];
//    
//    NSArray *centerValues = @[
//                              [NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight-gitHight)],
//                              
//                              [NSValue valueWithCGPoint:CGPointMake(-400, kAVWindowHeight-gitHight)],
//                              ];
//    
//    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:beginTime propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
//    
//    
//    [currentLayer addAnimation: leftRightMoveAni forKey:@"leftRightMoveAni"];
//    
    
    // add  git
    
    CGFloat gitHight = 114;
    
    AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 1000, gitHight)
                                                       withImage:[UIImage imageNamed:@"wazi"]];
    
    [currentLayer addSublayer: gitLayer];
    
     gitLayer.anchorPoint = CGPointMake(0.0, 0.0);

    
    CGPoint startCenterPoint = CGPointMake(0, kAVWindowHeight);
    
    CGPoint endCenterPoint =CGPointMake(0,kAVWindowHeight-gitHight);
    
    
    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:1
                                                                               withBeginTime:0
                                                                                   fromValue:startCenterPoint
                                                                                     toValue:endCenterPoint
                                                                                        mass:10];
    
    moveCenter1.fillMode=kCAFillModeBackwards;
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],

                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight-gitHight)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(-400, kAVWindowHeight-gitHight)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:4 withBeginTime:moveCenter1.duration propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,leftRightMoveAni]];
    
    
    [gitLayer addAnimation:animationGroup forKey:@"moveCenter1"];
}


//tudi
-(void)bottomtudiZiLeftRightMove
{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    // add  git
    
    CGFloat gitHight = 114;
    
    AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 1000, gitHight)
                                                       withImage:[UIImage imageNamed:@"wazi"]];
    
    [currentLayer addSublayer: gitLayer];
    
    gitLayer.anchorPoint = CGPointMake(0.0, 0.0);
    
    
    CGPoint startCenterPoint = CGPointMake(0, kAVWindowHeight);
    
    CGPoint endCenterPoint =CGPointMake(0,kAVWindowHeight-gitHight);
    
    
    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance]springCenterAni:1
                                                                               withBeginTime:0
                                                                                   fromValue:startCenterPoint
                                                                                     toValue:endCenterPoint
                                                                                        mass:10];
    
    moveCenter1.fillMode=kCAFillModeBackwards;
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.5],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:CGPointMake(0, kAVWindowHeight-gitHight)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(-200, kAVWindowHeight-gitHight)],
                              
                              [NSValue valueWithCGPoint:CGPointMake(-400, kAVWindowHeight-gitHight)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:4 withBeginTime:moveCenter1.duration propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    
    leftRightMoveAni.fillMode=kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,leftRightMoveAni]];
    
    
    [gitLayer addAnimation:animationGroup forKey:@"moveCenter1"];
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


-(void)maskVeMaskClothCenterToBothSides
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 6;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    
    
    AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                       withImage:[UIImage imageNamed:@"git1.jpg"]];
    
    [homeLayer addSublayer: gitLayer];

    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    [gitLayer addSublayer: nextLayer];
    
    nextLayer.mask = nextLayer.maskLayer;

    CGPoint startCenterPoint = CGPointMake(kAVWindowWidth+kAVWindowCenter.x, kAVWindowCenter.y);
    
    CGPoint endCenterPoint =kAVWindowCenter;
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.6 withBeginTime:beginTime fromValue:startCenterPoint toValue:endCenterPoint];
    
    moveCenter1.timingFunction = [CAMediaTimingFunction easeOutBack];
    
    [gitLayer addAnimation:moveCenter1 forKey:@"moveCenter1"];
    
    
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         
                         [NSNumber numberWithFloat:0.3],
                          [NSNumber numberWithFloat:0.4],
                         
                         [NSNumber numberWithFloat:0.7],
                         [NSNumber numberWithFloat:0.9],

                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGRect:CGRectMake(0, 0,  0, kAVWindowHeight)],
                              
                              [NSValue valueWithCGRect:CGRectMake(0, 0,100,kAVWindowHeight)],
                              [NSValue valueWithCGRect:CGRectMake(0, 0, 80,kAVWindowHeight)],
                              
                               [NSValue valueWithCGRect:CGRectMake(0, 0, 380,kAVWindowHeight)],
                               [NSValue valueWithCGRect:CGRectMake(0, 0, 350,kAVWindowHeight)],
                              
                               [NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,kAVWindowHeight)],
                              ];
    
    CAKeyframeAnimation *leftRightMoveAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:5 withBeginTime:beginTime+1.0 propertyName:kAVBasicAniBounds values:centerValues keyTimes:keyTime];
    
     leftRightMoveAni.timingFunction = [CAMediaTimingFunction easeOutBack];

    [nextLayer.maskLayer addAnimation:leftRightMoveAni forKey:@"bounrdsSpringAni"];
    
}

-(void)moveluMerrry
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 3;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, 400, 180)
                                                       withImage:[UIImage imageNamed:@"LuMerry"]];
    
    [homeLayer addSublayer: gitLayer];
    gitLayer.anchorPoint = CGPointMake(0.0, 0.0);
    
    CGPoint startCenterPoint = CGPointMake(kAVWindowWidth, kAVWindowWidth-100);
    
    CGPoint endCenterPoint =CGPointMake(-400, 300);
    
    CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startCenterPoint toValue:endCenterPoint];
    
    moveCenter1.timingFunction = [CAMediaTimingFunction easeInOutCirc];
    
    [gitLayer addAnimation:moveCenter1 forKey:@"moveCenter1"];
}



-(void)playListGit
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
//    CGFloat duration = 2.5;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    NSArray *gitImageList = @[
                            [UIImage imageNamed:@"smGit1"],
                             [UIImage imageNamed:@"smGit2"],
                             [UIImage imageNamed:@"smGit3"],
                             [UIImage imageNamed:@"smGit4"],
                             [UIImage imageNamed:@"smGit5"],
                             [UIImage imageNamed:@"smGit6"],
                            ];
    
    CGFloat gitSize = 150;
    
    
    for (NSInteger index= 0; index< [gitImageList count]; index++) {
        
        AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, gitSize, gitSize)
                                                           withImage:gitImageList[index]];
        
        gitLayer.position = CGPointMake(kAVWindowCenter.x, kAVWindowHeight-gitSize+30);
        
        [currentLayer addSublayer: gitLayer];
        
        CAKeyframeAnimation *opacityOpenClose = [[AVBasicRouteAnimate defaultInstance] opacityOpenClose:0.4 withBeginTime:beginTime+(index*0.6)+0.3 isAnimate:NO];

        [gitLayer addAnimation:opacityOpenClose forKey:@"opacityOpenClose"];
    }
    
}


//-(void)playListSpringGit
//{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
//    
//    CGFloat duration = 2.5;
//    
//    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
//                                                        vContentRect:kAVRectWindow
//                                                           withImage:[UIImage imageNamed:@"0.png"]];
//    
//    [homeLayer addSublayer: currentLayer];
//    
//    NSArray *gitImageList = @[
//                              [UIImage imageNamed:@"0"],
//                              [UIImage imageNamed:@"1"],
//                              [UIImage imageNamed:@"2"],
//                              [UIImage imageNamed:@"3"],
//                              ];
//    
//    CGFloat gitSize = 150;
//    
//    for (NSInteger index= 0; index< [gitImageList count]; index++) {
//        
//        AVBasicLayer *gitLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake((index*100)+30, 300, gitSize, gitSize)
//                                                           withImage:gitImageList[index]];
//
//        
//        [currentLayer addSublayer: gitLayer];
//        
//        bounrdsSpringAni.mass = 8;
//        
//        
//        CAKeyframeAnimation *opacityOpenClose = [[AVBasicRouteAnimate defaultInstance] opacityOpenClose:0.5 withBeginTime:beginTime+(index*0.6)+0.3 isAnimate:NO];
//        
//        [gitLayer addAnimation:opacityOpenClose forKey:@"opacityOpenClose"];
//    }
//    
//}

-(void)testCompVideo
{

        [self testAVMusicPlayAtTimeView];
    
        [self performSelector:@selector(exportVideo) withObject:nil afterDelay:2];
    

}

-(void)testAVMusicPlayAtTimeView
{
    //
    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
    //
    self.avPlayer = [[AVPreEnginePlayer alloc] initWithFrame:homeLayer.bounds witchMusic: [NSURL fileURLWithPath:MP3URL]];
    
    [self.view addSubview : self.avPlayer];
    
    CGFloat scaleValue = kDeviceWidth/kAVWindowWidth;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
    
    self.avPlayer.transform = transform;
    
    self.avPlayer.center =  CGPointMake(kDeviceWidth/2, kDeviceWidth/2);

    
    
    //增加 视频 播放的地方
    NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"797" ofType:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:videoURL]];

    // Create and configure AVPlayerLayer
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame= homeLayer.bounds;
   // playerLayer.readyForDisplay = YES;
    [self.avPlayer.animateLayer addSublayer:playerLayer];
    
    [playerLayer player];
    
//    for (NSInteger index= 0; index < 4; index++) {
//
//        CALayer *imageLayer1 = [CALayer layer];
//        imageLayer1.frame =CGRectMake(0, 0, 1080, 1080);
//
//        [self.avPlayer.animateLayer addSublayer:imageLayer1];
//
//        NSString  *imageName = [NSString stringWithFormat:@"%ld.png", index];
//
//        imageLayer1.contents = (id)[[UIImage imageNamed:imageName] CGImage];
//
//        imageLayer1.contentsGravity=kCAGravityResizeAspectFill;
//
//        CFTimeInterval locationTime = [self.avPlayer.animateLayer convertTime:CACurrentMediaTime() fromLayer:self.avPlayer.layer] ;
//
//        CABasicAnimation *opacityInAnimation = [HotBasicAnimate moveYAnimation:1.0 withBeginTime:(1.0*(3-index)) + locationTime
//                                                                         frome:30 to:600];
//
//        [imageLayer1 addAnimation:opacityInAnimation forKey:@"opacityShowAndCloseAni"];
//
//
//    }

    [self.avPlayer playNewAtTime:0 totalTime:6];

}



-(void)testGIF
{
    UIImage *tempImage = [UIImage imageNamed:@"meinv2.png"];
    
//    CGFloat duration  = 3;
//    
//    CGFloat beginTime= kSceneBTime(homeLayer,1);
    
    
    FaceDetectDTO *tempDTO = [[FaceDetectManager sharedFaceDetectManager] faceDetect:tempImage windowRect:kAVRectWindow];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:tempDTO.contendRect
                                                        withImage:tempImage];
    
    [homeLayer addSublayer: nextLayer];
    
    NSString *musicFilePath = [[NSBundle mainBundle] pathForResource:@"logoGif" ofType:@"gif"];
    
   // NSURL *musicURL = [NSURL fileURLWithPath:musicFilePath];
    
    GifAnimationLayer *gitKateer  = [GifAnimationLayer layerWithGifFilePath:musicFilePath];
    
    gitKateer.frame =  CGRectMake(40, 40, 60, 60);
    
   // [gitKateer startAnimating];
    
    [nextLayer addSublayer: gitKateer];
}

-(void)oneFaceMoveEaseOut
{

    UIImage *tempImage = [UIImage imageNamed:@"0.png"];

    
    CGRect testRect = CGRectMake(100, 100, 200, 200);
    
//    CGRect endRect  = CGRectInset(testRect, -(100/2), -(100/2));
    
    
    
    //UIImage *tempImage = [UIImage imageNamed:@"3.png"];
    
    CGFloat duration  = 3;
    
    CGFloat beginTime= kSceneBTime(homeLayer,1);
    
    
    FaceDetectDTO *tempDTO = [[FaceDetectManager sharedFaceDetectManager] faceDetect:tempImage windowRect:kAVRectWindow];
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:tempDTO.contendRect
                                                        withImage:tempImage];
    
    [homeLayer addSublayer: nextLayer];
    
    NSArray *scaleValues = @[
                             [NSNumber numberWithFloat:tempDTO.faceAwareStruct.windowsRadio],
                             [NSNumber numberWithFloat:tempDTO.faceStruct1.windowsRadio-0.1],
                             [NSNumber numberWithFloat:tempDTO.faceStruct1.windowsRadio],
                            // [NSNumber numberWithFloat:tempDTO.totalFaceStruct.windowsRadio],

                             
                             ];
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:0.40],
                        // [NSNumber numberWithFloat:0.70],

                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *centerValues = @[
                              [NSValue valueWithCGPoint:tempDTO.faceAwareStruct.windowsCenter],
                              [NSValue valueWithCGPoint:tempDTO.faceStruct1.windowsCenter],
                              
                              [NSValue valueWithCGPoint:tempDTO.faceStruct1.windowsCenter],

                             // [NSValue valueWithCGPoint:tempDTO.faceStruct2.windowsCenter],
                              ];
    
    CAKeyframeAnimation *moveCenterAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:centerValues keyTimes:keyTime];
    moveCenterAni.fillMode=kCAFillModeBoth;
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleValues keyTimes:keyTime];
    scaleAni.fillMode=kCAFillModeBoth;
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenterAni,scaleAni]];
    
    [nextLayer.contentLayer addAnimation:animationGroup forKey:@"sdf"];
    
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
}


-(void) exportVideo
{
    [self.avPlayer pauseActive];
    
    AVEngineCompositeBlock block = ^(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL){
        
        if (isSuccess) {
            
            NSLog(@"exportVideoFileAndPush=%@", videoURL);
            
            AVPlayer *player = [AVPlayer playerWithURL:videoURL];
            
            // Create and configure AVPlayerLayer
            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
            playerLayer.frame= CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width);
            
            [self.view.layer addSublayer:playerLayer];
            
            [player play];
            
        }
    };
    
    NSString *videoURL = [[NSBundle mainBundle] pathForResource:@"emptyVideo" ofType:@"mp4"];
    
    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
    
    AVMediaComposionCommand *composionCommand = [[AVMediaComposionCommand alloc] initWithURL:[NSURL fileURLWithPath:videoURL]videoSize:CGSizeMake(kAVWindowWidth, kAVWindowWidth)];
    
    [composionCommand loadMusic:[NSURL fileURLWithPath:MP3URL] totalTime:4];
    
    [self.avPlayer exportAni];
    
    [composionCommand exportVideo:self.avPlayer.animateLayer compeleteBlock:block outName:@"mac.mp4"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
