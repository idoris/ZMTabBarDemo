//
//  Channel.h
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/29.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

//频道名称
@property(nonatomic,copy)NSString *channelName;
@property(nonatomic,copy)NSString *ControllName;
//返回数组
+(NSArray*)statuses;
@end
