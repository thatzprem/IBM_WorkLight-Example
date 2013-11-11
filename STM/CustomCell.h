//
//  CustomCell.h
//  STM
//
//  Created by Smaranika Tripathy on 04/01/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell<UITextFieldDelegate,UIActionSheetDelegate,UITextViewDelegate>{
    UILabel *captionLabel;
    UITextField *customTextField;
    UITextView *descriptionView;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
-(void)assignDataToValues:(NSDictionary *)taskDict forIndexPath:(NSIndexPath *)indexpath;

@end
