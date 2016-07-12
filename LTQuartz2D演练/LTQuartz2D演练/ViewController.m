//
//  ViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ViewController.h"
#import "LineViewController.h"
#import "ShapeViewController.h"
#import "ProgressViewController.h"
#import "PieViewController.h"
#import "BarViewController.h"
#import "TextAndImageViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** obj*/
@property (nonatomic, strong, nullable) UITableView  *tableView;

@end

@implementation ViewController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Quartz2D";

    [self.view addSubview:self.tableView];

}

#pragma mark - --- delegate 视图委托 ---


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *dif = @"Cell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:dif];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dif];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"线";
            break;
        case 1:
            cell.textLabel.text = @"形状";
            break;
        case 2:
            cell.textLabel.text = @"下载进度";
            break;
        case 3:
            cell.textLabel.text = @"饼形图";
            break;
        case 4:
            cell.textLabel.text = @"柱形图";
            break;
        case 5:
            cell.textLabel.text = @"绘制文字和图片";
            break;

        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {

        [ self.navigationController  pushViewController:[LineViewController new] animated:YES];

    }else if (indexPath.row == 1){
        [ self.navigationController  pushViewController:[ShapeViewController new] animated:YES];
    }else if (indexPath.row == 2){
        [ self.navigationController  pushViewController:[ProgressViewController new] animated:YES];
    }else if (indexPath.row == 3){
        [ self.navigationController  pushViewController:[PieViewController new] animated:YES];
    }else if (indexPath.row == 4){
        [ self.navigationController  pushViewController:[BarViewController new] animated:YES];
    }else if (indexPath.row == 5){
        [ self.navigationController  pushViewController:[TextAndImageViewController new] animated:YES];
    }


}

#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView   = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;

    }
    return _tableView;
}

@end
