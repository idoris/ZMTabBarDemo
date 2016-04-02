//
//  ZMMainTabBarC.m
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/28.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import "ZMMainTabBarC.h"

#import "ZMNavigationC.h"

#import "ZMDiscoveryTableVC.h"
#import "ViewController.h"
#import "ZMProfileTableC.h"
#import "ZMHomeViewC.h"



@interface ZMMainTabBarC ()

@end

@implementation ZMMainTabBarC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取4个子控制器
    [self addChildViewController];
    
    
    
    
}


// 添加所有子控制器
-(void)addChildViewController{
    
    // 设置 tabBar 的 tintColor
//    self.tabBar.tintColor = [UIColor redColor];
    
    //添加子控制器
    [self addChildViewController:[[ZMHomeViewC alloc] init] title:@"资讯" imageName:@"tabbar_home"];
    [self  addChildViewController:[[ZMDiscoveryTableVC alloc]init] title:@"搜索" imageName:@"tabbar_discover"];
    [self addChildViewController:[[ViewController alloc] init] title:@"消息" imageName:@"tabbar_message_center"];
    [self addChildViewController:[[ZMProfileTableC alloc] init] title:@"我的" imageName:@"tabbar_profile"];
    
    
}


//添加子控制器

-(void)addChildViewController:(UIViewController *)childController  title:(NSString *)title   imageName:(NSString *)imgName{
    
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:imgName];
    NSString *selectedImgName = [NSString stringWithFormat:@"%@_selected",imgName];
    //选中图片
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImgName];
    
    //设置navigationC的跟控制器
    ZMNavigationC *nav = [[ZMNavigationC alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
