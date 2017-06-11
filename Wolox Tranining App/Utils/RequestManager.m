//
//  RequestManager.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 4/28/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"

#define PARSE_APPLICATION_ID @"kLRpYZ9OqIMFJ8zDyrqFlJhWEAabsO20bfZfBXgT"
#define PARSE_REST_API_KEY @"c2Vi5MRQx5WxhppghBZy4KYIGjQ6U0CeLAY6UHXO"
#define CONTENT_TYPE @"application/json"
#define BASE_URL @"https://api.parse.com"

@interface RequestManager()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

@end

@implementation RequestManager

+ (id)sharedManager {
    static RequestManager *sharedRequestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedRequestManager = [[self alloc] init];
    });
    return sharedRequestManager;
}

- (id)init {
    self = [super init];
    if(self) {
        self.manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL: [NSURL URLWithString:BASE_URL]];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.manager.requestSerializer setValue:PARSE_APPLICATION_ID forHTTPHeaderField:@"X-Parse-Application-Id"];
        [self.manager.requestSerializer setValue:PARSE_REST_API_KEY forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        [self.manager.requestSerializer setValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    }
    return self;
}

- (void)setSerializerValue:(NSString*)value forField:(NSString*)field {
	[self.manager.requestSerializer setValue: value forHTTPHeaderField:field];
}

- (void)performPostRequest:(NSMutableDictionary *)parameters path:(NSString*)path success:(void(^)(id))successBlock error:(void(^)(NSString *))errorBlock {
    [self.manager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
        if(errorBlock) {
            errorBlock([self getError: error]);
        }
    }];
}

- (void)performGetRequest:(NSMutableDictionary *)parameters path:(NSString*)path success:(void(^)(id))successBlock error:(void(^)(NSString *))errorBlock {
    [self.manager GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(errorBlock) {
            errorBlock([self getError:error]);
        }
    }];
}

#pragma mark - Private methods

- (NSString*)getError:(NSError*)err {
    return @"Error";
}

@end
