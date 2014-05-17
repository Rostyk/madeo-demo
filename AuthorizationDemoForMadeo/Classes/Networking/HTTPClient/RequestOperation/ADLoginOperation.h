//
//  GFCPassengerLoginOperation.h
//  Yellow
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2013 Treeline Interactive. All rights reserved.
//

#import "ADRequestOperation.h"

@interface ADLoginOperation : ADRequestOperation <ADRequestOperationProtocol>

/* Login request operation */
    
-(instancetype)initWithParameters:(NSDictionary *)params delegate:(id<ADRequestOperationDelegate>)delegate;

@end
