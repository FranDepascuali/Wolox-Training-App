//
//  LogInViewController.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/4/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivityIndicator;

@end
