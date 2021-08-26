//
//  TextAniViewController.m
//  AVCoreTest
//
//  Created by mac on 2018/9/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TextAniViewController.h"
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
#import "NSString+Additions.h"
#import "MCAudioTextDTO.h"

#import "AVTextFontLayer.h"
#import "MCCTextLayer.h"

#define kBeginShowTime  0.4f
#define kScaleRootValue  1.0f

#define kDefalutTextFont  [UIFont systemFontOfSize:40]


#define kOffsetValueX     90*kScaleRootValue

#define kOffsetValueY    kAVWindowHeight*kScaleRootValue/2.0
#define kContendWidth     (kAVWindowWidth*kScaleRootValue -(2*kOffsetValueX))


@interface TextAniViewController ()
@property (nonatomic, strong) VCAnimateTextModel *textModel;
@property (nonatomic, strong) AVTextAttributedHelper *helper;
@property (nonatomic, strong) NSMutableArray *audioTextList;
//@property (nonatomic, strong) CALayer *homeLayer;
@end

@implementation TextAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *viewRoot = [[UIView alloc] initWithFrame:kAVRectWindow];
    CGFloat scaleValue = self.view.bounds.size.width/kAVWindowWidth;
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
    viewRoot.transform = transform;
    viewRoot.center =  CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    viewRoot.layer.masksToBounds = YES;
    [self.view addSubview: viewRoot];
    homeLayer = [CALayer layer];
    homeLayer.frame = CGRectMake( 0, 0, kAVWindowWidth, kAVWindowHeight);

    [viewRoot.layer addSublayer: homeLayer];
    
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow withImage:[UIImage imageNamed:@"desktop"]];
    [homeLayer addSublayer:currentLayer];
    
    AVBottomLayer *lineLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 1, kAVWindowHeight) bgColor:[UIColor redColor].CGColor];
    lineLayer.position = CGPointMake(kAVWindowWidth*0.2, kAVWindowHeight*0.5);
    [homeLayer addSublayer:lineLayer];
    
    AVBottomLayer *lineLayerRight = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, 1, kAVWindowHeight) bgColor:[UIColor redColor].CGColor];
    lineLayerRight.position = CGPointMake(kAVWindowWidth -kAVWindowWidth*0.2, kAVWindowHeight*0.5);
    [homeLayer addSublayer:lineLayerRight];
    
    
    AVBottomLayer *lineLayer2 = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0, kAVWindowWidth, 1) bgColor:[UIColor redColor].CGColor];
    lineLayer2.position = CGPointMake(kAVWindowWidth*0.5, kAVWindowHeight*0.5);
    [homeLayer addSublayer:lineLayer2];
    
//    [self textScaleWithAnchorPointInLeftDownAni];
//    [self textAniFlipOver];
//    [self textAniThree];
//    [self textAniFour];
//    [self textAniFive];
    
//    [self test];
 //   [self ani];


//    [self testLoopTextForVideo2];
 //   [self testOldLoopTextFor];
    
//    [self testLoopTextForVideo3];

//    [self testSimlpTextVideo];
  //  [self testLoopTextForVideo];
    [self configTextData];
//    [self textAnimate];

    
   // [self initTextAimation];
    [self loopFullTextAimation];

//    [self testScaleAndTrans];

//    [self initTextAimationDemo];

}

- (NSMutableArray *)audioTextList{
    
    if (!_audioTextList) {
        
        _audioTextList = [[NSMutableArray alloc] init];
    }
    return _audioTextList;
}

- (void)configTextData{
    
    NSArray *tempList = [self audioText];
    
    for (NSInteger index = 0; index < tempList.count; index++) {
     
        MCAudioTextDTO *dto = [[MCAudioTextDTO alloc] init];
        dto.textContent = tempList[index];
        dto.textFontName = @"PingFangSC-Semibold";
        dto.textFontSize = 50;
        dto.duration = 0.9;
        dto.transTime = 0.4;
        dto.aniScaleValue = 1;
        dto.transScaleValue = index%2 == 0 ? 1.2 : 0.8;
        dto.beginTime = index*1.5;
        dto.textFontColor = UIColor.whiteColor;
        dto.animateType = VCTextAnimateTypeScale;
        dto.transitionType = VCTransitionTypeUp;
        if (index != 0) {
            
            dto.transitionType = VCTransitionTypeUpScale;
        }
        if (index == 1) {
            
            dto.animateType = VCTextAnimateTypeNone;
        }
        if (index == 2) {
            
           dto.transitionType = VCTransitionTypeClockwise;
        }else if (index == 4){
            
            dto.transitionType = VCTransitionTypeAnticlockwise;

        }
        
        [self.audioTextList insertObject:dto atIndex:0];
    }
}

- (VCAnimateTextModel *)conversionTextModel:(MCAudioTextDTO *)dto{
    
    VCAnimateTextModel *textModel = [[VCAnimateTextModel alloc] init];
    textModel.textContent = dto.textContent;
    textModel.textFontSize = dto.textFontSize;
    textModel.textFontColor = dto.textFontColor;
    textModel.textFontName = dto.textFontName;
    return textModel;
}

- (NSArray *)audioText{
    
    return @[
             @"轻轻的我走了轻轻的我走了",
             @"正如",
             @"我轻轻的招手",
             @"作",
             @"我轻西云彩走了天",
             
             @"那河",
             @"是夕阳中的新娘",
             @"波光里的艳影",
             @"在我的",
             
             @"软泥上的青荇",
             @"油",
             @"在康河的柔波里",
             @"我甘心",
             
             @"那榆荫下的一潭",
             @"不是清泉",
             @"揉碎在浮藻间",
             @"沉淀着彩虹似的梦",
             @"寻梦？篙",
             @"向青草更青处漫溯",
             @"满载一船星辉",
             @"在",
             
             @"但我",
             @"悄悄是别离的笙箫",
             @"夏",
             @"沉默是今晚的康桥",
             
             @"悄悄的我走了",
             @"正如我",
             @"我挥一挥衣袖",
             @"不带"
             ];
    

//    return @[
//             @"轻轻的我走了",
//             @"正如我轻轻的来",
//             @"我轻轻的招手",
//             @"作别西天的云彩",
//             @"我轻西云彩走了天",
//
//             @"那河畔的金柳",
//             @"是夕阳中的新娘",
//             @"波光里的艳影",
//             @"在我的心头荡漾",
//
//             @"软泥上的青荇",
//             @"油油的在水底招摇",
//             @"在康河的柔波里",
//             @"我甘心做一条水草",
//
//             @"那榆荫下的一潭",
//             @"不是清泉，是天上虹",
//             @"揉碎在浮藻间",
//             @"沉淀着彩虹似的梦",
//             @"寻梦？撑一支长篙",
//             @"向青草更青处漫溯",
//             @"满载一船星辉",
//             @"在星辉斑斓里放歌",
//
//             @"但我不能放歌",
//             @"悄悄是别离的笙箫",
//             @"夏虫也为我沉默",
//             @"沉默是今晚的康桥",
//
//             @"悄悄的我走了",
//             @"正如我悄悄的来",
//             @"我挥一挥衣袖",
//             @"不带走一片云彩"
//             ];
    
}

- (VCAnimateTextModel *)textModel{
    
    if (!_textModel) {
        
        _textModel = [[VCAnimateTextModel alloc] init];
        _textModel.textFontName = @"PingFangSC-Semibold";
        _textModel.textFontColor = [UIColor redColor];
        _textModel.textFontSize = 40;
    }
    return _textModel;
}

-(void)loopFullTextAimation
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    NSMutableArray *textLayerList = [[NSMutableArray alloc ] init];

    CGFloat offsetStartY = kAVWindowHeight/2;
    
    NSInteger totalCount = self.audioTextList.count;
    
    CGFloat currentLayerHight = 0;
    
    //CGFloat currentLayerHight2 = 0;
    
    for (NSInteger index = 0; index < totalCount;  index++) {
        
        AVBottomLayer *beforeLayer =  (index>0)? textLayerList[index-1]:nil;
        
        MCAudioTextDTO *tempDTO = self.audioTextList[index];
        self.textModel.textContent = tempDTO.textContent;

        CGFloat fontSize = [self adjustedFontSizeForText:self.textModel.textContent];
        self.textModel.textFontSize = fontSize;
        
        CGSize textSize = [self.helper boundingRectTextModel:self.textModel
                                                   photoDesc:self.textModel.textContent
                                                    areaSize:CGSizeMake(kContendWidth, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];

        
        CGFloat offsetY =(index>0)?textSize.height/2+currentLayerHight/2 :offsetStartY+textSize.height/2;
        
        CGFloat offsetX =(index>0)?0:kOffsetValueX;
        
        AVTextFontLayer *tempLayer = [[AVTextFontLayer alloc] initTextLayerWithFrame:CGRectMake(offsetX, offsetY, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
        tempLayer.textLayer.alignmentMode = kCAAlignmentLeft;
        currentLayerHight = textSize.height;
        
        tempLayer.anchorPoint = CGPointMake(0, 1);
        tempLayer.position =   CGPointMake(offsetX, offsetY);
        
        //tempLayer.beforeLayer.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.5].CGColor;
        
        // tempLayer.opacity = 0.0f;
        tempLayer.masksToBounds = NO;
        
        if (beforeLayer) {
            [beforeLayer addSublayer: tempLayer];
        }else{
            [homeLayer addSublayer: tempLayer];
        }

        [textLayerList addObject: tempLayer];
        
        
    }

    // 第二个循环：：
    NSInteger totalItem = textLayerList.count-1;
    int rotateIndex = 0;
    BOOL isRotateRight = NO;
    for (NSInteger index = totalItem; index > -1;  index--) {
        
        
        MCAudioTextDTO *tempDTO = self.audioTextList[index];
        self.textModel.textContent = tempDTO.textContent;
        
        NSLog(@"index= %ld,  tempDTO.beginTime=%f ", (long)index, tempDTO.beginTime);
        
        AVTextFontLayer *beforeLayer =  (totalItem>index)? textLayerList[index+1]:nil;
        
        AVTextFontLayer *tempLayer = textLayerList[index];
        
        //镜头动画
        {
            CABasicAnimation *saleToAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
                                                                 withBeginTime:beginTime+ tempDTO.beginTime
                                                                     fromValue:0.0f
                                                                       toValue:1.0f];
            saleToAni.timingFunction =   [CAMediaTimingFunction easeOutBack];
            [tempLayer.textLayer addAnimation:saleToAni forKey:@"saleOutAni"];
            
        }
    
        
        CGFloat fontSize = [self adjustedFontSizeForText:self.textModel.textContent];
        self.textModel.textFontSize = fontSize;
        
//        CGSize textSize = [self.helper boundingRectTextModel:self.textModel
//                                                   photoDesc:self.textModel.textContent
//                                                    areaSize:CGSizeMake(kContendWidth, MAXFLOAT) isEqualWidth:YES isEqualHeight:NO];
        
        //上个layer
        if (totalItem>index && index>-1){
            
            MCAudioTextDTO *beforDTO = self.audioTextList[index+1];
            NSString *beforeText = beforDTO.textContent;
            
            NSInteger val = self.textModel.textContent.length-beforeText.length;
            CGFloat scaleValue = 1.0f - 0.1*val;
            if (scaleValue <0.7){ scaleValue =0.7;}
            if (scaleValue > 1.4){ scaleValue =1.4;}
            
            
            NSLog(@"scaleValue=%f", scaleValue);
            
            CGPoint toPoint = CGPointMake(0,0);
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:kBeginShowTime-0.05
                                                                          withBeginTime:beginTime+ tempDTO.beginTime-0.15
                                             //fromValue:fromPoint
                                                                                toValue:toPoint];
            [beforeLayer addAnimation:positionAni forKey:@"positionAni"];
            
            if((rotateIndex+1)%4 != 0){
                
                CABasicAnimation *saleToAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime-0.05
                                                                     withBeginTime:beginTime+ tempDTO.beginTime-0.15
                                                                           toValue:scaleValue];
                saleToAni.timingFunction =   [CAMediaTimingFunction easeOutBack];
                [beforeLayer addAnimation:saleToAni forKey:@"saleOutAni"];
            }
            
            //currentLayerHight2 = textSize.height;
        }
        
        if ((rotateIndex+1)%4 == 0){
            
            int radians =  isRotateRight?90:-90;
            
            NSLog(@"radians =%d", radians);

            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                                             customBasic:kBeginShowTime
                                             withBeginTime:beginTime+ tempDTO.beginTime-0.15
                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(radians)]
                                             propertyName:kAVBasicAniRotationZ];
            rotationAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

            [beforeLayer addAnimation:rotationAni forKey:@"positionAni"];
            
            if (isRotateRight){
                beforeLayer.anchorPoint = CGPointMake(1, 1);
                CGFloat beforeLayerCenterY = beforeLayer.position.y;
                beforeLayer.position =   CGPointMake(kContendWidth, beforeLayerCenterY);
            }
            
            isRotateRight =!isRotateRight;

        }
        
        rotateIndex +=1;
    }
}

-(void)initTextAimation
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    NSMutableArray *textLayerList = [[NSMutableArray alloc ] init];
    
    CGFloat offsetStartY = kAVWindowHeight/2+20;
 
    for (NSInteger index = 0; index < 10;  index++) {
        
        AVBottomLayer *beforeLayer =  (index>0)? textLayerList[index-1]:nil;
        
        CGFloat offsetY =(index>0)?40:offsetStartY;
        
        CGFloat offsetX =(index>0)?0:60;

        AVBottomLayer *tempLayer  = [[AVBottomLayer alloc] initWithFrame:CGRectMake(offsetX, offsetY, kAVWindowWidth- 2*60, 40)
                                                                 bgColor:[UIColor clearColor].CGColor];
        tempLayer.anchorPoint = CGPointMake(0, 1);
        tempLayer.position =   CGPointMake(offsetX, offsetY);
        
        tempLayer.beforeLayer.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.5].CGColor;
        
       // tempLayer.opacity = 0.0f;
        tempLayer.masksToBounds = NO;

        if (beforeLayer) {
           [beforeLayer addSublayer: tempLayer];
        }else{
           [homeLayer addSublayer: tempLayer];
        }
        [textLayerList addObject: tempLayer];
    
        
    }
    
    NSInteger totalItem = textLayerList.count-1;
    
    float rotateIndex = 1.0f;
    for (NSInteger index = totalItem; index > -1;  index--) {
        
        NSLog(@"index = totalItem index = %ld", (long)index);
        
        AVBottomLayer *beforeLayer =  (totalItem>index)? textLayerList[index+1]:nil;
        
        AVBottomLayer *tempLayer = textLayerList[index];
        
        {
            CABasicAnimation *saleToAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
                                                                           withBeginTime:beginTime+ totalItem- index
                                                                               fromValue:0.0f
                                                                                 toValue:1.0f];
            saleToAni.timingFunction =   [CAMediaTimingFunction easeOutBack];
            [tempLayer.beforeLayer addAnimation:saleToAni forKey:@"saleOutAni"];

        }
        
        //上个layer
        if (totalItem>index && index>-1){

            CGPoint fromPoint = CGPointMake(0, 40);
            CGPoint toPoint = CGPointMake(0,-5);

            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:kBeginShowTime withBeginTime:beginTime+ totalItem-index
                                                                             fromValue:fromPoint toValue:toPoint propertyName:@"position"];
            [beforeLayer addAnimation:positionAni forKey:@"positionAni"];
        }
        
        if (rotateIndex == 4){

            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                                             customBasic:kBeginShowTime
                                             withBeginTime:beginTime+ totalItem-index
                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)]
                                             propertyName:kAVBasicAniRotationZ];
            rotationAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

            [beforeLayer addAnimation:rotationAni forKey:@"positionAni"];

        }
        
        if (rotateIndex == 8){
            
            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                                             customBasic:kBeginShowTime
                                             withBeginTime:beginTime+ totalItem-index
                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)]
                                             propertyName:kAVBasicAniRotationZ];
            rotationAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            
            [beforeLayer addAnimation:rotationAni forKey:@"positionAni"];
            
            beforeLayer.anchorPoint = CGPointMake(1, 1);
            beforeLayer.position =   CGPointMake(kAVWindowWidth-2*60, 40);
            
        }
     
        rotateIndex +=1;
    }
}

#pragma mark -
#pragma mark - 文字动画

- (void)textAnimate{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    NSMutableArray *textLayerList = [[NSMutableArray alloc ] init];
    
    NSMutableArray *audioList = [[NSMutableArray alloc] init];
    
    NSMutableArray *textBgList = [[NSMutableArray alloc] init];
    
    //计算每个文字的高度
    for (NSInteger index = 0; index< self.audioTextList.count; index++) {

        MCAudioTextDTO *dto = (MCAudioTextDTO *)self.audioTextList[index];
        VCAnimateTextModel *textModel = [self conversionTextModel:dto];

        CGSize textSize = [self.helper boundingRectTextModel:textModel photoDesc:dto.textContent areaSize:CGSizeMake(kAVWindowWidth*0.8, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
        dto.textHeight = textSize.height;
        dto.textBgSize = textSize;
        CGRect textRect = CGRectMake(0, 0, textSize.width, textSize.height);
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:textRect text:self.helper.attributedString textModel:textModel];
        [textLayerList addObject:textLayer];
        [audioList addObject:dto];
    }
    
    //创建textLayer的bgLayer，从最后一个创建，因为要加到画布
    for (NSInteger index = audioList.count-1; index >= 0; index--) {

        NSInteger i = textBgList.count;
        
        CALayer *beforeLayer = nil;
        
        if (i > 0) {
         
            beforeLayer = (CALayer *)textBgList[i-1];
            
        }
        
        MCAudioTextDTO *lastDto = audioList[index];
        CALayer *textBgLayer = [CALayer layer];
        textBgLayer.frame = CGRectMake(0, 0, lastDto.textBgSize.width, lastDto.textHeight);
        [textBgList addObject:textBgLayer];
        
        AVBasicTextLayer *textLayer = (AVBasicTextLayer *)textLayerList[index];
        [textBgLayer addSublayer:textLayer];
        
        textLayer.position = CGPointMake(0, lastDto.textHeight);
        textLayer.anchorPoint = CGPointMake(0, 1);
        
        if (beforeLayer) {
        
            [beforeLayer addSublayer:textBgLayer];
           
            
        }else{
            
            textBgLayer.position = CGPointMake(kAVWindowWidth*0.2, kAVWindowHeight/2);
            textBgLayer.anchorPoint = CGPointMake(0, 1);
            [homeLayer addSublayer:textBgLayer];
        }
    }
    
    //做文字动画和文字背景动画
    for (NSInteger index =0; index < audioList.count; index++) {

        MCAudioTextDTO *dto = audioList[index];
        AVBasicTextLayer *textLayer = (AVBasicTextLayer *)textLayerList[index];

        
        if (dto.animateType == VCTextAnimateTypeScale) {
         
            //文字动画
            {
                CABasicAnimation *textAni = [[AVBasicRouteAnimate alloc] customBasic:dto.duration withBeginTime:beginTime+dto.beginTime+0.1 fromValue:@(0) toValue:@(dto.aniScaleValue) propertyName:@"transform.scale"];
                [textLayer addAnimation:textAni forKey:@"textAni"];
                
                CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:0.1 withBeginTime:beginTime+dto.beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
                [textLayer addAnimation:opacityAni forKey:@"opacityAni"];
            }
        }else{
            
            CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:0.1 withBeginTime:beginTime+dto.beginTime fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
            [textLayer addAnimation:opacityAni forKey:@"opacityAni"];
            
        }
        NSInteger currentBgIndex = (textBgList.count-1);
        //背景
        CALayer *textBgLayer = (CALayer *)textBgList[currentBgIndex-index];

        //转场动画
        if (index > 0) {

            CALayer *beforeLayer = (CALayer *)textBgList[currentBgIndex-index+1];

             [self addAudioTextTransAni:beginTime+dto.beginTime duration:dto.duration aniType:dto.transitionType audioDto:dto currentLayer:textBgLayer aniLayer:beforeLayer];

        }
    }
    
    
}

- (void)addAudioTextTransAni:(CFTimeInterval)beginTime
                    duration:(CFTimeInterval)duration
                     aniType:(TextTransAniType)transType
                    audioDto:(MCAudioTextDTO *)dto
                currentLayer:(CALayer *)currentLayer
                    aniLayer:(CALayer *)aniLayer{
    
    switch (transType) {
        case VCTransitionTypeUp:
        {
            aniLayer.position = CGPointMake(0, currentLayer.height);
            aniLayer.anchorPoint = CGPointMake(0, 1);
            
            CGFloat moveHeight = 0;
            
            if (dto.animateType == VCTextAnimateTypeScale) {
                
                moveHeight = -currentLayer.height*(dto.aniScaleValue-1);
            }
            CGPoint fromPoint = CGPointMake(0, currentLayer.height);
            CGPoint toPoint = CGPointMake(0, moveHeight);
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration withBeginTime:beginTime fromValue:fromPoint toValue:toPoint propertyName:@"position"];
            [aniLayer addAnimation:positionAni forKey:@"positionAni"];
            
            break;
        }
        case VCTransitionTypeUpScale:
        {
            
            aniLayer.position = CGPointMake(0, currentLayer.height);
            aniLayer.anchorPoint = CGPointMake(0, 1);
            
            CGFloat moveHeight = 0;
            
            if (dto.animateType == VCTextAnimateTypeScale) {
                
                moveHeight = -currentLayer.height*(dto.aniScaleValue-1);
            }
            CGPoint fromPoint = CGPointMake(0, currentLayer.height);
            CGPoint toPoint = CGPointMake(0, moveHeight);
            
            CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customCGPoint:duration withBeginTime:0 fromValue:fromPoint toValue:toPoint propertyName:@"position"];
            
            CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:duration withBeginTime:0 fromValue:@(1) toValue:@(dto.transScaleValue) propertyName:@"transform.scale"];
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:duration withBeginTime:beginTime aniArr:@[positionAni,scaleAni]];
            
            [aniLayer addAnimation:groupAni forKey:@"groupAni"];
            
            break;
        }
        case VCTransitionTypeClockwise: //顺时针
        {//如果上一个放大，width就要乘以放大比例，或缩小比例
            aniLayer.position = CGPointMake(aniLayer.width, currentLayer.height);
            aniLayer.anchorPoint = CGPointMake(1, 1);
            aniLayer.backgroundColor = UIColor.redColor.CGColor;
            
            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                 customBasic:duration
                 withBeginTime:beginTime
                 fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                 toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)]
                 propertyName:kAVBasicAniRotationZ];
            [aniLayer addAnimation:rotationAni forKey:@"rotationAni"];
            
            
            break;
        }
        case VCTransitionTypeAnticlockwise://逆时针
        {
            aniLayer.position = CGPointMake(0, currentLayer.height);
            aniLayer.anchorPoint = CGPointMake(0, 1);
            
            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                 customBasic:duration
                 withBeginTime:beginTime
                 fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                 toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)]
                 propertyName:kAVBasicAniRotationZ];
            [aniLayer addAnimation:rotationAni forKey:@"rotationAni"];
            
            break;
        }
        default:
            break;
    }
    
    
}

#pragma mark -
#pragma mark -

- (NSArray *)textList{
    
    return @[@"如果",
             @"梦",
             @"想",
             @"在远方",
             @"我愿意",
             @"等待",
             @"如果",
             @"心",
             @"在这里",
             @"正",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"轻轻我走了",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"轻轻我走了",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"轻轻我走了",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"我轻西云彩wewe天",
             @"轻轻我走了",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"轻轻我走了",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天",
             @"轻轻我走了",
             @"正如",
             @"我轻西云彩天",
             @"我轻西云彩wewe天"
             ];
}



-(NSMutableArray *)createAnimateDTO
{
    NSArray *oneTextList = [self textList];
    
    CGFloat totalTime = 20.0f;
    
    NSMutableArray *textList = [NSMutableArray array];
    for (int i = 0; i<oneTextList.count; i++) {
        
        MCAudioTextDTO *dto = [[MCAudioTextDTO alloc] init];
        dto.textContent = oneTextList[i];
        dto.textFontName = @"PingFangSC-Medium";
        dto.textFontSize = 50*kScaleRootValue;
        dto.textFontColor = [UIColor redColor];
        dto.beginTime = i*1.0f; //(totalTime/oneTextList.count+0.5)*i ;
        [textList addObject:dto];
    }
    
    return textList;
}


-(void)testLoopTextForVideo2
{

    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
   /// CFTimeInterval subTextCowDuration = 1.0f;  // 下一行文字出现依赖上一行文字的结束
    
    NSArray *oneTextList = [self createAnimateDTO];
    
    CALayer *bgLayer = [CALayer layer];
    bgLayer.frame = CGRectMake(0, 0, kAVWindowWidth, kAVWindowHeight);
    bgLayer.position = CGPointMake(kAVWindowWidth/2, kAVWindowHeight/2);
    [homeLayer addSublayer:bgLayer];
    
    CALayer *rootLayer = [CALayer layer];
    rootLayer.frame = CGRectMake(0, 0, bgLayer.width*kScaleRootValue, bgLayer.height*kScaleRootValue);
    rootLayer.position = bgLayer.position;
    CATransform3D transformScaleFromValue    = CATransform3DIdentity;
    transformScaleFromValue                  = CATransform3DScale(transformScaleFromValue, 1/kScaleRootValue, 1/kScaleRootValue, 1);
    rootLayer.transform = transformScaleFromValue;
    [bgLayer addSublayer: rootLayer];
    
    NSMutableArray *animations = @[].mutableCopy;
    CALayer *preLayer = nil;
    
    float postionX =  kOffsetValueX;  // kAVWindowWidth*0.2;

    NSInteger totalGroups = oneTextList.count%4==0 ? oneTextList.count/4 : oneTextList.count/4 + 1;
    
    for (int perGroup =0; perGroup < totalGroups;  perGroup++) {
        CALayer *rotateLayer = [CALayer layer];
        rotateLayer.frame = CGRectMake(0, 0, rootLayer.width*kScaleRootValue-2*kOffsetValueX, rootLayer.height*kScaleRootValue);
        rotateLayer.backgroundColor = [UIColor clearColor].CGColor;
        if (perGroup == totalGroups -1) {
            rotateLayer.frame = CGRectMake(kOffsetValueX, 0, rootLayer.width*kScaleRootValue-2*kOffsetValueX, rootLayer.height);
            [rootLayer addSublayer:rotateLayer];
        }
        
        CALayer *postionLayer = [CALayer layer];
        postionLayer.frame = rotateLayer.bounds;
        postionLayer.backgroundColor = [UIColor clearColor].CGColor;
        [rotateLayer addSublayer:postionLayer];
        
        postionLayer.anchorPoint = CGPointMake(0, kOffsetValueY/postionLayer.height);
        postionLayer.position  = CGPointMake(0, kOffsetValueY);

        CGPoint oriPoint = postionLayer.position;

        if (preLayer) {
            [postionLayer addSublayer:preLayer];
        }
        
        preLayer = rotateLayer;
        
        NSInteger loopMax = 4;
        if (perGroup == totalGroups-1) {
            if (oneTextList.count%4 != 0) {
                loopMax = oneTextList.count%4;
            }
        }
        CGFloat currentBottom = 0;
        CGFloat rootOffsetY= kOffsetValueY;
        CGFloat caculateY = 0;
        CGFloat currentScaleValue = 0;
        
        MCAudioTextDTO *fTextDto = oneTextList[perGroup*4];//每段第一个
        MCAudioTextDTO *lTextDto = oneTextList[perGroup*4+loopMax-1];//每段最后一个
        CGFloat nextTime = 0;
        if (perGroup*4+loopMax<oneTextList.count-1) {
            MCAudioTextDTO *nFTextDto = oneTextList[perGroup*4+loopMax];//下一段第一个
            nextTime = MAX(lTextDto.beginTime, nFTextDto.beginTime);
        }else{
            MCAudioTextDTO *lastTextDto = oneTextList.lastObject;//最后一个文字
            nextTime = lastTextDto.beginTime+2;
        }
        
        CGFloat lastTextHeight = 0;

        for (int rows = perGroup* 4; rows < perGroup *4+loopMax; rows ++) {
            
            MCAudioTextDTO *currentDTO = oneTextList[rows];
            
            NSString *text = currentDTO.textContent;
//            CGFloat fontSize = [self adjustedFontSizeForText:text];
//            currentDTO.textFontSize = fontSize;
            
          // NSLog(@"fontSize =%f",fontSize);
            
            CGSize realSize = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:currentDTO.textFontSize]} context:nil].size;
            
            CGFloat scaleValue = MAX(kContendWidth/realSize.width, 1);
            
            if (scaleValue> 6){
                scaleValue =6;
            }
            
            
            NSLog(@"scaleValue =%f",scaleValue);

            currentScaleValue = scaleValue;
            self.textModel.textContent = text;
            CGSize textSize = [self.helper boundingRectTextModel:self.textModel
                                                       photoDesc:self.textModel.textContent
                                                        areaSize:CGSizeMake(kContendWidth, MAXFLOAT)
                                                    isEqualWidth:YES
                                                   isEqualHeight:NO];

            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, rootOffsetY, textSize.width, textSize.height)
                                                                                      text:self.helper.attributedString textModel:self.textModel];
            rootOffsetY = rootOffsetY + textSize.height;
            [postionLayer addSublayer:textLayer];
            lastTextHeight = textLayer.height;
            {
                CABasicAnimation *apacityAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
                                                                      withBeginTime: beginTime+currentDTO.beginTime //  beginTime+(j%4)*subTextCowDuration
                                                                          fromValue:0.0f
                                                                            toValue:1.0f];
                
                [textLayer addAnimation:apacityAni forKey:@"opactiyAni"];
            }
            
            // bg animation 1
            {
                caculateY = caculateY - textLayer.height;
                CABasicAnimation *bgsaleToAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
                                                                       withBeginTime:0
                                                                             toValue:scaleValue];
                
                CABasicAnimation *bgMoveOffsetYAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:kBeginShowTime
                                                                                   withBeginTime:0
                                                                                         toValue:CGPointMake(oriPoint.x, oriPoint.y+caculateY*scaleValue+textLayer.height*scaleValue/2.0)];
                
                CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:kBeginShowTime
             withBeginTime:currentDTO.beginTime-fTextDto.beginTime
                    aniArr:@[bgsaleToAni,bgMoveOffsetYAni]];
                groupAni.fillMode=kCAFillModeForwards;
                
                [animations addObject: groupAni];
            }
            
            currentBottom = textLayer.bottom;

            CGFloat postDuration = lTextDto.beginTime - fTextDto.beginTime ;
            
            CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni: postDuration +kBeginShowTime
                 withBeginTime:beginTime+fTextDto.beginTime
                        aniArr:animations];
            groupAni.fillMode=kCAFillModeForwards;
            [postionLayer addAnimation: groupAni forKey:@"groupAni"];

            
        }
        {
            //缩放还原，位置调整
            CABasicAnimation *bgsaleToAni2 = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
          withBeginTime:0
                toValue:1];
            CABasicAnimation *bgMoveOffsetYAni2 = [[AVBasicRouteAnimate alloc] moveXYCenterTo:kBeginShowTime
                 withBeginTime:0
                       toValue:CGPointMake(oriPoint.x, oriPoint.y+caculateY+lastTextHeight/2.0)];
            
            CAAnimationGroup *groupAni2 = [[AVBasicRouteAnimate alloc] groupAni:kBeginShowTime
          withBeginTime:beginTime + nextTime
                 aniArr:@[bgsaleToAni2,bgMoveOffsetYAni2]];
            groupAni2.fillMode=kCAFillModeForwards;
            
            [postionLayer addAnimation: groupAni2 forKey:@"groupAni2"];
        }
        
        BOOL clockwise = perGroup%2>0;
        
        if (clockwise) {
            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                                             customBasic:kBeginShowTime
                                             withBeginTime:beginTime + nextTime
                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)]
                                             propertyName:kAVBasicAniRotationZ];
            rotationAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

            if (perGroup == totalGroups -1) {
                rotateLayer.position = CGPointMake((rotateLayer.width+postionX)*kScaleRootValue*0.9, kOffsetValueY);
            }else{
                rotateLayer.position = CGPointMake(rotateLayer.width*kScaleRootValue*0.9, kOffsetValueY);
            }
            rotateLayer.anchorPoint = CGPointMake(1.0*kScaleRootValue*0.9, kOffsetValueY/rotateLayer.bounds.size.height);

            [rotateLayer addAnimation:rotationAni forKey:@"tranAni"];

        }else{
            
            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
                                             customBasic:kBeginShowTime
                                             withBeginTime:beginTime + nextTime
                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)]
                                             propertyName:kAVBasicAniRotationZ];
            rotationAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

            if (perGroup == totalGroups -1) {
                rotateLayer.position = CGPointMake(postionX, kOffsetValueY);
            }else{
                rotateLayer.position = CGPointMake(0, kOffsetValueY);
            }
            rotateLayer.anchorPoint = CGPointMake(0, kOffsetValueY/rotateLayer.bounds.size.height);

            [rotateLayer addAnimation:rotationAni forKey:@"tranAni"];
        }

    }
}


//-(void)testLoopTextForVideo
//{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+2;
//
//    CFTimeInterval subTextCowDuration = 1.0f;
//
//    CGFloat rootLayerHight = 100;
//
//    NSArray *oneTextList = [self textList];
//
//    CALayer *totalLayer = nil;
//    NSInteger page = 0;
//    NSInteger max = oneTextList.count%4==0 ? oneTextList.count/4 : oneTextList.count/4 + 1;
//    for (int i=0; i<max;i++) {
//        CABasicAnimation *roApacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:beginTime isAnimate:NO];
//
//        AVBottomLayer *rotateLayer = [[AVBottomLayer alloc] initWithFrame:CGRectMake(0, 0,kAVWindowWidth, kAVWindowHeight/2)
//                                                                  bgColor:[[UIColor blueColor] colorWithAlphaComponent:0.3].CGColor];
//        rotateLayer.opacity = 0;
//        [rotateLayer addAnimation:roApacityAni forKey:@"apacityAni"];
//        if (page%2 != 0) {
//            rotateLayer.anchorPoint = CGPointMake(1, 1);
//            rotateLayer.position = CGPointMake(kAVWindowWidth, kAVWindowHeight/2);
//        }else{
//            rotateLayer.anchorPoint = CGPointMake(0, 1);
//            rotateLayer.position = CGPointMake(0, kAVWindowHeight/2);
//        }
//        [homeLayer addSublayer: rotateLayer];
//
//        AVBottomLayer *rootLayer = [[AVBottomLayer alloc] initWithFrame: CGRectMake(0, 0, kContendWidth , rootLayerHight)
//                                                                bgColor:[[UIColor yellowColor] colorWithAlphaComponent:0.4].CGColor];
//
//        [rotateLayer addSublayer:rootLayer];
//        totalLayer = rootLayer;
//
//        float postionX =  kOffsetValueX;  // kAVWindowWidth*0.2;
//        rootLayer.anchorPoint = CGPointMake(0, 0.5);
//        rootLayer.position  = CGPointMake(kOffsetValueX, rotateLayer.height+ rootLayerHight/2);
//
//
//        CGFloat currentBottom = 0;
//        CGFloat rootOffsetY= kAVWindowCenter.y;
//        CGFloat currentScaleValue = 0;
//
//        NSMutableArray *rootAniList = [[NSMutableArray alloc] init];
//
//        NSInteger loopMax = 4;
//        if (i==max-1) {
//            if (oneTextList.count%4 != 0) {
//                loopMax = oneTextList.count%4;
//            }
//        }
//        for (int j=i*4; j<i*4+loopMax; j++) {
//            NSString *text = oneTextList[j];
//            CGFloat fontSize = [self adjustedFontSizeForText:text];
//
//            CGFloat scaleValue =fontSize/  self.textModel.textFontSize ;
//
//            NSLog(@"1 scaleValue =%f",scaleValue);
//
//            currentScaleValue = scaleValue;
//
//            self.textModel.textContent = text;
//
//            CGSize textSize = [self.helper boundingRectTextModel:self.textModel
//                                                       photoDesc:self.textModel.textContent
//                                                        areaSize:CGSizeMake(kContendWidth, MAXFLOAT)
//                                                    isEqualWidth:YES
//                                                   isEqualHeight:NO];
//
//            CGFloat offsetX = 0;
//            CGFloat offsetY = (currentBottom==0)? (rootLayer.height -textSize.height)/2 :currentBottom;
//            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(offsetX, offsetY, textSize.width, textSize.height)
//                                                                                      text:self.helper.attributedString textModel:self.textModel];
//            [rootLayer addSublayer: textLayer];
//            {
//                CABasicAnimation *apacityAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
//                                                                       withBeginTime:beginTime+(j%4)*subTextCowDuration
//                                                                           fromValue:0.0f
//                                                                             toValue:1.0f];
//
//                [textLayer addAnimation:apacityAni forKey:@"opactiyAni"];
//            }
//
//            // bg animation 1
//            {
//                rootOffsetY = kAVWindowCenter.y - (textLayer.bottom - rootLayer.height/2 - (textLayer.bottom - textLayer.top) / 2.0)*scaleValue;
//
//                CABasicAnimation *bgsaleToAni = [[AVBasicRouteAnimate alloc] scaleTo:kBeginShowTime
//                                                                       withBeginTime:0
//                                                                             toValue:scaleValue];
//
//                CABasicAnimation *bgMoveOffsetYAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:kBeginShowTime
//                                                                                   withBeginTime:0
//
//                                                                                         toValue:CGPointMake(postionX, rootOffsetY)];
//
//                CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:kBeginShowTime
//                                                                     withBeginTime:j%4
//                                                                            aniArr:@[bgsaleToAni, bgMoveOffsetYAni]];
//                groupAni.fillMode=kCAFillModeForwards;
//
//                [rootAniList addObject: groupAni];
//            }
//
//            currentBottom = textLayer.bottom;
//        }
//
//        CABasicAnimation *bgApacityAni = [[AVBasicRouteAnimate alloc] opacityClose:kBeginShowTime withBeginTime:beginTime+4*subTextCowDuration+kBeginShowTime];
//
//        [rootLayer addAnimation: bgApacityAni forKey:@"apacityAni"];
//
//
//        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni: 4*subTextCowDuration+kBeginShowTime
//                                                             withBeginTime:beginTime
//                                                                    aniArr:rootAniList];
//        groupAni.fillMode=kCAFillModeForwards;
//        [rootLayer addAnimation: groupAni forKey:@"groupAni"];
//
//
//        if (page%2!=0) {
//            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
//                                             customBasic:kBeginShowTime
//                                             withBeginTime:beginTime + 4*subTextCowDuration
//                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
//                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)]
//                                             propertyName:kAVBasicAniRotationZ];
//
//            [rotateLayer addAnimation:rotationAni forKey:@"rotateLayer"];
//        }else{
//            CABasicAnimation *rotationAni = [[AVBasicRouteAnimate alloc]
//                                             customBasic:kBeginShowTime
//                                             withBeginTime:beginTime + 4*subTextCowDuration
//                                             fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)]
//                                             toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)]
//                                             propertyName:kAVBasicAniRotationZ];
//
//            [rotateLayer addAnimation:rotationAni forKey:@"rotateLayer"];
//        }
//
//        beginTime = beginTime + 5*subTextCowDuration;
//        page = page + 1;
//    }
//}


-(void)testTextAniVideo
{
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    
    CALayer *rootLayer = [CALayer layer];
    rootLayer.backgroundColor = [UIColor greenColor].CGColor;
    rootLayer.frame = kAVRectWindow;
    [homeLayer addSublayer:rootLayer];
    NSArray *oneTextList = [self textList];
    NSTimeInterval showDuration = 0.6;
    NSTimeInterval totalDuration = showDuration*oneTextList.count;
    
    for (int i = 0; i < oneTextList.count;i++) {
        NSString *text = oneTextList[i];
        CGFloat fontSize = [self adjustedFontSizeForText:text];
        self.textModel.textFontSize = fontSize;
        self.textModel.textContent = text;
        AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, kDeviceHeight*0.5+70*i, kDeviceWidth, fontSize+10)
                                                                                  text:text
                                                                             textModel:self.textModel];
        [rootLayer addSublayer: textLayer];
        CABasicAnimation *saleToAni = [[AVBasicRouteAnimate defaultInstance] scaleTo:showDuration
                                                                       withBeginTime:beginTime+0.5*(i+1)
                                                                           fromValue:0.0f
                                                                             toValue:1.0f];
        saleToAni.timingFunction =   [CAMediaTimingFunction easeOutBack];
        [textLayer addAnimation:saleToAni forKey:@"saleOutAni"];
        
        CABasicAnimation *bgsaleToAni = [[AVBasicRouteAnimate alloc] scaleTo:showDuration
                                                               withBeginTime:0
                                                                   fromValue:1.0f
                                                                     toValue:1.4f];
        
        CABasicAnimation *bgMoveOffsetYAni = [[AVBasicRouteAnimate alloc] moveXYCenterTo:totalDuration
                                                                           withBeginTime:0
                                                                               fromValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y)
                                                                                 toValue:CGPointMake(kAVWindowCenter.x, kAVWindowCenter.y-100*(i+1))];
        
        CABasicAnimation *bgRoteAni = [self rotationAnimationWithDuration:showDuration beginTime:totalDuration-showDuration];
        
        CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:totalDuration
                                                             withBeginTime:beginTime+1
                                                                    aniArr:@[bgsaleToAni, bgMoveOffsetYAni,bgRoteAni]];
        
        [rootLayer addAnimation:groupAni forKey:@"groupAni"];


        
    }
}

- (CABasicAnimation *)rotationAnimationWithDuration:(NSTimeInterval)duration beginTime:(NSTimeInterval)beginTime
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeBoth;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.toValue = [NSNumber numberWithFloat:(-M_PI/2)];
    rotationAnimation.duration = duration;
    rotationAnimation.beginTime = beginTime;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    return rotationAnimation;
}

- (CGFloat)adjustedFontSizeForText:(NSString *)text
{
    CGFloat fontSize = kContendWidth/text.length;
//    if (fontSize > 200.0f) {
//        fontSize = 200.f;
//    }
//
    if (fontSize < 40){
        fontSize = 40;
    }
    return fontSize;
}

- (void)ani{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.0;
    
    CALayer *rootLayer = [CALayer layer];
    rootLayer.frame = kAVRectWindow;
    [homeLayer addSublayer:rootLayer];
    
    CGFloat bgWidth = kAVWindowWidth*0.8;
    CGFloat bgHeight = 0;
    CALayer *bgLayer = [CALayer layer];
    bgLayer.backgroundColor = [UIColor clearColor].CGColor;
    bgLayer.anchorPoint = CGPointMake(0, 1);
    [rootLayer addSublayer:bgLayer];
    NSMutableArray *aniList = [[NSMutableArray alloc] init];
    NSArray *oneTextList = [self textList];
    //第一阶段
    {
        for (NSInteger index = 0; index < oneTextList.count; index++) {
            
            NSString *text = oneTextList[index];
            self.textModel.textContent = text;
            self.textModel.textFontSize = 40;
            CGSize textSize = [self.helper boundingRectTextModel:self.textModel photoDesc:text areaSize:CGSizeMake(kAVWindowWidth*0.8, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
            
        
            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
            textLayer.anchorPoint = CGPointMake(0, 0);
            textLayer.position = CGPointMake(0, bgHeight);
            [bgLayer addSublayer:textLayer];
            CABasicAnimation *transAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime+moveDuration*index fromValue:@(0) toValue:@(1) propertyName:@"transform.scale"];
            [textLayer addAnimation:transAni forKey:@"transAni"];
            
            CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:index*moveDuration fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, bgWidth, bgHeight)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, bgWidth, bgHeight+textSize.height)] propertyName:@"bounds"];
            boundsAni.fillMode = kCAFillModeForwards;
            [aniList addObject:boundsAni];
            
            bgHeight += textSize.height;
        }
        
        CABasicAnimation *transAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:oneTextList.count*moveDuration fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)] toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)] propertyName:@"transform.rotation.z"];
        transAni.fillMode = kCAFillModeForwards;
        [aniList addObject:transAni];
    }
    bgLayer.position = CGPointMake(kAVWindowWidth*0.2, kAVWindowHeight*0.6);

    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration*(aniList.count) withBeginTime:beginTime aniArr:aniList];
    [bgLayer addAnimation:groupAni forKey:@"groupAni"];
    
    
    //第二阶段
    CFTimeInterval twoBeginTime = beginTime+(oneTextList.count-0.5)*moveDuration;
    {
        CGFloat height = 0;
        NSMutableArray *twoAniList = [[NSMutableArray alloc] init];
        CALayer *bgTwoLayer = [CALayer layer];
        bgTwoLayer.backgroundColor = [UIColor clearColor].CGColor;
        [bgLayer addSublayer:bgTwoLayer];
        bgTwoLayer.anchorPoint = CGPointMake(0, 1);

        NSArray *twoTextList = [self textTwoList];
        for (NSInteger index = 0; index < twoTextList.count; index++) {

            NSString *text = twoTextList[index];
            self.textModel.textContent = text;
            self.textModel.textFontSize = 40;
            CGSize textSize = [self.helper boundingRectTextModel:self.textModel photoDesc:text areaSize:CGSizeMake(kAVWindowWidth*0.8, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];

            AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];

            [bgTwoLayer addSublayer:textLayer];
            textLayer.position = CGPointMake(textSize.width/2, height+textSize.height/2);


            if (index == 0) {

                [bgTwoLayer setFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
                bgTwoLayer.position = CGPointMake(0, bgHeight);
                bgTwoLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(90), 0, 0, 1);
                CABasicAnimation *transAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:index*moveDuration fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)] toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(90)] propertyName:@"transform.rotation.z"];
                transAni.fillMode = kCAFillModeForwards;
                [twoAniList addObject:transAni];

                textLayer.opacity = 0.0;
                CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.8, height+textSize.height/2)] toValue:[NSValue valueWithCGPoint:CGPointMake(textSize.width/2, height+textSize.height/2)] propertyName:@"position"];
                CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:0];
                CAAnimationGroup *gruopAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:twoBeginTime+index*moveDuration aniArr:@[positionAni,opacityAni]];
                [textLayer addAnimation:gruopAni forKey:@"gruopAni"];

            }else{

                CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:index*moveDuration fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, textSize.width, height)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, textSize.width, height+textSize.height)] propertyName:@"bounds"];
                boundsAni.fillMode = kCAFillModeForwards;
                [twoAniList addObject:boundsAni];


                textLayer.opacity = 0.0;
                 CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] opacityOpen:0.1 withBeginTime:0];
                CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(0) toValue:@(1) propertyName:@"transform.scale"];

                CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:twoBeginTime+index*moveDuration aniArr:@[scaleAni,opacityAni]];

                [textLayer addAnimation:groupAni forKey:@"scaleAni"];

            }

            height+=textSize.height;
        }

        CAAnimationGroup *twoGroupAni = [[AVBasicRouteAnimate alloc] groupAni:twoAniList.count*moveDuration withBeginTime:twoBeginTime aniArr:twoAniList];

        [bgTwoLayer addAnimation:twoGroupAni forKey:@"twoGroupAni"];
    }

}

- (NSArray *)textTwoList{
    
    return @[@"呵呵呵呵呵",
             @"喝喝喝2"];
    
}

- (AVTextAttributedHelper *)helper{
    
    if(!_helper){
        
        _helper = [[AVTextAttributedHelper alloc] init];
        
    }
    return _helper;
}


//- (void)setHelper:(AVTextAttributedHelper *)helper{
//
//
//    _helper = helper;
//
//}


- (void)test{
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.0;
    
    NSString *oneText = @"哈哈哈哈哈哈哈哈";
    self.textModel.textContent = oneText;
    self.textModel.textFontSize = 40;
    CGSize textSize = [self.helper boundingRectTextModel:self.textModel photoDesc:oneText areaSize:CGSizeMake(kAVWindowWidth*0.6, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    NSLog(@"x=%0.1f,y=%0.1f",textSize.width,textSize.height);
    
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(0, 0, textSize.height, textSize.width) bgColor:[UIColor whiteColor].CGColor];
    bgLayer.position = CGPointMake(kAVWindowWidth*0.2+textSize.width, kAVWindowHeight*0.6);
    bgLayer.anchorPoint = CGPointMake(1, 1);
    [homeLayer addSublayer:bgLayer];
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.height, textSize.width) text:self.helper.attributedString textModel:self.textModel];
    [bgLayer addSublayer:textLayer];
    
//    CABasicAnimation *positionAni =
    
//    CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth*0.8, textSize.height)] toValue:[NSValue valueWithCGRect:CGRectMake(0, 0, kAVWindowWidth*0.8, textSize.height+50)] propertyName:@"bounds"];
//    [bgLayer addAnimation:boundsAni forKey:@"boundsAni"];
    CABasicAnimation *boundsAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(0)] toValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(-90)] propertyName:kAVBasicAniRotationZ];
//    [bgLayer addAnimation:boundsAni forKey:@"boundsAni"];
}

- (void)textBoundsAni{
    
    
    
}

- (void)textScaleWithAnchorPointInLeftDownAni{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.0;
    
    NSString *oneText = @"哈哈哈哈哈哈哈哈";
    self.textModel.textContent = oneText;
    self.textModel.textFontSize = 40;
    CGSize textSize = [self.helper boundingRectTextModel:self.textModel photoDesc:oneText areaSize:CGSizeMake(kAVWindowWidth*0.6, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    NSLog(@"x=%0.1f,y=%0.1f",textSize.width,textSize.height);
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
    //(0,1) (0.5,1)
    textLayer.anchorPoint = CGPointMake(0.5, 1);
    textLayer.position = CGPointMake(kAVWindowWidth*0.2+(textSize.width*0.5), kAVWindowHeight*0.5);
    [homeLayer addSublayer:textLayer];
    
    CABasicAnimation *transAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:beginTime fromValue:@(0) toValue:@(1) propertyName:@"transform.scale"];
    [textLayer addAnimation:transAni forKey:@"transAni"];
    
}
//翻转
- (void)textAniFlipOver{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.0;
    
    NSString *oneText = @"哈哈";
    self.textModel.textContent = oneText;
    _textModel.textFontSize = 50;
    CGSize textSize = [self.helper boundingRectTextModel: self.textModel photoDesc:oneText areaSize:CGSizeMake(kAVWindowWidth*0.6, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
    textLayer.anchorPoint = CGPointMake(0, 1);
    textLayer.position = CGPointMake(kAVWindowWidth*0.2, kAVWindowHeight*0.5);
    [homeLayer addSublayer:textLayer];
    
    CATransform3D startTransform = CATransform3DIdentity;
    CGFloat distance = sqrt((textSize.height*textSize.height)+(textSize.height*textSize.height));
    startTransform.m34 = -1.f/(distance);;

    startTransform = CATransform3DRotate(startTransform, DEGREES_TO_RADIANS(-90), 1, 0, 0);

    CATransform3D endTransform = CATransform3DIdentity;
    endTransform.m34 = -1.f/(distance);
    endTransform = CATransform3DRotate(endTransform, DEGREES_TO_RADIANS(0), 1, 0, 0);
    CABasicAnimation *transAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:[NSValue valueWithCATransform3D:startTransform] toValue:[NSValue valueWithCATransform3D:endTransform] propertyName:@"transform"];
//    [textLayer addAnimation:transAni forKey:@"transAni"];
    
    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(0) toValue:@(1.3) propertyName:@"transform.scale"];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[transAni,scaleAni]];
    [textLayer addAnimation:groupAni forKey:@"groupAni"];
    
}

- (void)textAniThree{
    
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 3.0;
    
    NSString *oneText = @"哈哈";
    self.textModel.textContent = oneText;
    _textModel.textFontSize = 50;
    CGSize textSize = [self.helper boundingRectTextModel: self.textModel photoDesc:oneText areaSize:CGSizeMake(kAVWindowWidth*0.6, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
    textLayer.anchorPoint = CGPointMake(0.2, 0.3);
    textLayer.opacity = 0.0;
    textLayer.position = CGPointMake(kAVWindowWidth*0.2+textSize.width*0.2, kAVWindowHeight*0.5);
    [homeLayer addSublayer:textLayer];
    
    CABasicAnimation *opacityAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(0) toValue:@(1) propertyName:@"opacity"];
    
    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(3) toValue:@(1) propertyName:@"transform.scale"];
    
    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[scaleAni,opacityAni]];
    [textLayer addAnimation:groupAni forKey:@"groupAni"];
    
}

- (void)textAniFour{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 1.2;
    
    NSString *oneText = @"哈哈哈哈哈";
    self.textModel.textContent = oneText;
    _textModel.textFontSize = 50;
    CGSize textSize = [self.helper boundingRectTextModel: self.textModel photoDesc:oneText areaSize:CGSizeMake(kAVWindowWidth*0.6, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
    textLayer.anchorPoint = CGPointMake(0.7, 0.5);
    textLayer.position = CGPointMake(kAVWindowWidth*0.2+textSize.width*0.7, kAVWindowHeight*0.5);
    [homeLayer addSublayer:textLayer];
    
    NSArray *values = @[@(0.0),@(1.6),@(1)];
    NSArray *time = @[@(0.0),@(0.6),@(1.0)];
    
    
    CAKeyframeAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customKeyframe:moveDuration withBeginTime:beginTime propertyName:@"transform.scale" values:values keyTimes:time];
    [textLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
}

- (void)textAniFive{
    
    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval moveDuration = 0.8;
    
    NSString *oneText = @"哈哈哈哈哈";
    self.textModel.textContent = oneText;
    _textModel.textFontSize = 50;
    CGSize textSize = [self.helper boundingRectTextModel: self.textModel photoDesc:oneText areaSize:CGSizeMake(kAVWindowWidth*0.6, MAXFLOAT) isEqualWidth:NO isEqualHeight:NO];
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc] initTextLayerWithFrame:CGRectMake(0, 0, textSize.width, textSize.height) text:self.helper.attributedString textModel:self.textModel];
    textLayer.anchorPoint = CGPointMake(1, 1);
    textLayer.position = CGPointMake(kAVWindowWidth*0.2+textSize.width, kAVWindowHeight*0.5);
    [homeLayer addSublayer:textLayer];
    
    
    CABasicAnimation *positionAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.2+textSize.width*1.5, kAVWindowHeight*0.5)] toValue:[NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth*0.2+textSize.width, kAVWindowHeight*0.5)] propertyName:@"position"];
    
    CABasicAnimation *scaleAni = [[AVBasicRouteAnimate alloc] customBasic:moveDuration withBeginTime:0 fromValue:@(0) toValue:@(1) propertyName:@"transform.scale"];
//    [textLayer addAnimation:scaleAni forKey:@"scaleAni"];
    
    CAAnimationGroup *groupANi = [[AVBasicRouteAnimate alloc] groupAni:moveDuration withBeginTime:beginTime aniArr:@[positionAni,scaleAni]];
    [textLayer addAnimation:groupANi forKey:@"groupANi"];
    
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
