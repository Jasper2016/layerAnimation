//
//  FireworksViewController.m
//  AVCoreTest
//
//  Created by xwxing on 2017/12/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FireworksViewController.h"
#import "AVBasicLayer.h"
#import "AVConstant.h"

@interface FireworksViewController ()

@end

@implementation FireworksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self animation1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//萤火虫动画
- (void)animation1 {
    
    //粒子发射器
    CAEmitterLayer *fireflyEmitter  = [CAEmitterLayer layer];
    //粒子发射的位置
    fireflyEmitter.emitterPosition  = CGPointMake(kAVWindowWidth/2.0, kAVWindowHeight);
    //发射源的大小
    fireflyEmitter.emitterSize      = CGSizeMake(kAVWindowWidth, 0.0);;
    //发射模式
    fireflyEmitter.emitterMode      = kCAEmitterLayerOutline;
    //发射源的形状
    fireflyEmitter.emitterShape     = kCAEmitterLayerLine;
    
    //创建粒子
    CAEmitterCell *fireflyFlake     = [CAEmitterCell emitterCell];
    //粒子的名称
    fireflyFlake.name = @"snow";
    //粒子参数的速度乘数因子。越大出现的越快
    fireflyFlake.birthRate          = 1.0;
    //存活时间
    fireflyFlake.lifetime           = 120.0;
    //粒子速度
    fireflyFlake.velocity           = -10;                // falling down slowly
    //粒子速度范围
    fireflyFlake.velocityRange      = 10;
    //粒子y方向的加速度分量
    fireflyFlake.yAcceleration      = -10;
    //周围发射角度
    fireflyFlake.emissionRange      = 0.5 * M_PI;        // some variation in angle
    //子旋转角度范围
    fireflyFlake.spinRange          = 0.25 * M_PI;        // slow spin
    //粒子图片
    fireflyFlake.contents           = (id) [[UIImage imageNamed:@"Oval_yellow"] CGImage];
    //粒子颜色
//    fireflyFlake.color            = [[UIColor redColor] CGColor];
    
    //设置阴影
    fireflyEmitter.shadowOpacity    = 1.0;
    fireflyEmitter.shadowRadius     = 0.0;
    fireflyEmitter.shadowOffset     = CGSizeMake(0.0, 1.0);
    fireflyEmitter.shadowColor      = [[UIColor whiteColor] CGColor];
    
    // 将粒子添加到粒子发射器上
    fireflyEmitter.emitterCells = [NSArray arrayWithObject:fireflyFlake];
    [homeLayer insertSublayer:fireflyEmitter atIndex:0];
}

//烟花动画
- (void)animation2 {
    // Cells spawn in the bottom, moving up
    
    //分为3种粒子，子弹粒子，爆炸粒子，散开粒子
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = homeLayer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize    = CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode    = kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape    = kCAEmitterLayerLine;
    fireworksEmitter.renderMode        = kCAEmitterLayerAdditive;
    fireworksEmitter.seed = (arc4random()%100)+1;
    
    NSMutableArray *arr = @[].mutableCopy;
    NSArray *images = @[@"Oval_red",@"Oval_yellow",@"Oval_purple",@"Oval_orange"];
    for (int i = 0 ;i<4;i++) {
        UIImage *image = [UIImage imageNamed:images[i]];
        
        CAEmitterCell *rocket   = [CAEmitterCell emitterCell];
        rocket.birthRate        = 1.0;
        rocket.emissionRange    = 0.25 * M_PI;  // some variation in angle
        rocket.velocity         = 380;
        rocket.velocityRange    = 100;
        rocket.yAcceleration    = 75;
        rocket.lifetime         = 1.02;         // we cannot set the birthrate <
        rocket.contents         = (id)[image CGImage];
        rocket.scale            = 0.2;
        rocket.spinRange        = M_PI;         // slow spin
        
        CAEmitterCell *burst    = [CAEmitterCell emitterCell];

        burst.birthRate         = 1.0;          // at the end of travel
        burst.velocity          = 0;            //速度为0
        burst.scale             = 2.5;          //大小
        burst.lifetime          = 0.35;         //存在时间
        
        CAEmitterCell *spark    = [CAEmitterCell emitterCell];
        spark.birthRate         = 400;
        spark.velocity          = 125;
        spark.emissionRange     = 2* M_PI;      // 360 度
        spark.yAcceleration     = 75;           // 粒子y方向的加速度分量
        spark.lifetime          = 3;
        spark.contents          = (id)[image CGImage];
        spark.scaleSpeed        = -0.2;
        spark.alphaSpeed        = -0.25;
        spark.spin              = 2* M_PI;
        spark.spinRange         = 2* M_PI;
        
        [arr addObject:rocket];
        rocket.emitterCells                = [NSArray arrayWithObject:burst];
        burst.emitterCells                = [NSArray arrayWithObject:spark];
    }
    fireworksEmitter.emitterCells    = arr;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:homeLayer.bounds withImage:[UIImage imageNamed:@"red_bg"]];
    [homeLayer addSublayer:currentLayer];
    [currentLayer addSublayer:fireworksEmitter];
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
