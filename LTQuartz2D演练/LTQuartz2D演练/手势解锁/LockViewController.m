//
//  LockViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/20.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "LockViewController.h"
#import "VCView.h"
#import "LockView.h"
@implementation LockViewController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"手势解锁";
    self.view.backgroundColor = [UIColor whiteColor];


    VCView * vCView = [[VCView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width , self.view.bounds.size.height - 64 )];
    //    lockView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:vCView];
    

    LockView * lockView = [[LockView alloc]initWithFrame:CGRectMake(0, 50+64, self.view.bounds.size.width , self.view.bounds.size.width )];
//     不设背景会出问题。我也不知道怎么回事
    lockView.backgroundColor = [UIColor clearColor];
    [vCView addSubview:lockView];
}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---
@end
