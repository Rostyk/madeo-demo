//
//  ADUser.h
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import <Foundation/Foundation.h>

/* (authenticated)User entity */

@interface ADUser : NSObject
    
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong, readonly) NSString *authenticationToken;
    
-(id) initWithDictionary: (NSDictionary*) responseUserDictionary;
@end
