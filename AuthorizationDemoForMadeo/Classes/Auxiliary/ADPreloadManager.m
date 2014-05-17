//
//  DCPreloadManager.m
//  Discount Cab 2.0
//
//  Created by Rostyslav Stepanyak on 4/2/14.
//  Copyright (c) 2014 Treeline Interactive. All rights reserved.
//

#import "ADPreloadManager.h"

@interface ADPreloadManager ()

@property (nonatomic, strong) UIView *preloadView;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation ADPreloadManager

+(instancetype)sharedManager
{
    static ADPreloadManager * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ADPreloadManager alloc] init];
    });
    
    return _sharedInstance;
}

//creating preload views programatically
-(id) init {
    self = [super init];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.preloadView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, bounds.size.width, bounds.size.height)];
    self.preloadView.backgroundColor = [UIColor colorWithRed: 141./255. green: 145./255. blue: 152./255. alpha: 0.45];
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.spinner.center = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
    [self.preloadView addSubview: self.spinner];
    [self.spinner startAnimating];
    return self;
}

/* spinnerOffsetY actually contains the hight of the top bars (status bar + nabigation bar), it can be:  64 / 44 / 20 / 0 */
-(void) addPreloadToView: (UIView*) view spinnerOffset: (int) spinnerOffsetY {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.preloadView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    
    self.spinner.center = CGPointMake(self.preloadView.frame.size.width / 2, self.preloadView.frame.size.height / 2);
    if(![[view subviews] containsObject: self.preloadView])
      [view addSubview: self.preloadView];
}

-(void) removePreloadView {
    [self.preloadView removeFromSuperview];
}
    
-(void) dealloc {
    self.preloadView = nil;
    self.spinner = nil;
}

@end
