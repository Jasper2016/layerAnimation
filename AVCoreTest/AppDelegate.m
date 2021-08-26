//
//  AppDelegate.m
//  AVCoreTest
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "VcoreTest2ViewController.h"

#import "VcoreTest3ViewController.h"

#import "VcoreTest4ViewController.h"

#import "VcoreTest5ViewController.h"

#import "VcoreTest6ViewController.h"

#import "Test7ViewController.h"

#import "VcoreTest7ViewController.h"

#import "VcoreTest8ViewController.h"

#import "VCore8ViewController.h"

#import "CorporateCompanyViewController.h"

#import "CorporateCompanyTextViewController.h"

#import "WhiteSliderViewController.h"

#import "VCoreTestGMViewController.h"

#import "VCoreTestDiamondViewController.h"

#import "FashionWeedEndViewController.h"

#import "FashionWeedEnd3ViewController.h"

#import "VCoreTestRollViewController.h"

#import "VCore169TextAniController.h"

#import "CircleFriendsViewController.h"

#import "PieceDiamondViewController.h"

#import "VCoreTest1ViewController.h"

#import "VCHappyTravelViewController.h"

#import "RecordYearsViewController.h"

#import "WuwaViewController.h"
#import "HeartViewController.h"
#import "StileViewController.h"
#import "AVFireViewController.h"
#import "NewYearTwoViewController.h"

#import "HappyNewYearController.h"
#import "FullVideoViewController.h"
#import "WhiteSpaceViewController.h"
#import "SunshineViewController.h"
#import "FashionViewController.h"
#import "TextAniViewController.h"
#import "VideoMixViewController.h"
#import "MergeViewController.h"
#import "SoundTouchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *rootView = nil;


    NSInteger index = 11;

    switch (index) {
        case 0:
        {
            rootView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
            
            break;
        }
            
        case 1:
        {
            rootView = [[VCHappyTravelViewController alloc] init];
//            rootView = [[VCoreTestGMViewController alloc] init];
//            rootView = [[VCoreTestDiamondViewController alloc] init];
            
            break;
        }
            
        case 3:
        {
            rootView = [[VcoreTest3ViewController alloc] init];
            
            break;
        }
            
        case 4:
        {
            rootView = [[VcoreTest4ViewController alloc] init];
            
            break;
        }
            
        case 5:
        {
            rootView = [[VcoreTest5ViewController alloc] init];
            
            break;
        }
            
        case 6:
        {
            rootView = [[VcoreTest6ViewController alloc] init];
            
            break;
        }
            
        case 7:
        {
            rootView = [[Test7ViewController alloc] initWithNibName:@"Test7ViewController" bundle:nil];
            
            break;
        }
            
        case 8: //时间线
        {
            rootView = [[VcoreTest7ViewController alloc] init];
            
            break;
        }
            
        case 9:
        {
            rootView = [[VCore8ViewController alloc] initWithNibName:@"VCore8ViewController" bundle:nil];
            
            break;
        }
        case 10:
        {
            rootView = [[VcoreTest8ViewController alloc] init];
            break;
        }
            
        case 11:
        {
            rootView = [[CorporateCompanyViewController alloc] initWithNibName:@"CorporateCompanyViewController" bundle:nil];
            break;
        }
        case 12:
        {
            rootView = [[CorporateCompanyTextViewController alloc] initWithNibName:@"CorporateCompanyTextViewController" bundle:nil];
            break;
        }
        case 13:
        {
        
            rootView = [[WhiteSliderViewController alloc] initWithNibName:@"WhiteSliderViewController" bundle:nil];
            break;
        }
        case 14:{
        
           // rootView = [[FashionWeedEndViewController alloc] initWithNibName:@"FashionWeedEndViewController" bundle:nil];
            
            break;
        }
            
        case 15:{
            
            rootView = [[FashionWeedEndViewController alloc] initWithNibName:@"FashionWeedEndViewController" bundle:nil];
            
            break;
        }
            
        case 16:{
            
            rootView = [[FashionWeedEnd3ViewController alloc] initWithNibName:@"FashionWeedEnd3ViewController" bundle:nil];
            
            break;
        }
            
        case 17:
        {
            rootView = [[VCoreTestRollViewController alloc] init];
            break;
        }
        case  18:
        {
            rootView = [[VCore169TextAniController alloc] init];
            break;
        }
        case 19:
        {
            rootView = [[CircleFriendsViewController alloc] init];
            break;
        }
        case 20:
        {
            rootView = [[PieceDiamondViewController alloc] init];
            break;
        }
            
        case 21:
        {
            rootView = [[VCoreTest1ViewController alloc] init];
            break;
        }
            
            
        case 22:
        {
            rootView = [[VCHappyTravelViewController alloc] init];
            break;
        }
        case 23:
        {
            
            rootView = [[RecordYearsViewController alloc] init];
            break;
        }
        case 30:
        {
            rootView = [[WuwaViewController alloc] init];
            break;
        }

        case 32:
        {
            
            rootView = [[HeartViewController alloc] init];
            break;
        }
        case 31:
        {
            rootView = [[StileViewController alloc] init];
            break;  
        }
        case 33:
        {
            rootView = [[AVFireViewController alloc] init];
            break;
        }
        case 34:
        {
            rootView = [[NewYearTwoViewController alloc] init];
            break;
        }
        case 35:
        {
            rootView = [[HappyNewYearController alloc] init];
            break;
        }
            
        case 36:
        {
            rootView = [[FullVideoViewController alloc] init];
            break;
        }
        case 37:
        {
            rootView = [[WhiteSpaceViewController alloc] init];
            break;
        }
        case 38:
        {
            rootView = [[SunshineViewController alloc] init];
            break;
        }
        case 39:
        {
            rootView = [[FashionViewController alloc] init];
            break;
        }
        case 40:
        {
            
            rootView = [[TextAniViewController alloc] init];
            break;
        }
            
        case 41:
        {
            rootView = [[VideoMixViewController alloc] init];
            break;
        }
        case 42:
        {
            
            rootView = [[MergeViewController alloc] initWithNibName:@"MergeViewController" bundle:nil];
            break;
        }
        case 43:
        {
            rootView = [[SoundTouchViewController alloc] init];
            break;
        }
        default:
            
            
            break;
    }
    
    //    VcoreTestRootViewController *rootView = [[VcoreTestRootViewController alloc] initWithNibName:@"VcoreTestRootViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootView];
    
    self.window.rootViewController = nav;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
