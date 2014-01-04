//
//  CoreDataResponse.h
//  CoreDataClient
//
//  Created by Happiest Minds Technologies Pvt Ltd Rudramuni on 04/06/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataResponse : NSObject


// status      -  if sucess  YES else NO.
@property (nonatomic,assign) BOOL status;

// Message     -  reason for failure for this method if any.
@property (nonatomic,strong) NSString *message;

//Total Count -  total count of objects

@property (nonatomic,assign) NSInteger totalCount;

//TotalTime   -  Time to excute this Method

@property (nonatomic,assign) NSTimeInterval totalTime;

//Value       -  It may be NSManagedObject or array of objects. 
@property (nonatomic,strong) id value;

@end
