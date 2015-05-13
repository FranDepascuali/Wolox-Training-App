//
//  NewCellTableTableViewCell.h
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleNewTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *user;
@property (nonatomic, weak) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *desc;


@end