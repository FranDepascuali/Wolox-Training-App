//
//  NewsRequestManager.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/12/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "NewsRequestManager.h"
#import "RequestManager.h"

#define NEWS_PATH @"1/classes/news"

@interface NewsRequestManager()

@property (strong, nonatomic) RequestManager *manager;

@end

@implementation NewsRequestManager

- (id)init {
    self = [super init];
    if(self) {
        self.manager = [RequestManager sharedManager];
    }
    return self;
}

- (void)fetchNewsWithSuccess:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock{
    [self.manager performGetRequest: nil path: NEWS_PATH success:successBlock error:errorBlock];
}

@end
