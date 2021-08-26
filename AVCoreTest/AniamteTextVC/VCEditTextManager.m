//
//  VCEditTextManager.m
//  VCore
//
//  Created by gemin on 2017/8/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VCEditTextManager.h"
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@implementation VCEditTextManager

+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static VCEditTextManager *textManager;
    dispatch_once(&onceToken, ^{
        textManager = [VCEditTextManager new];
    });
    return textManager;
}

- (BOOL)isFontISExist:(NSString *)fontName
{
    UIFont *font = [UIFont fontWithName:fontName size:14.f];
    if (font && ([font.fontName compare:fontName] == NSOrderedSame
                 || [font.familyName compare:fontName] == NSOrderedSame)) {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)downloadWithfontName:(NSString *)fontName
             progressHandler:(VCDownloadFontProgressHandler)handler
                  completion:(VCDownloadFontCompletionHandler)completion
{
    //用字体的PostScript名字创建一个Dictionary
    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName,kCTFontNameAttribute, nil];
    // 创建一个字体描述对象 CTFontDescriptorRef
    CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
    // 将字体描述对象放到一个 NSMutableArray 中
    NSMutableArray *descs = [NSMutableArray array];
    [descs addObject:(__bridge id)desc];
    CFRelease(desc);
    __block BOOL errorDuringDownload = NO;
    
    //匹配字体
    __block NSString *errorMessage = @"";
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler( (__bridge CFArrayRef)descs, NULL,  ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef _Nonnull progressParameter) {
        double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
        if (state == kCTFontDescriptorMatchingDidBegin)
        {
            NSLog(@" 字体已经匹配");
        }
        else if (state == kCTFontDescriptorMatchingDidFinish)
        {
            NSLog(@"字体%@下载完成",fontName);
            completion(fontName);
        }
        else if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
            NSLog(@" 字体开始下载 ");
        }
        else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
            NSLog(@" 字体下载完成 ");
            completion(fontName);
        }
        else if (state == kCTFontDescriptorMatchingDownloading) {
            handler(progressValue/100);
            NSLog(@" 下载进度 %.0f%% ", progressValue);
        }
        else if (state == kCTFontDescriptorMatchingDidFailWithError) {
            NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
            if (error != nil) {
                errorMessage = [error description];
            } else {
                errorMessage = @"ERROR MESSAGE IS NOT AVAILABLE!";
            }
            // 设置标志
            errorDuringDownload = YES;
            NSLog(@" 下载错误: %@", errorMessage);
        }
        
        return YES;
    });
}

- (UIFont *)vcFontWithName:(NSString *)fontName size:(CGFloat)size
{
    if ([self isFontISExist:fontName]) {
        UIFont *font = [UIFont fontWithName:fontName size:size];
        return font;
    }
    else
    {
        //用字体的PostScript名字创建一个Dictionary
        NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName,kCTFontNameAttribute, nil];
        // 创建一个字体描述对象 CTFontDescriptorRef
        CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)attrs);
        // 将字体描述对象放到一个 NSMutableArray 中
        NSMutableArray *descs = [NSMutableArray array];
        [descs addObject:(__bridge id)desc];
        CFRelease(desc);
        //匹配字体
        CTFontDescriptorMatchFontDescriptorsWithProgressHandler((__bridge CFArrayRef)descs, NULL, ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef _Nonnull progressParameter) {
            if (state == kCTFontDescriptorMatchingDidFinish)
            {
                UIFont *font = [UIFont fontWithName:fontName size:size];
                return font;
            }
            else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
                UIFont *font = [UIFont fontWithName:fontName size:size];
                return font;
            }
            else if (state == kCTFontDescriptorMatchingDidFailWithError) {
                
                return [UIFont systemFontOfSize:size];
            }
            return YES;
        });
        return [self vcFontWithName:fontName size:size];
    }
}
@end
