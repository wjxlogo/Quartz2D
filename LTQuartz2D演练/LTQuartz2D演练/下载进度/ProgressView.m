//
//  ProgressView.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ProgressView.h"
@interface ProgressView()
/** obj*/
@property (nonatomic, strong, nullable) UILabel  *label;
@end

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];

    }
    return self;
}
- (void)setupUI{
    [self addSubview:self.label];
}
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;

    self.label.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];

    // 重新绘制圆弧
    //    [self drawRect:self.bounds];

    // 重绘，系统会先创建与view相关联的上下文，然后再调用drawRect
    [self setNeedsDisplay];
}



// 注意：drawRect不能手动调用，因为图形上下文我们自己创建不了，只能由系统帮我们创建，并且传递给我们
- (void)drawRect:(CGRect)rect {
    // 创建贝瑟尔路径
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);


    CGFloat endA = -M_PI_2 + _progress * M_PI * 2;

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];


    [path stroke];

}
- (void)layoutSubviews{
    
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width- 200, [UIScreen mainScreen].bounds.size.width-200)];
        _label.textColor = [UIColor greenColor];
        _label.font = [UIFont systemFontOfSize:50];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"0%";
    }
    return _label;
}

@end
