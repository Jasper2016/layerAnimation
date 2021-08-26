//
//  AVSceneTransiteShapeGeometry.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/13.
//  Copyright (c) 2015年 mac. All rights reserved.
// duration: 1.0f

#import "AVSceneTransiteShapeGeometry.h"

#import "AVSceneTransitEnumType.h"

#import "AVCommonHeader.h"

#import "AVConstant.h"

#import "ThrindLibHeader.h"

#import "UIBezierPath+BasicShapes.h"

#import "AVStaticFunc.h"

#import "AVRectUnit.h"

#define kBridWith       160

#define kBridoffsetY        16

@implementation AVSceneTransiteShapeGeometry

+(void)sceneShapeGeometry:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor aniParameter:(NSDictionary *)aniParameter currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer  aniRootLayer:(CALayer *)rootLayer
{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    shapeLayer.opacity = 0.0f;
    shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
   // [nextLayer addSublayer: shapeLayer];
    
    
    
    switch (transiteFactor) {
        case AVSTShapeGeometryARCToFull:
        {
            if (aniParameter ==nil) {
                NSLog(@"AVSceneAniCameraPath nil");
            }
            
            FaceRectMode faceAwareRect = [AVRectUnit hasOrNotFaceAwareRectMode:aniParameter contendRect:kAVRectWindow];

            faceAwareRect.windowsCenter.x +=200;
            
            CGPoint startPiont = faceAwareRect.windowsCenter;
            
            [rootLayer addSublayer: nextLayer];
            
            CALayer *backLayer = [CALayer layer];
            backLayer.backgroundColor = [UIColor blackColor].CGColor;
            backLayer.frame = currentLayer.bounds;
            [currentLayer addSublayer: backLayer];
            backLayer.opacity = 0.0f;
            CABasicAnimation *opacitBgyIn = [[AVBasicRouteAnimate defaultInstance] opacityFromTo:kOpacityDuration withBeginTime:beginTime fromValue:0 toValue:0.5];
            [backLayer addAnimation:opacitBgyIn forKey:@"opacityIn"];
            
            
            CGPoint customCenter = startPiont;
            
            CGFloat radius = 100;
            
           CGPoint arcCenter = CGPointMake(radius, radius);
            
            CGPoint endCenter = CGPointMake(customCenter.x+((currentLayer.position.x-customCenter.x)*2), customCenter.y+((currentLayer.position.y-customCenter.y)*2));

            
            UIBezierPath *startPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                                          radius:radius
                                                                      startAngle:DEGREES_TO_RADIANS(0)
                                                                        endAngle:DEGREES_TO_RADIANS(360)
                                                                       clockwise:YES];
            
            UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter: arcCenter
                                                                     radius:radius*10
                                                                 startAngle:DEGREES_TO_RADIANS(0)
                                                                   endAngle:DEGREES_TO_RADIANS(360)
                                                                  clockwise:YES];
            
            
            [startPath addLineToPoint:arcCenter];
            [startPath closePath];
            
            shapeLayer.path = startPath.CGPath;
            shapeLayer.frame = CGRectMake(0, 0, radius*3, radius*3);
            shapeLayer.position = customCenter;
            
            CABasicAnimation *opacityIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:kSceneAniParamNot];
            
            CABasicAnimation *arcToFullAni = [[AVBasicRouteAnimate defaultInstance] customBasic:duration-kOpacityDuration withBeginTime:kBTimeOffset(0,kOpacityDuration+0.25) fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:kAVBasicAniPath];
            
            CABasicAnimation *moveToCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:duration-kOpacityDuration-0.3 withBeginTime:kBTimeOffset(0,kOpacityDuration+0.3) toValue:endCenter];

            
            CAAnimationGroup *animationGroup = [[AVBasicRouteAnimate defaultInstance] groupAni:duration withBeginTime:beginTime aniArr: @[opacityIn,moveToCenterAni,arcToFullAni]];

            [shapeLayer addAnimation: animationGroup forKey:@"animationGroup"];

            [nextLayer.contentLayer setMask: shapeLayer];
            
            break;
        }
            
        case AVSTShapeGeometryMoveRectangularoFull:
        {
            CGFloat birdLayerHight = kAVWindowHeight/5;
            
            CALayer *bgLayer = [CALayer layer];
            bgLayer.backgroundColor = [UIColor whiteColor].CGColor;
            bgLayer.frame = CGRectMake(-kAVWindowWidth, birdLayerHight,kAVWindowWidth, birdLayerHight*3);
            
            [rootLayer addSublayer:bgLayer];
            
            UIBezierPath *startPath = [UIBezierPath bezierPath];
            
            // Set the starting point of the shape.
            [startPath moveToPoint:CGPointMake(0, birdLayerHight+kBridoffsetY)];
            
            // Draw the lines
            [startPath addLineToPoint:CGPointMake(kAVWindowWidth-32, birdLayerHight+kBridoffsetY)];
            [startPath addLineToPoint:CGPointMake(kAVWindowWidth, bgLayer.frame.size.height-kBridoffsetY+48)];
            [startPath addLineToPoint:CGPointMake(0,   bgLayer.frame.size.height-kBridoffsetY+48)];
            
            [startPath closePath];
            
            UIBezierPath *endPath = [UIBezierPath bezierPath];
            
            // Set the starting point of the shape.
            [endPath moveToPoint:CGPointMake(0, 0)];
            
            // Draw the lines
            [endPath addLineToPoint:CGPointMake(kAVWindowWidth,0)];
            [endPath addLineToPoint:CGPointMake(kAVWindowWidth, kAVWindowHeight)];
            [endPath addLineToPoint:CGPointMake(0,  kAVWindowHeight)];
            
            [endPath closePath];
            
            shapeLayer.path = startPath.CGPath;
            shapeLayer.frame = kAVRectWindow;
            shapeLayer.position = bgLayer.position;
            shapeLayer.opacity = 1.0f;
            
            [rootLayer addSublayer: nextLayer];
            [nextLayer setMask: shapeLayer];
            
            CABasicAnimation *moveToCenterAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:kBirdAciteDuration withBeginTime:beginTime fromValue:CGPointMake(shapeLayer.position.x,kAVWindowCenter.y) toValue:kAVWindowCenter];
            
            
            CABasicAnimation *arcToFullAni = [[AVBasicRouteAnimate defaultInstance] customBasic:kBirdAciteDuration withBeginTime:kBTimeOffset(beginTime,kBirdAciteDuration+0.3) fromValue:(id)startPath.CGPath toValue:(id)endPath.CGPath propertyName:kAVBasicAniPath];
            
            
            [bgLayer addAnimation:moveToCenterAni forKey:@"moveToCenterAni"];
            
            [bgLayer addAnimation:arcToFullAni forKey:@"arcToFullAni"];
            
            
            
            [shapeLayer addAnimation:moveToCenterAni forKey:@"moveToCenterAni"];
            
            [shapeLayer addAnimation:arcToFullAni forKey:@"arcToFullAni"];
            
            break;
        }
            
        case AVSTShapeGeometryFiveStarToFull:
        {
            [rootLayer addSublayer: nextLayer];
            
            [self ShapeGeometryCommon:duration withBeginTime:beginTime sceneTransiteFactor:transiteFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSTShapeGeometryLoveHeartToFull:
        {
            [rootLayer addSublayer: nextLayer];
            
            [self ShapeGeometryCommon:duration withBeginTime:beginTime sceneTransiteFactor:transiteFactor currentLayer:currentLayer nextLayer:nextLayer aniRootLayer:rootLayer];
            
            break;
        }
            
        case AVSTShapeGeometryTwoARCToFull:  //1.5s
        {
            [rootLayer addSublayer: nextLayer];
            
            AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5].CGColor];
            
            [currentLayer addSublayer: bgLayer];
            bgLayer.opacity = 0;
            
            CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime+0.3];
            
            [bgLayer addAnimation: openIn forKey:@"oepnId"];
            
            
            CAShapeLayer  *bothLayer = [self createShape:YES lineWidth:60];
            
            [currentLayer addSublayer: bothLayer];
            
            CAShapeLayer  *maskLayer =  [self createShape:NO lineWidth:60];
            
            [nextLayer setMask: maskLayer];
            
            CATransform3D starttransform = CATransform3DMakeScale(0.0, 0.0, 1.0);
            
            CATransform3D endtransform = CATransform3DMakeScale(2.4, 2.4, 1.0);
            
            //  tempLayer.transform = starttransform;
            
            CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime fromValue:starttransform toValue:endtransform];
            
            [maskLayer addAnimation: saleToOne forKey:@"sale"];
            
            [bothLayer addAnimation: saleToOne forKey:@"sale"];
            
            //end
            
            if (YES) {
                CAShapeLayer  *bothLayer = [self createShape:YES lineWidth:100];
                
                [currentLayer addSublayer: bothLayer];
                
                CAShapeLayer  *maskLayer =  [self createShape:NO lineWidth:100];
                
                [nextLayer setMask: maskLayer];
                
                CATransform3D starttransform = CATransform3DMakeScale(0.0, 0.0, 1.0);
                
                CATransform3D endtransform = CATransform3DMakeScale(1.5, 1.5, 1.0);
                
                //  tempLayer.transform = starttransform;
                
                CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime+0.3 fromValue:starttransform toValue:endtransform];
                
                [maskLayer addAnimation: saleToOne forKey:@"sale"];
                
                [bothLayer addAnimation: saleToOne forKey:@"sale"];
            }

            break;
        }
            
        case AVSTShapeGeometryMoreARCRoundShow: //1.2s +0.2
        {
            [rootLayer addSublayer: nextLayer];
            
            AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.5].CGColor];
            
            [currentLayer addSublayer: bgLayer];
            bgLayer.opacity = 0;
            
            CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:0.8 withBeginTime:beginTime+0.5];
            
            [bgLayer addAnimation: openIn forKey:@"oepnId"];
            
            AVBasicLayer *maskBg = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColor clearColor].CGColor];
            
            [nextLayer.contentLayer setMask: maskBg];
            
            NSArray *lineWidthList = @[
                                       [NSNumber numberWithInteger:95],
                                       [NSNumber numberWithInteger:38],
                                       [NSNumber numberWithInteger:41],
                                       [NSNumber numberWithInteger:110],
                                       ];
            
            NSArray *frameList = @[
                                   [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(405), kAVLeftOffset(405), 440, 440)],
                                   [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(312), kAVLeftOffset(370), 315, 315)],
                                   [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(310), kAVLeftOffset(310), 250, 250)],
                                   [NSValue valueWithCGRect:CGRectMake(kAVLeftOffset(380), kAVLeftOffset(100), 110, 110)],
                                   ];
            
            for (NSInteger index =0; index <[frameList count]; index++) {
                //for (NSInteger index =1; index <2; index++) {
                
                NSValue *sideValue  = [frameList objectAtIndex:index]; CGRect roundFrame = [sideValue CGRectValue];
                
                NSNumber *lineValue = [lineWidthList objectAtIndex:index]; NSInteger toWidth = [lineValue integerValue];
                
                CAShapeLayer  *bothLayer = [self createRoundShape:YES roundRect:roundFrame lineWidth:10 ];
                
                [currentLayer addSublayer: bothLayer];
                
                CAShapeLayer  *maskLayer =  [self createRoundShape:NO roundRect:roundFrame lineWidth:10];
                
                [maskBg addSublayer: maskLayer];
                
                if (index !=2) {
                    CATransform3D rotate45s = CATransform3DMakeRotation(M_PI_2*index, 0, 0, 1);
                    
                    bothLayer.transform =rotate45s;
                    maskLayer.transform =rotate45s;
                }
                
                CABasicAnimation *strokeEndAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:0.9 withBeginTime:0 fromValue:0 toValue:1 propertyName:kAVShapeStrokeEnd];
                
                CABasicAnimation *lineWidthAni = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1 withBeginTime:0.2 fromValue:5 toValue:toWidth propertyName:@"lineWidth"];
                lineWidthAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                
                CABasicAnimation *lineWidthAni2 = [[AVBasicRouteAnimate defaultInstance] customCGFloat:1 withBeginTime:0.2 fromValue:0 toValue:toWidth propertyName:@"lineWidth"];
                lineWidthAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                
                
                CAAnimationGroup *animationGroup1 = [[AVBasicRouteAnimate defaultInstance] groupAni:1.2 withBeginTime:beginTime aniArr: @[strokeEndAni,lineWidthAni]];
                
                
                CAAnimationGroup *animationGroup2 = [[AVBasicRouteAnimate defaultInstance] groupAni:1.2 withBeginTime:beginTime+ 0.15 aniArr: @[strokeEndAni,lineWidthAni2]];
                
                [bothLayer addAnimation: animationGroup1 forKey:@"sale"];
                
                [maskLayer addAnimation: animationGroup2 forKey:@"sale"];
                
            }

            break;
        }
            
        case AVSTShapeGeometryMoreColorBarMove:  //0.8 + 0.4  .....
        {
            [rootLayer addSublayer: nextLayer];
            
            AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColorFromRGB(0x00b7f2) colorWithAlphaComponent:0.4].CGColor];
            
            [currentLayer addSublayer: bgLayer];
            bgLayer.opacity = 0;
            
            CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime+0.3];
            
            [bgLayer addAnimation: openIn forKey:@"oepnId"];
            
            AVBasicLayer *maskBg = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[UIColor clearColor].CGColor];
            
            [nextLayer setMask: maskBg];
            
            NSMutableArray *delayTimeList = [[NSMutableArray alloc] init];
            
            for (NSInteger index =0; index <18; index++) {
                
                int value = (arc4random() % 8) + 1;
                
                double randomFloat = value/10.00;
                
                [delayTimeList addObject: [NSNumber numberWithFloat: randomFloat]];
                
            }
            
            NSMutableArray *widthDelayList = [[NSMutableArray alloc] init];
            
            for (NSInteger index =0; index <18; index++) {
                
                int value = (arc4random() % 5) + 1;
                
                double randomFloat = value/50.00;
                
                [widthDelayList addObject: [NSNumber numberWithFloat: randomFloat]];
                
            }
            
            NSInteger countItem = [delayTimeList count];
            
            CGFloat moduleHight = kAVWindowHeight/countItem;
            
            for (NSInteger index =0; index <[delayTimeList count]; index++) {
                
                CGFloat moduleTop =index*moduleHight;
                
                NSNumber *randomNumber = [delayTimeList objectAtIndex:index]; CGFloat delayTime = [randomNumber floatValue];
                
                NSNumber *randomNumber1 = [widthDelayList objectAtIndex:index]; CGFloat delayTime1 = [randomNumber1 floatValue];
                
                AVBasicLayer *moduleLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(kAVWindowWidth, moduleTop, kAVWindowWidth, moduleHight) bgColor:[UIColor yellowColor].CGColor];
                moduleLayer.anchorPoint = CGPointMake(0, 0);
                moduleLayer.position = CGPointMake(kAVWindowWidth, moduleTop);
                [currentLayer addSublayer: moduleLayer];
                
                AVBasicLayer *subMaskLayer = [[AVBasicLayer alloc] initWithFrame:CGRectMake(kAVWindowWidth, moduleTop, kAVWindowWidth+100, moduleHight) bgColor:[UIColor blackColor].CGColor];
                subMaskLayer.anchorPoint = CGPointMake(0, 0);
                subMaskLayer.position = CGPointMake(kAVWindowWidth, moduleTop);
                [maskBg addSublayer: subMaskLayer];
                
                CGPoint nextPosition = CGPointMake(-100, moduleTop);
                
                CABasicAnimation *moveAni = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.8 withBeginTime:beginTime+delayTime toValue: nextPosition];
                
                [moduleLayer addAnimation: moveAni forKey:@"cvb"];
                
                
                CABasicAnimation *moveAni2 = [[AVBasicRouteAnimate defaultInstance] moveXYCenterTo:0.8 withBeginTime:beginTime+delayTime+delayTime1 toValue: nextPosition];
                
                [subMaskLayer addAnimation: moveAni2 forKey:@"cvb"];
                
            }

            break;
        }
        default:
            break;
    }
}

+(CAShapeLayer *)createRoundShape:(BOOL)isBorder roundRect:(CGRect)roundFrame lineWidth:(float)width
{
    CAShapeLayer  *shapeLayer =nil;
    
    UIBezierPath *shapePath =nil;
    
    shapePath = [UIBezierPath circularShape:roundFrame];
    
    shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame = roundFrame;
    
    shapeLayer.lineWidth = width;
    
    shapeLayer.lineCap = kCALineCapRound; //设置线头的样式为圆的
    shapeLayer.lineJoin = kCALineJoinRound; //设置线段转折点的样式
    
    if (isBorder ==YES) {
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.9].CGColor;
        
        shapeLayer.lineWidth = width;
    }else{
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
        
        shapeLayer.lineWidth = width-8;
    }
    
    shapeLayer.path = shapePath.CGPath;
    
    return shapeLayer;
}

+(CAShapeLayer *)createShape:(BOOL)isBorder lineWidth:(float)width
{
    CAShapeLayer  *shapeLayer =nil;
    
    CGFloat offsetY = 0;
    
    UIBezierPath *shapePath =nil;
    
    shapePath = [UIBezierPath circularShape:kAVRectWindow];
    
    shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame = kAVRectWindow;
    
    shapeLayer.lineWidth = width;
    
    shapeLayer.top +=offsetY;
    
    if (isBorder ==YES) {
        
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.9].CGColor;
    }else{
        
        shapeLayer.fillColor = [UIColor blackColor].CGColor;
        
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    }
    
    shapeLayer.path = shapePath.CGPath;
    
    return shapeLayer;
}

+(void)ShapeGeometryCommon:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime sceneTransiteFactor:(NSInteger)transiteFactor currentLayer:(AVBasicLayer *)currentLayer  nextLayer: (AVBasicLayer *)nextLayer  aniRootLayer:(CALayer *)rootLayer
{
    AVBasicLayer *bgLayer = [[AVBasicLayer alloc] initWithFrame:currentLayer.bounds bgColor:[[UIColor blueColor] colorWithAlphaComponent:0.4].CGColor];
    
    [currentLayer addSublayer: bgLayer];
    bgLayer.opacity = 0;
    
    CABasicAnimation *openIn = [[AVBasicRouteAnimate defaultInstance] opacityOpen:duration withBeginTime:beginTime];
    
    [bgLayer addAnimation: openIn forKey:@"oepnId"];
    
    CAShapeLayer  *bothLayer = [self createShape:YES shapeType:transiteFactor];
    
    [currentLayer addSublayer: bothLayer];
    
    CAShapeLayer  *maskLayer =  [self createShape:NO shapeType:transiteFactor];
    
    [nextLayer setMask: maskLayer];
    
    CATransform3D starttransform = CATransform3DMakeScale(0.0, 0.0, 1.0);
    
    CATransform3D endtransform = CATransform3DMakeScale(2.4, 2.4, 1.0);
    
    //  tempLayer.transform = starttransform;
    
    CABasicAnimation *saleToOne = [[AVBasicRouteAnimate defaultInstance] transform3D:duration withBeginTime:beginTime fromValue:starttransform toValue:endtransform];
    
    [maskLayer addAnimation: saleToOne forKey:@"sale"];
    
    [bothLayer addAnimation: saleToOne forKey:@"sale"];
}

+(CAShapeLayer *)createShape:(BOOL)isBorder shapeType:(NSInteger)transiteFactor
{
    CAShapeLayer  *shapeLayer =nil;
    
    CGFloat offsetY = 0;
    
    UIBezierPath *shapePath =nil;
    
    switch (transiteFactor ) {
        case AVSTShapeGeometryFiveStarToFull:
        {
            offsetY = -56;
            shapePath = [UIBezierPath stars:1 shapeInFrame:kAVRectWindow];
            break;
        }
            
        case AVSTShapeGeometryLoveHeartToFull:
        {
            offsetY = 32;
             shapePath = [UIBezierPath heartShape:kAVRectWindow];
            break;
        }
        default:
            break;
    }
    
        
    shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.frame = kAVRectWindow;
    
    shapeLayer.lineWidth = 32;
    
    shapeLayer.top +=offsetY;

    if (isBorder ==YES) {
    
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.8].CGColor;
    }else{
        
        shapeLayer.fillColor = [UIColor blackColor].CGColor;
        
        shapeLayer.strokeColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5].CGColor;
    }

    shapeLayer.path = shapePath.CGPath;

    return shapeLayer;
}
@end
