//
//  AVMaskBaiscLayer.h
//  TestVideoPreViewing
//
//  Created by mac on 15/5/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "AVSceneAniEnumType.h"

@interface AVMaskBaiscLayer : CAGradientLayer
{

}

- (id)initWithFrame:(CGRect)frame maskDirType:(AVMaskDirType)dirType;

@end
