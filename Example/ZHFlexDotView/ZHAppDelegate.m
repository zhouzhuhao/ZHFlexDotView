//
//  ZHAppDelegate.m
//  ZHFlexDotView
//
//  Created by zhouzhuhao on 06/25/2019.
//  Copyright (c) 2019 zhouzhuhao. All rights reserved.
//

#import "ZHAppDelegate.h"
#import <ZHFlexDotView/ZHFlexDotView-umbrella.h>

@interface ZHAppDelegate ()
@property (nonatomic,strong) ZHFlexDotView *dotView;
@end

@implementation ZHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	
#pragma mark -DEBUG模式下才显示Flex,如果需要打包后的ipa也出现Flex,就需要在scheme中配置Archive时为debug
#if DEBUG
	NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
	for (UIWindow *win in frontToBackWindows) {
		if (win.windowLevel == UIWindowLevelNormal) {
			self.dotView = [[ZHFlexDotView alloc] initWithFrame:CGRectMake(0, 60, 80, 80)];
			[win addSubview:self.dotView];
			break;
		}
	}
#endif
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
