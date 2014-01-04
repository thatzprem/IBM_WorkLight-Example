//
//  DataAdapter.m
//  STM
//
//  Created by Prem kumar on 07/12/13.
//  Copyright (c) 2013 FreakApps. All rights reserved.
//

#import "DataAdapter.h"
#import "DATA_TABLE.h"
#include <objc/runtime.h>

#define TABLE_NAME @"DATA_TABLE"


@interface DataAdapter (){
 
    CoreDataContextManager *coreDataInstance;

}
@end

@implementation DataAdapter

static  DataAdapter *instance  = nil;

+(DataAdapter*)getSharedInstance{
    
    @synchronized(self) {
		if (instance == nil) {
			instance = [[DataAdapter alloc] init];
		}
	}
	return instance;
}

-(void)saveDataToLocal:(STMTaskDetailsObject *)requestObject{
    
    CoreDataRequest *request = [[CoreDataRequest alloc]init];
    request.entityName = TABLE_NAME;
    
    CoreDataResponse *response = [self createManagedObjectForEntity:request];
    
    DATA_TABLE *dataTableObject;
    if(response.status)
    {
        NSLog(@"Response status: %d",response.status);
        dataTableObject = response.value;
    }
    
    dataTableObject.taskName = requestObject.taskName;
    dataTableObject.taskDesc = requestObject.taskDesc;
    dataTableObject.startDate = (NSDate *)requestObject.startDate;
    dataTableObject.endDate = (NSDate *)requestObject.endDate;
    dataTableObject.owner = requestObject.owner;
    dataTableObject.dependency = requestObject.dependencies;
    dataTableObject.progress = (NSNumber *)requestObject.taskProgress;
    dataTableObject.status = requestObject.status;
    dataTableObject.recordID = [NSNumber numberWithInt:arc4random() %1000000];

    NSError *saveLocalError;
    @try {
        [self saveContext:&saveLocalError];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

-(NSMutableArray *)getAllFromLocal{
        
    CoreDataRequest *request = [[CoreDataRequest alloc]init];
    request.entityName = TABLE_NAME;
    CoreDataResponse *response = [self getAllManagedObjectsOfEntity:request];
    
    NSArray *dataRecordArray = nil;
    if(response.status)
        dataRecordArray = response.value;
 
    NSLog(@"Retreived record details: %@",dataRecordArray);
    
    NSMutableArray *arrayOfMultipleRecordDictionaries = [[NSMutableArray alloc] init];
    for (int  i = 0 ;i < [dataRecordArray count]; i++) {
        [arrayOfMultipleRecordDictionaries addObject:[self convertToDictionary:[dataRecordArray objectAtIndex:i]]];
    }
    NSLog(@"Converted record details as NSDictionaries: %@",arrayOfMultipleRecordDictionaries);
    return arrayOfMultipleRecordDictionaries;
}

-(NSDictionary *)convertToDictionary:(DATA_TABLE *)managedObject{
    
    NSLog(@"Received managed object: %@",managedObject);
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([managedObject class], &count);
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:50];
    
    NSLog(@"Properties available in managed Object %d",count);
    
    for(int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id obj = [managedObject valueForKey:name];
        [dictionary setObject:((obj == nil) ? [NSNull null] : obj) forKey:name];
    }
    
    free(properties);
    return dictionary;
}

-(BOOL)deleteLocalByRecordID:(NSNumber*)recordID{
    
    NSLog(@"Deleting record by ID: %d",[recordID intValue]);
    CoreDataRequest *request = [[CoreDataRequest alloc]init];
    request.keyValuepairs = @{@"recordID":recordID};
    request.entityName = TABLE_NAME;
    CoreDataResponse *respone = [self deletObjectByKeyAndValue:request];

    return respone.status;
}

@end
