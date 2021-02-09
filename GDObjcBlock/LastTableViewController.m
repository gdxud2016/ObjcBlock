//
//  LastTableViewController.m
//  GDObjcBlock
//
//  Created by apple on 2019/7/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "LastTableViewController.h"
#import "GDTableViewCell.h"

@interface LastTableViewController ()

@property(nonatomic,strong)NSMutableArray * data;
@end

@implementation LastTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = [NSMutableArray array];
    
    for (NSInteger index = 0 ; index < 100 ; index ++) {
        NSInteger x = arc4random() % 8 + 1;
        [_data addObject:[NSString stringWithFormat:@"%ld",x]];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[GDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    NSString * ss = _data[indexPath.row];
    NSString * tt =  _data [_data.count - 1 - indexPath.row];
    [cell setImage:[UIImage imageNamed:ss] content:[NSString stringWithFormat:@"%@这个是数字蒸激励",ss] imageT:[UIImage imageNamed:tt]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell uploadImageView];
}
@end
