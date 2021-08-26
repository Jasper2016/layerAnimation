#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@protocol SDAVAssetExportSessionDelegate;
@interface SDAVAssetExportSession : NSObject
@property (nonatomic, weak) id<SDAVAssetExportSessionDelegate> delegate;
@property (nonatomic, strong, readonly) AVAsset *asset;
@property (nonatomic, copy) AVVideoComposition *videoComposition;
@property (nonatomic, copy) AVAudioMix *audioMix;
@property (nonatomic, copy) NSString *outputFileType;
@property (nonatomic, copy) NSURL *outputURL;
@property (nonatomic, copy) NSDictionary *videoInputSettings;
@property (nonatomic, copy) NSDictionary *videoSettings;
@property (nonatomic, copy) NSDictionary *audioSettings;
@property (nonatomic, assign) CMTimeRange timeRange;
@property (nonatomic, assign) BOOL shouldOptimizeForNetworkUse;
@property (nonatomic, copy) NSArray *metadata;
@property (nonatomic, strong, readonly) NSError *error;
@property (nonatomic, assign, readonly) float progress;
@property (nonatomic, assign, readonly) AVAssetExportSessionStatus status;
+ (id)exportSessionWithAsset:(AVAsset *)asset;
- (id)initWithAsset:(AVAsset *)asset;
- (void)exportAsynchronouslyWithCompletionHandler:(void (^)(void))handler;
- (void)cancelExport;
@end
@protocol SDAVAssetExportSessionDelegate <NSObject>
- (void)exportSession:(SDAVAssetExportSession *)exportSession renderFrame:(CVPixelBufferRef)pixelBuffer withPresentationTime:(CMTime)presentationTime toBuffer:(CVPixelBufferRef)renderBuffer;
@end
