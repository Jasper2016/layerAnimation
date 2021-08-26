//
//  AVMaskBaiscLayer.m
//  TestVideoPreViewing
//
//  Created by mac on 15/5/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVMaskBaiscLayer.h"

#import <UIKit/UIKit.h>

@implementation AVMaskBaiscLayer

- (id)initWithFrame:(CGRect)frame maskDirType:(AVMaskDirType)dirType
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        self.frame = frame;
        
        self.colors = @[(__bridge id)[UIColor blackColor].CGColor, (__bridge id)[UIColor clearColor].CGColor];
        
        
        switch (dirType) {
            case AVAniXYRightToLeft:
            {
                self.startPoint = CGPointMake(1, 0.5); // 结束点
                self.endPoint = CGPointMake(0, 0.5);
                break;
            }
                
            case AVAniXYLeftToRight:
            {
                self.startPoint = CGPointMake(0, 0.5); // 结束点
                self.endPoint = CGPointMake(1, 0.5);
                break;
            }
                
            case AVAniXYTopToBottom:
            {
                self.startPoint = CGPointMake(0.5, 0); // 结束点
                self.endPoint = CGPointMake(0.5, 1);
                break;
            }
                
            case AVAniXYBottomToTop:
            {
                self.startPoint = CGPointMake(0.5, 1); // 结束点
                self.endPoint = CGPointMake(0.5, 0);
                break;
            }
                
            default:
                break;
        }
        
        self.locations = @[@0.9, @1.0];
        
    }
    return self;
}

@end
