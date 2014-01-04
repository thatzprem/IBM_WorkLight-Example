//
//  STMTaskDetailsObject.h
//  STM
//
//  Created by Prem kumar on 03/01/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMTaskDetailsObject : NSObject{
    
    
}
@property (nonatomic,strong)NSString *taskName;
@property (nonatomic,strong)NSString *taskDesc;
@property (nonatomic,strong)NSDate *startDate;
@property (nonatomic,strong)NSDate *endDate;
@property (nonatomic,strong)NSString *owner;
@property (nonatomic,strong)NSString *dependencies;
@property (nonatomic,strong)NSNumber *taskProgress;
@property (nonatomic,readwrite)NSString *status;
@property (nonatomic,strong)NSNumber *recordID;


+ (STMTaskDetailsObject *)sharedInstance;

@end
