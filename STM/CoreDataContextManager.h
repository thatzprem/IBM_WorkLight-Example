//
//  CoreDataContextManager.h
//  CoreDataClient
//
//  Created by Happiest Minds Technologies Pvt Ltd SR on 16/05/13.
//  Copyright (c) 2013 Happiest Minds. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "CoreDataRequest.h"
#import "CoreDataResponse.h"

@interface CoreDataContextManager : NSManagedObjectContext


/**
 Methods used Set up PersistentStoreCoordinator and NSManagedObjectModel by using CoreDataConfig plist fike.
 @return  retuns a instance of  NSManagedObjectContext which is assciacted with Applicate datastore and PersistentStoreCoordinator
 */

-(id)init;

/**
 Methods used Creates, configures, and returns an instance of NSManagedObject class for the entity with a given name
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 entityName - The Name of the entity. This is required parameter. 

 Discussion:
 If Entity name is nil  throws  EntityNotFoundException.
 Creates, configures, and returns an instance of the class for the entity with a given name.
 This method makes it easy for you to create instances of a given entity without worrying about the details of managed object creation.
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  if sucess  1 else 0
 TotalTime   -  Time to excute this Method
 Value       -  if Sucess Value contains a new, autoreleased, fully configured instance of NSManagedObject class for the entity named entityName.
                The instance has its entity description set and is inserted it into context else nil.
 
 @Code
 CoreDataRequest *request = [[CoreDataRequest alloc]init];
 [request setEntityName:@"Name OF Entity"];
 
 CoreDataResponse *response = [<CoreDataContextManager Instance>  createManagedObjectForEntity:request];
 
 if(response.status == YES)
 {
 NSManagedObject *object = [response value];
 }
 else
 {
 // Check Message for failure.
 
 }
 
 @End
 
 */

- (CoreDataResponse *) createManagedObjectForEntity:(CoreDataRequest *)request;

/**
 Methods used Creates, configures, and set data for an instance of NSManagedObject class for the entity with a given name.
 
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 keyValuepairs - Data to be inserted in entity with Valid Key-Value pair of Entity.
 entityName -   The name of an entity.
 attributeListTofetch -  Return Value Expected after insertion, (attributeListTofetch should contain NSMANAGEDOBJECTID for ObjectID of entity or  Valid entity Keys)
                 if attributeListTofetch is nil, the return entity;
 @return  if array is nil, return saved NSMangedObejct, else return based on array elements
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  if sucess  1 else 0
 TotalTime   -  Time to excute this Method
 Value       -  if attributeListTofetch is nil, return saved NSMangedObejct, else return based on attributeListTofetch elements.
 
 */

/**
 Example:
 CoreDataContextManager *manager = [[CoreDataContextManager alloc]init];
 NSString *json = <JSON String>;
 NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:json,[NSString stringWithFormat:@"HM000%i",0], nil] forKeys:[NSArray arrayWithObjects:@"empDetails",@"empID", nil]];
 
 CoreDataRequest *request = [[CoreDataRequest alloc]init];
 [request setEntityName:@"Name OF Entity"];
 [request setKeyValuepairs:dictionary];
 
 
  CoreDataResponse *response = [<CoreDataContextManager Instance>  insertManagedObject:request];
 if(response.status == YES)
 {
 NSManagedObjectID *onjectID = [response value];
 }
 else
 {
 // Check Message for failure.
 
 }
 
 
 [request setAttributeListTofetch:[NSArray arrayWithObjects:@"NSMANAGEDOBJECTID", nil]];
 
 CoreDataResponse *response = [<CoreDataContextManager Instance>  insertManagedObject:request];
 if(response.status == YES)
 {
 NSManagedObject *object = [response value];
 }
 else
 {
 // Check Message for failure.
 
 }

 */

- (CoreDataResponse *) insertManagedObject:(CoreDataRequest *)request;



/**
 Methods used to delete all NSManaged Object Of given entity.
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 entityName -  The name of an entity.
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  0
 TotalTime   -  Time to excute this Method
 Value       -  nil.
 
 */

- (CoreDataResponse *)  deleteAllManagedObjectsInEntity:(CoreDataRequest *)request;

/**
 Methods used to delete  NSManaged Object Of given entity containing Key and Value.
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 entityName -  The name of an entity.
 keyValuepairs - Valid Key-Value pair of Entity to delete managed object.
 
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -   0
 TotalTime   -  Time to excute this Method
 Value       -  nil.
 
 
 */

- (CoreDataResponse *) deletObjectByKeyAndValue:(CoreDataRequest *)request;

/**
 
 Methods used to delete NSManagedObject using Object ID.
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 objectID -  The NSManagedObjectID of Managed Object.
 
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -   0
 TotalTime   -  Time to excute this Method
 Value       -  nil.
 

 */

- (CoreDataResponse *) deleteObjectByObjectID:(CoreDataRequest *)request;


/**
 
 Methods used to delete NSManagedObjects using conditions.
@param request -  CoreDataRequest Object having Required Parameters.

Required:
entityName -  The name of an entity.
queryString -  string having valid NSPredicate format string for search.
 
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -   0
 TotalTime   -  Time to excute this Method
 Value       -  nil.
 
 
 */



- (CoreDataResponse *) deleteObjectsByCondition:(CoreDataRequest *)request;



/**
 Methods used to get NSManagedObject using Object ID.
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 objectID - An NSManagedObjectID object is a compact, universal identifier for a managed object..
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  if sucess  1 else 0
 TotalTime   -  Time to excute this Method
 Value       -  NSManagedObject.
 
Discussion:  returns the object for the specified ID if it is already registered, otherwise it creates a fault corresponding to that objectID.  It never returns nil, and never performs I/O.  The object specified by objectID is assumed to exist, and if that assumption is wrong the fault may throw an exception when used. */

- (CoreDataResponse *) getObjectByObjectID:(CoreDataRequest *)request;

/**
 Methods used to get NSManagedObject using  dictionary containing entity valid Key-Value pair.
 
 @param request -  CoreDataRequest Object having Required Parameters.
 Required:
 keyValuepairs  -  dictionary containing entity valid Key-Value pair.
 entityName -  Entity Name
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  total count of objects
 TotalTime   -  Time to excute this Method
 Value       -  Array of Managedobjects if success else nil.
 
 */

- (CoreDataResponse *) getObjectWithKeyValues:(CoreDataRequest *)request;


/**
 method to fetch objects from the persistent stores into the context ; 
 
 @param request -  CoreDataRequest Object having Required Parameters.
 Required:
 entityName -  Entity Name
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  total count of objects
 TotalTime   -  Time to excute this Method
 Value       -  Array of  Managedobjects if success else nil.
 */

- (CoreDataResponse *) getAllManagedObjectsCountOfEntity:(CoreDataRequest *)request;

- (CoreDataResponse *) getAllManagedObjectsOfEntity:(CoreDataRequest *)request;



/**
method to fetch object from the persistent stores into the context with which Entity is associated and entity having Attribute Name and attribut key.
 
 
 @param request -  CoreDataRequest Object having Required Parameters.
 Required:
 keyValuepairs  -  dictionary containing entity valid Key-Value pair.
 entityName -  Entity Name
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @return CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  1 
 TotalTime   -  Time to excute this Method
 Value       -   Managedobject if success else nil.
 */


- (CoreDataResponse *) getManagedObjectByKeyValue:(CoreDataRequest *)request;


/**
 method to fetch objects based on searchCriteria from the persistent stores into the context in Entity .
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 entityName -  The name of an entity.
 queryString -  string having valid NSPredicate format string for search.
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @param callBack -  callback  having CoreDataResponse Object.
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  total count of objects return with method
 TotalTime   -  Time to excute this Method
 Value       -   array of Managedobjects if success else nil.
 */

-(void) getManagedObjectsCountWithSearchCriteria:(CoreDataRequest *)request
                               searchResult:(void (^)(CoreDataResponse * response))callBack;

-(void) getManagedObjectsWithSearchCriteria:(CoreDataRequest *)request
                     searchResult:(void (^)(CoreDataResponse * response))callBack;


/**
 method to update existing ManagedObjects  in a entity .
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
 Required:
 entityName -  The name of an entity.
 queryString -  string having valid NSpredicate format to update managedObject.
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @param callBack - callback  having CoreDataResponse Object. 
 
 status      -  If Update is successful return YES, else return NO..
 Message     -  reason for failure for this method if any.
 Total Count -  0
 TotalTime   -  Time to excute this Method
 Value       -   array of  Managedobject if update successful else nil..
 */

-(void ) updateManagedInEntityWithUpdateCondition:(CoreDataRequest *)request
             updateCompletion:(void (^)(CoreDataResponse * response))callBack;

/**
 method to update existing ManagedObjects  in a entity  using Object ID.
 
 @param request -  CoreDataRequest Object having Required Parameters.
 
  Required:
  objectID -  The NSManagedObjectID of Managed Object.
 
 Optional
 attributeListTofetch -  Return Valid entity Keys Expected after successful execution.
 
 @param callBack - callback  having CoreDataResponse Object.
 
 status      -  If Update is successful return YES, else return NO..
 Message     -  reason for failure for this method if any.
 Total Count -  0
 TotalTime   -  Time to excute this Method
 Value       -   Managedobject if update successful else nil.

 */

-(void ) updateManagedInEntityWithObjectID:(CoreDataRequest *)request
             updateCompletion:(void (^)(CoreDataResponse * response))callBack;


/**
 Attempts to commit unsaved changes to registered objects to their persistent store.
 @param error A pointer to an NSError object. You do not need to create an NSError object. The save operation aborts after the first failure if you pass NULL.
@return YES if the save succeeds, otherwise NO. 
 
 If there were multiple errors (for example several edited objects had validation failures) the description of NSError returned indicates that there were multiple errors, and its userInfo dictionary contains the key NSDetailedErrors. The value associated with the NSDetailedErrors key is an array that contains the individual NSError objects.
 
 */

- (BOOL) saveContext:(NSError **)error;


/**
 method to update existing ManagedObjects  in a entity  using .
 
 @param request -  CoreDataRequest Object having Required Parameters.
 Required:
 keyValuepairs  -  dictionary containing entity valid Key-Value pair.
 entityName -  Entity Name
 
 
 @return callback  having CoreDataResponse Object. 
 
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  total count of duplicate object
 TotalTime   -  Time to excute this Method
 Value       -   array of duplicate objects if success else nil.
 
 */

-(void) checkDuplicatesForKeyValue:(CoreDataRequest *)request result:(void (^)(CoreDataResponse * response))callBack;


/**
 method to update existing ManagedObjects  in a entity  using .
 
 @param request -  CoreDataRequest Object having Required Parameters.
 Required:
 queryString -  string having valid NSpredicate format to update managedObject.
 entityName -  Entity Name
 
 
 @return callback  having CoreDataResponse Object.
 
 status      -  if sucess  YES else NO.
 Message     -  reason for failure for this method if any.
 Total Count -  total count of duplicate object
 TotalTime   -  Time to excute this Method
 Value       -   array of duplicate objects if success else nil.
 
 */

-(void) checkDuplicateObjectForCondition:(CoreDataRequest *)request result:(void (^)(CoreDataResponse * response))callBack;




@end
