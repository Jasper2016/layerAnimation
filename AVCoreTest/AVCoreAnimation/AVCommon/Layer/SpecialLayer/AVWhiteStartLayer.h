//
//  AVWhiteStartLayer.h
//  testTextPlayShow
//
//  Created by mac on 15/9/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "AVBasicLayer.h"

@interface AVWhiteStartLayer : AVBasicLayer
{

}

- (id)initWithFrame:(CGRect)vBorderRect vContentRect:(CGRect)vContentRect vContentImage:(UIImage *)vContentImage  loveImage:(UIImage *)loveImage maskImage:(UIImage *)maskImage;


-(void)startAnimation:(NSDictionary *)inputDic;

-(void)setFaceCenter:(NSDictionary *)aniParameter vContentRect:(CGRect)vContentRect;

@end
