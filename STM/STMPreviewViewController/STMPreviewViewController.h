//
//  STMPreviewViewController.h
//  STM
//
//  Created by Prem kumar on 10/01/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMPreviewViewController : UIViewController


@property (nonatomic,retain)IBOutlet UIWebView *webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil HTMLString:(NSMutableString*)htmlString;

@end
