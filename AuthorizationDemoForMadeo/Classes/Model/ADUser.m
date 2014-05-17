//
//  ADUser.m
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import "ADUser.h"
#import "APIResponseConstants.h"

@implementation ADUser

-(id) initWithDictionary: (NSDictionary*) responseUserDictionary {
    self = [super init];
    self.firstName = responseUserDictionary[AD_USER_FIRST_NAME];
    self.lastName = responseUserDictionary[AD_USER_LAST_NAME];
    self.email = responseUserDictionary[AD_USER_EMAIL];
    _authenticationToken = responseUserDictionary[AD_USER_AUTHENTICATION_TOKEN];
    
    return self;
}

    
@end
