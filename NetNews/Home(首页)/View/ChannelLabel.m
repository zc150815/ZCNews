//
//  ChannelLabel.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


@end
