//
//  AVLineLayer.m
//  AVCoreTest
//
//  Created by mac on 2017/10/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AVLineLayer.h"
#import <UIKit/UIKit.h>

@implementation AVLineLayer

- (id)initWithFrame:(CGRect)frame bgColor:(CGColorRef)colorRef
{
    self = [self init];
    if (self) {

        
        self.frame = frame;
        
        if (colorRef) {
            
            self.backgroundColor = colorRef;
            
            self.rasterizationScale= [UIScreen mainScreen].scale;
            
          // self.shouldRasterize = YES;
            
            self.masksToBounds = YES;
            self.allowsEdgeAntialiasing = YES;
        }
        
        
    }
    return self;
}

@end
