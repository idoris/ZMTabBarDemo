//
//  bodyScrollView.m
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/29.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import "bodyScrollView.h"
#import "Channel.h"

#define RandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]
@interface bodyScrollView ()

//频道名称数组
@property(nonatomic,strong)NSArray  *statuses;
@end

@implementation bodyScrollView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupUI];
    }
    
    return self;
}

//设置视图
-(void)setupUI{
    //获取频道名称数组
    self.statuses = [Channel statuses];

    //循环创建频道标签
    for (int i = 0; i<self.statuses.count; i++) {
        
        //创建view
        UIView *bodyView = [self craeatViewWithLabelName:[self.statuses[i] channelName] controllerName:[self.statuses[i] ControllName]];
        
        bodyView.frame = CGRectMake(self.bounds.size.width*i, 0, self.bounds.size.width, self.bounds.size.height);
        
        //背景色
//        bodyView.backgroundColor = RandomColor;
        
        //把bodyView添加到父控件上
        [self addSubview:bodyView];
        
    }
    
    //设置contentSize滚动范围
    self.contentSize = CGSizeMake(self.bounds.size.width*self.statuses.count, 0);

    self.pagingEnabled = YES;
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;


    
}

//创建view
- (UIView *)craeatViewWithLabelName:(NSString*)labelName controllerName:(NSString *)controllerName {
    
//    UIView *view = [[UIView alloc] init];
    
    Class cls = NSClassFromString(controllerName);
    UIViewController *VC = [[cls alloc]init];
    
    
    UIButton *btn = [[UIButton alloc]init];
    
    //频道名称
    [btn setTitle:labelName forState:UIControlStateNormal];
    
    //背景色
    [btn setBackgroundColor:RandomColor];
    //设置frame
    btn.frame = CGRectMake(100, 100, 100, 60);
    [VC.view addSubview:btn];

    return  VC.view;
    
//    [view addSubview:btn];
//    
//    return view;
}



@end
