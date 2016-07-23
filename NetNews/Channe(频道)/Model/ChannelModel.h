//
//  ChannelModel.h
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

//model属性
@property (copy, nonatomic) NSString *tname;
@property (copy, nonatomic) NSString *tid;


//供外部调用的方法
+(NSArray *)creatChannel;
@end
