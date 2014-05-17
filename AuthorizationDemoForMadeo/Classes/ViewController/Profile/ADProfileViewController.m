//
//  ADProfileViewController.m
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import "ADProfileViewController.h"
#import "ADTextField.h"
#import "ADLoginManager.h"
#import "ADUser.h"


@interface ADProfileViewController ()
    @property (nonatomic, weak) IBOutlet ADTextField *firstNameTextField;
    @property (nonatomic, weak) IBOutlet ADTextField *lastNameTextField;
    @property (nonatomic, weak) IBOutlet ADTextField *emailTextField;
@end

@implementation ADProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self showProfile];
}
    
-(void) showProfile {
    ADUser *user = [ADLoginManager sharedManager].authenticatedUser;
    
    self.firstNameTextField.text = user.firstName;
    self.lastNameTextField.text = user.lastName;
    self.emailTextField.text = user.email;
}
    
-(IBAction) logoutButtonTapped:(id)sender {
    //place preload graphics
    [self addPreload];
    
    //attempting to logout
    [ADLoginManager sharedManager].delegate = self;
    [[ADLoginManager sharedManager] logout];
}
    
#pragma mark Login delegate methods

-(void) loggedOut {
    [self.navigationController popViewControllerAnimated: YES];
}

//we cant have invalid data while loggin out, still place this method to avoid warnings
- (void) verificationOfDataFailedWithError: (InputDataValidationIssue) issue {
    
}
    
//logout method fails
- (void) didFailWithError: (NSError*)error {
    [self removePreload];
    
    [self produceAlertWithMessage: [error localizedDescription]];
}

-(void) produceAlertWithMessage: (NSString *) message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: /*@"Madeo. AuthDemo"*/ @""
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
