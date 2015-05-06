//
//  NewsViewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/6/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "BaseModel.h"

@interface NewsViewModel : BaseModel

-(id)initWithUserId:(NSString*)userId imageUrl:(NSString*)imgUrl description:(NSString*)title;

-(NSString*)getImage;

-(NSString*)getDescription;

-(void)fetchUserNameWithSuccess:(void(^)(NSString * name))successBlock error: (void(^)(NSString*)) errorBlock;

@end
