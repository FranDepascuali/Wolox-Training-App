//
//  RequestManager.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/28/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

<<<<<<< HEAD
typedef enum ConnectionType : NSUInteger {
    USERS,
    OBJECTS
} ConnectionType;

@interface RequestManager : NSObject

- (id)initWithUrl:(NSString*)url;

- (void)performPostRequest:(NSMutableDictionary*)parameters path:(NSString*)path success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

- (void)performGetRequest:(NSMutableDictionary*)parameters path:(NSString*)path success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;
=======
@interface RequestManager : NSObject

- (id)initWithUrl: (NSString *) url;

- (void)createUserWithEmail:(NSString*)email password:(NSString*) password success:(void(^)(id))successBlock error:(void(^)(NSString *))errorBlock;
>>>>>>> View controller y Model view controller.

@end
