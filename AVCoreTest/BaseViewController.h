//
//  BaseViewController.h
//  AVCoreTest
//
//  Created by mac on 15/12/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import "AVPreEnginePlayer.h"

@interface BaseViewController : UIViewController
{
        CALayer *homeLayer ;
}

@property(nonatomic, strong) AVPreEnginePlayer  *avPlayer;
@end
