//
//  STMPreviewViewController.m
//  STM
//
//  Created by Prem kumar on 10/01/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "STMPreviewViewController.h"

@interface STMPreviewViewController (){
    
    NSMutableString *htmlString;
    
}

@property(nonatomic,retain)NSMutableString *htmlString;

- (IBAction)cancel:(id)sender;


@end

@implementation STMPreviewViewController
@synthesize webView;
@synthesize htmlString;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil HTMLString:(NSMutableString*)localHtmlString
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.htmlString = localHtmlString;
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@",self.htmlString);
    
    UIBarButtonItem* barButtonCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel:)];
    self.navigationItem.rightBarButtonItem = barButtonCancel;
    
    self.navigationItem.title = @"Preview Report";
    
    [webView loadHTMLString:self.htmlString baseURL:nil];

    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)cancel:(id)sender{
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
