//
//  UIBezierPath+BasicShapes.h
//  TestSceneEffect
//
//  Created by mac on 15/5/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (BasicShapes)

+ (UIBezierPath *)heartShape:(CGRect)originalFrame;
+ (UIBezierPath *)userShape:(CGRect)originalFrame;
+ (UIBezierPath *)martiniShape:(CGRect)originalFrame;
+ (UIBezierPath *)beakerShape:(CGRect)originalFrame;
+ (UIBezierPath *)starShape:(CGRect)originalFrame;
+ (UIBezierPath *)stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

+ (UIBezierPath *)circularShape:(CGRect)originalFrame;

+ (UIBezierPath *)regularTriangleShape:(CGRect)bounds;  //正三角形

+ (UIBezierPath *)squareShape:(CGRect)bounds;  //正方形

+ (UIBezierPath *)bezierPathLine:(CGRect)bounds startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle lineWidth:(CGFloat)lineWidth;  //画弧形线

+(CGPathRef) geometryHStroke:(CGRect)bounds startXOffset:(CGFloat )startXOffset upSlideLength: (CGFloat)slideLength;    // 不规则的水平 三角形

+(CGPathRef) geometryVStroke:(CGRect)bounds startXOffset:(CGFloat )startXOffset upSlideLength: (CGFloat)slideLength;    // 不规则的垂直 三角形

+(CGPathRef) homeVStroke:(CGRect)bounds startXOffset:(CGFloat )startXOffset upSlideLength: (CGFloat)slideLength;

+(UIBezierPath *)chatPopoBorderStroke:(CGRect)bounds dirMode:(NSInteger)dirMode rowOffset:(CGFloat)rowOffset;
/**
 * 屋顶三角形
 *
 * @param breakPoint 拐点的x值
 * @param rowPoint   顶点的x值
 *
 * return 屋顶三角形path
 */
+ (UIBezierPath *)roofTriangleShape:(CGRect)bounds breakPointValue:(CGFloat)breakPoint rowPointValue:(CGFloat)rowPoint;

/**
 * 屋顶三角形maskPath
 *
 * @param breakPoint 拐点的x值
 * @param rowPoint   顶点的x值
 *
 * return 屋顶三角形maskPath
 */
+ (UIBezierPath *)roofMaksTriangleShape:(CGRect)bounds breakPointValue:(CGFloat)breakPoint rowPointValue:(CGFloat)rowPoint;

+ (UIBezierPath *)whiteSliderTextBgShape:(CGRect)bounds;

+ (UIBezierPath *)whiteSliderTextMaskShape:(CGRect)bounds;
@end
