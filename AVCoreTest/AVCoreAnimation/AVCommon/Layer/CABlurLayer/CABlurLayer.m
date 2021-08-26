//
//  CABlurLayer.m
//  AVCoreTest
//
//  Created by mac on 17/4/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CABlurLayer.h"

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kDuartionBlur @"duartionBlur"

@implementation CABlurLayer

@dynamic duartionBlur;

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:kDuartionBlur])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id)actionForKey:(NSString *) key
{
    if ([key isEqualToString:kDuartionBlur])
    {
        CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:key];
        theAnimation.fromValue = [self.presentationLayer valueForKey:key];
        return theAnimation;
    }
    return [super actionForKey:key];
}


-(void)drawInContext:(CGContextRef)context
{
  
    //if (self.duartionBlur < 100.0){
        
        CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, 100);
        CGContextConcatCTM(context, flipVertical);
        //CGContextTranslateCTM(context,0, -self.frame.origin.y);
        [[self  presentationLayer].superlayer renderInContext:context];
        
            UIImage *renderImage = UIGraphicsGetImageFromCurrentImageContext();
        
        //UIImage *renderImage = [self renderImageInLayer:self.superlayer renderRect:self.bounds];
        self.contents = (id)renderImage.CGImage;
   // }
}

- (UIImage *)renderImageInLayer:(CALayer *)bgLayer renderRect:(CGRect)renderRect
{
    UIGraphicsBeginImageContext(renderRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // center image
    CGContextTranslateCTM(context,0, -renderRect.origin.y);
    
    [bgLayer renderInContext:context];
    
    UIImage *renderImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return renderImage;
}

@end
