//
//  NewsViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/6/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewsRequestManager.h"
#import "UserRequestManager.h"
#import "News.h"

@interface NewsViewModel()
@property (strong, nonatomic) News* singleNew;
@property (strong, nonatomic) NewsRequestManager *newsManager;
@property (strong, nonatomic) UserRequestManager *userManager;
@end


@implementation NewsViewModel

-(id)initWithUserId:(NSString*)userId imageUrl:(NSString*)imgUrl description:(NSString*)title{
    self = [super init];
    if(self){
        self.singleNew = [[News alloc] initWithUserId: userId imageUrl: imgUrl description: title];
        self.newsManager = [[NewsRequestManager alloc] init];
        self.userManager = [[UserRequestManager alloc] init];
    }
    return self;
}

-(NSString*)getImage{
    return self.singleNew.image;
}

-(NSString*)getDescription{
    return self.singleNew.desc;
}

-(void)fetchUserNameWithSuccess:(void(^)(NSString * name))successBlock error: (void(^)(NSString*)) errorBlock{
    if(self.singleNew.userId){
        if(self.singleNew.userName == nil){
            [self.userManager fetchUserNameWithUserId: self.singleNew.userId success:^(id response) {
                if(successBlock){
                    successBlock([response objectForKey:@"name"]);
                }
                self.singleNew.userName = [response objectForKey:@"name"];
            } error:^(NSString * err) {
                if(errorBlock)
                    errorBlock(err);
            }];
        }
        else successBlock(self.singleNew.userName);
    }
}

@end
