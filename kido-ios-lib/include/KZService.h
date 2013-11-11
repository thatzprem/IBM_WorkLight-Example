#import <Foundation/Foundation.h>
#import "KZHTTPClient.h"
#import "KZResponse.h" 
#import "KZIdentityProvider.h"
#import "KZUser.h"

extern NSInteger const KZHttpErrorStatusCode;

@interface KZService : NSObject
{
    NSString * _endpoint;
    KZHTTPClient * _client;
    NSURL * baseUrl;
}
@property (atomic, strong) NSString * kzToken;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSURL * serviceUrl;
@property (atomic) BOOL isAuthenticated;
@property (atomic, strong) KZUser * KidoZenUser;


-(id) initWithEndpoint:(NSString *) endpoint andName:(NSString *) name;
-(NSError *) createNilReferenceError;
//-(void) parseUserInfo:(NSString *) token;
@end