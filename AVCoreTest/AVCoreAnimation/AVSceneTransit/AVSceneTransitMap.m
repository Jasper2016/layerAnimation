//
//  AVSceneTransitMap.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/9.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSceneTransitMap.h"

@implementation AVSceneTransitMap

+(CGVector)getScaleRadio:(CGRect)faceAwareRect partArea:(CGRect)partArea
{
    CGFloat radioWidth =  faceAwareRect.size.width/partArea.size.width;
    
    CGFloat radioHight =  faceAwareRect.size.height/partArea.size.height;
    
    CGVector radio = CGVectorMake(radioWidth, radioHight);
    
    return radio;
}

+(CAAnimationGroup *) transitMap:(CFTimeInterval)beginTime transiteDTO:(AVSTransiteDTO *)transiteDTO
{
    CGFloat duration = transiteDTO.STFullDuration;
    
    if (!transiteDTO.STParameters) {
        NSLog(@"transitMap");
    }

    CGRect startFrame = [[transiteDTO.STParameters objectForKey: KAVMapStartRectKey] CGRectValue];
    CGRect topFrame = [[transiteDTO.STParameters objectForKey: KAVMapTopRectKey] CGRectValue];
    
    NSMutableArray *rectList = [[NSMutableArray alloc] init];
    
    [rectList addObject: [NSValue valueWithCGRect:startFrame]];
    
    CGFloat offsetX =  ((topFrame.origin.x-KAVMapIntervalOffset)<0)?topFrame.origin.x:topFrame.origin.x-KAVMapIntervalOffset;
    
    [rectList addObject: [NSValue valueWithCGRect:CGRectMake(offsetX, 0, CGRectGetWidth(kAVRectWindow), CGRectGetHeight(kAVRectWindow))]];
    
    [rectList addObject: [NSValue valueWithCGRect:topFrame]];
    
    [rectList addObject: [NSValue valueWithCGRect:topFrame]];
    
     CGFloat endOffsetX =  ((topFrame.origin.x-KAVMapIntervalOffset)<0)?topFrame.origin.x:topFrame.origin.x+KAVMapIntervalOffset;
    
    CGRect endFrame = CGRectMake(endOffsetX, 0, CGRectGetWidth(kAVRectWindow), CGRectGetHeight(kAVRectWindow));
    
    [rectList addObject: [NSValue valueWithCGRect:endFrame]];
    
    
    
    NSMutableArray *keyValues  = [[NSMutableArray alloc] init];
    
    NSMutableArray *scaleKeyValues  = [[NSMutableArray alloc] init];
    
    
    for (NSInteger index =0; index <[rectList count]; index++) {
        
        CGRect startArea = [[rectList objectAtIndex:index] CGRectValue];
        
        ScaleEndCenterRadio startParma = [AVRectUnit getScaleEndAreaCenter:startArea contendRect:kAVRectWindow];
        
//        CGVector startParma = [self getScaleRadio:kAVRectWindow partArea:startArea];
//        
//        //start
//        CGPoint startCenterPoint= [AVRectUnit getScaleEndCenterPoint:startParma startFrame:startArea endFrame:kAVRectWindow];
        
        [keyValues addObject: [NSValue valueWithCGPoint:startParma.center]];
        
        [scaleKeyValues addObject:[NSNumber numberWithFloat:startParma.radio]];
        
        // [keyTime addObject:[NSNumber numberWithFloat:factor*(index+0)]];
        
    }
    
    NSArray *keyTime = @[[NSNumber numberWithFloat:0.0],
                         [NSNumber numberWithFloat:0.2],
                         [NSNumber numberWithFloat:0.3],
                         [NSNumber numberWithFloat:0.9],
                         [NSNumber numberWithFloat:1.0]
                                ];
    
    CAKeyframeAnimation *moveCenter1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniPosition values:keyValues keyTimes:keyTime];
    
    CAKeyframeAnimation *saleTo1 = [[AVBasicRouteAnimate defaultInstance] customKeyframe:duration withBeginTime:0  propertyName:kAVBasicAniTransformScale values:scaleKeyValues keyTimes:keyTime];
    
    CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[moveCenter1,saleTo1]];
    animationGroup.fillMode = kCAFillModeForwards;
    
   // [currentLayer.contentLayer addAnimation:animationGroup forKey:kGetRandomString];
    
    return animationGroup;

}

@end
