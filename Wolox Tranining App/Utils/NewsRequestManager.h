//
//  NewsRequestManager.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/12/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsRequestManager : NSObject

- (void) fetchNewsWithSuccess:(void(^)(id))successBlock error:(void(^)(NSString*))errorBlock;

@end
