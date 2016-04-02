//
//  DemoViewController.m
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/4/1.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import "DemoViewController.h"
#import "HeadScrollView.h"
#import "bodyScrollView.h"
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenWidth kScreenSize.width
#define kScreenHeight kScreenSize.height
@interface DemoViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)HeadScrollView *HeadScroll;
@property(nonatomic,weak)bodyScrollView *bodyScroll;
//当前选中的channelbutton标签
@property(nonatomic,assign)NSInteger currentSelectedIndex;



@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为了不让我们的channelScrollView的contentInset Top增加64
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
//    
//    //加载头部视图
    [self addHeadScrollview];
//
//    //加载身体视图
    [self addBodyScrollview];
    
}



#pragma mark--切换控制器
-(void)addPresentViewController:(UIViewController *)VC WithIndex:(NSInteger)index {
    
//    self.currentSelectedIndex =index;
    
    [VC.view addSubview:self.view];
    
    
    
}



//上下联动
//点击channel,身体跟着移动

//正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //计算当前滚动到哪页
    
    NSInteger index = (self.bodyScroll.contentOffset.x+0.5*kScreenWidth) / kScreenWidth ;
    
    [self.HeadScroll sliderAnimation:index];
    
    
    //3.获取当前的channelbutton
    UIButton *selectedChannelBtn = self.HeadScroll.channelButtons[index];
    
    //让我们的标签居中
    [self.HeadScroll btnToCenter:selectedChannelBtn];
    
//        [self.HeadScroll scrollToTag:selectedChannelBtn];
    
}


- (void)addHeadScrollview {
    
    HeadScrollView *scroll = [[HeadScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 64)];
    
    [self.view addSubview:scroll];
    
    _HeadScroll = scroll;
    
    
    scroll.scrollToTagBlock = ^(NSInteger index){
        //让body滚动
        self.bodyScroll.contentOffset = CGPointMake(kScreenWidth*index, 0);
        
    };
    
    
}

- (void)addBodyScrollview{
    
    CGFloat bodyX = 0;
    CGFloat bodyY = CGRectGetMaxY(self.HeadScroll.frame);
    CGFloat bodyW = kScreenWidth;
    CGFloat bodyH = kScreenHeight-CGRectGetMaxY(self.HeadScroll.frame);
    
    
    bodyScrollView *bodyScroll = [[bodyScrollView alloc ]initWithFrame:CGRectMake(bodyX, bodyY, bodyW, bodyH)];
    [self.view addSubview:bodyScroll];
    
    _bodyScroll = bodyScroll;
    
    self.bodyScroll.delegate = self;
}



@end
