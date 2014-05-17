//
//  ADLogoutOperation.m
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import "ADLogoutOperation.h"

@implementation ADLogoutOperation

-(instancetype)initWithParameters:(NSDictionary *)params delegate:(id<ADRequestOperationDelegate>)delegate {
        
    self = [super initWithMethod: kAPIApplicationLogout parameters:params context:nil delegate:delegate];
    self.isGET = YES; //As I looked through office.madeo.cz routes the /user/logout is Get
    return self;
}
    
- (void)performHandlingResponse:(id)json {
    if ([json isKindOfClass:[NSDictionary class]]) {
        [super performHandlingResponse:json];
    }
}
    
    
-(void)requestFailed:(NSError *)error {
    [super requestFailed:error];
}
    
@end
