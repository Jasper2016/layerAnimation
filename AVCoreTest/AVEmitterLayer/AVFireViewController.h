//
//  AVFireViewController.h
//  AVCoreTest
//
//  Created by wanghaifei on 2017/12/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#import "AVPreEnginePlayer.h"

typedef void (^AVEngineCompositeBlock)(BOOL isSuccess, NSString *errorMsg, NSURL *videoURL);

@interface AVFireViewController : BaseViewController
{
    
}

@property(nonatomic, strong) AVPreEnginePlayer  *avPlayer;
@end
