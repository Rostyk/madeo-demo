//
//  ADLoginManager.h
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADRequestOperationDelegate.h"
#import "ADLoginDelegate.h"
#import "ADUser.h"

/* class that utilizes basic login operations */
@interface ADLoginManager : NSObject<ADRequestOperationDelegate>

// responding to successfull login / logout operations
@property (nonatomic, weak) id <ADLoginDelegate> delegate;


//this property contains authnticated user recieved from server after successfull login
@property (nonatomic, strong, readonly) ADUser *authenticatedUser;

//shared instance of the manager
+ (instancetype) sharedManager;
    
//attempt to login
-(void) loginWithMail: (NSString *) mail andPassword: (NSString *) password;
-(void) recievedAuthenticatedUser: (ADUser*) user;
//attempt to logout
-(void) logout;
    
    
@end
