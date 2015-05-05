//
//  NewsViewController.m
//  Wolox Tranining App
//
//  Created by Francisco Depascuali on 5/5/15.
//  Copyright (c) 2015 Francisco Depascuali. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewModel.h"
#import "SingleNewTableViewCell.h"

@interface NewsViewController ()

@property (nonatomic,strong) NSArray* news;
@property (nonatomic,strong) NewsViewModel* model;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [NewsViewModel new];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model getNumberOfNews];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"SingleNewCellPrototype";
    
    SingleNewTableViewCell *cell = (SingleNewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.user.text = [self.model getUserAt: ind];
    cell.userImage.image = [self.model getImage];
    cell.description.text = [self.model getNewDescription];
    
    return cell;
}


@end
