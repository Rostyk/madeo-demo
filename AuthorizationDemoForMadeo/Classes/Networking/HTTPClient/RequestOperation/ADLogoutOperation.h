//
//  ADLogoutOperation.h
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import "ADRequestOperation.h"
#import "ADLoginManager.h"

/*Log out request operation */

@interface ADLogoutOperation : ADRequestOperation<ADRequestOperationProtocol>

-(instancetype)initWithParameters:(NSDictionary *)params delegate:(id<ADRequestOperationDelegate>)delegate;
    
@end
