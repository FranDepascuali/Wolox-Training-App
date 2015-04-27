//
//  SignUpViewController.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/22/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "SignUpViewController.h"
#import "UIView+Toast.h"


@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (IBAction)termsButtonClicked:(id)sender {
	[self.viewModel openPage: @"http://www.wolox.com.ar"];
}

- (IBAction)joinButtonClicked:(id)sender {
	
	if(![self.viewModel inputIsCorrect: self.email_input.text password: self.password.text confirmPassword: self.confirmPassword.text]){
		[self.view makeToast:[self.viewModel getError: self.email_input.text password: self.password.text confirmPassword: self.confirmPassword.text]];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.viewModel = [SignUpViewModel new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

