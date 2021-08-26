//
//  WPHotspotLabel.m
//  WPAttributedMarkupDemo
//
//  Created by Nigel Grange on 20/10/2014.
//  Copyright (c) 2014 Nigel Grange. All rights reserved.
//

#import "WPHotspotLabel.h"
#import "WPAttributedStyleAction.h"

#import <CoreText/CoreText.h>
#import "AVCommonHeader.h"

#import "AVSceneAniEnumType.h"

@implementation WPHotspotLabel


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addHotspotHandler];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addHotspotHandler];
    
    }
    return self;
}

-(void)addHotspotHandler
{
    __weak WPHotspotLabel* weakSelf = self;
    [self setOnTap:^(CGPoint pt) {
        // Locate the text attributes at the touched position
        NSDictionary* attributes = [weakSelf textAttributesAtPoint:pt];
        // If the touched attributes contains our custom action style, execute the action block
        WPAttributedStyleAction* actionStyle = attributes[@"WPAttributedStyleAction"];
        if (actionStyle) {
            actionStyle.action();
        }
    }];
}

-(CALayer *)maskLayer
{
    if (!_maskLayer) {
        
        _maskLayer =[[CALayer alloc] init];
        
        _maskLayer.frame =self.bounds;
        
        _maskLayer.backgroundColor = [UIColor redColor].CGColor;
        
        //[self.layer addSublayer: _maskLayer];
    }
    
    return _maskLayer;
}

-(NSDictionary*)textAttributesAtPoint:(CGPoint)pt
{
    // Locate the attributes of the text within the label at the specified point
    NSDictionary* dictionary = nil;
    
    // First, create a CoreText framesetter
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);
    
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    // Get the frame that will do the rendering.
    CFRange currentRange = CFRangeMake(0, 0);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);

    // Get each of the typeset lines
    NSArray *lines = (__bridge id)CTFrameGetLines(frameRef);
    
    CFIndex linesCount = [lines count];
    CGPoint *lineOrigins = (CGPoint *) malloc(sizeof(CGPoint) * linesCount);
    CTFrameGetLineOrigins(frameRef, CFRangeMake(0, linesCount), lineOrigins);
    
    CTLineRef line = NULL;
    CGPoint lineOrigin = CGPointZero;
    
    // Correct each of the typeset lines (which have origin (0,0)) to the correct orientation (typesetting offsets from the bottom of the frame)
    
    CGFloat bottom = self.frame.size.height;
    for(CFIndex i = 0; i < linesCount; ++i) {
        lineOrigins[i].y = self.frame.size.height - lineOrigins[i].y;
        bottom = lineOrigins[i].y;
    }
    
    // Offset the touch point by the amount of space between the top of the label frame and the text
    pt.y -= (self.frame.size.height - bottom)/2;
    
    
    // Scan through each line to find the line containing the touch point y position
    for(CFIndex i = 0; i < linesCount; ++i) {
        line = (__bridge CTLineRef)[lines objectAtIndex:i];
        lineOrigin = lineOrigins[i];
        CGFloat descent, ascent;
        CGFloat width = CTLineGetTypographicBounds(line, &ascent, &descent, nil);
        
        if(pt.y < (floor(lineOrigin.y) + floor(descent))) {
            
            // Cater for text alignment set in the label itself (not in the attributed string)
            if (self.textAlignment == NSTextAlignmentCenter) {
                pt.x -= (self.frame.size.width - width)/2;
            } else if (self.textAlignment == NSTextAlignmentRight) {
                pt.x -= (self.frame.size.width - width);
            }
            
            // Offset the touch position by the actual typeset line origin. pt is now the correct touch position with the line bounds
            pt.x -= lineOrigin.x;
            pt.y -= lineOrigin.y;
            
            // Find the text index within this line for the touch position
            CFIndex i = CTLineGetStringIndexForPosition(line, pt);
            
            // Iterate through each of the glyph runs to find the run containing the character index
            NSArray* glyphRuns = (__bridge id)CTLineGetGlyphRuns(line);
            CFIndex runCount = [glyphRuns count];
            for (CFIndex run=0; run<runCount; run++) {
                CTRunRef glyphRun = (__bridge CTRunRef)[glyphRuns objectAtIndex:run];
                CFRange range = CTRunGetStringRange(glyphRun);
                if (i >= range.location && i<= range.location+range.length) {
                    dictionary = (__bridge NSDictionary*)CTRunGetAttributes(glyphRun);
                    break;
                }
            }
            if (dictionary) {
                break;
            }
        }
    }
    
    free(lineOrigins);
    CFRelease(frameRef);
    CFRelease(framesetter);
    
    
    return dictionary;
}

-(void)playText:(CFTimeInterval)duration beginTime:(CFTimeInterval)beginTime aniFactor:(NSInteger)aniFactor
{
    switch (aniFactor) {
            
        case AVArtAniTextPlay:
        {
            self.layer.mask = self.maskLayer;
            
            CGPoint startPosition = CGPointMake(-(self.frame.size.width/2), self.frame.size.height/2);
            
            CGPoint nextPosition = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
            
            CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:beginTime fromValue:startPosition toValue:nextPosition];
            
            [self.maskLayer addAnimation: moveAni forKey:@"moveAni"];
            
            break;
        }
            
        case AVArtAniTextStandstill:
        {
        
            break;
        }
            
        case AVArtAniTextBottomToCenter:
        {
            self.opaque= 0;
        
            CGPoint startCenterPoint = self.layer.position;
            
            CGPoint endCenterPoint =CGPointMake(startCenterPoint.x, startCenterPoint.y+200);
            
            CABasicAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration withBeginTime:0 fromValue:endCenterPoint toValue:startCenterPoint];
            
            CABasicAnimation *opacityOpen = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration*0.6 withBeginTime:0];

            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,opacityOpen]];
            
            [self.layer addAnimation:animationGroup forKey:@"animationGroup"];
            break;
        }
            
        default:
            break;
            
    }
    
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
