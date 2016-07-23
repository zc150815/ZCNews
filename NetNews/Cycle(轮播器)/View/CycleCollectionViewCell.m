//
//  CycleCollectionViewCell.m
//  NetNews
//
//  Created by Ning Xie on 16/7/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "CycelModel.h"

@interface CycleCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CycleCollectionViewCell

-(void)setModel:(CycelModel *)model
{
    _model = model;
    
    [self.imgsrcView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.titleLabel.text = model.title;
}

@end
