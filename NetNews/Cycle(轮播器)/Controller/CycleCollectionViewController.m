//
//  CycleCollectionViewController.m
//  NetNews
//
//  Created by Ning Xie on 16/7/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CycleCollectionViewController.h"
#import "CycelModel.h"
#import "CycleCollectionViewCell.h"

@interface CycleCollectionViewController ()

@property (strong, nonatomic) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *FlowLayout;

@property (strong, nonatomic) IBOutlet UICollectionView *CycleCollectionView;

@end

@implementation CycleCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupCycle];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.FlowLayout.itemSize = self.CycleCollectionView.bounds.size;
}
-(void)setupCycle
{
    [CycelModel downloadCycleWithUrlstr:@"ad/headline/0-4.html" successBlock:^(NSArray *array) {
        
        self.dataArray = array;
        
        //重新加载collectionView的内容
        [self.collectionView reloadData];
        
        //实现无限轮播
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.dataArray.count inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
        
    } failBlock:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

#pragma mark 实现UICollectionView数据源方法


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArray.count * 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CycelCell" forIndexPath:indexPath];
    
    CycelModel *model = self.dataArray[indexPath.row%self.dataArray.count];
    
    cell.model = model;
    
    return cell;
}

#pragma mark 实现轮播器的无线轮播
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    NSIndexPath *indexPath;
    if (index == 0) {
        indexPath = [NSIndexPath indexPathForItem:self.dataArray.count inSection:0];
    }
    else if (index == self.dataArray.count * 2 -1)
    {
        indexPath = [NSIndexPath indexPathForItem:self.dataArray.count - 1 inSection:0];
    }
    
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];

}












@end
