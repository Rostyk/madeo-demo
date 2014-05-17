//
//  ViewController.m
//  AuthorizationDemoForMadeo
//
//  Created by Rostyslav Stepanyak on 5/17/14.
//  Copyright (c) 2014 Rostyslav Stepanyak. All rights reserved.
//

#import "ADLoginViewController.h"
#import "ADLoginManager.h"
#import "ADSegues.h"
#import "ADTextField.h"


@interface ADLoginViewController ()
    @property (nonatomic, weak) IBOutlet ADTextField *mailTextField;
    @property (nonatomic, weak) IBOutlet ADTextField *passwordTextField;
    
    @property (nonatomic, strong) UITextField *activeTextField;
@end

@implementation ADLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}
    
-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    //clear textfields
    [self clearTextFields];
    
    //hide the keyboard if the login buttin is hit immediately without clicking return key
    [self hideKeyboard];
}

-(void) clearTextFields {
    //Perhaps the login should remain
    //self.mailTextField.text = @"";
    self.passwordTextField.text = @"";
}

-(void) hideKeyboard {
    [self.activeTextField resignFirstResponder];
}

#pragma mark login action
    
- (IBAction) loginButtonTapped:(id)sender {
    [ADLoginManager sharedManager].delegate = self;
    
    //palce preload graphics
    [self addPreload];
    
    //hide the keyboard if the login buttin is hit immediately without clicking return key
    [self hideKeyboard];
    
    //attempting to login ==> See Login Delegate Section for further workflow
    [[ADLoginManager sharedManager] loginWithMail: self.mailTextField.text andPassword: self.passwordTextField.text];
    
    
}
    
#pragma mark text fields delegate

/*Following thow methods save the filed currently being entered to resign it in case we hit login or whatever other case that requires immediate resigning the first responder of the active field*/
- (void)textFieldDidBeginEditing:(UITextField *)textField{
        self.activeTextField = textField;
}


/*if we hit 'Done' while entering user name => jump to password
  if we hit 'Done' while editing password => hide the keyboard */
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.mailTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    else if(textField == self.passwordTextField){
        [self.passwordTextField resignFirstResponder];
    }
    return YES;
}
    
    

#pragma mark - Login delegate

/* this method would be triggered by login workflow if the credentials the user is attempting to login with dont pass validation. It (the validation) is performed before the actual call to the API)*/
- (void) verificationOfDataFailedWithError: (InputDataValidationIssue) issue {

    //hide preload graphics
    [self removePreload];
    
    switch (issue) {
        case VIMailIncorrect: {
            [self.mailTextField becomeFirstResponder];
            [self produceAlertWithMessage: @"Your mail is incorrect"];
            break;
        }
        case VICredentialsTooShort: {
             [self produceAlertWithMessage: @"Your credentials don't seem to be correct."];
             break;
        }
        
        default:
             [self produceAlertWithMessage: @"The data you input is wrong."];
        break;
    }
}
    
-(void) didFailWithError:(NSError *)error {
    //hide preload graphics
    [self removePreload];
    
    [self produceAlertWithMessage: [error localizedDescription]];
}
    
//Successfully logged in. Login manager should contain a proper User entity
- (void) loggedIn {
    //hide preload graphics
    [self removePreload];
    
    [self performSegueWithIdentifier: MainTabbarUISegue sender:self];
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
