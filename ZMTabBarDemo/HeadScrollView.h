//
//  HeadScrollView.h
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/28.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadScrollView : UIScrollView


@property(nonatomic,copy)void (^scrollToTagBlock) (NSInteger index);
//频道buttons数组
@property(nonatomic,strong)NSMutableArray *channelButtons;
//当前的下标
@property(nonatomic,assign)NSInteger currentIndex;

//滑块
@property(nonatomic,weak)UIView *slider;

-(void)sliderAnimation:(NSInteger)index;

//选中的按钮居中显示
-(void)btnToCenter:(UIButton *)button;

//点击
-(void)scrollToTag:(UIButton *)sender;
@end

