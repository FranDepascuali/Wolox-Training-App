//
//  LogInViewController.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/4/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "LogInViewController.h"
#import "Toast/UIView+Toast.h"
#import "LogInViewModel.h"

@interface LogInViewController ()

@property (strong, nonatomic) LogInViewModel *viewModel;

@end

@implementation LogInViewController

- (IBAction)termsButtonClicked:(id)sender {
    [self.viewModel openTermsAndConditions];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingActivityIndicator.hidden = YES;
    self.viewModel = [[LogInViewModel alloc] init];
}

- (IBAction)logInButtonClicked:(id)sender {
    self.loadingActivityIndicator.hidden = NO;
    [self.loadingActivityIndicator startAnimating];
    [self.viewModel logInWithEmail:self.emailTextField.text password:self.passwordTextField.text success:^ {
        [self.loadingActivityIndicator stopAnimating];
        self.loadingActivityIndicator.hidden = YES;
        // TODO: abrir scene de news
    } error:^(NSString * error) {
        [self.loadingActivityIndicator stopAnimating];
        self.loadingActivityIndicator.hidden = YES;
        [self displayError:error];
    }];
}

#pragma mark - Private methods

- (void)displayError:(NSString *)error {
    [self.view makeToast:error];
}

@end
