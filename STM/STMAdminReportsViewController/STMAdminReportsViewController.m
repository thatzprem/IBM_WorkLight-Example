//
//  STMAdminReportsViewController.m
//  STM
//
//  Created by Prem kumar on 29/12/12.
//  Copyright (c) 2012 Happiest Minds. All rights reserved.
//

#import "STMAdminReportsViewController.h"
#import "AppDelegate.h"
#import "KZNotification.h"

@interface STMAdminReportsViewController (){

    KZNotification * notification;
}

@end

@implementation STMAdminReportsViewController
@synthesize weeklyRptBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.title = NSLocalizedString(@"Reports", @"Reports");
        self.tabBarItem.image = [UIImage imageNamed:@"report"];

    }
    return self;
}

-(IBAction)onBtnPressed:(id)sender{

    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Incomplete implementation as Kidozen push notification feature didn't work" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
    [alert show];
    
    
    
//   // AppDelegate *del= (AppDelegate *)[[UIApplication sharedApplication]delegate]; // get Apple Push Notification service device token id
//
//    notification=[[taskApplicationDelegate kidozenApplication] pushNotifications];
//    
//    NSDictionary * message = [NSDictionary dictionaryWithObjectsAndKeys:@"ios push message", @"title",@"KZ Push notifications!", @"text", nil];
//    
//    [notification pushNotification:message InChannel:@"taskreport" completion:^(KZResponse * k) {
//        NSLog(@"message published in Task Report channel");
//    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Reports";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
