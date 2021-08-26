    //
//  AVSTransiteDTO.m
//  TestVideoPreViewing
//
//  Created by mac on 15/2/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVSTransiteDTO.h"

@implementation AVSTransiteDTO

- (id)init
{
    if (self = [super init])
    {
        
        self.STFullDuration = 0;
    }
    
    return self;
}

//默认设置
-(void)setSTFullDuration:(CFTimeInterval)STFullDuration
{
    if (_STFullDuration !=STFullDuration) {
        
        _STFullDuration = STFullDuration;
        
        self.STAniDuration = STFullDuration;
    }
}

@end
