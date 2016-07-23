//
//  HomeViewController.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"
#import "HomeCollectionViewCell.h"


@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
//频道控件
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
//collectionView控件
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//collectionView布局控件
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *CollectionViewFlowLayout;


@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) ChannelLabel *currentLabel;

@property (strong, nonatomic) NSMutableArray *labelArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChannel];
}
-(void)viewDidAppear:(BOOL)animated
{
    self.CollectionViewFlowLayout.itemSize = self.collectionView.bounds.size;
}


#pragma mark 频道列表的建立

-(void)setupChannel
{
    CGFloat labelH = self.channelScrollView.bounds.size.height;
    CGFloat labelW = 80;
    
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        
        CGFloat labelX = labelW * i;
        
        ChannelLabel *label = [[ChannelLabel alloc]initWithFrame:CGRectMake(labelX, 0, labelW, labelH)];
        
        ChannelModel *model = self.dataArray[i];
        
        label.text = model.tname;
        label.tag = i;
        label.font = TextFont;
        
        [self.channelScrollView addSubview:label];
       
        //给lable添加手势事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickChannelWith:)];
        //将手势添加到label
        [label addGestureRecognizer:tap];
        
        //设置label可点击
        label.userInteractionEnabled = YES;
        
        //给头条设置文字属性
        if (i == 0) {
            label.textColor = [UIColor redColor];
            self.currentLabel = label;
            self.currentLabel.font = BoldTextFont;
        }
        
        //把每一个label添加到一个label数组中
        [self.labelArray addObject:label];
    }
    //设置scrollView的滚动范围
    self.channelScrollView.contentSize = CGSizeMake(labelW * self.dataArray.count, 0);
}

-(void)clickChannelWith:(UITapGestureRecognizer *)tap
{
    //还原之前的label属性
    if (self.currentLabel) {
        self.currentLabel.textColor = [UIColor blackColor];
        self.currentLabel.font = TextFont;
    }
    
    ChannelLabel *label = (ChannelLabel *)tap.view;
    
    //设置当前的label
    self.currentLabel = label;
    
    //设置当前label的属性
    label.textColor = [UIColor redColor];
    label.font = BoldTextFont;;
    
    //设置collectionView联动
    [self.collectionView setContentOffset:CGPointMake(label.tag * self.collectionView.bounds.size.width, 0) animated:NO];
    
    CGFloat labelContentOffsetX = label.center.x - self.collectionView.bounds.size.width/2;
    
    //设置最大和最小偏移量
    CGFloat minContentOffsetX = 0;
    CGFloat maxContentOffsetX = self.channelScrollView.contentSize.width - self.collectionView.bounds.size.width;
    
    //判断若超过最大最小偏移量时进行设置
    if (labelContentOffsetX < minContentOffsetX) {
        labelContentOffsetX = minContentOffsetX;
    }
    else if (labelContentOffsetX > maxContentOffsetX)
    {
        labelContentOffsetX = maxContentOffsetX;
    }
    
    //设置频道列表滚动
    [self.channelScrollView setContentOffset:CGPointMake(labelContentOffsetX, 0) animated:YES];
}

#pragma mark 数据懒加载

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        
        _dataArray = [ChannelModel creatChannel];
    }
    
    return _dataArray;
}

-(NSMutableArray *)labelArray
{
    if (_labelArray == nil) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}
#pragma mark 实现collectionView的数据源方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    
    ChannelModel *model = self.dataArray[indexPath.item];
    
    NSString *urlstr = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    
    cell.urlstr = urlstr;
    
    return cell;
}

//停止拖动之后要执行的方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.currentLabel) {
        self.currentLabel.textColor = [UIColor blackColor];
        self.currentLabel.font = TextFont;
    }
    

    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    ChannelLabel *label = self.labelArray[index];
    
    label.textColor = [UIColor redColor];
    label.font = BoldTextFont;;
    
    //设置为当前label
    self.currentLabel = label;
    
    CGFloat labelContentOffsetX = label.center.x - self.collectionView.bounds.size.width/2;
    
    //设置最大最小偏移量
    CGFloat minContentOffsetX = 0;
    CGFloat maxContentOffsetX = self.channelScrollView.contentSize.width - self.collectionView.bounds.size.width;
    
    //判断若超过最大最小偏移量时进行设置
    if (labelContentOffsetX < minContentOffsetX) {
        labelContentOffsetX = minContentOffsetX;
    }
    else if (labelContentOffsetX > maxContentOffsetX)
    {
        labelContentOffsetX = maxContentOffsetX;
    }
    
    //设置频道列表滚动
    [self.channelScrollView setContentOffset:CGPointMake(labelContentOffsetX, 0) animated:YES];
    
    
}

@end
