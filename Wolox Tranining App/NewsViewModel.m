//
//  NewsViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "NewsViewModel.h"
#import "RequestManager.h"

@interface NewsViewModel()

@property(strong, nonatomic) RequestManager* manager;

@property(strong, nonatomic) NSArray* news;

@end

@implementation NewsViewModel

- (id)init{
    self = [super init];
    self.manager = [[RequestManager alloc] initWithUrl: @"https://api.parse.com"];
    [self.manager getAllNewsWithSuccess: ^(id response) {
//        NSString *sessionToken = [response valueForKey:@"sessionToken"];
//        [[NSUserDefaults standardUserDefaults] setObject:sessionToken forKey:@"UserSession"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
        // hacer collection news model
        self.news = response;
    } error:^(NSString * err) {
        return;
    }];
    return self;
}

- (NSInteger)getNumberOfNews{
    return [self.news count];
}


- (NSString*)getUser{
    
}

- (UIImage*)getImage{
    
    
}

- (NSString*)getNewDescription{
    
    
}



@end
