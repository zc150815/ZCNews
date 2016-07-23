//
//  CycleCollectionViewCell.h
//  NetNews
//
//  Created by Ning Xie on 16/7/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CycelModel;
@interface CycleCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) CycelModel *model;
@end
