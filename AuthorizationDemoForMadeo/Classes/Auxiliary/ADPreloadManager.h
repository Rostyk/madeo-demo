//
//  DCPreloadManager.h
//  Discount Cab 2.0
//
//  Created by Rostyslav Stepanyak on 5/17/2014
//  Copyright (c) 2014 Treeline Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADPreloadManager : NSObject

-(void) addPreloadToView: (UIView*) view spinnerOffset: (int) spinnerOffsetY;
-(void) removePreloadView;
+(instancetype)sharedManager;

@end
