//
//  ZMHomeViewC.m
//  ZMTabBarDemo
//
//  Created by 张敏 on 16/3/28.
//  Copyright © 2016年 张敏. All rights reserved.
//

#import "ZMHomeViewC.h"
#import "DemoViewController.h"



@interface ZMHomeViewC ()
@property(nonatomic,strong)DemoViewController *demoVC;
@end

@implementation ZMHomeViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DemoViewController *demoVC = [[DemoViewController alloc]init];
    self.demoVC = demoVC;
    
//    [demoVC addPresentViewController:self WithIndex:2 ];//
    
}







@end
