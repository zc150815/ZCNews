//
//  NetworkTool.m
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NetworkTool.h"
#import <AFNetworking.h>

@implementation NetworkTool

static id _instancetype;
+(instancetype)sharedNetworkTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
//        _instanceType = [[self alloc]initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/"]];
        NSURL *baseurl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        _instancetype = [[self alloc]initWithBaseURL:baseurl];
    });
    
    return _instancetype;
}
@end
