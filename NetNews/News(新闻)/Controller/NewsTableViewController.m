//
//  NewsTableViewController.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@property (strong, nonatomic) NSArray *dataArray;


@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark 实心Tableview的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsModel *model = self.dataArray[indexPath.row];
    
    NSString *identifier = @"BaseCell";
    if (model.imgType) {
        identifier = @"BigCell";
    }
    else if (model.imgextra.count == 2)
    {
        identifier = @"ImagesCell";
    }
   
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    
    cell.model = model;
    
    return cell;
}

//设置不同的tableviewcell的行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model = self.dataArray[indexPath.row];
    
    CGFloat rowHeight = 80;
    
    if (model.imgType) {
        rowHeight = 180;
    }
    else if (model.imgextra.count == 2)
    {
        rowHeight = 150;
    }
    
    return rowHeight;
}

-(void)setUrlstr:(NSString *)urlstr
{
    
    [NewsModel downloadNewsWithUrlstr:urlstr successBlock:^(NSArray *array) {
        
        self.dataArray = array;
        
        [self.tableView reloadData];
        
    } failBlock:^(NSError *error) {
        
        NSLog(@"error %@",error);
    }];
}


#pragma mark 数据懒加载
-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}
@end
