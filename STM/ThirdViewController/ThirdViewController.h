//
//  ThirdViewController.h
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UITableViewController<UITextFieldDelegate>{
    
    UIBarButtonItem *barButtonEdit ;
    UIBarButtonItem *barButtonDone ;
    
    KZStorage * _tasksStorage;
    NSMutableArray * _tasks;
    
    NSMutableDictionary *settingsDict;


}

@end
