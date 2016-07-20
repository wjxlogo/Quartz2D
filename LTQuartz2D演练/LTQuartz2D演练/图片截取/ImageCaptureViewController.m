//
//  ImageCaptureViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/13.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ImageCaptureViewController.h"
@interface ImageCaptureViewController()

/** obj*/
@property (nonatomic, assign) CGPoint  startP;
/** obj*/
@property (nonatomic, strong, nullable) UIView   *clipView;
/** obj*/
@property (nonatomic, strong, nullable) UIImageView *imageView ;


@end

@implementation ImageCaptureViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"图片截取";
    self.view.backgroundColor = [UIColor redColor];

    self.imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];

    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:self.imageView];

    UIPanGestureRecognizer  *pan  = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];

}
- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint endA = CGPointZero;
    if (pan.state == UIGestureRecognizerStateBegan) {
        //获取一开始的触摸点
//        开始点
        _startP = [pan locationInView:self.view];
             NSLog(@"%s,%f",__FUNCTION__,_startP.x);
    }else if (pan.state == UIGestureRecognizerStateChanged){
//结束点
        endA = [pan locationInView:self.view];
        CGFloat w = endA.x - _startP.x;
        CGFloat h = endA.y - _startP.y;



        //        截取范围
        CGRect clipR = CGRectMake(_startP.x, _startP.y, w, h);
        self.clipView.frame = clipR;

    }else if (pan.state == UIGestureRecognizerStateEnded){
//        _endP = [pan locationInView:self.view];
        // 图片裁剪，生成一张新的图片

        // 开启上下文
        // 如果不透明，默认超出裁剪区域会变成黑色，通常都是透明
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);

        // 设置裁剪区域
        UIBezierPath *path =  [UIBezierPath bezierPathWithRect:_clipView.frame];

        [path addClip];

        // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();

        // 把控件上的内容渲染到上下文
        [self.imageView.layer renderInContext:ctx];


        // 生成一张新的图片
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        NSLog(@"%s,%f",__FUNCTION__,image.size.width);


        // 关闭上下文
        UIGraphicsEndImageContext();
//        截取view的隐藏
//        先移除在设为Nil
        [_clipView removeFromSuperview];
        _clipView = nil;


    }

}
- (UIView *)clipView{
    if (!_clipView) {
        _clipView = [[UIView alloc]init];
        _clipView.backgroundColor = [UIColor blueColor];
        _clipView.alpha = 0.5;
        [self.view addSubview:_clipView];
    }
    return _clipView;
}
@end
