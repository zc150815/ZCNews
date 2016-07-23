//
//  NewsTableViewCell.h
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>


@class NewsModel;
@interface NewsTableViewCell : UITableViewCell

@property (strong, nonatomic) NewsModel *model;

@end
