//
//  CoreDataRequest.h
//  CoreDataClient
//
//  Created by Happiest Minds Technologies Pvt Ltd Rudramuni on 04/06/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataRequest : NSObject


// entityName -  The name of an entity.

@property (nonatomic,strong) NSString *entityName;


//keyValuepairs  -  dictionary containing entity valid Key-Value pair.
@property (nonatomic,strong) NSDictionary *keyValuepairs;



// queryString -  string having valid NSpredicate format to update managedObject.
@property (nonatomic,strong) NSString *queryString;

//attributeListTofetch -  Return Valid entity Keys Expected after successful execution.


@property (nonatomic,strong) NSArray *attributeListTofetch;

//  objectID -  The NSManagedObjectID of Managed Object.
@property (nonatomic,strong) NSManagedObjectID *objectID;

@property (nonatomic,strong) NSArray *groupByList;



@end
