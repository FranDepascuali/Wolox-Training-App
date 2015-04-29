//
//  SignUpViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/24/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "SignUpViewModel.h"
#import "RequestManager.h"
#import "AFNetworking.h"

@interface SignUpViewModel()

@property (strong, nonatomic) RequestManager *manager;

@end

@implementation SignUpViewModel

- (id)init{
    self = [super init];
    self.manager = [[RequestManager alloc] initWithUrl: @"https://api.parse.com"];
    return self;
}

- (BOOL)password:(NSString*)password matchConfirmPassword:(NSString*)confirmPassword{
    return [password isEqualToString:confirmPassword];
}

- (void)createUserWithEmail:(NSString*)email password: (NSString*)password success:(void(^)(void))successBlock error:(void(^)(NSString *))errorBlock {
    [self.manager createUserWithEmail:email password:password success:^(id response) {
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

@end
