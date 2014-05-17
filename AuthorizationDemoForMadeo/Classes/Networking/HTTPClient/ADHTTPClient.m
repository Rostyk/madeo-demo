//
//  RSYellowAPIClient.m
//  Yellow
//
//  Created by Ros Stepanyak on 5/17/2014
//  Copyright (c) 2013 Treeline Interactive. All rights reserved.
//

#import "ADHTTPClient.h"
#import "ADRequestSerializer.h"
@interface ADHTTPClient ()

@end

@implementation ADHTTPClient

//shared client instance
+ (instancetype)client
{
    static ADHTTPClient *_sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ADHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kServerBaseURL]];
    });
    
    return _sharedInstance;
}

#pragma mark -
#pragma mark Custom initialization

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self)
    {
        /*our custom serializer to add some headers to all the requests*/
        self.requestSerializer = [ADRequestSerializer new];
        
        [self.reachabilityManager startMonitoring];
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    }
    
    return self;
}

//adds auth_token header for all the further requests
-(void)setAuthorizationHeaderFieldWithToken:(NSString *)token {
        [(ADRequestSerializer *)self.requestSerializer setAuthorizationHeaderFieldWithToken: [self encodedString: token]];
}
    
-(NSString *)encodedString: (NSString*) string {
        return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)string, NULL, (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ", CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

#pragma mark -
#pragma mark Custom Server Methods

-(AFHTTPRequestOperation *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    
    AFHTTPRequestOperation *operation = [super POST:URLString parameters:parameters success:success failure:failure];
    [operation setShouldExecuteAsBackgroundTaskWithExpirationHandler:nil];
    return operation;
}

-(AFHTTPRequestOperation *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    
    AFHTTPRequestOperation *operation = [super GET:URLString parameters:parameters success:success failure:failure];
    [operation setShouldExecuteAsBackgroundTaskWithExpirationHandler:nil];
    return operation;
}
    
    
@end
