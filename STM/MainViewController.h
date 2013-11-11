//
//  MainViewController.h
//  STM
//
//  Created by Smaranika Tripathy on 03/01/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface MainViewController : UIViewController<UITabBarControllerDelegate,MBProgressHUDDelegate>{
    
    IBOutlet UIButton *userBtn;
    IBOutlet UIButton *adminBtn;
    int returnDownloadMethodValue;
    
}

@property (strong, nonatomic) UITabBarController *tabBarController;
@property(nonatomic,retain)MBProgressHUD *HUD;             //Custom progress indicator

-(IBAction)onPressed:(id)sender;
@end
