//
//  STMAddViewController.m
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import "STMAddViewController.h"
#import "STMTaskDetailsObject.h"
#import "CustomCell.h"
#import "DataAdapter.h"

#define		ARRAY	[NSArray arrayWithObjects:@"Sears-Workbook",@"Complete the workbook along with Biswajit",@"12/12/2012", @"31/12/2012", @"Prem kumar", @"Biswajit", @"Chris Peri", nil]



@interface STMAddViewController (){
    
}

@property(nonatomic,retain) UIBarButtonItem *barButtonDone;

-(void)buttonActionDone:(id)sender;
-(void)buttonActionCancel:(id)sender;



@end

@implementation STMAddViewController

@synthesize barButtonDone               =   __barButtonDone;
@synthesize barButtonCancel             =   __barButtonCancel;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        AppDelegate *appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate.addDict removeAllObjects];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonActionDone:)];
    self.navigationItem.rightBarButtonItem = self.barButtonDone;
    
    self.barButtonCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonActionCancel:)];
    self.navigationItem.leftBarButtonItem = self.barButtonCancel;
    
    self.navigationItem.title = @"New Task";
    
}
-(void)buttonActionCancel:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)buttonActionDone:(id)sender
{

    //Return the cell details.

    AppDelegate *appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([appDelegate.addDict objectForKey:@"taskName"] == nil || [appDelegate.addDict objectForKey:@"startDate"] == nil) {
        UIAlertView *addTaskIncompleteDataAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"TaskName or Start date is empty" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [addTaskIncompleteDataAlert show];
        return;
    }
    
    STMTaskDetailsObject *taskObject = [[STMTaskDetailsObject alloc] init];
    taskObject.taskName = [appDelegate.addDict objectForKey:@"taskName"];
    taskObject.taskDesc = [appDelegate.addDict objectForKey:@"description"];
    taskObject.startDate = [NSDate date];
    taskObject.endDate = [NSDate date];
    taskObject.owner = [appDelegate.addDict objectForKey:@"owner"];
    taskObject.dependencies = [appDelegate.addDict objectForKey:@"dependencies"];
    taskObject.taskProgress = [NSNumber numberWithInt:50];
    taskObject.status = [appDelegate.addDict objectForKey:@"status"];
    
    [[DataAdapter getSharedInstance] saveDataToLocal:taskObject];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different{
{
    if (section==0) {
        return @"";
    }else
        return @"Description";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 7;
    else return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) return 48;
    else return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier indexPath:indexPath];
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NSLog(@"indexpath=%d",indexPath.row);
}

@end
