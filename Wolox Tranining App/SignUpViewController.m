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

- (IBAction)termsButtonClicked:(id)sender {
    [self.viewModel openTermsAndConditions];
}

- (IBAction)createUserButtonClicked:(id)sender {
    if (![self.viewModel emailIsCorrect: self.emailTextField.text]) {
        [self displayError: self.viewModel.emailFormatErrorMessage];
        return;
    }
    if (![self.viewModel password: self.passwordTextField.text matchConfirmPassword: self.confirmPasswordTextField.text]) {
        [self displayError:self.viewModel.passwordMatchErrorMessage];
        return;
    }
    [self.viewModel createUserWithEmail:self.emailTextField.text password:self.passwordTextField.text success:^ {
        // TODO: abrir scene de news
    } error:^(NSString* error) {
        [self displayError:error];
    }];
}

- (void)viewDidLoad {
//    NSLog(@"%@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);
    [super viewDidLoad];
    self.viewModel = [[SignUpViewModel alloc] init];
}

- (void)displayError:(NSString *)error {
    [self.view makeToast:error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
