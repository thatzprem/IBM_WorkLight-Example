//
//  STMTaskTableViewCell.h
//  ShouldISpend
//
//  Created by Ashutosh Tamrakar on 01/12/11.
//  Copyright (c) 2011 Atimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMTaskTableViewCell : UITableViewCell
{
    IBOutlet UILabel *__labelName;
    IBOutlet UILabel *__labelTotalAmount;
    IBOutlet UILabel *__labelAmountPaidYet;
    IBOutlet UILabel *__labelNextDueDate;
    
    IBOutlet UIImageView *__imageViewBackground;
    IBOutlet UIImageView *__imageViewPaidStatus;
    IBOutlet UIImageView *__imageViewDisclosure;
}
@property(nonatomic,retain) UILabel *labelName;
@property(nonatomic,retain) UILabel *labelTotalAmount;
@property(nonatomic,retain) UILabel *labelAmountPaidYet;
@property(nonatomic,retain) UILabel *labelNextDueDate; 
@property(nonatomic,retain) UIImageView *imageViewBackground;
@property(nonatomic,retain) UIImageView *imageViewPaidStatus;
@property(nonatomic,retain) UIImageView *imageViewDisclosure;


@end
