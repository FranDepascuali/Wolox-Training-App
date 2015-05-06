//
//  NewsViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "NewsViewModel.h"

@interface NewsCollectionViewModel : BaseModel

- (void)fetchNewsWithSuccess:(void(^)(void))successBlock error:(void(^)(NSString *))errorBlock;

- (NSUInteger)count;

- (NewsViewModel *)newsViewModelAtIndex:(NSUInteger)index;

@end
