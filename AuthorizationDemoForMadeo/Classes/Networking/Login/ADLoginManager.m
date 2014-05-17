//
//  ADLoginManager.m
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/15/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import "ADLoginManager.h"
#import "ADLoginOperation.h"
#import "ADLogoutOperation.h"

#import "MailValidator.h"

#define MINIMUM_INPUT_LENGTH         2

@implementation ADLoginManager

//shared instance of the manager
+ (instancetype) sharedManager {
        static ADLoginManager *_sharedInstance = nil;
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[ADLoginManager alloc] init];
        });
        
        return _sharedInstance;
}
  
//attempting to login with certain credentials (mail / password)
-(void) loginWithMail: (NSString *) mail andPassword: (NSString *) password {
    if([mail length] > MINIMUM_INPUT_LENGTH && [password length]> MINIMUM_INPUT_LENGTH) {
        
        if([MailValidator isMailValid: mail]) {
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            [parameters setValue: mail forKey: @"email"];
            [parameters setValue: password forKey: @"password"];
            
            //Attempting to login
            ADLoginOperation *loginOperation = [[ADLoginOperation alloc] initWithParameters:parameters delegate:self];
            [loginOperation start];
        }
        else {
            //Mail string didn't pass the validation before the request
            [self.delegate verificationOfDataFailedWithError: VIMailIncorrect];
        }
    }
    else {
        //2 symbols cant be the proper credentials
        [self.delegate verificationOfDataFailedWithError: VICredentialsTooShort];
    }
}

//attempting to logout (auth token should already be added to header requests by ADRequestSerializer)
-(void) logout {
    ADLogoutOperation *logoutOperation = [[ADLogoutOperation alloc] initWithParameters: nil delegate:self];
    [logoutOperation start];
}
    
-(void) recievedAuthenticatedUser: (ADUser*) user {
    _authenticatedUser = user;
}
    
#pragma mark Response delegate methods
    
//Successfully performed login/logout
-(void)requestOperation:(ADRequestOperation *)operation didFinishHandlingResponse:(id)responseObject {
    /*Successfully logged in*/
    if ([operation isKindOfClass:[ADLoginOperation class]]) {
        [self.delegate loggedIn];
    }
    if ([operation isKindOfClass:[ADLogoutOperation class]]) {
        _authenticatedUser = nil;
        [self.delegate loggedOut];
    }
}



//method failed
-(void)requestOperation:(ADRequestOperation *)operation didFailWithError:(NSError *)error userMessage:(NSString *)message {
    [self.delegate didFailWithError: error];
}
    
@end
