//
//  RequestManager.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/28/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

- (id)initWithUrl: (NSString *) url;

- (void)createUserWithEmail:(NSString*)email password:(NSString*) password success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

- (void)logInWithEmail:(NSString*)email password:(NSString*)password success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

@end
