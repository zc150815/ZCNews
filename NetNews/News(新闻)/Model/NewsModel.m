//
//  NewsModel.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTool.h"

@implementation NewsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
+(instancetype)NewsModelWithDic:(NSDictionary *)dic
{
    NewsModel *model = [[NewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

+(void)downloadNewsWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failBlock:(void (^)(NSError *))failBlock
{
    [[NetworkTool sharedNetworkTool]GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        
        NSString *key = dic.keyEnumerator.nextObject;
        
        NSArray *array = [dic objectForKey:key];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            NewsModel *model = [NewsModel NewsModelWithDic:obj];
            
            [arrayM addObject:model];
        }];
        
        if (successBlock) {
            successBlock(arrayM.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failBlock) {
            failBlock(error);
        }
        
    }];
    

}

@end
