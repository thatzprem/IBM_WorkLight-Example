#import "CustomSettingsCell.h"
#import "AppDelegate.h"

@implementation CustomSettingsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        if (captionLabel == nil) {
            captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 125.0, 24.0)];
            captionLabel.tag = 101;
            captionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
            
            [self.contentView addSubview:captionLabel];
        }
        
        [self modifyCell:self forIndexPath:indexPath];
    }
    return self;
}

- (void) modifyCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        captionLabel.text = NSLocalizedString(@"E-mail", @"E-mail");
        
        customTextField=[self creteTextFldWithTag:200 forCell:cell];
        customTextField.placeholder = NSLocalizedString(@"E-mail", @"E-mail");
        
    }
    else if (indexPath.row == 1 && indexPath.section == 0)
    {
        captionLabel.text = NSLocalizedString(@"Mobile", @"Mobile");
        
        customTextField=[self creteTextFldWithTag:201 forCell:cell];
        customTextField.placeholder = NSLocalizedString(@"Mobile", @"Mobile");
        
        
    }
    else if(indexPath.row == 0 && indexPath.section == 1)
    {
        captionLabel.frame=CGRectMake(10.0, 10.0, 140.0, 24.0);

        captionLabel.text = NSLocalizedString(@"Password enable", @"Password enable");
        customSwitch=[self creteSwitchWithTag:202 forCell:cell];
        
    }
    else if(indexPath.row == 1 && indexPath.section == 1)
    {
        captionLabel.frame=CGRectMake(10.0, 10.0, 140.0, 24.0);

        captionLabel.text = NSLocalizedString(@"Background lock", @"Background lock");
        customSwitch=[self creteSwitchWithTag:203 forCell:cell];
        
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
    [self.contentView addSubview:customTextField];
    
    
}
-(UISwitch *)creteSwitchWithTag:(int)tagNumber forCell:(UITableViewCell *)cell{
    if (customSwitch == nil)  {
        customSwitch = [[UISwitch alloc] init];
        CGRect switchFrame = customSwitch.frame;
        switchFrame.origin = CGPointMake(185.0, floorf((44.0 - switchFrame.size.height) / 2.0) );
        customSwitch.frame = switchFrame;
        customSwitch.tag = tagNumber;
        [cell.contentView addSubview:customSwitch];
        [customSwitch addTarget:self action:@selector(switchActionPasswordEnable:) forControlEvents:UIControlEventValueChanged];
    }
    return customSwitch;
}

- (void)switchActionPasswordEnable:(id)sender{
    
    UISwitch *mySwitch=sender;
    NSString *key;
    BOOL isOn;
    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;

    if([mySwitch isOn]) {
        isOn=YES;
    } else {
        // Do nothing - switch is not on.
        isOn=NO;
    }
    

    switch ([sender tag]) {
        case 202:
            key=@"Password enable";
            break;
        case 203:
            key=@"Background lock";
            break;
    
    }
    [del.settingsDict setObject:[NSNumber numberWithBool:isOn] forKey:key];
    NSLog(@"settingsDict=%@",del.settingsDict);

}
-(UITextField *)creteTextFldWithTag:(int)tagNumber forCell:(UITableViewCell *)cell{
    
    // UITextField *txtField= (UITextField *)[cell.contentView viewWithTag:tagNumber];
    
    if (customTextField == nil)
    {
        customTextField = [[UITextField alloc] initWithFrame:CGRectMake(140.0, 12.0, 150.0, 24.0)];
        customTextField.tag = tagNumber;
        customTextField.delegate = self;
        
        customTextField.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        customTextField.keyboardType = UIKeyboardTypeDefault;
        
    }
    return customTextField;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    AppDelegate *del=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [del.settingsDict setObject:textField.text forKey:customTextField.placeholder];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}
-(void)assignDataToValues:(NSDictionary *)taskDict{
    
    switch (customTextField.tag) {
        case 200:
            customTextField.text=[taskDict objectForKey:@"E-mail"];
            break;
        case 201:
            customTextField.text=[taskDict objectForKey:@"Mobile"];
            break;
        default:
            break;
    }
    
    switch (customSwitch.tag) {
        case 202:
            customTextField.text=[taskDict objectForKey:@"Password enable"];
            break;
        case 203:
            customTextField.text=[taskDict objectForKey:@"Background lock"];
            break;
        default:
            break;
    }
}

@end
