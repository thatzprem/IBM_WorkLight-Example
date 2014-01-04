//
//  CustomCell.h
//  STM
//
//  Created by Smaranika Tripathy on 04/01/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STMTaskDetailsObject.h"


@interface CustomCell : UITableViewCell<UITextFieldDelegate,UIActionSheetDelegate,UITextViewDelegate>{
    
    UITextField *customTextField;
    UITextView *descriptionView;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
-(void)assignDataToValues:(STMTaskDetailsObject *)taskDict forIndexPath:(NSIndexPath *)indexpath;

@end
