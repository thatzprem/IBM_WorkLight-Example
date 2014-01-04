//
//  STMDetailsViewController.m
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import "STMDetailsViewController.h"
#import "AppDelegate.h"
#import "STMTaskDetailsObject.h"
#import "CustomCell.h"
@interface STMDetailsViewController ()


@property(nonatomic,retain) UIBarButtonItem *barButtonEdit;
@property(nonatomic,retain) UIBarButtonItem *barButtonDone;
@property(nonatomic,retain) STMTaskDetailsObject *localDictionary;
@property(nonatomic)int indexPath;


-(void)buttonActionDone:(id)sender;
- (void)buttonActionEdit:(id)sender;
-(STMTaskDetailsObject*)getModifiedDetails;



- (void) modifyCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end

@implementation STMDetailsViewController

@synthesize barButtonDone               =   __barButtonDone;
@synthesize barButtonEdit               =   __barButtonEdit;
@synthesize localDictionary             =   __localDictionary;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(STMTaskDetailsObject*)localDictionary indexPath:(int)indexPath{
    
    self.localDictionary = localDictionary;
    indexPath = indexPath;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Task Details";
    
    self.barButtonEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(buttonActionEdit:)];
    
    self.barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonActionDone:)];
    
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (!appDelegate.isAdmin) {
        self.navigationItem.rightBarButtonItem = self.barButtonDone;
    }
    
    //Changing request for approval button.
    if (appDelegate.isAdmin) {
        
        if ([self.localDictionary.status isEqualToString:@"WaitingApproval"])  {
            
            UIBarButtonItem *barButtonApprove = [[UIBarButtonItem alloc] initWithTitle:@"Approve" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonActionApprove:)];
            self.navigationItem.rightBarButtonItem = barButtonApprove;
            
        }
    }
    
    self.navigationItem.leftBarButtonItem=nil;
}

-(void)buttonActionApprove:(id)sender{
    
//    NSMutableDictionary *updatedTask = [NSMutableDictionary dictionaryWithDictionary:self.localDictionary];
//    [updatedTask setObject:@"Pending" forKey:@"status"];
//    self.localDictionary = updatedTask;
//    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Task status changed to approved!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alertView show];
//    self.navigationItem.rightBarButtonItem = self.barButtonDone;
    
}

-(void)buttonActionDone:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    if ([appDelegate.addDict objectForKey:@"taskName"] == nil || [appDelegate.addDict objectForKey:@"startDate"] == nil) {
        UIAlertView *addTaskIncompleteDataAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"TaskName or Start date is empty" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [addTaskIncompleteDataAlert show];
        return;
    }
    [appDelegate.tasksObjectsArray removeObjectAtIndex:self.indexPath];
    
    STMTaskDetailsObject *taskObject = [[STMTaskDetailsObject alloc] init];
    taskObject.taskName = [appDelegate.addDict objectForKey:@"taskName"];
    taskObject.taskDesc = [appDelegate.addDict objectForKey:@"description"];
    taskObject.startDate = [appDelegate.addDict objectForKey:@"startDate"];
    taskObject.endDate = [appDelegate.addDict objectForKey:@"endDate"];
    taskObject.owner = [appDelegate.addDict objectForKey:@"owner"];
    taskObject.dependencies = [appDelegate.addDict objectForKey:@"dependencies"];
    taskObject.taskProgress = [appDelegate.addDict objectForKey:@"progress"];
    taskObject.status = [appDelegate.addDict objectForKey:@"status"];
    
    [appDelegate.tasksObjectsArray addObject:taskObject];
    
    NSLog(@"%@",[appDelegate.tasksObjectsArray objectAtIndex:[appDelegate.tasksObjectsArray count]-1]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)buttonActionEdit:(id)sender{
    
    self.navigationItem.rightBarButtonItem = self.barButtonDone;
}
//
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    return 6;
//}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier indexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // Configure the cell...
    [cell assignDataToValues:self.localDictionary forIndexPath:indexPath];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
}

@end
