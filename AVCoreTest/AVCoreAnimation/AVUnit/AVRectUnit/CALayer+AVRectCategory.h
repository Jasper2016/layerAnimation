//
//  CALayer+AVRectCategory.h
//  TestSceneEffect
//
//  Created by mac on 15/5/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (AVRectCategory)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat bottom;

@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

//@property(nonatomic,readonly) CGFloat screenX;
//@property(nonatomic,readonly) CGFloat screenY;
//@property(nonatomic,readonly) CGFloat screenViewX;
//@property(nonatomic,readonly) CGFloat screenViewY;
//@property(nonatomic,readonly) CGRect screenFrame;

@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;


@end
