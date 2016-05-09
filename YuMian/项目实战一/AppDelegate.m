//
//  AppDelegate.m
//  项目一
//
//  Created by ma c on 16/4/5.
//  Copyright © 2016年 ma c. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "UMSocial.h"
#import "UMSocialSinaSSOHandler.h"
#import <AlipaySDK/AlipaySDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window  = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    BaseTabBarController *tabbarController = [[BaseTabBarController alloc] init];
    self.window.rootViewController = tabbarController;
    
    //注册
    [UMSocialData setAppKey:@"56f8f88667e58e2369000577"];
    //打开新浪微博开关
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3127942519"
                                              secret:@"cf16093c25b5055b4e66b2b5c63326a1"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    
    //显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
  return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
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
