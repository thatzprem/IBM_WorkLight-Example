//
//  AppDelegate.m
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 Happiest Minds. All rights reserved.
//

#import "AppDelegate.h"

#import "STMTableViewController.h"

#import "SecondViewController.h"

#import "ThirdViewController.h"

#import "STMAdminViewController.h"

#import "STMAdminReportsViewController.h"

#import "STMAdminSettingsViewController.h"
#import "MainViewController.h"

#define TENANT  @"http://happiestminds.dev.kidozen.com"
#define APP  @"stm"
#define USER  @"hm@kidozen.com"
#define PASS  @"pass"

@implementation AppDelegate

@synthesize isAdmin,addDict,mDeviceToken;
@synthesize settingsDict;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    addDict=[[NSMutableDictionary alloc]initWithCapacity:1];
    settingsDict=[[NSMutableDictionary alloc]initWithCapacity:1];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Kido-Code.
//    self.kidozenApplication = [[KZApplication alloc] initWithTennantMarketPlace:TENANT applicationName:APP andCallback:^(KZResponse * kr) {
//        NSAssert(!kr.error, @"error must be null");
//        [kr.application authenticateUser:USER withProvider:@"kidozen" andPassword:PASS completion:^(id kr) {
//            NSAssert(![kr  isKindOfClass:[NSError class]], @"error must be null");
//        }];
//    }];
    
    UIViewController *viewController1 = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    
    self.window.rootViewController = navController1;
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    return YES;
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	NSLog(@"My token is: %@", deviceToken);
    NSString * ldeviceToken =(NSString *)deviceToken;
	NSLog(@"My token is: %@", ldeviceToken);
//ldeviceToken=@"73c6618dd7e8b84024557f59f724228896b356cded4679bd217f4a065013766f";
  ldeviceToken  = @"d74b727499c282c7e955487360e3155209e724e2f7198808e03b4885cc5c9bc0";
    
   KZNotification *notification=[[taskApplicationDelegate kidozenApplication ]pushNotifications];
    [notification subscribeDevice:ldeviceToken toChannel:@"taskreport" completion:^(KZResponse * k) {
        NSLog(@"Device subscribed to sports channel");
    }];

}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
