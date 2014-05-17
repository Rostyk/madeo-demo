//
//  PassengerLoginOperation.m
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2013 Treeline Interactive. All rights reserved.
//

#import "ADLoginOperation.h"
#import "Networking.h"
#import "ADLoginManager.h"
#import "APIResponseConstants.h"
@interface ADLoginOperation ()

@end

@implementation ADLoginOperation

-(instancetype)initWithParameters:(NSDictionary *)params delegate:(id<ADRequestOperationDelegate>)delegate {
    self = [super initWithMethod: kAPIApplicationLogin parameters:params context:nil delegate:delegate];
    return self;
}

- (void)performHandlingResponse:(id)json {
    if ([json isKindOfClass:[NSDictionary class]]) {
        
        /*Creating the authenticated user*/
        ADUser *user = [[ADUser alloc] initWithDictionary: json];
        [[ADLoginManager sharedManager] recievedAuthenticatedUser: user];
        [[ADHTTPClient client] setAuthorizationHeaderFieldWithToken:json[AD_USER_AUTHENTICATION_TOKEN]];
        
        [super performHandlingResponse:json];
    }
}


-(void)requestFailed:(NSError *)error {
    [super requestFailed:error];
}


@end
