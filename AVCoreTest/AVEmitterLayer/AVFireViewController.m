//
//  AVFireViewController.m
//  AVCoreTest
//
//  Created by wanghaifei on 2017/12/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AVFireViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "AVConstant.h"

#import "AVMediaComposionCommand.h"


@interface AVFireViewController ()
@property (nonatomic,strong)CAEmitterLayer * emitterLayer;
@property (nonatomic,strong) UIImageView * imageViewBG;

@end

@implementation AVFireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.imageViewBG = [[UIImageView alloc]init];
    self.imageViewBG.image = [UIImage imageNamed:@"yanhuoBG"];
    self.imageViewBG.frame = CGRectMake(0, 100, kDeviceWidth, kDeviceWidth);
    [self.view addSubview:self.imageViewBG];
    
    
    [self fireBeautiful];
//    [self testAVMusicPlayAtTimeView];
    
   // [self performSelector:@selector(exportVideo) withObject:nil afterDelay:6];
}


-(void)testAVMusicPlayAtTimeView
{
    //
    NSString *MP3URL = [[NSBundle mainBundle] pathForResource:@"tst" ofType:@"mp3"];
    //
    self.avPlayer = [[AVPreEnginePlayer alloc] initWithFrame:homeLayer.bounds
                                                  witchMusic: [NSURL fileURLWithPath:MP3URL]];
    
    [self.view addSubview : self.avPlayer];
    
    CGFloat scaleValue = kDeviceWidth/kAVWindowWidth;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
    
    self.avPlayer.transform = transform;
    
    self.avPlayer.center =  CGPointMake(kDeviceWidth/2, kDeviceWidth/2);
    
    
    
    self.imageViewBG = [[UIImageView alloc]init];
    self.imageViewBG.image = [UIImage imageNamed:@"yanhuoBG"];
    self.imageViewBG.frame = self.avPlayer.animateLayer.bounds;
    [self.avPlayer.animateLayer  addSublayer:self.imageViewBG.layer];
    
    
    [self fireBeautiful];
    
    
    ///[self.avPlayer playNewAtTime:0 totalTime:6];
    
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

-(void) fireBeautiful
{
    
    CGFloat startX = [UIScreen mainScreen].bounds.size.width/2;
    
    for (int i=0; i<=8; i++) {
      
        CAEmitterLayer * emitterLayerOne = [self CreateWithPosition:CGPointMake(startX/1.5, kDeviceWidth) WithSize:CGSizeMake(20, 20)];
        
        CAEmitterCell *cell             = [self CeateEmittercCell];
    
        // 爆炸
        CAEmitterCell *burst            = [self CeateBurstCell];
        // 火花 and finally, the sparks
        CAEmitterCell *spark            = [self CeateSparkCell];
        
        emitterLayerOne.emitterCells = [NSArray arrayWithObject:cell];//每一个显示都是有逻辑关系，发射的layer ---->>爆炸的layer 爆炸的layer----->>>火花的layer
        cell.emitterCells = [NSArray arrayWithObjects:burst, nil];
        
        burst.emitterCells = [NSArray arrayWithObject:spark];
      
        [self.imageViewBG.layer addSublayer:emitterLayerOne];
        
        startX +=20;
        
    }

    
}

-(CAEmitterCell *)CeateEmittercCell
{
    CAEmitterCell *cell             = [CAEmitterCell emitterCell];
    // 速率
    cell.birthRate                  = 0.6;
    // 发射的角度
    cell.emissionRange              = 0.11 * M_PI;
    // 速度
    cell.velocity                   = 235;
    // 范围
    cell.velocityRange              = kAVWindowHeight-100;
    // Y轴 加速度分量
    cell.yAcceleration              = 75;
    // 声明周期
    cell.lifetime                   = 1.04;
    //是个CGImageRef的对象,既粒子要展现的图片
    cell.contents                   = (id)
    [[UIImage imageNamed:@"111"] CGImage];
    // 缩放比例
    cell.scale                      = 0.2;
    // 子旋转角度范围
    cell.spinRange                  = M_PI;
    
    return cell;
    
}


-(CAEmitterCell *)CeateBurstCell
{
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 1.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 2.5;
    //生命周期
    burst.lifetime                  = 0.35;
    
    return burst;
}

-(CAEmitterCell *)CeateSparkCell
{
    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
    //粒子产生系数，默认为1.0
    spark.birthRate                 = 1000;
    //速度
    spark.velocity                  = 125;
    // 360 deg//周围发射角度
    spark.emissionRange             = 2 * M_PI;
    // gravity//y方向上的加速度分量
    spark.yAcceleration             = 75;
    //粒子生命周期
    spark.lifetime                  = 4;
    //是个CGImageRef的对象,既粒子要展现的图片
    spark.contents                  = (id)
    [[UIImage imageNamed:@"333"] CGImage];
    //缩放比例速度
    spark.scaleSpeed                = -0.2;
    //粒子透明度在生命周期内的改变速度
    spark.alphaSpeed                = -0.25;
    //子旋转角度
    spark.spin                      = 2* M_PI;
    //子旋转角度范围
//    spark.spinRange                 = 2* M_PI;
    
    return spark;
    
}



- (CAEmitterLayer *)CreateWithPosition:(CGPoint )aPoint WithSize:(CGSize )size
{
   CAEmitterLayer * aEmitterLayer =  [CAEmitterLayer layer];
    aEmitterLayer.emitterPosition = aPoint;
    aEmitterLayer.emitterSize = size;
    aEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    aEmitterLayer.emitterShape = kCAEmitterLayerLine;
    aEmitterLayer.renderMode=kCAEmitterLayerAdditive;
    aEmitterLayer.velocity=1;
    //随机产生粒子
    aEmitterLayer.seed=arc4random()%100+10;
    
    return aEmitterLayer;
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
