//
//  CAMultiColorLayer.m
//  TestSceneEffect
//
//  Created by mac on 15/3/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CAMultiColorLayer.h"

#import <UIKit/UIKit.h>

@implementation CAMultiColorLayer


#if 0
-(void)drawInContext:(CGContextRef)context
{

    for (NSInteger index =0; index < [self.colorArr count]; index++) {
        
        CGColorRef fillColor = (__bridge CGColorRef)([self.colorArr objectAtIndex:index]);
        
        NSValue *sideValue  = [self.sideArr objectAtIndex:index]; CGSize sideSize = [sideValue CGSizeValue];
        
        CGFloat borderOffset = (self.frame.size.width- sideSize.width)/2;
        
        CGFloat insideOffset = borderOffset+ sideSize.height;
        
       // CGContextRestoreGState(context);
        
        CGContextSetFillColorWithColor(context,fillColor);
        
        
        CGContextMoveToPoint(context, borderOffset, borderOffset);
        
        CGContextAddLineToPoint(context, self.frame.size.width-borderOffset, borderOffset);
        
        CGContextAddLineToPoint(context, self.frame.size.width-borderOffset, self.frame.size.height-borderOffset);
        
        CGContextAddLineToPoint(context, borderOffset, self.frame.size.height-borderOffset);
        
        
        CGContextMoveToPoint(context, insideOffset, insideOffset);
        
        CGContextAddLineToPoint(context, self.frame.size.width-insideOffset, insideOffset);
        
        CGContextAddLineToPoint(context, self.frame.size.width-insideOffset, self.frame.size.height-insideOffset);
        
        CGContextAddLineToPoint(context, insideOffset, self.frame.size.height-insideOffset);
        
        
        CGContextClosePath(context);
        
        CGContextDrawPath(context, kCGPathEOFill);
        
       // CGContextSaveGState(context);
    }
    
}
#else

-(void)drawInContext:(CGContextRef)context
{

    for (NSInteger index =0; index < [self.colorArr count]; index++) {
        

        CGColorRef fillColor = (__bridge CGColorRef)([self.colorArr objectAtIndex:index]);
        
        NSValue *sideValue  = [self.sideArr objectAtIndex:index]; CGSize sideSize = [sideValue CGSizeValue];
        
        CGFloat borderOffset = (self.frame.size.width- sideSize.width)/2;
        
        CGContextSetStrokeColorWithColor(context,fillColor);
        
        CGContextStrokeRectWithWidth(context, CGRectMake(borderOffset, borderOffset, sideSize.width, sideSize.width), sideSize.height);
        
    }
    
}
#endif



@end
