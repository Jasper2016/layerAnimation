//
//  WuwaViewController.m
//  AVCoreTest
//
//  Created by mac on 2017/11/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "WuwaViewController.h"
#import "AVBasicLayer.h"

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

#import "AVPlayTextLayer.h"

#import "AVTextAttributedHelper.h"

#define kDefalutTextFont2  [UIFont systemFontOfSize:kDefultFontValue]

@interface WuwaViewController ()

@end

@implementation WuwaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self AVAniThreeSpliceSubBar];
    
    [self leftRightSpliceScene2];
}

-(void)leftRightSpliceScene3
{
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    
    [homeLayer addSublayer: nextLayer];
    
    
    CGFloat subHeight = kAVWindowHeight/2;
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, kAVWindowHeight)
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"3.png"]];
    
    [homeLayer addSublayer: leftLayer];
    leftLayer.position  = CGPointMake(kAVWindowCenter.x, 0);
    
    leftLayer.mask = leftLayer.maskLayer;
//    leftLayer.maskLayer.frame = CGRectMake(0, 0,subWidth, kAVWindowHeight);
//    leftLayer.maskLayer.position  = CGPointMake(subWidth/2, 0);
    
}


-(void)leftRightSpliceScene2
{
    CGFloat moveduration = 1.2;
    
    CGFloat subWidth = kAVWindowWidth/2;
    
    CGFloat  whiteBarHight = 140;
    
    CGFloat  startOffset = 200;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    
    {
//        AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
//                                                         vContentRect:kAVRectWindow
//                                                            withImage:[UIImage imageNamed:@"0.png"]];
//
//
//        [homeLayer addSublayer: currentLayer];
    }
    
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, kAVWindowHeight)
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"3.png"]];

    [homeLayer addSublayer: leftLayer];
    leftLayer.position  = CGPointMake(kAVWindowCenter.x, 0);
    
    leftLayer.mask = leftLayer.maskLayer;
    leftLayer.maskLayer.frame = CGRectMake(0, 0,subWidth, kAVWindowHeight);
    leftLayer.maskLayer.position  = CGPointMake(subWidth/2, 0);
    
    
    
    AVBasicLayer *rightLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, kAVWindowHeight)
                                                      vContentRect:kAVRectWindow
                                                         withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: rightLayer];
    rightLayer.position  = CGPointMake(kAVWindowCenter.x, kAVWindowHeight);
    
    rightLayer.mask = rightLayer.maskLayer;
    rightLayer.maskLayer.frame = CGRectMake(0, 0,subWidth, kAVWindowHeight);
    rightLayer.maskLayer.position  = CGPointMake(kAVWindowCenter.x+(subWidth/2), kAVWindowHeight);
    
    {
        leftLayer.opacity = 0;
        rightLayer.opacity = 0;
        
        CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.35 withBeginTime:beginTime];
        [leftLayer addAnimation:opacityAni forKey:@"opacityAni"];
        [rightLayer addAnimation:opacityAni forKey:@"opacityAni"];
    }
    
    beginTime +=0.3;
    
    {
        CABasicAnimation *leftMasterMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                      withBeginTime:beginTime
                                                                          fromValue: CGPointMake(kAVWindowCenter.x, -startOffset)
                                                                            toValue: CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];
        
        [leftLayer addAnimation: leftMasterMoveAni forKey:@"boundLeftAni"];
        
        
        CABasicAnimation *rightMasterMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                       withBeginTime:beginTime
                                                                           fromValue: CGPointMake(kAVWindowCenter.x, kAVWindowHeight+startOffset)
                                                                             toValue: CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];
        
        [rightLayer addAnimation: rightMasterMoveAni forKey:@"boundLeftAni"];
    }
    
    {
        CABasicAnimation *leftMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                         withBeginTime:beginTime
                                                                             fromValue: CGPointMake(subWidth/2, kAVWindowHeight)
                                                                               toValue: CGPointMake(subWidth/2, kAVWindowCenter.y)];

         [leftLayer.maskLayer addAnimation: leftMoveAni forKey:@"boundLeftAni"];


        CABasicAnimation *rightMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                         withBeginTime:beginTime
                                                                             fromValue: CGPointMake(kAVWindowCenter.x+(subWidth/2), 0)
                                                                               toValue: CGPointMake(kAVWindowCenter.x+(subWidth/2), kAVWindowCenter.y)];

        [rightLayer.maskLayer addAnimation: rightMoveAni forKey:@"boundLeftAni"];

    }
    
    
    {
        CABasicAnimation *saleOutAni =  [[AVBasicRouteAnimate alloc] scaleTo:AVScaleSlowDuration withBeginTime:beginTime+moveduration
                                                                   fromValue:1 toValue:1.4];

        [leftLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        [rightLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }
    
    //next  add  text
    {
        AVBottomLayer *whiteBLeftgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, (kAVWindowHeight-whiteBarHight)/2, kAVWindowWidth, whiteBarHight)
                                                                   bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor];
        [leftLayer addSublayer: whiteBLeftgLayer];
        whiteBLeftgLayer.masksToBounds = YES;
        
        AVBottomLayer *whiteRightBgLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, (kAVWindowHeight-whiteBarHight)/2, kAVWindowWidth, whiteBarHight)
                                                                   bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor];
        
        [rightLayer addSublayer: whiteRightBgLayer];
        whiteRightBgLayer.masksToBounds = YES;
        
        {
            NSString *photoDesc = @"M  U   k  0";
            VCAnimateTextModel *model = [[VCAnimateTextModel alloc] init];
            model.textContent = photoDesc;
            model.textFontName = @"Helvetica-Bold";
            model.textFontSize = 90;
            model.textFontColor = [UIColor whiteColor];
            AVTextAttributedHelper *helper = [[AVTextAttributedHelper alloc] init];
            CGSize textSize = [helper boundingRectTextModel:model
                                                  photoDesc:photoDesc
                                                   areaSize:CGSizeMake(kAVWindowWidth, MAXFLOAT)
                                               isEqualWidth:YES
                                              isEqualHeight:NO];
            
            AVBasicTextLayer *textLeftLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, (whiteBLeftgLayer.height - textSize.height)/2,textSize.width, textSize.height)
                                                                              intText:photoDesc
                                                                             textFont:[UIFont boldSystemFontOfSize:90]
                                                                            textColor:[UIColor whiteColor]];
            
            [ whiteBLeftgLayer addSublayer: textLeftLayer];
            
            AVBasicTextLayer *textRightLayer = [[AVBasicTextLayer alloc] initWithFrame:CGRectMake(0, (whiteBLeftgLayer.height - textSize.height)/2,textSize.width, textSize.height)
                                                                              intText:photoDesc
                                                                             textFont:[UIFont boldSystemFontOfSize:90]
                                                                            textColor:[UIColor whiteColor]];
            
            [ whiteRightBgLayer addSublayer: textRightLayer];
            
            beginTime += 0.4;
            //add
            {
                CABasicAnimation *leftMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration-0.2
                                                                              withBeginTime:beginTime
                                                                                  fromValue: CGPointMake(kAVWindowCenter.x, - (textSize.height/2))
                                                                                    toValue: CGPointMake(kAVWindowCenter.x,  whiteRightBgLayer.height/2)];
                
                [textLeftLayer addAnimation: leftMoveAni forKey:@"boundLeftAni"];
                
                
                CABasicAnimation *rightMoveAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration-0.2
                                                                               withBeginTime:beginTime
                                                                                   fromValue: CGPointMake(kAVWindowCenter.x,  whiteBLeftgLayer.height + textSize.height)
                                                                                     toValue: CGPointMake(kAVWindowCenter.x,  whiteRightBgLayer.height/2)];
                
                [textRightLayer addAnimation: rightMoveAni forKey:@"boundLeftAni"];
            }
            
            beginTime += 0.3;
            {
                CABasicAnimation *saleOutAni =  [[AVBasicRouteAnimate alloc] scaleTo:AVScaleSlowDuration withBeginTime:beginTime+moveduration
                                                                           fromValue:1 toValue:1.1];
                
                [textLeftLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
                [textRightLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
            }
        }
        
    }
}

-(void)leftRightSpliceScene
{
    CGFloat moveduration = 1;

    CGFloat subHeight = kAVWindowHeight/2;
    CGFloat subWidth = kAVWindowWidth/2;

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2 ;

    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, subHeight)
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"0.png"]];
//    AVBottomLayer *leftLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, subHeight)
//                                                          withImage:[UIImage imageNamed:@"1.png"]];
    [homeLayer addSublayer: leftLayer];
    leftLayer.anchorPoint =  CGPointMake(0.5, 0);
    leftLayer.position  = CGPointMake(kAVWindowCenter.x, 0);

    leftLayer.mask = leftLayer.maskLayer;
    leftLayer.maskLayer.frame = CGRectMake(0, 0,subWidth, subHeight);
    leftLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
    leftLayer.maskLayer.position  = CGPointMake(subWidth/2, 0);


    AVBasicLayer *rightLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, subHeight)
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: rightLayer];
    rightLayer.anchorPoint =  CGPointMake(0.5, 1);
    rightLayer.position  = CGPointMake(kAVWindowCenter.x, kAVWindowHeight);

    rightLayer.mask = rightLayer.maskLayer;
    rightLayer.maskLayer.frame = CGRectMake(0, 0,subWidth, subHeight);
    rightLayer.maskLayer.anchorPoint = CGPointMake(0.5, 0);
    rightLayer.maskLayer.position  = CGPointMake(kAVWindowCenter.x+(subWidth/2), 0);

    {
        CABasicAnimation *boundAni = [[AVBasicRouteAnimate alloc] customBasic:moveduration
                                                                     withBeginTime:beginTime
                                                                         fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,  subHeight)]
                                                                           toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,  kAVWindowHeight)]
                                                                      propertyName:kAVBasicAniBounds];
        [leftLayer addAnimation: boundAni forKey:@"kAVBasicAniPosition"];

        [rightLayer addAnimation: boundAni forKey:@"kAVBasicAniPosition"];

    }

    {
        CABasicAnimation *boundLeftAni = [[AVBasicRouteAnimate alloc] customBasic:moveduration
                                                                              withBeginTime:beginTime
                                                                                  fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, subWidth, subHeight)]
                                                                                    toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, subWidth,  kAVWindowHeight)]
                                                                               propertyName:kAVBasicAniBounds];
        [leftLayer.maskLayer addAnimation: boundLeftAni forKey:@"boundLeftAni"];

        [rightLayer.maskLayer addAnimation: boundLeftAni forKey:@"boundLeftAni"];
    }


    {
        CABasicAnimation *saleOutAni =  [[AVBasicRouteAnimate alloc] scaleTo:AVScaleSlowDuration withBeginTime:beginTime
                                                                   fromValue:1 toValue:1.4];

        [leftLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
        [rightLayer.contentLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    }

}


-(void)AVAniThreeSpliceSubBar
{
    
    CGFloat moveduration = 0.6;
    
    CGFloat subWidth = kAVWindowWidth/3;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBottomLayer *leftLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                         withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: leftLayer];
    leftLayer.mask = leftLayer.maskLayer;
    leftLayer.maskLayer.frame = CGRectMake(0, 0,subWidth, kAVWindowHeight);

    
    AVBottomLayer *centerLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                         withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: centerLayer];
    centerLayer.mask = centerLayer.maskLayer;
    centerLayer.maskLayer.frame = CGRectMake(subWidth,0,subWidth, kAVWindowHeight);
    
    AVBottomLayer *rightLayer = [[AVBottomLayer alloc] initWithFrame:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    [homeLayer addSublayer: rightLayer];
    rightLayer.mask = rightLayer.maskLayer;
    rightLayer.maskLayer.frame = CGRectMake(subWidth*2, 0,subWidth, kAVWindowHeight);
    
    
    CABasicAnimation *bottomToUpAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                    withBeginTime:beginTime
                                                                         fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowHeight+ kAVWindowCenter.y)
                                                                           toValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];

    [leftLayer addAnimation:bottomToUpAni forKey:@"bottomToUpAni"];
    [rightLayer addAnimation:bottomToUpAni forKey:@"bottomToUpAni"];
                                                                                               
    CABasicAnimation *upToBottomAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:moveduration
                                                                   withBeginTime:beginTime
                                                                       fromValue:CGPointMake(kAVWindowCenter.x, -kAVWindowCenter.y)
                                                                         toValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)];
    
    [centerLayer addAnimation:upToBottomAni forKey:@"upToBottomAni"];
    
    CABasicAnimation *saleOutAni = [AVAniScaleSlowBasic scaleSlowOutBasic:beginTime+moveduration fromScaleValue:1];
    
    [leftLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    [rightLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    [centerLayer addAnimation:saleOutAni forKey:@"saleOutAni"];
    
}


-(void)AVAniStart
{

    CGFloat moveduration = 0.8;
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    AVBasicLayer *leftLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    
    [homeLayer addSublayer: leftLayer];
    leftLayer.mask = leftLayer.maskLayer;
    
    
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
