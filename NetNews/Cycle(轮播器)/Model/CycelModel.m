//
//  CycelModel.m
//  NetNews
//
//  Created by Ning Xie on 16/7/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CycelModel.h"
#import "NetworkTool.h"

@implementation CycelModel
+(instancetype)CycleModelWithDic:(NSDictionary *)dic
{
    CycelModel *model = [[CycelModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
+(void)downloadCycleWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failBlock:(void (^)(NSError *))failBlock
{
    [[NetworkTool sharedNetworkTool]GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        
        
        NSString *key = dic.keyEnumerator.nextObject;
        
        NSArray *array = [dic objectForKey:key];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CycelModel *model = [CycelModel CycleModelWithDic:obj];
            
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
