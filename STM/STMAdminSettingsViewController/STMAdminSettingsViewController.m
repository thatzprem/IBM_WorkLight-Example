//
//  STMAdminSettingsViewController.m
//  STM
//
//  Created by Prem kumar on 29/12/12.
//  Copyright (c) 2012 Happiest Minds. All rights reserved.
//

#import "STMAdminSettingsViewController.h"

#import "STMManagePeopleViewController.h"
@interface STMAdminSettingsViewController ()

- (void) modifyCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end

@implementation STMAdminSettingsViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 2) {
        return 3;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    [self modifyCell:cell forIndexPath:indexPath];

    return cell;
}

- (void) modifyCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = NSLocalizedString(@"Manage people", @"Manage people");
        }
        else if (indexPath.row == 1)
        {
            UILabel *captionLabel = (UILabel *)[cell.contentView viewWithTag:101];
            if (captionLabel == nil) {
                captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 125.0, 24.0)];
                captionLabel.tag = 101;
                captionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
                
                [cell.contentView addSubview:captionLabel];
            }
            
            UITextField *textField = (UITextField *)[cell.contentView viewWithTag:200];
            if (textField == nil) {
                textField = [[UITextField alloc] initWithFrame:CGRectMake(140.0, 12.0, 150.0, 24.0)];
                textField.tag = 200;
                //            textField.delegate = self;
                
                textField.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
                [cell.contentView addSubview:textField];
                textField.keyboardType = UIKeyboardTypeDefault;
                
            }
            
            captionLabel.text = NSLocalizedString(@"Manage alerts", @"Manage alerts");
            textField.placeholder = NSLocalizedString(@"Completed", @"Completed");
        }
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    }
    
    else if (indexPath.row == 1 && indexPath.section == 0){
        
            UILabel *captionLabel = (UILabel *)[cell.contentView viewWithTag:101];
            if (captionLabel == nil) {
                captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 125.0, 24.0)];
                captionLabel.tag = 101;
                captionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
                
                [cell.contentView addSubview:captionLabel];
            }
            
            UITextField *textField = (UITextField *)[cell.contentView viewWithTag:200];
            if (textField == nil) {
                textField = [[UITextField alloc] initWithFrame:CGRectMake(140.0, 12.0, 150.0, 24.0)];
                textField.tag = 200;
                textField.userInteractionEnabled = FALSE;
                
                //            textField.delegate = self;
                
                textField.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
                [cell.contentView addSubview:textField];
                textField.keyboardType = UIKeyboardTypeDefault;
                
            }
            
            captionLabel.text = NSLocalizedString(@"Manage alerts", @"Manage alerts");
            textField.placeholder = NSLocalizedString(@"Completed", @"Completed");
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }

    else if(indexPath.row == 1 && indexPath.section == 0)
    {
        UILabel *captionLabel = (UILabel *)[cell.contentView viewWithTag:101];
        if (captionLabel == nil) {
            captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 125.0, 24.0)];
            captionLabel.tag = 101;
            captionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            
            [cell.contentView addSubview:captionLabel];
        }
        
        UITextField *textField = (UITextField *)[cell.contentView viewWithTag:200];
        if (textField == nil) {
            textField = [[UITextField alloc] initWithFrame:CGRectMake(140.0, 12.0, 150.0, 24.0)];
            textField.tag = 200;
            //            textField.delegate = self;
            
            textField.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            [cell.contentView addSubview:textField];
            textField.keyboardType = UIKeyboardTypeDefault;
            
        }
        
        captionLabel.text = NSLocalizedString(@"Mobile", @"Mobile");
        textField.placeholder = NSLocalizedString(@"Mobile", @"Mobile");
    }
    else if(indexPath.row == 0 && indexPath.section == 1)
    {
        
        UILabel *passwordEnableLabel = (UILabel *)[cell.contentView viewWithTag:500];
        if (passwordEnableLabel == nil) {
            passwordEnableLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 140.0, 24.0)];
            passwordEnableLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            
            passwordEnableLabel.tag = 500;
            [cell.contentView addSubview:passwordEnableLabel];
        }
        
        //Adding value Label
        UISwitch *passwordEnableSwitch = (UISwitch *)[cell.contentView viewWithTag:501];
        if (passwordEnableSwitch == nil) {
            passwordEnableSwitch = [[UISwitch alloc] init];
            CGRect switchFrame = passwordEnableSwitch.frame;
            switchFrame.origin = CGPointMake(185.0, floorf((44.0 - switchFrame.size.height) / 2.0) );
            passwordEnableSwitch.frame = switchFrame;
            passwordEnableSwitch.tag = 501;
            [cell.contentView addSubview:passwordEnableSwitch];
            //[passwordEnableSwitch addTarget:self action:@selector(switchActionPasswordEnable:) forControlEvents:UIControlEventValueChanged];
        }
        
        passwordEnableLabel.text = NSLocalizedString(@"Password enable", @"Password enable");
        cell.accessoryType=UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    else if(indexPath.row == 1 && indexPath.section == 1)
    {
        UILabel *passwordEnableLabel = (UILabel *)[cell.contentView viewWithTag:500];
        if (passwordEnableLabel == nil) {
            passwordEnableLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 140.0, 24.0)];
            passwordEnableLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            
            passwordEnableLabel.tag = 500;
            [cell.contentView addSubview:passwordEnableLabel];
        }
        
        //Adding value Label
        UISwitch *passwordEnableSwitch = (UISwitch *)[cell.contentView viewWithTag:501];
        if (passwordEnableSwitch == nil) {
            passwordEnableSwitch = [[UISwitch alloc] init];
            CGRect switchFrame = passwordEnableSwitch.frame;
            switchFrame.origin = CGPointMake(185.0, floorf((44.0 - switchFrame.size.height) / 2.0) );
            passwordEnableSwitch.frame = switchFrame;
            passwordEnableSwitch.tag = 501;
            [cell.contentView addSubview:passwordEnableSwitch];
            //[passwordEnableSwitch addTarget:self action:@selector(switchActionPasswordEnable:) forControlEvents:UIControlEventValueChanged];
        }
        
        passwordEnableLabel.text = NSLocalizedString(@"Background lock", @"Background lock");
        cell.accessoryType=UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    else if(indexPath.section == 2){
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = NSLocalizedString(@"Share with a friend", @"Share with a friend");
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = NSLocalizedString(@"About Us", @"About Us");
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = NSLocalizedString(@"Provide a feedback", @"Provide a feedback");
        }
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
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
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        STMManagePeopleViewController *detailViewController = [[STMManagePeopleViewController alloc] initWithNibName:@"STMManagePeopleViewController" bundle:nil];
        // ...
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:detailViewController animated:YES];

    }
    else if(indexPath.section == 0 && indexPath.row == 1){
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

        //Getting name and notes and save into DAO object, else reloading tableview will clear it out.
        // Getting name
        //NSIndexPath *nameIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        //UITableViewCell *nameCell = [tableView cellForRowAtIndexPath:nameIndexPath];
        //UITextField *nameTextField = (UITextField *)[nameCell.contentView viewWithTag:101];
        
        // Getting notes
        //NSIndexPath *notesIndexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        //UITableViewCell *notesCell = [tableView cellForRowAtIndexPath:notesIndexPath];
        //UITextField *notesTextField = (UITextField *)[notesCell.contentView viewWithTag:101];
        
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Select Type", @"Select Type") delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", @"Cancel") destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Pending", @"Pending"), NSLocalizedString(@"Completed", @"Completed"), nil];
        
        actionSheet.delegate = self;
        [actionSheet showInView:self.view];
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

@end
