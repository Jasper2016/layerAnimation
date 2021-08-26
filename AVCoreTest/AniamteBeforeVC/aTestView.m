//
//  aTestView.m
//  AVCoreTest
//
//  Created by jasper on 2019/6/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import "aTestView.h"

@implementation aTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(UIView *)viewSub
{
    if (!_viewSub) {
        _viewSub = [[UIView alloc]init];
    }
    return _viewSub;
}



@end
