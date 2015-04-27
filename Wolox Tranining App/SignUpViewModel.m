//
//  SignUpViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/24/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "SignUpViewModel.h"
#import "UIKit/UIKit.h"

@implementation SignUpViewModel

- (BOOL)inputIsCorrect: (NSString*) email password:(NSString*) password confirmPassword: (NSString*) confirmPassword{
	return false;
}

- (BOOL) emailIsCorrect: (NSString*) email{
	return false;
}

-(void) openPage: (NSString *) url{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (NSString*) getError: (NSString *) email password: (NSString*) password confirmPassword: (NSString*) confirmPassword{
	return @"error";
}
@end
