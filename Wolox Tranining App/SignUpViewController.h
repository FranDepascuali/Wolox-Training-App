//
//  SignUpViewController.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/22/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewModel.h"

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *email_input;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *terms;
@property (weak, nonatomic) IBOutlet UIButton *joinButton;
@property (strong, nonatomic) SignUpViewModel *viewModel;

@end
