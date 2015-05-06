//
//  LogInViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/4/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "LogInViewModel.h"
#import "RequestManager.h"

@interface LogInViewModel()

@property (strong, nonatomic) RequestManager *manager;

@end

@implementation LogInViewModel

- (id)init{
    self = [super init];
    self.manager = [[RequestManager alloc] initWithUrl: @"https://api.parse.com"];
    return self;
}

- (void)logInWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(void))successBlock error:(void(^)(NSString*))errorBlock{
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

@end