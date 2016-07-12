//
//  ProgressViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"
@interface ProgressViewController ()
/** obj*/
@property (nonatomic, strong, nullable) UILabel  *label;
/** obj*/
@property (nonatomic, strong, nullable) UISlider  *slider;
/** obj*/
@property (nonatomic, strong, nullable) ProgressView * progressView;



@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"下载进度";
    self.view.backgroundColor = [UIColor whiteColor];

    self.progressView = [[ProgressView alloc]initWithFrame:CGRectMake(50, 50+64, self.view.bounds.size.width - 100, self.view.bounds.size.width - 100)];
    self.progressView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.progressView];


    UISlider    *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, self.view.bounds.size.width +64, self.view.bounds.size.width - 100, 50)];
    [slider  addTarget:self action:@selector(progress:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:slider];
    slider = _slider;


}
- (void)progress:(UISlider *)sender{
    self.progressView.progress = sender.value;
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
