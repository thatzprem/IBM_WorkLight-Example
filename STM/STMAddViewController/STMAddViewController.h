//
//  STMAddViewController.h
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMAddViewController : UITableViewController{

    NSDictionary * mDict;
    UIBarButtonItem *barButtonCancel;
    
}

@property(nonatomic,strong)IBOutlet UITextField *taskName;
@property(nonatomic,strong)IBOutlet UITextField *taskDesc;
@property(nonatomic,strong)IBOutlet UITextField *startDate;
@property(nonatomic,strong)IBOutlet UITextField *endDate;
@property(nonatomic,strong)IBOutlet UITextField *owner;
@property(nonatomic,strong)IBOutlet UITextField *dependencies;
@property(nonatomic,strong)IBOutlet UITextField *progress;
//@property(nonatomic,strong)IBOutlet BOOL *completed;

@property(nonatomic,retain) UIBarButtonItem *barButtonCancel;





@end
