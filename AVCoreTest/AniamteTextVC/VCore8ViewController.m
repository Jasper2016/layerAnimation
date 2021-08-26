//
//  VCore8ViewController.m
//  AVCoreTest
//
//  Created by mac on 2017/3/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCore8ViewController.h"
#import "AVFundation.h"
#import "JNWSpringAnimation.h"
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

#import "GeometryGradientLayer.h"

#import "AVShapeBaseLayer.h"

#import "AVCirleShapeLayer.h"

#import "AVChartColorLayer.h"

#import "NSString+Additions.h"

#import "AVPlayTextLayer.h"

#import "NSString+AVCore.h"

#import "VCEditTextManager.h"

#import "CustomLayer.h"

@interface VCore8ViewController ()<UITextFieldDelegate>{

    CGFloat _fontSize;
}
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic, strong) AVBasicLayer *currentLayer;
@property (nonatomic, strong) AVBottomLayer *textBgLayer;
@property (nonatomic, strong) AVBottomLayer *topWhiteLayer;
@property (nonatomic, strong) AVPlayTextLayer *textLayer;
@property (nonatomic, strong) UIFont *font;
@end

@implementation VCore8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fontSize = 23;
    // Do any additional setup after loading the view.
//    [self testText];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.textfield resignFirstResponder];
    return YES;
}
- (IBAction)fontSizePlus:(id)sender {
    
    _fontSize++;
    NSLog(@"_fontSize=%.f",_fontSize);
}

- (IBAction)fontSzieMinus:(id)sender {
    
    _fontSize--;
    NSLog(@"_fontSize=%.f",_fontSize);
    
}

- (IBAction)submitBtnEvent:(id)sender {
    //    STSongti-SC-Regular//PingFangSC-Regular、、Helvetica-Bold
    __weak typeof(self)weakSelf = self;
    NSString *fontName = @"HiraginoSansGB-W3";
    if ([[VCEditTextManager sharedInstance] isFontISExist:fontName]) {
        __strong typeof(weakSelf)strongSlef= weakSelf;
        strongSlef.font = [UIFont fontWithName:fontName size:_fontSize];
        [strongSlef testMutableText];
//        [strongSlef testText];
    }else{
       __strong typeof(weakSelf)strongSlef= weakSelf;
       [[VCEditTextManager sharedInstance] downloadWithfontName:fontName progressHandler:^(float percent) {
           NSLog(@"%f",percent);
       } completion:^(NSString *fontName) {
          
           strongSlef.font = [UIFont fontWithName:fontName size:_fontSize];
           dispatch_async(dispatch_get_main_queue(), ^{
          
//                [strongSlef testText];
               [strongSlef testMutableText];
               
           });
          
           
       }];
        
    }
//    self.font = [UIFont fontWithName:@"Helvetica-Bold" size:_fontSize];
////    [UIFont systemFontOfSize:_fontSize];
////    [self testText];
//    [self testMutableText];
}

- (IBAction)resetBtnEvent:(id)sender {
    
    self.textfield.text = nil;
    [homeLayer removeAllAnimations];
    _currentLayer = nil;
    _textLayer = nil;
    _textBgLayer = nil;
    _topWhiteLayer = nil;
    
    
}

- (void)testMutableText{
    
    _currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                           vContentRect:kAVRectWindow
                                              withImage:[UIImage imageNamed:@"cat.png"]];
    
    [homeLayer addSublayer:_currentLayer];
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;
    
    CGFloat mvoeDuration = duration-2.2;
    
    beginTime+=0.7;

    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineSpacing = 1.0;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary * attributes = [NSDictionary dictionaryWithObjectsAndKeys:paragraphStyle,NSParagraphStyleAttributeName , [NSNumber numberWithFloat:3.0] , NSKernAttributeName,self.font,NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.textfield.text attributes:attributes];
    
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    _textBgLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,rect.size.width, rect.size.height)
                                                bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
    _textBgLayer.anchorPoint= CGPointMake(0.5, 1);
    _textBgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-rect.size.height/2);
    _textBgLayer.masksToBounds = YES;
    _topWhiteLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,kAVWindowWidth, 1)
                                                  bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor];
    [_textBgLayer addSublayer: _topWhiteLayer];
    
    [_currentLayer addSublayer: _textBgLayer];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    textLayer.string = attributedString;
    textLayer.font = CFBridgingRetain(self.font.fontName);
    textLayer.fontSize = self.font.pointSize;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.truncationMode = kCATruncationNone;
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.wrapped = YES; //设置后会自动换行
    textLayer.position = CGPointMake(kAVWindowWidth/2,rect.size.height/2);
    textLayer.backgroundColor = [UIColor redColor].CGColor;

    [_textBgLayer addSublayer:textLayer];

    
    CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:mvoeDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,rect.size.height)] propertyName:kAVBasicAniBounds];
    
    [_textBgLayer addAnimation: boundsAni forKey:@"boundsAni"];
}

#define kTextInterval 0

- (void)testText
{
    
    _currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                      vContentRect:kAVRectWindow
                                                         withImage:[UIImage imageNamed:@"cat.png"]];
    
    [homeLayer addSublayer:_currentLayer];
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
    
    CGFloat duration = 2;

    CGFloat mvoeDuration = duration-2.2;
    
    beginTime+=0.7;
    
    NSString *sceneDescString = self.textfield.text;
    
    CGFloat numCount = (self.textfield.text.length*_fontSize)/kAVWindowWidth;
    NSLog(@"lenght=%zd numCount = %.f",self.textfield.text.length,numCount);
    
//    CGSize textSize = [sceneDescString sizeForFont:self.font size:CGSizeMake(kAVWindowWidth-200, MAXFLOAT) mode:NSLineBreakByCharWrapping];

    
    CGSize textSize = [sceneDescString textBroadSizeWithFont:self.font maxSize:CGSizeMake(kAVWindowWidth, MAXFLOAT) interval:kTextInterval isDefluatWidth:NO];
    NSLog(@"newHeight=%f",textSize.height-(_fontSize*kTextFontOffsetFactor));
    _textBgLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,textSize.width, textSize.height)
                                                              bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
    _textBgLayer.anchorPoint= CGPointMake(0.5, 1);
    _textBgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight-textSize.height/2);
    _textBgLayer.masksToBounds = YES;
    _topWhiteLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0,kAVWindowWidth, 1)
                                                                bgColor:[[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor];
    [_textBgLayer addSublayer: _topWhiteLayer];
    
    [_currentLayer addSublayer: _textBgLayer];

    _textLayer = [[AVPlayTextLayer alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) intText:sceneDescString textFont:self.font textColor:[UIColor whiteColor]];
    
    
    _textLayer.position = CGPointMake(kAVWindowWidth/2,textSize.height/2);
    _textLayer.backgroundColor = [UIColor redColor].CGColor;
    [_textBgLayer addSublayer:_textLayer];
    
    [_textLayer addAni:0.35 beginTime:beginTime+0.1 aniFactor:AVArtAniTextCenterToLeftRight];
    
    CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:mvoeDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth, 0)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth,textSize.height)] propertyName:kAVBasicAniBounds];
    
    [_textBgLayer addAnimation: boundsAni forKey:@"boundsAni"];

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
