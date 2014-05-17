//
//  MailValidator.h
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailValidator : NSObject

//verfifies the potential mail string
+ (BOOL) isMailValid: (NSString*) mailString;
    
@end
