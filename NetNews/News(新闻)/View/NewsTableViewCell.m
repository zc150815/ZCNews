//
//  NewsTableViewCell.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsModel.h"
#import <UIImageView+WebCache.h>


@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextraView;


@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLab;


@end
@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setModel:(NewsModel *)model
{
    _model = model;
    
    [self.imgsrcView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.titleLab.text = model.title;
    self.sourceLab.text = model.source;
    self.replyCountLab.text = [NSString stringWithFormat:@"%@",model.replyCount];
    
    for (NSInteger i = 0;  i < model.imgextra.count; i++) {
        
        UIImageView *image = self.imgextraView[i];
        
        NSDictionary *dic = model.imgextra[i];
        
        NSString *urlstr = [dic objectForKey:@"imgsrc"];
        
        [image sd_setImageWithURL:[NSURL URLWithString:urlstr]];
    }
    
    
}
@end
