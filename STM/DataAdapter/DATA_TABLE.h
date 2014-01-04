//
//  DATA_TABLE.h
//  STM
//
//  Created by Prem kumar on 10/12/13.
//  Copyright (c) 2013 FreakApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DATA_TABLE : NSManagedObject

@property (nonatomic, retain) NSString * dependency;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * owner;
@property (nonatomic, retain) NSNumber * progress;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * taskDesc;
@property (nonatomic, retain) NSString * taskName;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSNumber * recordID;

@end
