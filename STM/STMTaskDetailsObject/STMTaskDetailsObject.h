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
@property (nonatomic,strong)NSString *startDate;
@property (nonatomic,strong)NSString *endDate;
@property (nonatomic,strong)NSString *owner;
@property (nonatomic,strong)NSString *dependencies;
@property (nonatomic,strong)NSString *progress;
@property (nonatomic,readwrite)NSString *status;


+ (STMTaskDetailsObject *)sharedInstance;

@end
