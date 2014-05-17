//
//  ADLoginDelegate.h
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#ifndef AuthorizationDemoForMadeo_ADLoginDelegate_h
#define AuthorizationDemoForMadeo_ADLoginDelegate_h

typedef NS_ENUM(NSUInteger, InputDataValidationIssue)
{
    VIMailIncorrect = 1,
    VICredentialsTooShort = 2
};

@protocol ADLoginDelegate<NSObject>
    

- (void) verificationOfDataFailedWithError: (InputDataValidationIssue) issue;
- (void) didFailWithError: (NSError*)error;

@optional
- (void) loggedIn;
- (void) loggedOut;
    
@end

#endif
