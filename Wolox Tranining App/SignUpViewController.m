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
    [self.viewModel openPage: @"http://www.wolox.com.ar"];
}

- (IBAction)joinButtonClicked:(id)sender {
    
    if(![self.viewModel emailIsCorrect: self.email_input.text]){
        [self displayError: @"El e-mail ingresado es inválido"];
        return;
    }
    else if (![self.viewModel password: self.password.text matchConfirmPassword: self.confirmPassword.text]){
        [self displayError:@"Las contraseñas no coinciden"];
        return;
    }
    
    [self.viewModel createUserWithEmail:self.email_input.text password:self.password.text success:^{
        // TODO: abrir scene de loggin
        //    ViewControllerMonitorMenu *monitorMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerMonitorMenu"];
        //    [self presentViewController:monitorMenuViewController animated:NO completion:nil];}
        
    } error:^(NSString * error) {
        [self displayError:error];
    }];
}

- (void)viewDidLoad {
//    NSLog(@"%@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);
    [super viewDidLoad];
    self.viewModel = [SignUpViewModel new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayError:(NSString *) error{
    [self.view makeToast:error];
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

