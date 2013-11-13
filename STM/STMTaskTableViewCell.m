//
//  STMTaskTableViewCell.m
//  ShouldISpend
//
//  Created by Ashutosh Tamrakar on 01/12/11.
//  Copyright (c) 2011 Atimi. All rights reserved.
//

#import "STMTaskTableViewCell.h"

@interface STMTaskTableViewCell () 

@end


@implementation STMTaskTableViewCell
@synthesize labelTaskName;
@synthesize labelTaskDesc;
@synthesize labelTaskProgress;
@synthesize labelTaskDueDate;
@synthesize imageViewBackground;
@synthesize imageViewTaskStatus;
@synthesize imageViewDisclosure;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    
}

@end
