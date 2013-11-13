//
//  MainViewController.m
//  STM
//
//  Created by Smaranika Tripathy on 03/01/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "MainViewController.h"
#import "STMTableViewController.h"

#import "SecondViewController.h"

#import "ThirdViewController.h"

#import "STMAdminViewController.h"

#import "STMAdminReportsViewController.h"

#import "STMAdminSettingsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize HUD;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden=YES;
    
    [userBtn setHidden:YES];
    [adminBtn setHidden:YES];
    
    self.HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:self.HUD];
    
    [self.HUD setDelegate:self];
    self.HUD.labelText = @"Connecting to server...";
    self.HUD.dimBackground =NO;
    self.HUD.minShowTime = 1.0f;
    [self.HUD setHidden:NO];
    [self.HUD showWhileExecuting:@selector(downloadDataFromServer) onTarget:self withObject:nil animated:YES];
    
}
-(void)downloadDataFromServer
{
    returnDownloadMethodValue = 1;
    
}

//HUDDelegate method for CustomProgress indicator hidden
//Called after the download completes in downloadDataFromServer method
-(void)hudWasHidden:(MBProgressHUD *)hud
{
    //If Synchronization selected from SettingsView
    
    
    [userBtn setHidden:NO];
    [adminBtn setHidden:NO];
    
    [userBtn setEnabled:YES];
    [adminBtn setEnabled:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onPressed:(id)sender{
    
    
    //USER
    UIViewController *viewController1 = [[STMTableViewController alloc] initWithNibName:@"STMTableViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    navController1.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem1 = [[UITabBarItem alloc] initWithTitle:@"Tasks" image:[UIImage imageNamed:@"tasks.png"] tag:0];
    viewController1.tabBarItem = theItem1;
    
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    navController2.navigationBar.tintColor = [UIColor blackColor];
    
    UIViewController *viewController3 = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    navController3.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem3 = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"settings.png"] tag:0];
    viewController3.tabBarItem = theItem3;
    
    
    //ADMIN
    UIViewController *viewController1_admin = [[STMAdminViewController alloc] initWithNibName:@"STMAdminViewController" bundle:nil];
    UINavigationController *navController1_admin = [[UINavigationController alloc] initWithRootViewController:viewController1_admin];
    navController1_admin.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem1_admin = [[UITabBarItem alloc] initWithTitle:@"Tasks" image:[UIImage imageNamed:@"tasks.png"] tag:0];
    viewController1_admin.tabBarItem = theItem1_admin;
    [[viewController1_admin tabBarItem]setBadgeValue:@"1"];
    
    
    UIViewController *viewController2_admin = [[STMAdminReportsViewController alloc] initWithNibName:@"STMAdminReportsViewController" bundle:nil];
    UINavigationController *navController2_admin = [[UINavigationController alloc] initWithRootViewController:viewController2_admin];
    navController2_admin.navigationBar.tintColor = [UIColor blackColor];
    
    UIViewController *viewController3_admin = [[STMAdminSettingsViewController alloc] initWithNibName:@"STMAdminSettingsViewController" bundle:nil];
    UINavigationController *navController3_admin = [[UINavigationController alloc] initWithRootViewController:viewController3_admin];
    navController3_admin.navigationBar.tintColor = [UIColor blackColor];
    UITabBarItem* theItem3_admin = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"settings.png"] tag:0];
    viewController3_admin.tabBarItem = theItem3_admin;
    
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    
	[[[self.tabBarController.viewControllers objectAtIndex:0] tabBarItem] setBadgeValue:@"Prem"];
	[UIApplication sharedApplication].applicationIconBadgeNumber = 2;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    if ([sender tag]==1) {
        
        appDelegate.isAdmin = FALSE;

        self.tabBarController.viewControllers = @[navController1, navController2, navController3];

    }else
    if ([sender tag]==2) {
            
            appDelegate.isAdmin = TRUE;
            
            self.tabBarController.viewControllers = @[navController1_admin, navController2_admin, navController3_admin];
    }
    [self.navigationController pushViewController:self.tabBarController animated:YES];
}

@end
