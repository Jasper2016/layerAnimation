//
//  ViewController.h
//  AVCoreTest
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 mac. All rights reserved.
//
#import "BaseViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import "AVPreEnginePlayer.h"

typedef void (^AVEngineCompositeBlock)(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL);

@interface ViewController : BaseViewController
{

    
    NSMutableAttributedString *attributedString;
}

@end

