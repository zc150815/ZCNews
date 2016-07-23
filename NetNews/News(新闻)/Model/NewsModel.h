//
//  NewsModel.h
//  NetNews
//
//  Created by Ning Xie on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

/// 新闻标题
@property (nonatomic,copy) NSString *title;
/// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
/// 新闻来源
@property (nonatomic,copy) NSString *source;
/// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
/// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
/// 大图标记
@property (nonatomic, assign) BOOL imgType;
/*
 "url_3w": "http://tech.163.com/16/0720/06/BSD7DCQ500097U7R.html",
 "postid": "BSD7DCQ500097U7R",
 "votecount": 4784,
 "replyCount": 5641,
 "ltitle": "iOS 9.3.3更新说明没说这个秘密:运行更快更流畅",
 "digest": "网易科技讯7月20日消息据外媒报道，iOS9.3.3已经发布，此前苹果曾发布五个公测版。值得注意的是，iOS9.3.3不仅是一个安全补丁，更让人激动的是它还隐藏",
 "url": "http://3g.163.com/tech/16/0720/06/BSD7DCQ500097U7R.html",
 "docid": "BSD7DCQ500097U7R",
 "title": "iOS 9.3.3更新说明没说这个秘密:运行更快更流畅",
 "source": "网易科技报道",
 "priority": 154,
 "lmodify": "2016-07-20 13:28:06",
 "imgsrc": "http://cms-bucket.nosdn.127.net/f1207f9e85184d80a7cfa55b67c257ba20160720060630.jpeg",
 "subtitle": "",
 "boardid": "tech_bbs",
 "ptime": "2016-07-20 06:04:39"
 */

+(void)downloadNewsWithUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *array))successBlock failBlock:(void(^)(NSError *error))failBlock;

@end
