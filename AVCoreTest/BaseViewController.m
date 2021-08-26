//
//  BaseViewController.m
//  AVCoreTest
//
//  Created by mac on 15/12/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"

#import "AVFundation.h"
#import "GifAnimationLayer.h"

#import "HotBasicAnimate.h"

#import "AVMediaComposionCommand.h"

#import "JNWSpringAnimation.h"

#import "AVColorTextLayer.h"

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    homeLayer = [CALayer layer];
    homeLayer.frame = CGRectMake( 0, 0, kAVWindowWidth, kAVWindowHeight);
    
    CGFloat scaleValue = self.view.frame.size.width/kAVWindowWidth;
    
    [homeLayer setValue:[NSNumber numberWithFloat:scaleValue] forKeyPath:@"transform.scale"];

    homeLayer.position =CGPointMake(self.view.center.x , self.view.center.y);
    
    [self.view.layer addSublayer: homeLayer];
    
    homeLayer.masksToBounds = YES;
    
    //[self testLiayer];

}

-(void)testLiayer
{
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    NSString *superStirng = @"<blue>                ❈</blue> <whitleS>WHEN I MET YOU </whitleS> \n <whitle>WHEN LOVE</whitle> <blue1B>MEET</blue1B> <whitle>LOVE</whitle>";
    
    AVColorTextLayer *textLayer = [[AVColorTextLayer alloc] initWithFrame:CGRectMake(10, 300, 500, 50)
                                                           attributedText:superStirng];
    
    
    [currentLayer addSublayer: textLayer];
    
    
}

-(void)maskBrothTransim
{
//    CFTimeInterval beginTime = [homeLayer convertTime:CACurrentMediaTime() fromLayer:nil]+1 ;
//    
//    CGFloat duration = 1;
    
    AVBasicLayer *currentLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                        vContentRect:kAVRectWindow
                                                           withImage:[UIImage imageNamed:@"0.png"]];
    
    [homeLayer addSublayer: currentLayer];
    
    
    AVBasicLayer *nextLayer = [[AVBasicLayer alloc] initWithFrame:kAVRectWindow
                                                     vContentRect:kAVRectWindow
                                                        withImage:[UIImage imageNamed:@"1.png"]];
    
    [homeLayer addSublayer: nextLayer];
    
    
    
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
