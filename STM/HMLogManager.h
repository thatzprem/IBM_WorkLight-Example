//
//  HMLogManager.h
//  Logger
//
/**
 Created by Happiest Minds on 12/03/13.
 Copyright (c) 2013 Happiest Minds Technologies Pvt Ltd.
 This program is not to be copied or distributed without the express written consent of Happiest Minds. All rights reserved.
 */


#import <Foundation/Foundation.h>
#import "stdarg.h"

#define HMLogger_Info(format,...) [[HMLogManager getSharedInstance] info:format, ## __VA_ARGS__]
#define HMLogger_Warning(format,...) [[HMLogManager getSharedInstance] warning:format, ## __VA_ARGS__]
#define HMLogger_Error(format,...) [[HMLogManager getSharedInstance] error:format, ## __VA_ARGS__]
#define HMLogger_Debug(format,...) [[HMLogManager getSharedInstance] debug:format, ## __VA_ARGS__]

#define start_time()  HMLogger_Debug(@"Start Time of %@: %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd),[NSDate date]);

#define end_time()  HMLogger_Debug(@"End Time of %@: %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd),[NSDate date]);


// Defining macros for loggable object
#define HMLogger_LogableObject_Info(object) [[HMLogManager getSharedInstance] infoWithLoggableObject:object]
#define HMLogger_LogableObject_Warning(object) [[HMLogManager getSharedInstance] warningWithLoggableObject:object]
#define HMLogger_LogableObject_Error(object) [[HMLogManager getSharedInstance] errorWithLoggableObject:object]
#define HMLogger_LogableObject_Debug(object) [[HMLogManager getSharedInstance] debugWithLoggableObject:object]


// Defining macros for loggable object with properties
#define HMLogger_LogableObjectForProperties_Info(object,propertyList) [[HMLogManager getSharedInstance] infoWithLoggableObject:object classPropertiesListInArray:propertyList]
#define HMLogger_LogableObjectForProperties_Warning(object,propertyList) [[HMLogManager getSharedInstance] warningWithLoggableObject:object classPropertiesListInArray:propertyList]
#define HMLogger_LogableObjectForProperties_Error(object,propertyList) [[HMLogManager getSharedInstance] errorWithLoggableObject:object classPropertiesListInArray:propertyList]
#define HMLogger_LogableObjectForProperties_Debug(object,propertyList) [[HMLogManager getSharedInstance] debugWithLoggableObject:object classPropertiesListInArray:propertyList]



/** Enum to handle Log Level state in the application
 Default log level - INFO,Value - 1
 */
typedef enum {
	
	LOG_INFO = 1,
	LOG_WARNING,
	LOG_ERROR,
	LOG_DEBUG,
	
} LOG_LEVEL;

/**
 Singleton Entity responsible for:
 •	Initialize the logger component based on configuration file details.
 •	Interact with logger and get the log message
 */

@interface HMLogManager : NSObject

/**
 It will return an instance of this singleton
 @return id self (his own)
 */
+ (HMLogManager*)getSharedInstance;


/**
 Caller to set the requried level og log messages the need to be printed.
 @param logLevel, an enum variable defining the log level.
 @return void
 */
- (void)setNewLogLevel:(LOG_LEVEL)logLevel;


/**
 Caller to get the current log level set within the component(if not previously by the caller, it returns the default value set for the congiguration file).
 @return LOG_LEVEL, log level as a Enum value.
 */
- (LOG_LEVEL)getLogLevel;

/**
 Methods used by caller to log its messages based on any of the listed type by Logger component.
 @param logMessage, the actual message sent by the caller.
 @return void
 */
- (void)info:(NSString *)messageFormat, ...;
- (void)warning:(NSString *)messageFormat, ...;
- (void)error:(NSString *)messageFormat, ...;
- (void)debug:(NSString *)messageFormat, ...;

/**
 Methods used by caller to log an object specifying the property names in an array.
 @param loggableObject, The object reference.
 @param propertyArray, The array containing the property names
 @return void
 */
/**
 Example:
 DetailsClass *detailsClassObjec = [[DetailsClass alloc] init];
 NSArray *testArray = [NSArray arrayWithObjects:@"nameString",@"rollNumber", nil];
 [logger infoWithLoggableObject:detailsClassObjec classPropertiesListInArray:testArray];
 */
- (void)infoWithLoggableObject:(id)loggableObject classPropertiesListInArray:(NSArray*)propertyArray;
- (void)warningWithLoggableObject:(id)loggableObject classPropertiesListInArray:(NSArray*)propertyArray;
- (void)errorWithLoggableObject:(id)loggableObject classPropertiesListInArray:(NSArray*)propertyArray;
- (void)debugWithLoggableObject:(id)loggableObject classPropertiesListInArray:(NSArray*)propertyArray;


/**
 Methods used by caller to log all the properties of a class object provided.
 @param loggableObject, The object reference.
 @return void
 */
/**
 Example:
 DetailsClass *detailsClassObjec = [[DetailsClass alloc] init];
 [logger infoWithLoggableObject:detailsClassObjec];
 */
- (void)infoWithLoggableObject:(id)loggableObject;
- (void)warningWithLoggableObject:(id)loggableObject;
- (void)errorWithLoggableObject:(id)loggableObject;
- (void)debugWithLoggableObject:(id)loggableObject;





@end
