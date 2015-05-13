//
//  LogInViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/4/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "LogInViewModel.h"
#import "UserRequestManager.h"
#import "UIKit/UIKit.h"

#define TERMS_AND_CONDITIONS @"http://www.wolox.com.ar/"

@interface LogInViewModel()

@property (strong, nonatomic) UserRequestManager *manager;

@end

@implementation LogInViewModel

- (id)init {
    self = [super init];
    self.manager = [[UserRequestManager alloc] init];
    self.emailFormatErrorMessage = @"El e-mail ingresado es inválido";
    return self;
}

- (void)logInWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(void))successBlock error:(void(^)(NSString*))errorBlock {
    [self.manager logInWithEmail:email password:password success:^(id response) {
        NSString *sessionToken = [response valueForKey:@"sessionToken"];
        [[NSUserDefaults standardUserDefaults] setObject:sessionToken forKey:@"UserSession"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        if(successBlock) {
            successBlock();
        }
    } error:^(NSString * err) {
        if(errorBlock)
            errorBlock(err);
    }];
}

- (void)openTermsAndConditions {
    [self openPage:TERMS_AND_CONDITIONS];

}

- (BOOL)emailIsCorrect:(NSString*)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - Private methods

- (void)openPage:(NSString*)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end