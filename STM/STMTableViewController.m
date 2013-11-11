//
//  STMTableViewController.m
//  STM
//
//  Created by Prem kumar on 26/12/12.
//  Copyright (c) 2012 freakApps. All rights reserved.
//

#import "STMTableViewController.h"
#import "STMAddViewController.h"
#import "STMDetailsViewController.h"
#import "STMTaskTableViewCell.h"
#import "AppDelegate.h"


#define TASKNAME_ARRAY [NSArray arrayWithObjects:@"Sears Workbook", @"Clear Pending PTT Issues", @"Release PTT for HM-Testing",@"PTT Release for Sears",@"Augmented Reality",@"AR-Team Discussion",@"dsfsd", nil]

#define	SECTION_TITLE_ARRAY	[NSArray arrayWithObjects:@"11/12/2012",@"12/12/2012",@"13/12/2012", @"14/12/2012", @"15/12/2012", @"16/12/2012", @"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads",@"2006-2010",@"dfads", nil]



@interface STMTableViewController (){
    
    KZStorage * _tasksStorage;
    NSMutableArray * _tasks;



}
@property (strong, nonatomic) id tasksType;
@property (strong, nonatomic) NSMutableArray *sectionHeaderArray;
@property (nonatomic, retain) UIBarButtonItem             *barButtonAdd;
@property (nonatomic, retain) UIBarButtonItem             *barButtonDone;
@property (nonatomic, retain) UIBarButtonItem             *barButtonEdit;
- (void)buttonActionAdd:(id)sender;
- (void)buttonActionEdit:(id)sender;
-(void)buttonActionDone:(id)sender;

- (void)modifyCell:(STMTaskTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)configureView;


@end

int numberOfRows;


@implementation STMTableViewController

NSIndexPath *rowToDelete;


@synthesize barButtonAdd                =   __barButtonAdd;
@synthesize barButtonEdit               =   __barButtonEdit;
@synthesize barButtonDone               =   __barButtonDone;
@synthesize sectionHeaderArray          =   __sectionHeaderArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self configureView];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureView];
        // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.title = @"Tasks";
    self.barButtonEdit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(buttonActionEdit:)];
    self.barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(buttonActionAdd:)];
    self.barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(buttonActionDone:)];

    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (!appDelegate.isAdmin) {
        
        self.navigationItem.leftBarButtonItem = self.barButtonEdit;
    }
    self.navigationItem.rightBarButtonItem = self.barButtonAdd;
    [self.tableView reloadData];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{
    _tasks=nil;
    [self configureView];
    
}

- (void)configureView{

    self.tasksType = @"All";
    
    if (self.tasksType) {
        NSLog(@"task=%@",_tasks);
        
        if (!_tasks) {
            _tasks = [[NSMutableArray alloc] init];
            _tasksStorage = [[taskApplicationDelegate kidozenApplication] StorageWithName:@"samplePrem"];
            if ([_tasksType isEqualToString:@"All"]) {
                [_tasksStorage all:^(KZResponse * k) {
                    _tasks = [k response];
                    [self.tableView reloadData];
                    
                }];
            }
            else
            {
                NSString * completed = [_tasksType isEqualToString:@"Completed"] ? @"true" : @"false";
                NSLog(@"completed = %@",completed);
                
                //NSString * queryString = [NSString stringWithFormat:@"{\"completed\":%@}", completed];
                NSString * queryString = [NSString stringWithFormat:@"{\"status\":\"Pending\"}"];
                [_tasksStorage query:queryString withBlock:^(KZResponse * k) {
                    _tasks = [k response];
                    
                    NSLog(@"QueryString  = %@",queryString);
                    //NSLog(@"Response = %@",_tasks);
                    
                    [self.tableView reloadData];
                }];
            }
        }
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
    NSLog(@"Tasks row coun = %d",[_tasks count]);
    
    return [TASKNAME_ARRAY count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    numberOfRows = 1;
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
 	return [SECTION_TITLE_ARRAY objectAtIndex:section];

}

//Below delegate COMMENTED to be used later.

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
//    if (section == 0){
//        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.bounds.size.width - 10, 18)];
//        label.text = @"Section Header Text Here";
//        label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
//        label.backgroundColor = [UIColor clearColor];
//        
//        
//        UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HomeHeaderImage.png"]];
//        
//        headerImage.frame = CGRectMake(0, 0, tableView.bounds.size.width, 30);
//        
//        [headerImage addSubview:label];
//
//        [headerView addSubview:headerImage];
//
//        
//        [headerView setBackgroundColor:[UIColor blackColor]];
//
//    }
//    else
//        [headerView setBackgroundColor:[UIColor blackColor]];
//    return headerView;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    STMTaskTableViewCell *cell = (STMTaskTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"STMTaskTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [self modifyCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)modifyCell:(STMTaskTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIImage *bgImage = nil;
    UIImage *disclosureImage;
    
    NSDictionary *taskDictionary = [NSDictionary dictionaryWithObject:@"Prem" forKey:@"taskName"];
    
    NSDictionary *task = taskDictionary;

    NSString* statusString = @"Completed";
    
    UIImage *badgeImage = nil;
    
    
    if ([statusString isEqualToString:@"Completed"]) {
        
        disclosureImage = [UIImage imageNamed:@"table_disclosure_green.png"];
        
        if (numberOfRows == 1) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_green_single.png"];
            badgeImage = [UIImage imageNamed:@"goal_paid_top.png"];
        } else if (indexPath.row == 0 ) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_green_top.png"];
            badgeImage = [UIImage imageNamed:@"goal_paid_top.png"];
        } else if (indexPath.row == (numberOfRows - 1) ) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_green_bottom.png"];
            badgeImage = [UIImage imageNamed:@"goal_paid_bottom.png"];
        } else {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_green_middle.png"];
            badgeImage = [UIImage imageNamed:@"goal_paid_bottom.png"];
        }
    }
    else if ([statusString isEqualToString:@"Pending"]){
        
        disclosureImage = [UIImage imageNamed:@"table_disclosure_red.png"];

        
        if (numberOfRows == 1) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_red_single.png"];
            badgeImage = [UIImage imageNamed:@"goal_overdue_top.png"];
        } else if (indexPath.row == 0 ) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_red_top.png"];
            badgeImage = [UIImage imageNamed:@"goal_overdue_top.png"];
        } else if (indexPath.row == (numberOfRows - 1) ) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_red_bottom.png"];
            badgeImage = [UIImage imageNamed:@"goal_overdue_bottom.png"];
        } else {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_red_middle.png"];
            badgeImage = [UIImage imageNamed:@"goal_overdue_bottom.png"];
        }
        
    }
    else{
        
        disclosureImage = [UIImage imageNamed:@"table_disclosure_yellow.png"];
        
        
        if (numberOfRows == 1) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_yellow_single.png"];
            badgeImage = [UIImage imageNamed:@"goal_approval_top.png"];
        } else if (indexPath.row == 0 ) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_yellow_top.png"];
            badgeImage = [UIImage imageNamed:@"goal_approval_top.png"];
        } else if (indexPath.row == (numberOfRows - 1) ) {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_yellow_bottom.png"];
            badgeImage = [UIImage imageNamed:@"goal_approval_bottom.png"];
        } else {
            bgImage = [UIImage imageNamed:@"goal_cell_bg_yellow_middle.png"];
            badgeImage = [UIImage imageNamed:@"goal_approval_bottom.png"];
        }
        
    }

    
    
    @try {
        
        NSLog(@"%@",task);
        
        cell.labelName.text = [task objectForKey:@"taskName"];
        cell.labelTotalAmount.text = [task objectForKey:@"taskDesc"];
        cell.labelAmountPaidYet.text = [task objectForKey:@"progress"];
        cell.labelNextDueDate.text = [task objectForKey:@"endDate"];
        cell.labelTotalAmount.text = [task objectForKey:@"description"];
        
        //FIXME--Check the below key value again.
        //[self.tableView reloadData];
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"%@",[exception description]);
    }
    @finally {
                
    }
    
        cell.imageViewBackground.image = bgImage;
        cell.imageViewDisclosure.image = disclosureImage;
        cell.imageViewPaidStatus.image = badgeImage;
        cell.imageViewPaidStatus.frame = CGRectMake( (315.0 - badgeImage.size.width), 0.0, badgeImage.size.width, badgeImage.size.height);

}
    

-(void)buttonActionDone:(id)sender;{
    
    [self.tableView setEditing:NO animated:YES];
    self.navigationItem.leftBarButtonItem = self.barButtonEdit;
}


- (void)buttonActionAdd:(id)sender{
    
    STMAddViewController   *sTMDetailsViewController = [[STMAddViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:sTMDetailsViewController];
    navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self presentViewController:navigationController animated:YES completion:NULL];
    
}
- (void)buttonActionEdit:(id)sender{
        
    [self.tableView setEditing:YES animated:YES];
    self.navigationItem.leftBarButtonItem = self.barButtonDone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    rowToDelete = indexPath;
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"All the data related to this Task will get deleted." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
    [alertView show];
    
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        
        NSLog(@"Delete row action cancelled");
        
    }
    else if (buttonIndex == 1){
        
        if (!_tasksStorage) {
            _tasksStorage = [[taskApplicationDelegate kidozenApplication] StorageWithName:@"samplePrem"];
        }
        
        NSString *taskId = [_tasks[rowToDelete.section]objectForKey:@"_id"];
        NSLog(@"TASK-ID of the deleting row = %@",taskId);

        //Delete a task in a row.
        [_tasksStorage deleteUsingId:taskId withBlock:^(KZResponse * k) {
            NSAssert(!k.error, @"error must be null");
            _tasks=nil;
            [self configureView];
            [self.tableView reloadData];
        }];
        
        
    }
    
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
    
    NSDictionary *task = nil;

    
    STMDetailsViewController *detailViewController = [[STMDetailsViewController alloc] initWithNibName:@"STMDetailsViewController" bundle:nil dictionary:task];
    
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
