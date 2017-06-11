//
//  SignUpViewController.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/22/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "SignUpViewController.h"
#import "Toast/UIView+Toast.h"
#import "SignUpViewModel.h"

@interface SignUpViewController ()

@property (strong, nonatomic) SignUpViewModel *viewModel;

@end

@implementation SignUpViewController

- (IBAction)createUserButtonClicked:(id)sender {
    if(![self.viewModel emailIsCorrect: self.emailTextField.text]) {
        [self displayError: self.viewModel.emailFormatErrorMessage];
        return;
    }
    if (![self.viewModel password: self.passwordTextField.text matchConfirmPassword: self.confirmPasswordTextField.text]) {
        [self displayError:self.viewModel.passwordMatchErrorMessage];
        return;
    }
    [self.viewModel createUserWithEmail:self.emailTextField.text password:self.passwordTextField.text success:^ {
        NSString * storyboardName = @"MainStoryboard";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"NewsProfileViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    } error:^(NSString* error) {
        [self displayError:error];
    }];
}

- (IBAction)termsButtonClicked:(id)sender {
    [self.viewModel openTermsAndConditions];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[SignUpViewModel alloc] init];
}

- (void)displayError:(NSString *)error {
    [self.view makeToast:error];
}

@end
