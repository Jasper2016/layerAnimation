//
//  AVBasicGradientLayer.h
//  AVCoreTest
//
//  Created by mac on 16/2/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AVBasicGradientLayer : CAGradientLayer
{
    
}

- (id)initWithFrame:(CGRect)frame
         colorsList:(NSArray *)colorsList
       locationList:(NSArray *)locationList
         startPoint:(CGPoint)startPoint
           endPoint:(CGPoint)endPoint;
@end
