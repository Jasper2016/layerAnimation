//
//  AVChartColorLayer.m
//  AVCoreTest
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AVChartColorLayer.h"

#import <UIKit/UIKit.h>

#define DEGREES_TO_RADIANS3(d) (d * M_PI / 180)

@implementation AVChartColorLayer

- (id)initWithFrame:(CGRect)frame colorList:(NSArray *)colorList;
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
    
        self.startAngle = 0;
        
        self.colorList = colorList;
        
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"startAngle"])
    {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

- (id)actionForKey:(NSString *) key
{
    if ([key isEqualToString:@"startAngle"])
    {
        CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:key];
        theAnimation.fromValue = [self.presentationLayer valueForKey:key];
        return theAnimation;
    }
    return [super actionForKey:key];
}


- (void)drawInContext:(CGContextRef)context
{
    NSArray *colostLisgt =@[
                            [[UIColor redColor]colorWithAlphaComponent:0.6],
                            [[UIColor greenColor]colorWithAlphaComponent:0.6],
                            [[UIColor blueColor]colorWithAlphaComponent:0.6],
                            [[UIColor yellowColor]colorWithAlphaComponent:0.6],
                            [[UIColor magentaColor]colorWithAlphaComponent:0.6],
                            ];
    

    float startAngle = - M_PI_2;
    float endAngle = 0.0f;
    
    float idenx = 0;  float value = 0;
    
    NSInteger sum = [colostLisgt count];

    
    CGContextMoveToPoint(context, self.bounds.size.width/2, self.bounds.size.height/2);
    
    for (int i = 0; i < 5; i++)
    {

        endAngle = startAngle + M_PI*2*value/sum;

        endAngle = startAngle + M_PI*2*idenx/sum;

        CGContextAddArc(context,
                        self.bounds.size.width/2,
                        self.bounds.size.height/2,
                        self.bounds.size.height/2,
                        startAngle,
                        endAngle,
                        NO
                        );

        UIColor *orightColor = colostLisgt[i];

        
        CGColorRef fillchartColor =orightColor.CGColor;
        
        NSInteger _countComponents = CGColorGetNumberOfComponents(fillchartColor);
        
        if (_countComponents == 4) {
            
            const CGFloat *_components = CGColorGetComponents(fillchartColor);
            CGFloat red     = _components[0];
            CGFloat green = _components[1];
            CGFloat blue   = _components[2];
            CGFloat alpha = _components[3];
            
            CGContextSetRGBFillColor(context, red, green, blue, alpha);
        }else{
            
            CGContextSetRGBFillColor(context, 1, 1, 0, 1);
        }
        
        
        CGContextFillPath(context);
        
    }
        
}



@end
