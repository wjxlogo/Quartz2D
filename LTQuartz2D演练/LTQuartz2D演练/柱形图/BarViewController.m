//
//  BarViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "BarViewController.h"
#import "BarView.h"
@interface BarViewController ()

@end

@implementation BarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"柱形图";
    self.view.backgroundColor = [UIColor whiteColor];
    BarView * barView = [[BarView alloc]initWithFrame:CGRectMake(50, 50+64, self.view.bounds.size.width - 100, self.view.bounds.size.width - 100)];
    barView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:barView];
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
