//
//  HomeCollectionViewCell.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "NewsTableViewController.h"

@interface HomeCollectionViewCell ()

@property (strong, nonatomic)NewsTableViewController *NewsVC;

@end

@implementation HomeCollectionViewCell

-(void)awakeFromNib
{
//    self.backgroundColor = RandomColor;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.NewsVC = [storyboard instantiateInitialViewController];
    self.NewsVC.tableView.frame = self.contentView.bounds;
    
    [self addSubview:self.NewsVC.tableView];
}


-(void)setUrlstr:(NSString *)urlstr
{
    _urlstr = urlstr;
    self.NewsVC.urlstr = self.urlstr;
    
    
}
@end
