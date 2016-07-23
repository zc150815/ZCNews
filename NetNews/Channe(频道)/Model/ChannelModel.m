//
//  ChannelModel.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ChannelModel.h"


@implementation ChannelModel

//字典转模型方法
+(instancetype)ChannelModelWithDic:(NSDictionary *)dic
{
    ChannelModel *model = [[ChannelModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
//供外部调用的方法
+(NSArray *)creatChannel
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *array = [dic objectForKey:@"tList"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    
    [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ChannelModel *model = [ChannelModel ChannelModelWithDic:obj];
        
        [arrayM addObject:model];
    }];
    
    [arrayM sortUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    
    }];
    
    return arrayM.copy;
}
@end
