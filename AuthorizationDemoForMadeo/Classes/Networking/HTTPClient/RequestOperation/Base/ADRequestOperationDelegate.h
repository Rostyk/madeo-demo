//
//  GFCRequestOperationDelegate.h
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2013 Treeline Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ADRequestOperation;

@protocol ADRequestOperationDelegate <NSObject>
@optional

//** @note Called immediately after success response received
- (void)requestOperation:(ADRequestOperation *) operation didReceiveResponse:(id)responseObject;

//** @note Called after operation did finish handling response
- (void)requestOperation:(ADRequestOperation *) operation didFinishHandlingResponse:(id)responseObject;

//** @note Called if response failed with error
- (void)requestOperation:(ADRequestOperation *) operation didFailWithError:(NSError *)error userMessage:(NSString *)message;

@end
