//
//  CustomSettingsCell.h
//  STM
//
//  Created by Smaranika Tripathy on 09/01/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSettingsCell : UITableViewCell<UITextFieldDelegate>
{
    
    UILabel *captionLabel;
    UITextField *customTextField;
    UISwitch *customSwitch;
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
-(void)assignDataToValues:(NSDictionary *)taskDict;
@end
