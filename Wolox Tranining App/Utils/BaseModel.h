//
//  BaseModel.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/4/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (BOOL)emailIsCorrect:(NSString*) email;

- (void)openPage:(NSString *) url;

@end
