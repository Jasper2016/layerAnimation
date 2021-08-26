//
//  AVFilterPhoto.m
//  TestVideoPreViewing
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AVFilterPhoto.h"

#import "UIImage+BoxBlur.h"

#import "GPUImage.h"

@implementation AVFilterPhoto


-(UIImage *)simpleFilter:(UIImage *)origalImage filterType:(AVImageFilterType)filterType blurRadius:(CGFloat)blurRadius;
{
    UIImage *filtereImage = nil;
    
    if (origalImage ==nil) {
        return nil;
    }
    
    switch (filterType) {
        case AVImageFilterBlackWhite:
        {
            GPUImageSaturationFilter *stillImageFilter = [[GPUImageSaturationFilter alloc] init];
            stillImageFilter.saturation = 0.0f;//
            filtereImage = [stillImageFilter imageByFilteringImage:origalImage];
            
            break;
        }
            
        case AVImageFilterGaussianBlur:
        {
            GPUImageGaussianBlurFilter *stillImageFilter = [[GPUImageGaussianBlurFilter alloc] init];
            stillImageFilter.blurRadiusInPixels = blurRadius;//
            filtereImage = [stillImageFilter imageByFilteringImage:origalImage];
            
            break;
        }
            
        case AVImageFilteriOS7GaussianBlur:
        {
            GPUImageiOSBlurFilter *stillImageFilter = [[GPUImageiOSBlurFilter alloc] init];
            stillImageFilter.blurRadiusInPixels = blurRadius;
            stillImageFilter.saturation = 0.4;
            filtereImage = [stillImageFilter imageByFilteringImage:origalImage];
            
            break;
        }
        default:
            break;
    }
    
    return filtereImage;
}


-(UIImage *)filterGPUImage:(UIImage *)origalImage filterType:(AVImageFilterType)filterType blurRadius:(CGFloat)blurRadius
{
    UIImage *filtereImage = nil;
    
    if (origalImage ==nil) {
        //DLog(@"filterGPUImage nil");
        return nil;
    }
    
    // filterType = 0;
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:origalImage];
    
    switch (filterType) {
        case AVImageFilterNone:
        {
            filtereImage = origalImage;
            
            break;
        }
            
        case AVImageFilterBlackWhite:
        {
            GPUImageSaturationFilter *stillImageFilter = [[GPUImageSaturationFilter alloc] init];
            
            stillImageFilter.saturation = 0.0f;//
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterGaussianBlur:
        {
            
            GPUImageGaussianBlurFilter *stillImageFilter = [[GPUImageGaussianBlurFilter alloc] init];
            
            stillImageFilter.blurRadiusInPixels = blurRadius;//
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            break;
        }
            
        case AVImageFilteriOS7GaussianBlur:
        {
            GPUImageiOSBlurFilter *stillImageFilter = [[GPUImageiOSBlurFilter alloc] init];
            
            // gaussianBlur.blurRadiusInPixels =1.0 ;//
            
            stillImageFilter.blurRadiusInPixels = blurRadius;

              stillImageFilter.saturation = 0.4;

            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            break;
        }
            
        case AVImageFilterCenterGaussianBlur:
        {
            GPUImageGaussianSelectiveBlurFilter *stillImageFilter = [[GPUImageGaussianSelectiveBlurFilter alloc] init];
            
            [stillImageFilter setExcludeCircleRadius:40.0*4/320.0];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterVignette:
        {
            GPUImageVignetteFilter *stillImageFilter = [[GPUImageVignetteFilter alloc] init];
            
            [stillImageFilter setVignetteEnd:0.75];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterToneCurve:
        {
            GPUImageToneCurveFilter *stillImageFilter = [[GPUImageToneCurveFilter alloc] init];
            
            [stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.08, 0.08)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            
            break;
        }
            
        case AVImageFilterToneCurve2:
        {
            
            GPUImageToneCurveFilter *stillImageFilter = [[GPUImageToneCurveFilter alloc] init];
            
            [stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterNostalgia:
        {
            
            GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
            
            stillImageFilter.intensity = 0.40f;//
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterGete:
        {
            GPUImageToneCurveFilter *stillImageFilter = [[GPUImageToneCurveFilter alloc] init];
            
            [stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.80, 0.80)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterQinglu:
        {
            
            GPUImageHueFilter *stillImageFilter = [[GPUImageHueFilter alloc] init];
            
            stillImageFilter.hue = 25;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterQingxin:
        {
            
            GPUImageRGBFilter *stillImageFilter = [[GPUImageRGBFilter alloc] init];
            
            stillImageFilter.blue = 0.65;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterYanHong:
        {
            GPUImageRGBFilter *stillImageFilter = [[GPUImageRGBFilter alloc] init];
            
            stillImageFilter.green = 0.39;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterHuanghun:
        {
            GPUImageRGBFilter *stillImageFilter = [[GPUImageRGBFilter alloc] init];
            
            stillImageFilter.red = 1.10;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            break;
        }
            
        case AVImageFilterSketch:
        {
            GPUImageSketchFilter *stillImageFilter = [[GPUImageSketchFilter alloc] init];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterBrightness:
        {
            GPUImageBrightnessFilter *stillImageFilter = [[GPUImageBrightnessFilter alloc] init];
            
            stillImageFilter.brightness = 0.4;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterWhiteBalance:
        {
            GPUImageWhiteBalanceFilter *stillImageFilter = [[GPUImageWhiteBalanceFilter alloc] init];
            
            stillImageFilter.temperature = 200;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
            
        default:
            break;
    }
    
    return filtereImage;
    
}



-(UIImage *)filterGPUImage:(UIImage *)origalImage filterType:(AVImageFilterType)filterType
{
    UIImage *filtereImage = nil;
    
    if (origalImage ==nil) {
        //DLog(@"filterGPUImage nil");
        return nil;
    }

   // filterType = 0;
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:origalImage];
    
    switch (filterType) {
        case AVImageFilterNone:
        {
            filtereImage = origalImage;
            
            break;
        }
            
        case AVImageFilterBlackWhite:
        {
            GPUImageSaturationFilter *stillImageFilter = [[GPUImageSaturationFilter alloc] init];
            
            stillImageFilter.saturation = 0.0f;//
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];

            break;
        }
            
        case AVImageFilterGaussianBlur:
        {
            
            GPUImageGaussianBlurFilter *stillImageFilter = [[GPUImageGaussianBlurFilter alloc] init];
            
          // stillImageFilter.blurRadiusInPixels = 5.0;//
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            break;
        }
        case AVImageFilter2IOS7Blur1:
        {
            
            GPUImageiOSBlurFilter *filter = [[GPUImageiOSBlurFilter alloc] init];
//            [filter forceProcessingAtSize:origalImage.size];
            filter.blurRadiusInPixels =6 ;//
            filter.saturation = 0.5;
            
            
            [stillImageSource addTarget:filter];
            [stillImageSource processImage];
            [filter useNextFrameForImageCapture];
            
            filtereImage = [filter imageFromCurrentFramebuffer];
            
        }
        case AVImageFilteriOS7GaussianBlur:
        {
            GPUImageiOSBlurFilter *stillImageFilter = [[GPUImageiOSBlurFilter alloc] init];
            
            // gaussianBlur.blurRadiusInPixels =1.0 ;//
            
            //stillImageFilter.saturation = 2;
            
            //   gaussianBlur.saturation = 0.3;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];

            
            break;
        }
            
        case AVImageFilterCenterGaussianBlur:
        {
            GPUImageGaussianSelectiveBlurFilter *stillImageFilter = [[GPUImageGaussianSelectiveBlurFilter alloc] init];
            
            [stillImageFilter setExcludeCircleRadius:40.0*4/320.0];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterVignette:
        {
            GPUImageVignetteFilter *stillImageFilter = [[GPUImageVignetteFilter alloc] init];
            
            [stillImageFilter setVignetteEnd:0.75];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterToneCurve:
        {
            GPUImageToneCurveFilter *stillImageFilter = [[GPUImageToneCurveFilter alloc] init];
            
            [stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.08, 0.08)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            
            break;
        }
            
        case AVImageFilterToneCurve2:
        {
            
            GPUImageToneCurveFilter *stillImageFilter = [[GPUImageToneCurveFilter alloc] init];
            
            [stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterNostalgia:
        {
            
            GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
            
            stillImageFilter.intensity = 0.40f;//
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterGete:
        {
            GPUImageToneCurveFilter *stillImageFilter = [[GPUImageToneCurveFilter alloc] init];
            
            [stillImageFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.80, 0.80)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterQinglu:
        {
            
            GPUImageHueFilter *stillImageFilter = [[GPUImageHueFilter alloc] init];
            
            stillImageFilter.hue = 25;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterQingxin:
        {
            
            GPUImageRGBFilter *stillImageFilter = [[GPUImageRGBFilter alloc] init];
            
            stillImageFilter.blue = 0.65;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterYanHong:
        {
            GPUImageRGBFilter *stillImageFilter = [[GPUImageRGBFilter alloc] init];
            
            stillImageFilter.green = 0.69;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterHuanghun:
        {
            GPUImageRGBFilter *stillImageFilter = [[GPUImageRGBFilter alloc] init];
            
            stillImageFilter.red = 1.10;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            
            break;
        }
            
        case AVImageFilterSketch:
        {
            GPUImageSketchFilter *stillImageFilter = [[GPUImageSketchFilter alloc] init];
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterBrightness:
        {
            GPUImageBrightnessFilter *stillImageFilter = [[GPUImageBrightnessFilter alloc] init];
            
            stillImageFilter.brightness = 0.4;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
        case AVImageFilterWhiteBalance:
        {
            GPUImageWhiteBalanceFilter *stillImageFilter = [[GPUImageWhiteBalanceFilter alloc] init];
            
            stillImageFilter.temperature = 200;
            
            [stillImageSource addTarget:stillImageFilter];
            [stillImageFilter useNextFrameForImageCapture];
            [stillImageSource processImage];
            
            filtereImage = [stillImageFilter imageFromCurrentFramebuffer];
            
            break;
        }
            
            
        default:
            break;
    }
    
    return filtereImage;
    
}
@end
