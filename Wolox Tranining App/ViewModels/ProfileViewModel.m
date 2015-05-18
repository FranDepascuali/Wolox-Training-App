//
//  ProfileViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/17/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "ProfileViewModel.h"
#import "UserRequestManager.h"

@interface ProfileViewModel()

@property (strong, nonatomic) UserRequestManager *manager;

@end

@implementation ProfileViewModel

- (id)init {
	self = [super init];
	if(self) {
		self.manager = [[UserRequestManager alloc] init];
	}
	return self;
}

- (void)fetchUserInfoWithSuccess:(void(^)(NSString * countryName, NSString* userName, NSString* userDescription, NSString* imageUrl))successBlock error:(void(^)(NSString *))errorBlock {
	NSString* userSession = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserSession"];
	[self.manager fetchUserInfoFromSessionId:userSession success:^(id response) {
		if(successBlock) {
			successBlock([response valueForKey:@"location"], [response valueForKey:@"name"],[response valueForKey:@"description"], [response valueForKey:@"picture"]);
		}
	} error:^(NSString* err) {
		if(errorBlock) {
			errorBlock (err);
		}
	}];
}

@end
