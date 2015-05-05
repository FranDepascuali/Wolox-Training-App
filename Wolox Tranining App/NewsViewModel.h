//
//  NewsViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import <UIKit/UIKit.h> 

@interface NewsViewModel : BaseModel

- (NSString*)getUser;
- (UIImage*)getImage;
- (NSString*)getNewDescription;

- (void)fetchNewsWithSuccess:(void(^)(void))successBlock error:(void(^)(NSString *))errorBlock;
- (NSUInteger)count;
- (NewsViewModel *)viewModelAtIndex:(NSUInteger)index;

@end
