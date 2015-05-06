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
    [self.viewModel openPage: @"http://www.wolox.com.ar"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [LogInViewModel new];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logInButtonClicked:(id)sender {
    
    [self.viewModel logInWithEmail:self.email_input.text password:self.password.text success:^{
        // TODO: abrir scene de loggin
        //    ViewControllerMonitorMenu *monitorMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerMonitorMenu"];
        //    [self presentViewController:monitorMenuViewController animated:NO completion:nil];}
    } error:^(NSString * error) {
        [self displayError:error];
    }];
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
