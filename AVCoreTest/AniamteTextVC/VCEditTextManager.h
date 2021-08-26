//
//  VCEditTextManager.h
//  VCore
//
//  Created by gemin on 2017/8/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VCDownloadFontProgressHandler)(float percent);
typedef void (^VCDownloadFontCompletionHandler)(NSString *fontName);

@interface VCEditTextManager : NSObject

+(instancetype)sharedInstance;

//- (UIFont *)vcFontWithName:(NSString *)fontName size:(CGFloat)size;

- (BOOL)isFontISExist:(NSString *)fontName;

- (void)downloadWithfontName:(NSString *)fontName
             progressHandler:(VCDownloadFontProgressHandler)handler
                  completion:(VCDownloadFontCompletionHandler)completion;

@end
