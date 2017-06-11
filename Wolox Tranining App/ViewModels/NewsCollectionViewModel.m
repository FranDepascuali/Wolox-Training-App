//
//  NewsViewModel.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "NewsCollectionViewModel.h"
#import "NewsRequestManager.h"

#define LIKE_IMAGE @"like_active"
#define UNLIKED_IMAGE @"like_inactive"

@interface NewsCollectionViewModel()

@property(strong, nonatomic) NewsRequestManager* manager;
@property(strong, nonatomic) NSMutableArray* news;
@property(assign) BOOL likeButtonSelected;

@end

@implementation NewsCollectionViewModel

- (id)init {
    self = [super init];
	if(self) {
		self.manager = [[NewsRequestManager alloc] init];
        self.likeButtonSelected = NO;
	}
    return self;
}

- (void)fetchNewsWithSuccess:(void(^)(void))successBlock error:(void(^)(NSString *))errorBlock {
    [self.manager fetchNewsWithSuccess:^(id response){
        NSArray* rawNews = [response objectForKey:@"results"];
        self.news = [[NSMutableArray alloc] initWithCapacity:[rawNews count]];
        for(int i = 0; i<[rawNews count]; i++){
            id rawNew = [rawNews objectAtIndex:i];
            NewsViewModel* newViewModel = [[NewsViewModel alloc] initWithUserId:[rawNew valueForKey:@"userId"] imageUrl:[rawNew valueForKey:@"picture"] description:[rawNew valueForKey:@"title"]];
            [self.news insertObject:newViewModel atIndex:i];
        }
        if(successBlock)
            successBlock();
    }error:^(NSString* err){
        if(errorBlock)
            errorBlock(err);
    }];
}

- (NSUInteger)count {
    return [self.news count];
}

- (BOOL)like:(NSUInteger)modelIndex {
    NewsViewModel* newViewModel = [self.news objectAtIndex:modelIndex];
    newViewModel.like = !newViewModel.like;
    return newViewModel.like;
}

- (NewsViewModel *)newsViewModelAtIndex:(NSUInteger)index {
    return [self.news objectAtIndex:index];
}

- (UIImage*)likeImageAtIndex:(NSUInteger)modelIndex {
    NewsViewModel* newViewModel = [self.news objectAtIndex:modelIndex];
    if(newViewModel.like) {
        return [UIImage imageNamed: LIKE_IMAGE];
    }
    else {
        return [UIImage imageNamed: UNLIKED_IMAGE];
    }
}
@end
