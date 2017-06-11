//
//  SignUpViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/24/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "SignUpViewModel.h"
#import "UserRequestManager.h"
#import "AFNetworking.h"

#define TERMS_AND_CONDITIONS @"http://www.wolox.com.ar/"

@interface SignUpViewModel()

@property (strong, nonatomic) UserRequestManager *manager;

@end

@implementation SignUpViewModel

- (id)init {
    self = [super init];
    if(self) {
        self.manager = [[UserRequestManager alloc] init];
        self.emailFormatErrorMessage = @"El e-mail ingresado es inválido";
        self.passwordMatchErrorMessage = @"Las contraseñas ingresadas no coinciden";
    }
    return self;
}

- (BOOL)password:(NSString*)password matchConfirmPassword:(NSString*)confirmPassword {
    return [password isEqualToString:confirmPassword];
}

- (void)createUserWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(void))successBlock error:(void(^)(NSString *))errorBlock {
    [self.manager createUserWithEmail:email password:password success:^(id response) {
        NSString *sessionToken = [response valueForKey:@"sessionToken"];
        [[NSUserDefaults standardUserDefaults] setObject:sessionToken forKey:@"UserSession"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        if(successBlock) {
            successBlock();
        }
    } error:^(NSString* err) {
        if(errorBlock)
            errorBlock(err);
    }];
}
- (BOOL)emailIsCorrect:(NSString*)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (void)openTermsAndConditions {
    [self openPage:TERMS_AND_CONDITIONS];
}

#pragma mark - Private methods

- (void)openPage:(NSString*)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
