//
//  UserRequestManager.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/11/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserRequestManager : NSObject

- (void)createUserWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(id))successBlock error:(void(^)(NSString *))errorBlock;

- (void)logInWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

- (void)fetchUserNameWithUserId:(NSString*)userId success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

- (void)fetchUserInfoFromSessionId:(NSString*)userSession success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

@end
