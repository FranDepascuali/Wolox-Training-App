//
//  SingleNewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/6/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "News.h"

@interface News()
@end

@implementation News

- (id)initWithUserId:(NSString*)userId imageUrl: (NSString*)imageUrl description: (NSString*)title{
    self = [super init];
    if(self){
        self.userId = userId;
        self.image = imageUrl;
        self.desc = title;
    }
    return self;
}

#pragma mark - Private

@end
