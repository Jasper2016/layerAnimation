//
//  AVAniCameraOneFaceShake.h
//  TestVideoPreViewing
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "AVSceneAniEnumType.h"

@interface AVAniCameraOneFaceShake : NSObject


//移动一会颤抖  --in
+(CAAnimationGroup *)oneFaceShakeMoveIn:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime faceArea:(FaceRectMode)faceArea faceAwareRect:(FaceRectMode)faceAwareRect contentRect:(CGRect)contentRect;

//移动一会颤抖  --out
+(CAAnimationGroup *)oneFaceShakeMoveOut:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime faceArea:(FaceRectMode)faceArea  faceAwareRect:(FaceRectMode)faceAwareRect contentRect:(CGRect)contentRect;

//竖图 上 ，下 ，全部   弧线

@end
