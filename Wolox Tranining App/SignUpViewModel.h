//
//  SignUpViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/24/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpViewModel : NSObject

@property (strong, nonatomic) NSString *emailFormatErrorMessage;
@property (strong, nonatomic) NSString *passwordMatchErrorMessage;

- (void)createUserWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(void))successBlock error:(void(^)(NSString *))errorBlock;

- (BOOL)password:(NSString*)password matchConfirmPassword:(NSString*)confirmPassword;

- (BOOL)emailIsCorrect:(NSString*)email;

- (void)openTermsAndConditions;

@end
