//
//  ProfileViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/17/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileViewModel : NSObject

@property (strong, nonatomic) NSString *imageUrl;

- (void)fetchUserInfoWithSuccess:(void(^)(NSString *countryName, NSString *userName, NSString *userDescription, NSString *imageUrl))successBlock error:(void(^)(NSString *))errorBlock;

@end
