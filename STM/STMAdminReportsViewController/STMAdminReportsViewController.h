//
//  STMAdminReportsViewController.h
//  STM
//
//  Created by Prem kumar on 29/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMAdminReportsViewController : UIViewController{
    
  IBOutlet  UIButton *weeklyRptBtn;
}
@property(nonatomic,strong)IBOutlet  UIButton *weeklyRptBtn;

-(IBAction)onBtnPressed:(id)sender;
@end
