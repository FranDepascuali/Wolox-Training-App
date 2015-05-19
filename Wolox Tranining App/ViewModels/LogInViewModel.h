//
//  LogInViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/4/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogInViewModel : NSObject

@property (strong, nonatomic) NSString *emailFormatErrorMessage;

- (void)logInWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(void))successBlock error:(void(^)(NSString*))errorBlock;

- (void)openTermsAndConditions;

- (BOOL)emailIsCorrect:(NSString*)email;

@end
