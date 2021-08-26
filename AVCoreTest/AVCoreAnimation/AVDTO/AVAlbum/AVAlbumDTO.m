//
//  AVAlbumDTO.m
//  TestVideoPreViewing
//
//  Created by mac on 15/4/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVAlbumDTO.h"

#import "AVConstant.h"

@implementation AVAlbumDTO

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.vBorderRect = kAVRectWindow;
        
        self.mediaType =  AVMediaPhoto;
        
        self.imageFilterType = AVImageFilterNone;
    }
    
    return self;
}

-(void)setVBorderRect:(CGRect)vBorderRect
{
    _vBorderRect = vBorderRect;
    
    self.vContentRect = CGRectMake(0, 0, _vBorderRect.size.width, _vBorderRect.size.height);
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    AVAlbumDTO *serializer = [[[self class] allocWithZone:zone] init];
    
    serializer.mediaType = self.mediaType;
    
    serializer.faceRectDTO = self.faceRectDTO;
    
    serializer.asset = self.asset;
    
    serializer.imageFilterType = self.imageFilterType;
    
    serializer.contendImage = self.contendImage;
    
    serializer.vBorderRect = self.vBorderRect;
    
    serializer.vContentRect = self.vContentRect;
    
    return serializer;
}

@end
