//
//  ShapeViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ShapeViewController.h"
#import "ShapeView.h"
@interface ShapeViewController ()

@end

@implementation ShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"形状";
     self.view.backgroundColor = [UIColor whiteColor];
    ShapeView * shapeView = [[ShapeView alloc]initWithFrame:CGRectMake(50, 50+64, self.view.bounds.size.width - 100, self.view.bounds.size.width - 100)];
    shapeView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shapeView];

    
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
