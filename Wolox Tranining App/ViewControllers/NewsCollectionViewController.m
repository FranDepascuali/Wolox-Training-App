//
//  NewsViewController.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "NewsCollectionViewController.h"
#import "NewsViewModel.h"
#import "SingleNewTableViewCell.h"
#import "NewsCollectionViewModel.h"
#import "NewsViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define CELL_ID @"NewsTableViewCell"

@interface NewsCollectionViewController ()

@property (nonatomic,strong) NewsCollectionViewModel* model;

@end

@implementation NewsCollectionViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.loadingTableIndicator setHidesWhenStopped:YES];
	[self.loadingTableIndicator startAnimating];
	self.model = [NewsCollectionViewModel new];
	[self.newsTable registerNib:[UINib nibWithNibName:CELL_ID bundle:nil] forCellReuseIdentifier:CELL_ID];
	self.newsTable.delegate=self;
	self.newsTable.dataSource=self;
	[self.model fetchNewsWithSuccess:^ {
		[self.newsTable reloadData];
		[self.loadingTableIndicator stopAnimating];
	}error:^(NSString * err) {
		[self.loadingTableIndicator stopAnimating];
		[self displayError:err];
	}];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SingleNewTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    NewsViewModel* newViewModel = [self.model newsViewModelAtIndex:indexPath.row];
    [newViewModel fetchUserNameWithSuccess:^(NSString * name) {
        cell.user.text = name;
    } error:^(NSString* err) {
        [self displayError:err];
    }];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString: [newViewModel getImage]]
                      placeholderImage:[UIImage imageNamed:@"header_logo"]];
	
	[self.model attachImages: cell.likeButton];
	
	[cell.likeButton addTarget:self.model action:@selector(likeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	
    cell.desc.text = [newViewModel getDescription];
    return cell;
}

#pragma mark - Private

- (void)displayError:(NSString *)error {
    [self.view makeToast:error];
}

@end
