#import "KZService.h"

@interface KZNotification : KZService
{
    NSString * deviceMacAddress;
}

-(void) subscribeDevice:(NSString *)deviceId toChannel:(NSString *) channel completion:(void (^)(KZResponse *))block;
-(void) getSubscriptions:(void (^)(KZResponse *))block;
-(void) unSubscribeDevice:(NSString *)deviceId fromChannel:(NSString *) channel completion:(void (^)(KZResponse *))block;
-(void) pushNotification:(NSDictionary *) notification InChannel:(NSString *) channel completion:(void (^)(KZResponse *))block;

@end
