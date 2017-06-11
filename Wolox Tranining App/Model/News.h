//
//  SingleNewModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/6/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface News : NSObject

@property (strong, nonatomic) NSString* userId;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSString* desc;
@property (strong, nonatomic) NSString* userName;

- (id)initWithUserId:(NSString*)userId imageUrl:(NSString*)imageUrl description:(NSString*)desc;

@end
