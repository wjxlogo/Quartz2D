//
//  LockView.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/20.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "LockView.h"

@interface LockView()

@property (nonatomic, strong) NSMutableArray *selectedsBtn;

@property (nonatomic, assign) CGPoint curP;

@end

@implementation LockView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self ) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    // 创建9个按钮
    for ( int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

        // 不允许用户交互，按钮就不能点击，也就不能达到高亮状态
        btn.userInteractionEnabled = NO;

        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];

        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];

        btn.tag = i;

        [self addSubview:btn];
    }

    UIPanGestureRecognizer  *pan  = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];

}



- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取触摸点
    _curP = [pan locationInView:self];

    // 判断触摸点在不在按钮上
    for (UIButton *btn in self.subviews) {
        // 点在不在某个范围内,并且按钮没有被选中
        if (CGRectContainsPoint(btn.frame, _curP) && btn.selected == NO) {
            // 点在按钮上
            btn.selected = YES;

            // 保存到数组中
            [self.selectedsBtn addObject:btn];

        }

    }

    // 重绘
    [self setNeedsDisplay];


    if (pan.state == UIGestureRecognizerStateEnded) {

        // 创建可变字符串
        NSMutableString *strM = [NSMutableString string];
        // 保存输入密码
        for (UIButton *btn in self.selectedsBtn) {

            [strM appendFormat:@"%ld",btn.tag];

        }
        NSLog(@"%@",strM);

        // 还原界面

        // 取消所有按钮的选中
        [self.selectedsBtn makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];

        // 清除画线,把选中按钮清空
        [self.selectedsBtn removeAllObjects];
    }

}
// 只要调用这个方法，就会把之前绘制的东西全部清掉，重新绘制
- (void)drawRect:(CGRect)rect
{
    // 没有选中按钮，不需要连线
    if (self.selectedsBtn.count == 0) return;

    // 把所有选中按钮中心点连线
    UIBezierPath *path = [UIBezierPath bezierPath];


    NSUInteger count = self.selectedsBtn.count;
    // 把所有选中按钮之间都连好线
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.selectedsBtn[i];
        if (i == 0) {
            // 设置起点
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }

    }

    // 连线到手指的触摸点
    [path addLineToPoint:_curP];


    [[UIColor greenColor] set];
    path.lineWidth = 10;
    path.lineJoinStyle = kCGLineJoinRound;
    [path stroke];


}



// 为什么要在这个方法布局子控件，因为只要一调用这个方法，就表示父控件的尺寸确定
- (void)layoutSubviews
{
    [super layoutSubviews];

    NSUInteger count = self.subviews.count;
    int cols = 3;

    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 74;
    CGFloat h = 74;
    CGFloat margin = (self.bounds.size.width - cols * w) / (cols + 1);

    CGFloat col = 0;
    CGFloat row = 0;
    for (NSUInteger i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        // 获取当前按钮的列数
        col = i % cols;
        row = i / cols;
        x = margin + col * (margin + w);
        y = row * (margin + w);

        btn.frame = CGRectMake(x, y, w, h);

    }

}

- (NSMutableArray *)selectedsBtn
{
    if (_selectedsBtn == nil) {
        _selectedsBtn = [NSMutableArray array];
    }

    return _selectedsBtn;
}

@end
