//
//  AVSceneDisOpacity.h
//  TestVideoPreViewing
//
//  Created by mac on 15/1/23.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AVSceneDisOpacity : NSObject
{
    
}

+(CAAnimationGroup *)disappearOpacity:(CFTimeInterval)duration withBeginTime:(CFTimeInterval)beginTime toValue:(CFTimeInterval)toValue;
@end
