//
//  Channel.m
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/29.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import "Channel.h"

@implementation Channel

-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_channelName];
    
}


+(NSArray*)statuses{
    
    //创建一个可变的模型数组
    NSMutableArray *statuses = [NSMutableArray array];
    
    //读取plist文件
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"statusList.plist" ofType:nil];
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:filepath];
    
    //遍历数组
    for (NSDictionary  *dict in dicArr) {
        //字典转模型
        Channel *channel = [Channel channelWithDict:dict];
              //4 将我们的模型加入到模型数组中
        [statuses addObject:channel];
    
    }
    
    NSLog(@"--%@",statuses);
    
    return statuses.copy;
}






+(instancetype)channelWithDict:(NSDictionary *)dict{
    id obj = [[self alloc]init];
    //kvc赋值
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}




@end
