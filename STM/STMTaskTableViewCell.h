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
    

}
@property(nonatomic,retain) IBOutlet UILabel *labelTaskName;
@property(nonatomic,retain) IBOutlet UILabel *labelTaskDesc;
@property(nonatomic,retain) IBOutlet UILabel *labelTaskProgress;
@property(nonatomic,retain) IBOutlet UILabel *labelTaskDueDate;
@property(nonatomic,retain) IBOutlet UIImageView *imageViewBackground;
@property(nonatomic,retain) IBOutlet  UIImageView *imageViewTaskStatus;
@property(nonatomic,retain) IBOutlet UIImageView *imageViewDisclosure;


@end
