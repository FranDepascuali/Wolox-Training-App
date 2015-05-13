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
    [self.loadingActivityIndicator setHidesWhenStopped:YES];
    self.viewModel = [[LogInViewModel alloc] init];
}

- (IBAction)logInButtonClicked:(id)sender {
    if(![self.viewModel emailIsCorrect: self.emailTextField.text]) {
        [self displayError: self.viewModel.emailFormatErrorMessage];
        return;
    }
    [self.loadingActivityIndicator startAnimating];
    [self.viewModel logInWithEmail:self.emailTextField.text password:self.passwordTextField.text success:^ {
        [self.loadingActivityIndicator stopAnimating];
        NSString * storyboardName = @"Main";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"NewsProfileViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    } error:^(NSString * error) {
        [self displayError:error];
        [self.loadingActivityIndicator stopAnimating];
    }];
}

#pragma mark - Private methods

- (void)displayError:(NSString *)error {
    [self.view makeToast:error];
}
 
@end
