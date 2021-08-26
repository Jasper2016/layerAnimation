//
//  AVCirleShapeLayer.m
//  AVCoreTest
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AVCirleShapeLayer.h"


#import "AVConstant.h"

#define DEGREES_TO_RADIANS2(d) (d * M_PI / 180)

@implementation AVCirleShapeLayer

- (id)initWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor;
{
    self = [self init];
    if (self) {
        
        self.frame = frame;
        
        self.fillColor = fillColor.CGColor;
        
        self.startAngle = 0;
        
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
    CGContextMoveToPoint(context, self.bounds.size.width/2, self.bounds.size.height/2);
    
    CGContextAddArc(context,
                    self.bounds.size.width/2,
                    self.bounds.size.height/2,
                    self.bounds.size.height/2,
                    DEGREES_TO_RADIANS2(0),
                    DEGREES_TO_RADIANS2(self.startAngle*360),
                    NO
                    );
    
    NSInteger _countComponents = CGColorGetNumberOfComponents(self.fillColor);
    
    if (_countComponents == 4) {
        
        const CGFloat *_components = CGColorGetComponents(self.fillColor);
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


@end
