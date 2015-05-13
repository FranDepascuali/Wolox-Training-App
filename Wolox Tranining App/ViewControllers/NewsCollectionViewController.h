//
//  NewsViewController.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Toast/UIView+Toast.h"

@interface NewsCollectionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingTableIndicator;
@property (weak, nonatomic) IBOutlet UITableView *newsTable;

@end
