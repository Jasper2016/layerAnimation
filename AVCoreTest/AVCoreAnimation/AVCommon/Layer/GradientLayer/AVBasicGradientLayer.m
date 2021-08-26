//
//  AVBasicGradientLayer.m
//  AVCoreTest
//
//  Created by mac on 16/2/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AVBasicGradientLayer.h"

@implementation AVBasicGradientLayer

- (id)initWithFrame:(CGRect)frame
         colorsList:(NSArray *)colorsList
       locationList:(NSArray *)locationList
         startPoint:(CGPoint)startPoint
           endPoint:(CGPoint)endPoint
{
    self = [self init];
    if (self) {
        
        //self.opacity =0.0f;
        
        self.frame = frame;
        
        self.colors = colorsList;
        
        self.locations = locationList;
        
        self.startPoint = startPoint;
        
        self.endPoint = endPoint;
        
    }
    return self;
}

@end
