//
//  UserRequestManager.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/11/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "UserRequestManager.h"
#import "RequestManager.h"

#define USER_PATH @"1/users/"
#define LOGIN_PATH @"1/login/"

@interface UserRequestManager()

@property (strong, nonatomic) RequestManager *manager;

@end

@implementation UserRequestManager

- (id)init {
    self = [super init];
    if(self) {
        self.manager = [RequestManager sharedManager];
    }
    return self;
}

- (void)createUserWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject: email forKey: @"username"];
    [parameters setObject: password forKey: @"password"];
    [self.manager performPostRequest: parameters path:USER_PATH success:successBlock error:errorBlock];
}

- (void)logInWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject: email forKey: @"username"];
    [parameters setObject: password forKey: @"password"];
    [self.manager performGetRequest: parameters path:LOGIN_PATH success:successBlock error:errorBlock];
}

- (void)fetchUserNameWithUserId: userId success: (void(^)(id))successBlock error:(void(^)(NSString*))errorBlock {
    [self.manager performGetRequest:nil path:[self getPath:USER_PATH endingWith:userId] success:successBlock error:errorBlock];
}

- (void)fetchUserInfoFromSessionId:(NSString*)userSession success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock{
	[self.manager setSerializerValue:userSession forField:@"X-Parse-Session-Token"];
	[self.manager performGetRequest:nil path:[self getPath:USER_PATH endingWith:@"me"] success:successBlock error:errorBlock];
}

#pragma mark - Private methods

- (NSString*)getPath:(NSString*)base endingWith:(NSString*)end {
    return [base stringByAppendingString:end];
}

@end
