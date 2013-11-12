//
//  STMTaskDetailsObject.m
//  STM
//
//  Created by Prem kumar on 03/01/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "STMTaskDetailsObject.h"

@implementation STMTaskDetailsObject

static STMTaskDetailsObject *sharedInstance = nil;

@synthesize taskName,taskDesc,startDate,endDate,owner,dependencies,progress,status;


- (void)initializeSharedInstance
{
    self.taskName = [[NSString alloc]init];
    self.taskDesc = [[NSString alloc]init];
    self.startDate = [[NSString alloc]init];
    self.endDate = [[NSString alloc]init];
    self.owner = [[NSString alloc]init];
    self.dependencies = [[NSString alloc]init];
    self.progress = [[NSString alloc]init];
    self.status = [[NSString alloc] init];
    
}

#pragma mark - Lifecycle Methods

+ (STMTaskDetailsObject *)sharedInstance
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance initializeSharedInstance];
        }
        return sharedInstance;
    }
}
- (id)copyWithZone:(NSZone *)zone
{
	STMTaskDetailsObject *myClassInstanceCopy = [[STMTaskDetailsObject allocWithZone: zone] init];
    
	myClassInstanceCopy.taskName = [self.taskName copy];
	myClassInstanceCopy.taskDesc = [self.taskDesc copy];
    myClassInstanceCopy.startDate=[self.startDate copy];
    myClassInstanceCopy.endDate=[self.endDate copy];
    myClassInstanceCopy.owner = [self.owner copy];
    myClassInstanceCopy.dependencies=[self.dependencies copy];
    myClassInstanceCopy.progress=[self.progress copy];
	
	return myClassInstanceCopy;
}
@end
