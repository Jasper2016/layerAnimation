//
//  FaceDetectDTO.m
//  TestVideoPreViewing
//
//  Created by mac on 15/6/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FaceDetectDTO.h"

@implementation FaceDetectDTO

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.faceStruct1 = FaceRectStructMake(CGPointZero, 1, CGRectZero);
        
        self.faceStruct2 = FaceRectStructMake(CGPointZero, 1, CGRectZero);

        self.faceStructEnd = FaceRectStructMake(CGPointZero, 1, CGRectZero);

        self.totalFaceStruct = FaceRectStructMake(CGPointZero, 1, CGRectZero);

        self.faceAwareStruct = FaceRectStructMake(CGPointZero, 1, CGRectZero);
        
        self.totalFacePoint = CGPointZero;
        
        self.contendRect   =CGRectZero;
        
        self.faceCount = 0;
        
        
    }
    return self;
}


@end
