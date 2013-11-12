//
//  AppDelegate.h
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *tasksObjectsArray;
@property (strong, nonatomic) NSMutableDictionary *settingsDict;
@property (strong, nonatomic) NSMutableDictionary *addDict;


@property (readwrite) BOOL isAdmin;
@property(strong,nonatomic)NSString * mDeviceToken;
@end
