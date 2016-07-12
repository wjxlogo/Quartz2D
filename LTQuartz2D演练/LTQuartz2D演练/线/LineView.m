//
//  LineView.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "LineView.h"

@implementation LineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

// 绘图的步骤： 1.获取上下文 2.创建路径（描述路径） 3.把路径添加到上下文 4.渲染上下文
// 通常在这个方法里面绘制图形
// 为什么要再drawRect里面绘图，只有在这个方法里面才能获取到跟View的layer相关联的图形上下文
// 什么时候调用:当这个View要显示的时候才会调用drawRect绘制图形，
// 注意：rect是当前控件的bounds
- (void)drawRect:(CGRect)rect {
    // Drawing code
    /* 都是一条线
    [self drawLine];
    [self drawLine1];
    [self drawLine2];*/
    //两条连接的线
//    [self draw2line];
    // 两条不连接的线。在一条线画完的时候 从新设置起点
//    [self draw2lineBezier];
    //绘制曲线
    [self drawCureveLine];
}
#pragma mark --- 绘制曲线  --- 
-(void)drawCureveLine{
    // 如何绘制曲线

    // 原生绘制方法
 
    // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
    
        // 描述路径
        // 设置起点
        CGContextMoveToPoint(ctx, 50, 50);
    
        // cpx:控制点的x
        CGContextAddQuadCurveToPoint(ctx, 150, 20, 250, 50);
    
    
        // 渲染上下文
        CGContextStrokePath(ctx);

}


#pragma mark --- 两条连接的线   以及设置状态
//贝瑟尔
- (void)draw2lineBezier{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 100)];
    path.lineWidth = 5;
    [[UIColor greenColor] set];
    [path stroke];


    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(100, 50)];
    [path1 addLineToPoint:CGPointMake(100, 100)];
    path1.lineWidth = 5;
    [path1 stroke];
}

- (void)draw2line{

    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 描述路径
    // 设置起点
    CGContextMoveToPoint(ctx, 50, 50);

    CGContextAddLineToPoint(ctx, 100, 200);
    //默认下一根线的起点就是上一根线的终点
    CGContextAddLineToPoint(ctx, 200, 200);

    //设置绘图状态，一定要在渲染之前
//    颜色
    [[UIColor redColor] setStroke];
//    线宽
    CGContextSetLineWidth(ctx, 5);
//    设置连接样式.不是特别明显
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //  设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);

    // 渲染上下文
    CGContextStrokePath(ctx);

}







#pragma mark - 最原始的绘图方式
- (void)drawLine
{
    // 1.获取图形上下文
    // 目前我们所用的上下文都是以UIGraphics
    // CGContextRef Ref：引用 CG:目前使用到的类型和函数 一般都是CG开头 CoreGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2.描述路径
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();

    // 设置起点
    // path：给哪个路径设置起点
    CGPathMoveToPoint(path, NULL, 50, 50);

    // 添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 200, 200);

    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path);

    // 4.渲染上下文
    CGContextStrokePath(ctx);
    
}
#pragma mark - 绘图第二种方式
- (void)drawLine1
{
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 描述路径
    // 设置起点
    CGContextMoveToPoint(ctx, 50, 50);

    CGContextAddLineToPoint(ctx, 200, 200);

    // 渲染上下文
    CGContextStrokePath(ctx);

}
#pragma mark - 绘图第三种方式
- (void)drawLine2
{
    // UIKit已经封装了一些绘图的功能

    // 贝瑟尔路径
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];

    // 设置起点
    [path moveToPoint:CGPointMake(50, 50)];

    // 添加一根线到某个点
    [path addLineToPoint:CGPointMake(200, 200)];

    // 绘制路径
    [path stroke];

    //    NSLog(@"%@",NSStringFromCGRect(rect));

}

@end
