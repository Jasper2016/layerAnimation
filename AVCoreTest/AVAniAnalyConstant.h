//
//  AVAniAnalyConstant.h
//  VCore
//
//  Created by mac on 15/6/10.
//  Copyright (c) 2015年 Apple. All rights reserved.
//


#define kDicSeparatedValue(dic, key) [[[[dic objectForKey:key] componentsSeparatedByString:@"|"] lastObject]integerValue]

#define kDicFloatValueForKey(dic, key)  [[dic objectForKey: key] floatValue]

#define kDicIntegerValueForKey(dic, key)  [[dic objectForKey: key] integerValue]
//
//#define kParseSeparatedRectDic (dic, frame, separate)   {   \
//     NSArray  *textArray= [[dic objectForKey:frame] componentsSeparatedByString:separate]; \
//    return  CGRect textRect = CGRectMake([[textArray objectAtIndex:0] floatValue], [[textArray objectAtIndex:1] floatValue], [[textArray objectAtIndex:2] floatValue],  [[textArray objectAtIndex:3] floatValue]);    \
//}

#define kAVSceneAniStartParmKey     @"SceneAniStartParmKey"

#define kSceneAniParam0     @"sceneAniParam0"

#define kAVSceneDTO   @"AVSceneDTO"

#define kArtDuration   @"ArtDuration"

#define kTransiteDuration   @"TransiteDuration"

#define kAVSceneFullList   @"AVSceneFullList"

#define kFactor     @"factor"

#define kStartSceneDTO   @"StartSceneDTO"

#define kEndSceneDTO   @"EndSceneDTO"

#define kValueType      @"valueType"

#define SceneAniType     @"SceneAniType"

#define kPhotoFilterType    @"PhotoFilterType"

#define kSceneFactorType     @"SceneFactorType"

#define kArtAniType      @"ArtAniType"

#define kIsHasArt         @"isHasArt"

#define kArtFactorType      @"ArtFactorType"

#define kAVArtDTO        @"AVArtDTO"

#define kStartArtDTO        @"StartArtDTO"

#define kAVSTransiteDTO     @"AVSTransiteDTO"

#define kAVSceneTransiteAniType   @"AVSceneTransiteAniType"

#define kTransiteAniType   @"TransiteAniType"

#define kTransiteFactorType   @"TransiteFactorType"

#define kFullDuration     @"fullDuration"

#define kAniDuration     @"aniDuration"

#define kHasFaceBool    @"HasFaceBool"

#define kHasFaceKey    @"YES"

#define kArtBeginTimeOffset  @"artBeginTimeOffset"

#define kMinCount       3

#define kAVAnalyDataFromLocal    0

#define kAVAnalyDataFromUserInput    1

#define kAVSceneNoFaceAniTypeNum  3

#define kAVSceneOneFaceAniTypeNum  1

#define kAVSceneTwoFaceAniTypeNum  1

