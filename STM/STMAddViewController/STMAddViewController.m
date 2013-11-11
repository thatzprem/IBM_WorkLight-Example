//
//  STMAddViewController.m
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import "STMAddViewController.h"
#import "STMTaskDetailsObject.h"
#import "KZStorage.h"
#import "CustomCell.h"
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
    
    [self dismissModalViewControllerAnimated:YES];
    
}

-(void)buttonActionDone:(id)sender
{
//Return the cell details.
    


    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
    NSLog(@"Logging the Dictionary :%@ ",del.addDict);
    //[del.addDict setObject:@"09/01/2013" forKey:@"createDate"];
    
    if (([del.addDict objectForKey:@"taskName"]!= NULL) && ([del.addDict objectForKey:@"startDate"]!= NULL) )
    {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"TaskName and StartDate are mandatory to create task." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
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
    // Return the number of rows in the section.
    if (section==0) {
        return 7;
        
    }else
        return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        return 48;
    }else //if (indexPath.section == 1){
        return 80;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier indexPath:indexPath];
    }
    
    // Configure the cell...
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
    NSLog(@"indexpath=%d",indexPath.row);
}

@end
