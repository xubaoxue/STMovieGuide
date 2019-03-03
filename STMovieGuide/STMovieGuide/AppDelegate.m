//
//  AppDelegate.m
//  BSMovieGuide
//
//  Created by study on 2017/3/16.
//  Copyright © 2017年 Study. All rights reserved.
//

#import "AppDelegate.h"
#import "STMovieController.h"
#import "ViewController.h"
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self guideTools];
    return YES;
}
#pragma mark - 判断是不是新版本
- (void)guideTools{
    
    // 获取之前的版本
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    // 获取当前版本
    NSString *verKey = (__bridge NSString *)kCFBundleVersionKey;
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[verKey];
    if (![oldVersion isEqualToString:currentVersion]) {
        //有新版本存储新版本
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"version"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        STMovieController *bsCtrl = [[STMovieController alloc]init];
        self.window.rootViewController = bsCtrl;
        [self.window makeKeyAndVisible];
    }else{
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        ViewController *lv = [[ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lv];
        self.window.rootViewController = nav;
        lv.navigationItem.title = @"StudyMoveGuide";
        lv.view.backgroundColor = RGBA(134, 216, 210, 0.5);
        [self.window makeKeyAndVisible];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
