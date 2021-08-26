//
//  VCoreTestDiamondViewController.m
//  AVCoreTest
//
//  Created by gemin on 2017/7/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "VCoreTestDiamondViewController.h"
#import "AVFundation.h"
#import "VCoreTransformFadeLayer.h"
#import "AVBasicTextLayer.h"

static NSInteger horizontalCount = 12;
static NSInteger verticalCount   = 3;
static const CGFloat AnimatedImagesViewImageViewsBorderOffset = 10;
static CGFloat   imageDesFount   = 20.f;

@interface VCoreTestDiamondViewController ()

@property (nonatomic, strong) CALayer *homeLayer;

@property (nonatomic, strong) CALayer *transformLayer;

@property (nonatomic, strong) CALayer *allMaskLayer;

@property (nonatomic, strong) CALayer *leftLayer;

@property (nonatomic, strong) CALayer *rightLayer;

@end

@implementation VCoreTestDiamondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _homeLayer = [CALayer layer];
    _homeLayer.frame = CGRectMake( 0, 100, kAVWindowWidth, kAVWindowWidth);
    CGFloat scaleValue = self.view.frame.size.width/kAVWindowWidth;
    [_homeLayer setValue:[NSNumber numberWithFloat:scaleValue] forKeyPath:@"transform.scale"];
    UIImage *image = [UIImage imageNamed:@"gril.png"];
    _homeLayer.contents = (__bridge id)image.CGImage;
    _homeLayer.position = self.view.center;
    _homeLayer.masksToBounds = YES;
    [self.view.layer addSublayer: _homeLayer];
    
//    [self buildMaskLayerAni];
//    [self.view.layer addSublayer:self.transformLayer];
//    [self irregularGraphics];
//    [self gradientMaskLayerAni];
//    [self threeSectionIrregular];
//    [self.homeLayer addSublayer:[self textLayer]];
//    [self imageDesLayerAni];
    [self diamondAni];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)diamondAni
{
    CALayer *diamondLayer = [self diamondBackLayer];
    diamondLayer.position = self.homeLayer.position;
    diamondLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    CATransform3D fromRotation = CATransform3DIdentity;
    fromRotation               = CATransform3DRotate(fromRotation, 0, 0, 0, 1);
    
    CATransform3D toRotation   = CATransform3DIdentity;
    toRotation                 = CATransform3DRotate(toRotation, M_PI, 0, 0, 1);
    
    NSArray *keyTime = @[@(0),@(1)];
    NSArray *rotationValue = @[[NSValue valueWithCATransform3D:fromRotation],
                               [NSValue valueWithCATransform3D:toRotation],];
    
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval duration  = 1.f;
    
    CAKeyframeAnimation *transform3DAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                  withBeginTime:beginTime
                                                                                   propertyName:@"transform"
                                                                                         values:rotationValue
                                                                                       keyTimes:keyTime];
    [diamondLayer addAnimation:transform3DAni forKey:nil];
    
    [self.homeLayer addSublayer:diamondLayer];
}

- (CALayer *)diamondBackLayer
{
    CGFloat layerWidth = 5.f;
    CGFloat layerSpace = 15.f;
    CALayer *backLayer = [CALayer layer];
    backLayer.backgroundColor = [UIColor clearColor].CGColor;
    backLayer.frame = (CGRect){CGPointZero,CGSizeMake(layerSpace*2+sqrtf(2*layerWidth*layerWidth),
                                                      sqrtf(2*layerWidth*layerWidth))};
    
    for (int i = 0; i < 3; i++)
    {
        CALayer *diamonLayer = [CALayer layer];
        diamonLayer.frame = CGRectMake(layerSpace*i, 1, layerWidth, layerWidth);
        diamonLayer.backgroundColor = [UIColor whiteColor].CGColor;
        CATransform3D transRotate = CATransform3DIdentity;
        transRotate = CATransform3DRotate(transRotate, M_PI/4, 0, 0, 1);
        diamonLayer.transform = transRotate;
        [backLayer addSublayer:diamonLayer];
    }
    return backLayer;
}


- (void)imageDesLayerAni
{
    CGFloat layerSpace = 15.f;
    CGFloat layerWidth = 5.f;

    CALayer *desBackLayer = [[CALayer alloc] init];
    desBackLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CGRect verticalFrame = (CGRect){CGPointZero,CGSizeMake(sqrtf(2*layerWidth*layerWidth),
                                                           layerSpace*2+sqrtf(2*layerWidth*layerWidth))};
    CALayer *verticalDiamondLayer = [self verticalDiamondBackLayerWithFrame:verticalFrame];
    verticalDiamondLayer.anchorPoint = CGPointMake(0.5, 0.5);

    NSString *text = @"删掉会房间卡大栅栏水电费看放假酸辣粉设计费啥房间改和";
    CGSize size = [text boundingRectWithSize:CGSizeMake(kAVWindowWidth-30*2, 500)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:imageDesFount]}
                                     context:nil].size;
    
    CGFloat desBackHeight = size.height > verticalFrame.size.height?ceil(size.height)+20:verticalFrame.size.height;

    desBackLayer.frame = CGRectMake(layerSpace,
                                    kAVWindowWidth - desBackHeight - layerSpace,
                                    kAVWindowWidth - layerSpace*2,
                                    desBackHeight);
    CALayer *textLyer = [self textLayerWithTitle:text
                                            size:size
                                          height:desBackHeight];
    verticalDiamondLayer.position = CGPointMake(layerWidth, desBackHeight*0.5);
    
    textLyer.left = 15;
    [desBackLayer addSublayer:verticalDiamondLayer];
    [desBackLayer addSublayer:textLyer];
    [self.homeLayer addSublayer:desBackLayer];
    
//    CALayer *topMaskLayer = [[CALayer alloc] init];
    NSArray *boundsKeyTime = @[
                               [NSNumber numberWithFloat:0],
                               [NSNumber numberWithFloat:1],
                               ];
    
    NSArray *boundsValues = @[@(0),@(desBackHeight)];
                              
    CAKeyframeAnimation *lineBoundsAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:2
                                                                                 withBeginTime:1
                                                                                  propertyName:@"height"
                                                                                        values:boundsValues
                                                                                      keyTimes:boundsKeyTime];
    [desBackLayer addAnimation:lineBoundsAni forKey:nil];

}

- (CALayer *)verticalDiamondBackLayerWithFrame:(CGRect)frame
{
    CGFloat layerWidth = 5.f;
    CGFloat layerSpace = 15.f;
    CALayer *backLayer = [CALayer layer];
    backLayer.backgroundColor = [UIColor clearColor].CGColor;
    backLayer.frame = frame;
    
    for (int i = 0; i < 3; i++)
    {
        CALayer *diamonLayer = [CALayer layer];
        diamonLayer.frame = CGRectMake(0, layerSpace*i, layerWidth, layerWidth);
        diamonLayer.backgroundColor = [UIColor whiteColor].CGColor;
        CATransform3D transRotate = CATransform3DIdentity;
        transRotate = CATransform3DRotate(transRotate, M_PI/4, 0, 0, 1);
        diamonLayer.transform = transRotate;
        [backLayer addSublayer:diamonLayer];
    }
    return backLayer;
}

- (CALayer *)textLayerWithTitle:(NSString *)title
                           size:(CGSize)size
                         height:(CGFloat)height
{
    CALayer *backLayer = [[CALayer alloc] init];
    backLayer.frame    = CGRectMake(0, 0, size.width+10, height);
    backLayer.backgroundColor = UIColorFromRGBAlpha(0x000000, 0.5).CGColor;
    backLayer.borderWidth     = 1.f;
    backLayer.borderColor     = [UIColor whiteColor].CGColor;
    
    AVBasicTextLayer *textLayer = [[AVBasicTextLayer alloc]  initWithFrame:CGRectMake(5,
                                                                                      (height - size.height-5)*0.5,
                                                                                      size.width,
                                                                                      size.height+5)
                                                                   intText:title
                                                                  textFont:[UIFont systemFontOfSize:imageDesFount]
                                                                 textColor:[UIColor whiteColor]];
    textLayer.alignmentMode = kCAAlignmentLeft;
    textLayer.anchorPoint = CGPointMake(0.5, 0.5);
    textLayer.wrapped = YES;
    [backLayer addSublayer:textLayer];
    return backLayer;

}

//三段不规则图形
- (void)threeSectionIrregular
{
    CGFloat shortOffsetX  = 100.f;
    CGFloat longOffsetX   = 200.f;
    {
        VCoreTransformFadeLayer *leftMaskLayer = [VCoreTransformFadeLayer layer];
        leftMaskLayer.frame            = CGRectMake(0, 0, longOffsetX, kAVWindowWidth);
        leftMaskLayer.fillColor        = [UIColor clearColor];
        leftMaskLayer.areaColor        = [UIColor blackColor];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(longOffsetX, 0)];
        [path addLineToPoint:CGPointMake(shortOffsetX, kAVWindowWidth)];
        [path addLineToPoint:CGPointMake(0, kAVWindowWidth)];
        [path closePath];
        leftMaskLayer.paths = @[path];
        [leftMaskLayer setNeedsDisplay];
        
        CALayer *leftLayer = [CALayer layer];
        leftLayer.frame = CGRectMake(0, 0, longOffsetX, kAVWindowWidth);
        UIImage *image = [UIImage imageNamed:@"top.png"];
        leftLayer.contents = (__bridge id)image.CGImage;
        leftLayer.masksToBounds = YES;
        leftLayer.mask = leftMaskLayer;
        [self.homeLayer addSublayer:leftLayer];
    }
    
    {
        VCoreTransformFadeLayer *centerMaskLayer = [VCoreTransformFadeLayer layer];
        centerMaskLayer.frame            = CGRectMake(0,
                                                      0,
                                                      kAVWindowWidth-shortOffsetX,
                                                      kAVWindowWidth);
        centerMaskLayer.fillColor        = [UIColor yellowColor];
        centerMaskLayer.areaColor        = [UIColor blackColor];
        
        UIBezierPath *centerPath = [UIBezierPath bezierPath];
        [centerPath moveToPoint:CGPointMake(longOffsetX, 0)];
        [centerPath addLineToPoint:CGPointMake(shortOffsetX, kAVWindowWidth)];
        [centerPath addLineToPoint:CGPointMake(kAVWindowWidth - longOffsetX, kAVWindowWidth)];
        [centerPath addLineToPoint:CGPointMake(kAVWindowWidth - shortOffsetX, 0)];
        [centerPath closePath];
        centerMaskLayer.paths = @[centerPath];
        [centerMaskLayer setNeedsDisplay];
        
        CALayer *centerLayer = [CALayer layer];
        centerLayer.frame = CGRectMake(0,
                                       0,
                                       kAVWindowWidth-shortOffsetX,
                                       kAVWindowWidth);
        UIImage *image = [UIImage imageNamed:@"meinv2.png"];
        centerLayer.contents = (__bridge id)image.CGImage;
        centerLayer.masksToBounds = YES;
        centerLayer.mask = centerMaskLayer;
        [self.homeLayer addSublayer:centerLayer];
    }
}


//不规则图形
- (void)irregularGraphics
{
    CGFloat offset     = 50.f;
    
    CGFloat leftWidth  = kAVWindowWidth/2.f+offset+50;
    CGFloat rightWidth = kAVWindowWidth/2.f - 50;
    CFTimeInterval beginTime = [_homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1;
    CFTimeInterval duration  = 3.f;
    
    NSInteger randomTranslationValueX   = [[self class] randomNumberBetweenNumber:0 andNumber:AnimatedImagesViewImageViewsBorderOffset] - AnimatedImagesViewImageViewsBorderOffset;
    NSInteger randomTranslationValueY   = [[self class] randomNumberBetweenNumber:0 andNumber:AnimatedImagesViewImageViewsBorderOffset] - AnimatedImagesViewImageViewsBorderOffset;
    CGFloat randomScaleTransformValue   = [[self class] randomNumberBetweenNumber:115 andNumber:120] / 100.0f;
    
    CATransform3D transformRotateFormValue   = CATransform3DIdentity;
    CATransform3D transformScaleFromValue    = CATransform3DIdentity;
    transformScaleFromValue                  = CATransform3DScale(transformRotateFormValue, 1, 1, 1);
    transformRotateFormValue                 = CATransform3DRotate(transformScaleFromValue, 0, 0, 1, 0);
    
    CATransform3D transformRotateValue  = CATransform3DIdentity;
    CATransform3D transformScaleToValue = CATransform3DIdentity;
    transformScaleToValue               = CATransform3DScale(transformRotateValue,
                                                             randomScaleTransformValue,
                                                             randomScaleTransformValue,
                                                             1);
    transformRotateValue                = CATransform3DRotate(transformScaleToValue,
                                                              0,
                                                              randomTranslationValueX,
                                                              randomTranslationValueY,
                                                              0);
    
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    
    NSArray *transformValues = @[
                                 [NSValue valueWithCATransform3D:transformRotateFormValue],
                                 [NSValue valueWithCATransform3D:transformRotateValue],
                                 ];
    CAKeyframeAnimation *transformAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                withBeginTime:beginTime+3
                                                                                 propertyName:@"transform"
                                                                                       values:transformValues
                                                                                     keyTimes:keyTime];
    
    {
        VCoreTransformFadeLayer *upMaskLayer = [VCoreTransformFadeLayer layer];
        upMaskLayer.frame = CGRectMake(0, 0, leftWidth, kAVWindowWidth);
        
        upMaskLayer.fillColor        = [UIColor clearColor];
        upMaskLayer.areaColor        = [UIColor blackColor];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(0, kAVWindowWidth)];
        [path addLineToPoint:CGPointMake(upMaskLayer.width - offset, kAVWindowWidth)];
        [path addLineToPoint:CGPointMake(upMaskLayer.width, 0)];
        [path closePath];
        upMaskLayer.paths = @[path];
        [upMaskLayer setNeedsDisplay];
        
        self.leftLayer = [CALayer layer];
        self.leftLayer.frame = CGRectMake(0, 0, leftWidth, kAVWindowWidth);
        UIImage *image = [UIImage imageNamed:@"top.png"];
        self.leftLayer.contents = (__bridge id)image.CGImage;
        self.leftLayer.masksToBounds = YES;
        self.leftLayer.mask = upMaskLayer;
        
        [self.leftLayer addAnimation:transformAni forKey:nil];
        [self.homeLayer addSublayer:self.leftLayer];
    }
    {
        VCoreTransformFadeLayer *downMaskLayer = [VCoreTransformFadeLayer layer];
        downMaskLayer.frame = CGRectMake(0, 0,  rightWidth, kAVWindowWidth);
        downMaskLayer.fillColor        = [UIColor clearColor];
        downMaskLayer.areaColor        = [UIColor blackColor];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(offset, 0)];
        [path addLineToPoint:CGPointMake(0, kAVWindowWidth)];
        [path addLineToPoint:CGPointMake(downMaskLayer.width, kAVWindowWidth)];
        [path addLineToPoint:CGPointMake(downMaskLayer.width, 0)];
        [path closePath];
        downMaskLayer.paths = @[path];
        [downMaskLayer setNeedsDisplay];

        self.rightLayer = [CALayer layer];
        self.rightLayer.frame = CGRectMake(0, 0,  rightWidth, kAVWindowWidth);
        UIImage *image = [UIImage imageNamed:@"meinv.png"];
        self.rightLayer.contents = (__bridge id)image.CGImage;
        self.rightLayer.masksToBounds = YES;
        self.rightLayer.mask = downMaskLayer;
        self.rightLayer.right = kAVWindowWidth;
        
        [self.rightLayer addAnimation:transformAni forKey:nil];
        [self.homeLayer addSublayer:self.rightLayer];
    }
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(leftWidth, 0)];
    [linePath addLineToPoint:CGPointMake(leftWidth - offset, kAVWindowWidth)];
    CAShapeLayer *linePathLayer = [CAShapeLayer layer];
    linePathLayer.path = linePath.CGPath;
    linePathLayer.fillColor = [UIColor clearColor].CGColor;
    linePathLayer.strokeColor = [UIColor whiteColor].CGColor;
    linePathLayer.lineWidth = 2;
    linePathLayer.anchorPoint = CGPointMake(0, 0);
    [self.homeLayer addSublayer:linePathLayer];
    
    NSNumber *fromeValue = @0;
    NSNumber *toValue = @1;
    CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
                                                                          withBeginTime:beginTime
                                                                              fromValue:fromeValue
                                                                                toValue:toValue
                                                                           propertyName:@"strokeEnd"];
//
//    CABasicAnimation *strokeEndAniDis = [[AVBasicRouteAnimate defaultInstance] customBasic:duration
//                                                                             withBeginTime:beginTime+duration
//                                                                                 fromValue:fromeValue
//                                                                                   toValue:toValue
//                                                                              propertyName:@"strokeStart"];
//    CAAnimationGroup *groupAni = [[AVBasicRouteAnimate defaultInstance] groupAni:6
//                                                                   withBeginTime:beginTime
//                                                                          aniArr:@[strokeEndAni,strokeEndAniDis]];
    [linePathLayer addAnimation:strokeEndAni forKey:nil];

}

+ (NSUInteger)randomNumberBetweenNumber:(NSUInteger)minNumber andNumber:(NSUInteger)maxNumber
{
    if (minNumber > maxNumber)
    {
        return [self randomNumberBetweenNumber:maxNumber andNumber:minNumber];
    }
    
    NSUInteger randomInt = (arc4random_uniform((u_int32_t)(maxNumber - minNumber + 1))) + minNumber;
    
    return randomInt;
}

- (CALayer *)transformLayer
{
    if (!_transformLayer) {
        _transformLayer = [CALayer layer];
        _transformLayer.frame = self.homeLayer.frame;
        _transformLayer.position = self.homeLayer.position;
        UIImage *image = [UIImage imageNamed:@"top.png"];
        _transformLayer.contents = (__bridge id)image.CGImage;
    }
    return _transformLayer;
}

- (void)gradientMaskLayerAni
{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame    = self.homeLayer.bounds;
    UIImage *image      = [UIImage imageNamed:@"meinv.png"];
    imageLayer.contents = (__bridge id)image.CGImage;
    
    CGRect maskFrame    = CGRectMake(-kAVWindowWidth/2.f,
                                     0,
                                     kAVWindowWidth + kAVWindowWidth / 2.f,
                                     kAVWindowWidth);

    CALayer *maskLayer         = [CALayer layer];
    maskLayer.frame            = maskFrame;
    CALayer *blackLayer        = [CALayer layer];
    blackLayer.frame           = CGRectMake(kAVWindowWidth/2.f,
                                            0,
                                            kAVWindowWidth,
                                            kAVWindowWidth);

    blackLayer.backgroundColor = [UIColor redColor].CGColor;
    [maskLayer addSublayer:blackLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame            = CGRectMake(0,
                                                0,
                                                kAVWindowWidth/2,
                                                kAVWindowWidth);
    [gradientLayer setColors:[NSArray arrayWithObjects: (id)[[UIColor clearColor] CGColor],
                                                        (id)[[UIColor whiteColor] CGColor], nil]];
    gradientLayer.locations        = @[@(0.5f), @(1.f)];
    gradientLayer.startPoint       = CGPointMake(0, 0);
    gradientLayer.endPoint         = CGPointMake(1, 0);

    [maskLayer addSublayer:gradientLayer];
    imageLayer.mask = maskLayer;
    
    [self.homeLayer addSublayer:imageLayer];

    
    NSArray *keyTime = @[
                       [NSNumber numberWithFloat:0],
                       [NSNumber numberWithFloat:1],
                       ];
    
    NSArray *values = @[
                      [NSValue valueWithCGPoint:CGPointMake(maskLayer.position.x, maskLayer.position.y)],
                      [NSValue valueWithCGPoint:CGPointMake(kAVWindowWidth+kAVWindowWidth/2, maskLayer.position.y)],
                      ];
    CGFloat duration         = 3.f;
    CFTimeInterval beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil] + 1;
    
    CAKeyframeAnimation *maskPositionAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                   withBeginTime:beginTime
                                                                                    propertyName:kAVBasicAniPosition
                                                                                          values:values
                                                                                        keyTimes:keyTime];
    
    [maskLayer addAnimation:maskPositionAni forKey:nil];

    
}

//图片碎片化转场
- (void)buildMaskLayerAni
{
    // 如果没有,就返回空
    if (horizontalCount < 1 || verticalCount < 1) {
        
        return;
    }
    // 承载所有的maskLayer
    self.allMaskLayer = [CALayer layer];
    self.allMaskLayer.frame  = self.transformLayer.bounds;
    self.transformLayer.mask = self.allMaskLayer;
    
    // 计算出每个Layer的尺寸
    CGFloat height          = self.transformLayer.frame.size.height;
    CGFloat width           = self.transformLayer.frame.size.width;
    CGFloat maskLayerHeight = verticalCount   <= 1 ? height : (height / verticalCount);
    CGFloat maskLayerWidth  = horizontalCount <= 1 ? width  : (width  / horizontalCount);
    
    // 用以计数
    int count = 0;
    
    // 先水平循环,再垂直循环
    
    CFTimeInterval beginTime = [self.homeLayer convertTime:CACurrentMediaTime() fromLayer:nil] + 1;
    NSArray *keyTime = @[
                         [NSNumber numberWithFloat:0],
                         [NSNumber numberWithFloat:1],
                         ];
    NSArray *opacityValue = @[
                             [NSNumber numberWithFloat:1],
                             [NSNumber numberWithFloat:0],
                             ];
    CGFloat duration   =  1.f;
    CGFloat animationGapDuration = 0.075;

    for (int horizontal = 0; horizontal < horizontalCount; horizontal++) {
        
        for (int vertical = 0; vertical < verticalCount; vertical++) {
            
            CGRect frame = CGRectMake(maskLayerWidth  * horizontal,
                                      maskLayerHeight * vertical,
                                      maskLayerWidth,
                                      maskLayerHeight);
            
            CALayer *maskLayer        = [CALayer layer];
            maskLayer.frame           = frame;
            maskLayer.backgroundColor = [UIColor blackColor].CGColor;
            CAKeyframeAnimation *opactiyAni = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration
                                                                                      withBeginTime:beginTime+count*animationGapDuration
                                                                                       propertyName:@"opacity"
                                                                                             values:opacityValue
                                                                                           keyTimes:keyTime];
            [maskLayer addAnimation:opactiyAni forKey:nil];
            [self.allMaskLayer addSublayer:maskLayer];
            
            count++;
        }
    }
}

@end
