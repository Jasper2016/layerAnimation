//
//  ADTransition.h
//  Transition
//
//  Created by Patrick Nollet on 21/02/11.
//  Copyright 2011 Applidium. All rights reserved.
//

// Abstract class

#import <Foundation/Foundation.h>
#import <QuartzCore/CoreAnimation.h>


typedef void (^SNOperationCallBackBlock)(BOOL isSuccess, NSString *errorMsg);

extern NSString * ADTransitionAnimationKey;
extern NSString * ADTransitionAnimationInValue;
extern NSString * ADTransitionAnimationOutValue;

@class ADTransition;
@protocol ADTransitionDelegate
@optional
- (void)pushTransitionDidFinish:(ADTransition *)transition;
- (void)popTransitionDidFinish:(ADTransition *)transition;
@end

typedef enum {
    ADTransitionTypeNull,
    ADTransitionTypePush,
    ADTransitionTypePop
} ADTransitionType;

typedef enum {
    ADTransitionRightToLeft,
    ADTransitionLeftToRight,
    ADTransitionTopToBottom,
    ADTransitionBottomToTop
} ADTransitionOrientation;


@interface ADTransition : NSObject {
    id <ADTransitionDelegate> __weak _delegate;
    ADTransitionType _type;
    
    SNOperationCallBackBlock completedBlock;
}

@property (nonatomic, weak) id <ADTransitionDelegate> delegate;
@property (nonatomic, assign) ADTransitionType type;
@property (nonatomic, readonly) NSTimeInterval duration; // abstract

+ (ADTransition *)nullTransition;
- (ADTransition *)reverseTransition;
- (NSArray *)getCircleApproximationTimingFunctions;

- (void)setCompletedBlock:(SNOperationCallBackBlock)block;

@end
