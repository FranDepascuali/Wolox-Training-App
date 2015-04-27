//
//  SignUpViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/24/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpViewModel : NSObject
	@property (nonatomic, readwrite) NSString *email_input;
	@property (nonatomic, readwrite) NSString *password;
	@property (nonatomic, readwrite) NSString *confirmPassword;

- (BOOL) inputIsCorrect: (NSString*) email password:(NSString*) password confirmPassword: (NSString*) confirmPassword;
- (BOOL) emailIsCorrect: (NSString*) email;
- (void) openPage: (NSString *) url;
- (NSString*) getError: (NSString *) email password: (NSString*) password confirmPassword: (NSString*) confirmPassword;
@end
