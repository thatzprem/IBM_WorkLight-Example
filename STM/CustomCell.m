//
//  CustomCell.m
//  STM
//
//  Created by Smaranika Tripathy on 04/01/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import "CustomCell.h"
#import "AppDelegate.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        if (indexPath.section==0) {
            if (captionLabel == nil) {
                captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 125.0, 24.0)];
                captionLabel.tag = 101;
                //captionLabel.textAlignment=NSTextAlignmentCenter;
                captionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
                
                [self.contentView addSubview:captionLabel];
            }

        }
        
         [self modifyCell:self forIndexPath:indexPath];
    }
    return self;
}

- (void) modifyCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section ==0) {
        
        if (indexPath.row == 0)
        {
            captionLabel.text = NSLocalizedString(@"taskname", @"taskname");
            customTextField=[self creteTextFldWithTag:200 forCell:cell];
            
        }
        else if(indexPath.row == 1)
        {
            captionLabel.text = NSLocalizedString(@"startDate", @"startDate");
            customTextField=[self creteTextFldWithTag:201 forCell:cell];
            
        }
        else if(indexPath.row == 2)
        {
            captionLabel.text = NSLocalizedString(@"endDate", @"endDate");
            customTextField=[self creteTextFldWithTag:202 forCell:cell];
            
        }
        else if(indexPath.row == 3)
        {
            captionLabel.text = NSLocalizedString(@"owner", @"owner");
            customTextField=[self creteTextFldWithTag:203 forCell:cell];
            
        }
        else if(indexPath.row == 4)
        {
            captionLabel.text = NSLocalizedString(@"dependencies", @"dependencies");
            customTextField= [self creteTextFldWithTag:204 forCell:cell];
            
        }
        else if(indexPath.row == 5)
        {
            captionLabel.text = NSLocalizedString(@"progress", @"progress");
            customTextField=[self creteTextFldWithTag:205 forCell:cell];
            
        }
        else if(indexPath.row == 6)
        {
            captionLabel.text = NSLocalizedString(@"status", @"status");
            customTextField=[self creteTextFldWithTag:206 forCell:cell];
            
        }
        [self.contentView addSubview:customTextField];

    }
    else if (indexPath.section==1 && indexPath.row==0)
    {
       // captionLabel.text = NSLocalizedString(@"description", @"description");
        [captionLabel removeFromSuperview];
        
        descriptionView=[[UITextView alloc]initWithFrame:CGRectMake(10.0, 12.0, 300.0, 60.0)];
        descriptionView.delegate=self;
        descriptionView.tag=555;
        [descriptionView setScrollEnabled:NO];
        [descriptionView setUserInteractionEnabled:YES];
        [descriptionView setBackgroundColor:[UIColor clearColor]];
        descriptionView.keyboardType=UIKeyboardTypeNamePhonePad;
        [self.contentView addSubview:descriptionView];
    }


}
-(UITextField *)creteTextFldWithTag:(int)tagNumber forCell:(UITableViewCell *)cell{
    
   // UITextField *txtField= (UITextField *)[cell.contentView viewWithTag:tagNumber];
    
    if (customTextField == nil) {
        customTextField = [[UITextField alloc] initWithFrame:CGRectMake(140.0, 12.0, 150.0, 24.0)];
        customTextField.tag = tagNumber;
        customTextField.delegate = self;
        
        customTextField.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        customTextField.keyboardType = UIKeyboardTypeDefault;
        
        switch (tagNumber) {
            case 200:
                customTextField.placeholder = NSLocalizedString(@"taskName", @"taskName");
                break;
            case 201:
                customTextField.placeholder = NSLocalizedString(@"startDate", @"startDate");
                break;
            case 202:
                customTextField.placeholder = NSLocalizedString(@"endDate", @"endDate");
                break;
            case 203:
                customTextField.placeholder = NSLocalizedString(@"owner", @"owner");
                break;
            case 204:
                customTextField.placeholder = NSLocalizedString(@"dependencies", @"dependencies");
                break;
            case 205:
                customTextField.placeholder = NSLocalizedString(@"progress", @"progress");
                break;
            case 206:
                customTextField.placeholder = NSLocalizedString(@"status", @"status");
                break;
                
            default:
                break;
        }
    }
    return customTextField;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField.tag == 206) {
        
        [customTextField setEnabled:NO];
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Select Type", @"Select Type") delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", @"Cancel") destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Pending", @"Pending"), NSLocalizedString(@"Completed", @"Completed"),NSLocalizedString(@"Request for approval", @"Request for approval"), nil];
        
        actionSheet.delegate = self;
        [actionSheet showInView:self];
        
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        customTextField.text = @"Pending";
    }
    else if (buttonIndex == 1){
        customTextField.text = @"Completed";
    }
    else if (buttonIndex == 2){
        customTextField.text = @"WaitingApproval";
    }

    
    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
    NSLog(@"customTextField.placeholder=%@ val=%@",customTextField.placeholder,customTextField.text);

    [del.addDict setObject:customTextField.text forKey:customTextField.placeholder];

    
}
#pragma mark -
#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
    NSLog(@"customTextField.placeholder=%@ val=%@",customTextField.placeholder,textField.text);
    
    if (textField.tag != 206) {
        [del.addDict setObject:textField.text forKey:customTextField.placeholder];
    }
    
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
   
    [textField resignFirstResponder];
    return YES;

}
#pragma mark -
#pragma mark UITextViewDelegate Methods

-(void)textViewDidEndEditing:(UITextView *)textView{
        
    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [del.addDict setObject:textView.text forKey:@"description"];
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)txtView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if( [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound ) {
        return YES;
    }
    
    [txtView resignFirstResponder];
    return NO;
}
#pragma mark -

-(void)assignDataToValues:(NSDictionary *)taskDict forIndexPath:(NSIndexPath *)indexpath{
    
    if (indexpath.section==0) {
        switch (indexpath.row) {
            case 0:
                customTextField.text=[taskDict objectForKey:@"taskName"];
                break;
            case 1:
                customTextField.text=[taskDict objectForKey:@"startDate"];
                break;
            case 2:
                customTextField.text=[taskDict objectForKey:@"endDate"];
                break;
            case 3:
                customTextField.text=[taskDict objectForKey:@"owner"];
                break;
            case 4:
                customTextField.text=[taskDict objectForKey:@"dependencies"];
                break;
            case 5:
                customTextField.text=[taskDict objectForKey:@"progress"];
                break;
            case 6:
                NSLog(@"%@",[taskDict objectForKey:@"status"]);
                customTextField.text=[taskDict objectForKey:@"status"];
                break;
            default:
                break;
        }
    }
    else if(indexpath.section==1){
        
        if (descriptionView) {
            descriptionView.text=[taskDict objectForKey:@"description"];
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
