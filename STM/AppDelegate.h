//
//  AppDelegate.h
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 Happiest Minds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KZApplication.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) KZApplication * kidozenApplication;

@property (strong, nonatomic) NSMutableDictionary *addDict;
@property (strong, nonatomic) NSMutableDictionary *settingsDict;

@property (readwrite) BOOL isAdmin;
@property(strong,nonatomic)NSString * mDeviceToken;
@end
