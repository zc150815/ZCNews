//
//  CycelModel.h
//  NetNews
//
//  Created by Ning Xie on 16/7/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycelModel : NSObject

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *imgsrc;

+(void)downloadCycleWithUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *array))successBlock failBlock:(void(^)(NSError *error))failBlock;
@end
