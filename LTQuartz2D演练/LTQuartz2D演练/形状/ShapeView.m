//
//  ShapeView.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView


- (void)drawRect:(CGRect)rect {
    // Drawing code
//    //圆角矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:50];
//
////    [path stroke];
//    //填充必须是完整的封闭路径
//    [path fill];

//    圆弧
//    Center:圆心
//    startAngle：起点  弧度
//    clockwise：是否 顺时针
//    CGPoint center =CGPointMake(125, 125);
//    UIBezierPath *path = [UIBezierPath  bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
//    [path stroke];


//    扇形
    CGPoint center =CGPointMake(125, 125);
        UIBezierPath *path = [UIBezierPath  bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:center];
//    封闭路径，关闭路径：从路径的终点到起点
//    [path closePath];
//
//    [path stroke];

//    也可以直接用,默认自动封闭路径
    [[UIColor redColor]set];
    [path fill];



}


@end
