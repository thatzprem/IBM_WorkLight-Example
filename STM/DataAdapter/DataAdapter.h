//
//  DataAdapter.h
//  STM
//
//  Created by Prem kumar on 07/12/13.
//  Copyright (c) 2013 FreakApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataContextManager.h"
#import "RequestObject.h"
#import "STMTaskDetailsObject.h"

@interface DataAdapter : CoreDataContextManager

+(DataAdapter*)getSharedInstance;
-(void)saveDataToLocal:(STMTaskDetailsObject *)requestObject;
-(NSMutableArray *)getAllFromLocal;
-(BOOL)deleteLocalByRecordID:(NSNumber*)recordID;

@end
