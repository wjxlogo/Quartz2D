//
//  TextAndImageViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "TextAndImageViewController.h"
#import "TextAndImageView.h"
@interface TextAndImageViewController ()
/** obj*/
@property (nonatomic, strong, nullable)TextAndImageView * textAndImageView ;

@end

@implementation TextAndImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"文字和图片";
    self.view.backgroundColor = [UIColor whiteColor];
    self.textAndImageView = [[TextAndImageView alloc]initWithFrame:CGRectMake(50, 50+64, self.view.bounds.size.width - 100, self.view.bounds.size.width - 100)];
    self.textAndImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.textAndImageView];



    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, self.view.bounds.size.width +64, 50, 30);
    [button setTitle:@"文字" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];

    [button addTarget:self action:@selector(buttonClilk) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(self.view.bounds.size.width-100, self.view.bounds.size.width +64, 50, 30);
    button1.backgroundColor = [UIColor redColor];

    [button1 setTitle:@"图片" forState:UIControlStateNormal];
      [button1 addTarget:self action:@selector(buttonClilk1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}
- (void)buttonClilk{
    self.textAndImageView.state = 1;
}
- (void)buttonClilk1{
    self.textAndImageView.state = 2;

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
