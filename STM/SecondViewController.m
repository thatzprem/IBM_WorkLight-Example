//
//  SecondViewController.m
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 Happiest Minds. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "STMPreviewViewController.h"

@interface SecondViewController (){
    
    NSMutableArray * _tasks;
    
}

-(IBAction)sendWeeklyreport:(id)sender;
-(IBAction)sendCompletedTasksreport:(id)sender;
-(IBAction)previewTasksreport:(id)sender;




@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Reports", @"Reports");
        self.tabBarItem.image = [UIImage imageNamed:@"report.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Reports";
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}
-(void)buttonActionDone:(id)sender;{
    
    //[self.tableView setEditing:NO animated:YES];
    self.navigationItem.leftBarButtonItem = __barButtonEdit;
}

- (void)buttonActionEdit:(id)sender{
    
    // [self.tableView setEditing:YES animated:YES];
    self.navigationItem.leftBarButtonItem = __barButtonDone;
}

-(IBAction)previewTasksreport:(id)sender{
    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Feature implementaion pending!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
//    [alert show];
//
    
    KZStorage *_tasksStorage = [[taskApplicationDelegate kidozenApplication] StorageWithName:@"samplePrem"];
    
    //   __block NSMutableArray *w=[[NSMutableArray alloc] init];
    
    
    [_tasksStorage all:^(KZResponse * k) {
        
        _tasks = [k response];
        
        //    [w arrayByAddingObjectsFromArray:_tasks];
        
        NSLog(@"Response = %@",_tasks);
        
        [[_tasks objectAtIndex:0] objectForKey:@"taskName"];
        
        
        htmlText = [[NSMutableString alloc] init];
        [htmlText appendFormat: @"<html><head><title>TEST</title></head>"];
        [htmlText appendFormat: @"<body>"];
        
        [htmlText appendFormat: @"<p>"];
        [htmlText appendFormat: @"Hi Biswajit"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"Please find below the completed Task list for the week:"];
        [htmlText appendFormat: @"<td>%@</td>", [[_tasks objectAtIndex:0] objectForKey:@"startDate"]];
        [htmlText appendFormat: @" to "];
        
        [htmlText appendFormat: @"<td>%@</td>", [[_tasks objectAtIndex:[_tasks count]-1] objectForKey:@"startDate"]];
        
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</p>"];
        
        
        //Table
        [htmlText appendFormat: @"<h4>"];
        [htmlText appendFormat: @"Quick snapshot above:-"];
        [htmlText appendFormat: @"</h4>"];
        
        
        [htmlText appendFormat: @"<table border=\"1\">"];
        
        [htmlText appendFormat: @"<tr>"];
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>sl#</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Date</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Tasks</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Description</b>"];
        [htmlText appendFormat: @"</td>"];
        
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Start date</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>End date</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Owner</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Dependencies</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Progress</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Status</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"</tr>"];
        
        int  i = 0;
        
        for ( NSDictionary* tmpText  in _tasks )
        {
            
            [htmlText appendFormat: @"<tr>"];
            [htmlText appendFormat: @"<td>%d</td>", ++i];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"startDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"taskName"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"description"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"startDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"endDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"owner"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"dependencies"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"progress"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"status"]];
            
            [htmlText appendFormat: @"</tr>"];
            
        }
        
        [htmlText appendFormat: @"<table>"];
        
        AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
        NSString *fromMailID = [NSString stringWithFormat:@"%@",[del.settingsDict objectForKey:@"E-mail"]];
        
        [htmlText appendFormat: @"<p>"];
        [htmlText appendFormat: @"Regards"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"%@",fromMailID];
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</p>"];
        
        [htmlText appendFormat: @"</body>"];
        [htmlText appendFormat: @"</html>"];
        
        // NSString *htmlBody = [[NSString alloc] initWithContentsOfFile:@"Test.html" encoding:NSUTF8StringEncoding error:nil];
        
        // NSLog(@"html Text = %@",htmlText);
        
        STMPreviewViewController *stmPreviewViewController = [[STMPreviewViewController alloc] initWithNibName:@"STMPreviewViewController" bundle:nil HTMLString:htmlText];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:stmPreviewViewController];
        navigationController.navigationBar.tintColor = [UIColor blackColor];

        
        stmPreviewViewController.modalPresentationStyle = UIModalPresentationFormSheet;
        
        [self presentViewController:navigationController animated:YES completion:NULL];
        
    }];

    
    
}
-(IBAction)sendCompletedTasksreport:(id)sender{
    
    
    KZStorage *_tasksStorage = [[taskApplicationDelegate kidozenApplication] StorageWithName:@"samplePrem"];
    
    //   __block NSMutableArray *w=[[NSMutableArray alloc] init];
    
    NSString * queryString = [NSString stringWithFormat:@"{\"status\":\"Completed\"}"];
    
    [_tasksStorage query:queryString withBlock:^(KZResponse * k) {
        
        _tasks = [k response];
        
        //    [w arrayByAddingObjectsFromArray:_tasks];
        
        NSLog(@"Response = %@",_tasks);
        
        [[_tasks objectAtIndex:0] objectForKey:@"taskName"];
        
        
        htmlText = [[NSMutableString alloc] init];
        [htmlText appendFormat: @"<html><head><title>TEST</title></head>"];
        [htmlText appendFormat: @"<body>"];
        
        [htmlText appendFormat: @"<p>"];
        [htmlText appendFormat: @"Hi Biswajit"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"Please find below the completed Task list for the week:"];
        [htmlText appendFormat: @"<td>%@</td>", [[_tasks objectAtIndex:0] objectForKey:@"startDate"]];
        [htmlText appendFormat: @" to "];
        
        [htmlText appendFormat: @"<td>%@</td>", [[_tasks objectAtIndex:[_tasks count]-1] objectForKey:@"startDate"]];
        
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</p>"];
        
        
        //Table
        [htmlText appendFormat: @"<h4>"];
        [htmlText appendFormat: @"Quick snapshot above:-"];
        [htmlText appendFormat: @"</h4>"];
        
        
        [htmlText appendFormat: @"<table border=\"1\">"];
        
        [htmlText appendFormat: @"<tr>"];
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>sl#</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Date</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Tasks</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Description</b>"];
        [htmlText appendFormat: @"</td>"];
        
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Start date</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>End date</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Owner</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Dependencies</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Progress</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>Status</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"</tr>"];
        
        int  i = 0;
        
        for ( NSDictionary* tmpText  in _tasks )
        {
            
            [htmlText appendFormat: @"<tr>"];
            [htmlText appendFormat: @"<td>%d</td>", ++i];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"startDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"taskName"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"description"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"startDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"endDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"owner"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"dependencies"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"progress"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"status"]];
            
            [htmlText appendFormat: @"</tr>"];
            
        }
        
        [htmlText appendFormat: @"<table>"];
        
        AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
        NSString *fromMailID = [NSString stringWithFormat:@"%@",[del.settingsDict objectForKey:@"E-mail"]];
        
        [htmlText appendFormat: @"<p>"];
        [htmlText appendFormat: @"Regards"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"%@",fromMailID];
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</p>"];
        
        [htmlText appendFormat: @"</body>"];
        [htmlText appendFormat: @"</html>"];
        
        // NSString *htmlBody = [[NSString alloc] initWithContentsOfFile:@"Test.html" encoding:NSUTF8StringEncoding error:nil];
        
        // NSLog(@"html Text = %@",htmlText);
        
        [self sendMailWithBody:htmlText];
        
    }];

}

-(IBAction)sendWeeklyreport:(id)sender{
    
    
    //    NSString *htmlBody = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.htmlcodetutorial.com/document/body_ex1.html"] encoding:NSUTF8StringEncoding error:nil];
    
    KZStorage *_tasksStorage = [[taskApplicationDelegate kidozenApplication] StorageWithName:@"samplePrem"];
    
    //   __block NSMutableArray *w=[[NSMutableArray alloc] init];
    
    
    [_tasksStorage all:^(KZResponse * k) {
        
        _tasks = [k response];
        
        //    [w arrayByAddingObjectsFromArray:_tasks];
        
        NSLog(@"Response = %@",_tasks);
        
        [[_tasks objectAtIndex:0] objectForKey:@"taskName"];
        
        
        htmlText = [[NSMutableString alloc] init];
        [htmlText appendFormat: @"<html><head><title>TEST</title></head>"];
        [htmlText appendFormat: @"<body>"];
        
        [htmlText appendFormat: @"<p>"];
        [htmlText appendFormat: @"Hi Biswajit"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"Please find below the Task plan management list for the week:"];
        [htmlText appendFormat: @"<td>%@</td>", [[_tasks objectAtIndex:0] objectForKey:@"startDate"]];
        [htmlText appendFormat: @" to "];

        [htmlText appendFormat: @"<td>%@</td>", [[_tasks objectAtIndex:[_tasks count]-1] objectForKey:@"startDate"]];

        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</p>"];
        
        
        //Table
        [htmlText appendFormat: @"<h4>"];
        [htmlText appendFormat: @"Quick snapshot above:-"];
        [htmlText appendFormat: @"</h4>"];
        
        
        [htmlText appendFormat: @"<table border=\"1\">"];
        
        [htmlText appendFormat: @"<tr>"];
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"<b>sl#</b>"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Date"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Task"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Description"];
        [htmlText appendFormat: @"</td>"];
        
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Start date"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"End date"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Owner"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Dependencies"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Progress"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"<td>"];
        [htmlText appendFormat: @"Status"];
        [htmlText appendFormat: @"</td>"];
        
        [htmlText appendFormat: @"</tr>"];
        
        int  i = 0;
        
        for ( NSDictionary* tmpText  in _tasks )
        {
            
            [htmlText appendFormat: @"<tr>"];
            [htmlText appendFormat: @"<td>%d</td>", i++];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"startDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"taskName"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"description"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"startDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"endDate"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"owner"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"dependencies"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"progress"]];
            [htmlText appendFormat: @"<td>%@</td>", [tmpText valueForKey:@"status"]];

            [htmlText appendFormat: @"</tr>"];
            
        }
        
        [htmlText appendFormat: @"<table>"];
        
        AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
        NSString *fromMailID = [NSString stringWithFormat:@"%@",[del.settingsDict objectForKey:@"E-mail"]];
        
        [htmlText appendFormat: @"<p>"];
        [htmlText appendFormat: @"Regards"];
        [htmlText appendFormat: @"<br>"];
        [htmlText appendFormat: @"%@",fromMailID];
        [htmlText appendFormat: @"</br>"];
        [htmlText appendFormat: @"</p>"];
        
        [htmlText appendFormat: @"</body>"];
        [htmlText appendFormat: @"</html>"];
        
        // NSString *htmlBody = [[NSString alloc] initWithContentsOfFile:@"Test.html" encoding:NSUTF8StringEncoding error:nil];
        
        // NSLog(@"html Text = %@",htmlText);
        
        [self sendMailWithBody:htmlText];
        
    }];
}
-(void)sendMailWithBody:(NSMutableString  *)htmlText{
    
    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *fromMailID=[del.settingsDict objectForKey:@"E-mail"];
    
    if (fromMailID == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Enter Sender mail ID in  Settings Page" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
        alert.tag=10;
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Enter Receiver mail ID" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.tag=20;
        [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
        UITextField *inputText=[alert textFieldAtIndex:0];
        inputText.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 20) {
        UITextField *inputText=[alertView textFieldAtIndex:0];
        AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
        NSString *fromMailID=[del.settingsDict objectForKey:@"E-mail"];
        
        NSString *toMailID=inputText.text;
        
        [[taskApplicationDelegate kidozenApplication] sendMailTo:toMailID
                                                            from:fromMailID
                                                     withSubject:@"Hi"
                                                     andHtmlBody:[NSString stringWithString:htmlText]
                                                     andTextBody:@"Kido test"
                                                      completion:^(KZResponse * k) {
                                                          NSAssert(!k.error, @"error must be null");
                                                      }];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Task details E-Mail sent successfully!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alert show];
        

    }
    else if (alertView.tag==10){
        
        if (buttonIndex==1) {
            ThirdViewController *thVC=[[ThirdViewController alloc]initWithNibName:@"ThirdViewController" bundle:nil];
            [self.navigationController pushViewController:thVC animated:YES];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
