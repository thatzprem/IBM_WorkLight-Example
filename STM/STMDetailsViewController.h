//
//  STMDetailsViewController.h
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STMAddViewController.h"
#import "STMTaskDetailsObject.h"

@interface STMDetailsViewController : STMAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(STMTaskDetailsObject*)localDictionary indexPath:(int)indexPath;


@end
