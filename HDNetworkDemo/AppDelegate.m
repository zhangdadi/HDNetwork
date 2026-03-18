//
//  AppDelegate.m
//  HDNetworkDemo
//
//  Created by zhangdadi on 2022/4/19.
//

#import "AppDelegate.h"
#import "HDNetwork.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self configNetwork];

    return YES;
}

/// 配置网络请求库
- (void)configNetwork {
    HDNWConfig.shared.apiBaseUrl = @"https://kna8u0t.nafasslive.com/nafass/";
    HDNWConfig.shared.resultConfig.msgName = @"message";
    HDNWConfig.shared.resultConfig.codeValueSucceed = 200;
    
    NSMutableDictionary *dict = NSMutableDictionary.dictionary;
    [dict setValue:@"ma" forKey:@"countryCode"];
    [dict setValue:@"258895258" forKey:@"phone"];
    [dict setValue:@"1" forKey:@"businessType"];
    [dict setValue:@"2" forKey:@"channelType"];
    [dict setValue:@"1.0.0" forKey:@"appVersion"];
    [dict setValue:@"ios" forKey:@"os"];
    [dict setValue:@"5412561122" forKey:@"deviceId"];
    [dict setValue:@"en" forKey:@"language"];
    
    [HDNWManager post].url(@"verification/code/get").param(dict).completionBlock(^(id<HDNWAPIResultProtocol> result, id data) {
        NSLog(@"%@", data);

    }).start(nil);
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
