//
//  ProfileViewController.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileViewModel.h"
#import "Toast/UIView+Toast.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ProfileViewController ()

@property (strong,nonatomic) ProfileViewModel* model;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.model = [[ProfileViewModel alloc] init];
	[self.model fetchUserInfoWithSuccess:^(NSString* countryName, NSString* userName, NSString* userDescription, NSString* imageUrl) {
		self.userCountryLabel.text = countryName;
		self.userNameLabel.text = userName;
		self.userDescriptionLabel.text = userDescription;
		[self.profileImageView sd_setImageWithURL:[NSURL URLWithString: imageUrl]
								 placeholderImage:[UIImage imageNamed:@"header_logo"]];
	} error:^(NSString* err) {
		[self displayError:err];
	}];
}

#pragma mark - Private methods

- (void)displayError:(NSString *)error {
	[self.view makeToast:error];
}

@end
