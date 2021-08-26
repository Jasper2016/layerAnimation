//
//  DrawStrokeLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/5/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DrawStrokeLayer.h"


NSString * const kJBSStrokeAnimation = @"StrokeAnimation";
NSString * const kJBSEmitterAnimation = @"EmitterAnimation";
NSString * const kJBSSparkCellKey = @"SparkCell";
NSString * const kJBSSmokeCellKey = @"SmokeCell";

@implementation DrawStrokeLayer


- (id)initWithFrame:(CGRect)frame textFont:(UIFont *)font  textColor:(UIColor *)textColor showText:(NSString *)showText
{
    self = [self init];
    if (self) {
    
        self.frame = frame;
        
        self.textLabel.frame = self.bounds;
        
        self.textLabel.text = showText;
        
        self.textLabel.font = font;
        
        self.path = [self.textLabel createPathForText];
        self.lineWidth = 1;
        self.strokeColor = textColor.CGColor;
        self.fillColor = nil;
        self.geometryFlipped = YES;   // CAShapeLayer, will you marry me?
        self.opacity = 0;

        //[self setupEmitterLayer];
        
    }
    return self;
}

- (void)doAnimation:(CFTimeInterval)duration  withBeginTime:(CFTimeInterval)beginTime
{
    
    // Animate drawing of line
    self.opacity = 1;
    CABasicAnimation *stroke = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    stroke.duration = duration;
    stroke.beginTime = beginTime;
    stroke.fromValue = [NSNumber numberWithFloat:0];
    stroke.toValue = [NSNumber numberWithFloat:1];
    stroke.removedOnCompletion = NO;
    stroke.fillMode=kCAFillModeBoth;
    [self addAnimation:stroke forKey:kJBSStrokeAnimation];
    
//    // Adjust the emitter
//    self.emitterLayer.birthRate = 1;
//    
//    // Particle animation
//    CAKeyframeAnimation *sparkle = [CAKeyframeAnimation animationWithKeyPath:@"emitterPosition"];
//    sparkle.path = self.path;
//    sparkle.fillMode = kCAAnimationPaced;
//    sparkle.duration = duration;
//    [self.emitterLayer addAnimation:sparkle forKey:kJBSEmitterAnimation];
//    
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, duration * 0.95 * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        self.emitterLayer.birthRate = 0;
//    });
}


- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
     //   _textLabel.frame = CGRectMake(self.userImageView.right+15, self.userImageView.top, 140, 25);
        _textLabel.textColor = [UIColor darkGrayColor];

       // _textLabel.font = [UIFont systemFontOfSize:30.0];
        
        _textLabel.alpha = 0;
        
        [self addSublayer: _textLabel.layer];
    }
    return _textLabel;
}

#pragma mark - Particles

- (void)setupEmitterLayer
{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.emitterCells = [NSArray arrayWithObjects:[self sparkCell], [self smokeCell], nil];
    emitter.emitterShape = kCAEmitterLayerPoint;
    emitter.birthRate = 0;
    
    [self addSublayer:emitter];
    self.emitterLayer = emitter;
}

- (CAEmitterCell *)sparkCell
{
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    spark.contents = (__bridge id)[UIImage imageNamed:@"spark.png"].CGImage;
    spark.birthRate = 900;
    spark.lifetime = 3;
    spark.scale = 0.1;
    spark.scaleRange = 0.2;
    spark.emissionRange = 2 * M_PI;
    spark.velocity = 60;
    spark.velocityRange = 8;
    spark.yAcceleration = -200;
    spark.alphaRange = 0.5;
    spark.alphaSpeed = -1;
    spark.spin = 1;
    spark.spinRange = 6;
    spark.alphaRange = 0.8;
    spark.redRange = 2;
    spark.greenRange = 1;
    spark.blueRange = 1;
    [spark setName:kJBSSparkCellKey];
    return spark;
}

- (CAEmitterCell *)smokeCell
{
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    smoke.contents = (__bridge id)[UIImage imageNamed:@"smoke.png"].CGImage;
    smoke.birthRate = 5;
    smoke.lifetime = 20;
    smoke.scale = 0.1;
    smoke.scaleSpeed = 1;
    smoke.alphaRange = 0.5;
    smoke.alphaSpeed = -0.7;
    smoke.spin = 1;
    smoke.spinRange = 0.8;
    smoke.blueRange = 0.3;
    smoke.velocity = 10;
    smoke.yAcceleration = 100;
    [smoke setName:kJBSSmokeCellKey];
    return smoke;
}

@end
