//
//  HeadScrollView.m
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/28.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import "HeadScrollView.h"
#import "Channel.h"
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenWidth kScreenSize.width

#define RandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]

@interface HeadScrollView ()
//频道名称数组
@property(nonatomic,strong)NSArray  *statuses;


@end



@implementation HeadScrollView


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
    NSLog(@"+++------%@",self.statuses);
    
    //初始化控件数组  如果不初始化有什么后果????
    self.channelButtons = [NSMutableArray array];
    
    CGFloat height = self.frame.size.height;
    CGFloat channelX =  0;
    CGFloat channelY =  0;
    CGFloat channelW =  80;
    CGFloat channelH =  54;
    CGFloat margin =  10;
    CGFloat sliderH = 5;
    CGFloat sliderY = height-margin;
    
    //循环创建频道标签
    for (int i = 0; i<self.statuses.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        
        //频道名称
        [btn setTitle:[self.statuses[i] channelName] forState:UIControlStateNormal];
        
        //背景色
        [btn setBackgroundColor:RandomColor];
        //把按钮添加到数组
        [self.channelButtons addObject:btn];
        
        channelX = channelW*i;
        //设置frame
        btn.frame = CGRectMake(channelX, channelY, channelW, channelH);
        
        //1.把label添加到父控件上
        [self addSubview:btn];
        
        //tag值
        btn.tag = i;
        
        [btn addTarget:self action:@selector(scrollToTag:) forControlEvents:UIControlEventTouchDown];
    }
    
    NSLog(@"+++++%@",self.channelButtons);
        //滑块
    UIView *slider = [[UIView alloc]initWithFrame:CGRectMake(0, sliderY, channelW, sliderH)];
    slider.backgroundColor = [UIColor redColor];
    self.slider = slider;
    //2.滑块添加到父控件上
    [self addSubview:slider];
    self.contentSize = CGSizeMake(channelW*self.statuses.count, 0);
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    
}

//button点击事件
-(void)scrollToTag:(UIButton *)sender{
    
    self.currentIndex = sender.tag;
    self.scrollToTagBlock(sender.tag);
    //滑块移动
    [self sliderAnimation:sender.tag];
    //居中显示
    [self btnToCenter:sender];
    
    
}


//滑块移动
-(void)sliderAnimation:(NSInteger)index{
    [UIView animateWithDuration:0.1 animations:^{
        self.slider.transform = CGAffineTransformMakeTranslation(index * 80, 0);
        
    }];
}


//选中的按钮居中显示
-(void)btnToCenter:(UIButton *)button {
    //4.让选中的channelbutton居中
    CGFloat needScrollViewX = button.center.x-
    kScreenWidth*0.5;
    
    //最小滚动的距离
    if (needScrollViewX < 0 ) {
        needScrollViewX = 0;
        
    }
    //最大允许滚动的长度
    CGFloat maxScrollViewX = self.contentSize.width-kScreenWidth;
    
    if (needScrollViewX>maxScrollViewX) {
        needScrollViewX = maxScrollViewX;
    }
    [UIView animateWithDuration:0.2 animations:^{
        //        [self setContentOffset:CGPointMake(needScrollViewX, 0) animated:NO];
        self.contentOffset = CGPointMake(needScrollViewX, 0);
        
    }];
    
}




@end
