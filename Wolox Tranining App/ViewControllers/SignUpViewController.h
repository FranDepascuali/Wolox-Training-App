//
//  SignUpViewController.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/22/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *createUserButton;


@end
