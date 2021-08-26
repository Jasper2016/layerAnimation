//
//  AVStaticFunc.h
//  TestVideoPreViewing
//
//  Created by mac on 15/4/5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

static inline void dispatch_async_main_after(NSTimeInterval after, dispatch_block_t block) {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(after * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}


#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBAlpha(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]
