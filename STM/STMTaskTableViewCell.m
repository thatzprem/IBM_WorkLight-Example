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
@synthesize labelName               =   __labelName;
@synthesize labelTotalAmount        =   __labelTotalAmount;
@synthesize labelAmountPaidYet      =   __labelAmountPaidYet;
@synthesize labelNextDueDate        =   __labelNextDueDate;
@synthesize imageViewBackground     =   __imageViewBackground;
@synthesize imageViewPaidStatus     =   __imageViewPaidStatus;
@synthesize imageViewDisclosure     =   __imageViewDisclosure;


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
    __labelName = nil;
    
    __labelTotalAmount = nil;
    
    __labelAmountPaidYet = nil;
    
    __labelNextDueDate = nil;
    
    __imageViewBackground = nil;
    
    __imageViewPaidStatus = nil;
    
    __imageViewDisclosure = nil;
    
}

@end
