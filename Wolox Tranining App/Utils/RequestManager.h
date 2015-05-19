//
//  RequestManager.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/28/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

- (void)performPostRequest:(NSMutableDictionary*)parameters path:(NSString*)path success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

- (void)performGetRequest:(NSMutableDictionary*)parameters path:(NSString*)path success:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

- (void)setSerializerValue:(NSString*)value forField:(NSString*)field;

+ (id)sharedManager;

@end
