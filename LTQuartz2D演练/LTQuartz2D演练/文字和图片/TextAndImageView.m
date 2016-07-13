//
//  TextAndImageView.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/12.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "TextAndImageView.h"

@implementation TextAndImageView

- (void)setState:(NSInteger)state{
    _state = state;
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    绘制文本
    if (self.state == 1) {
          [self attrText];
    }else{
        [self imageDraw:rect];
    }

//绘图


}

#pragma mark ---  绘制文字----------
- (void)imageDraw:(CGRect)rect{

    // 超出裁剪区域的内容全部裁剪掉
    // 注意：裁剪必须放在绘制之前
//    UIRectClip(CGRectMake(0, 0, 50, 50));

    UIImage *image = [UIImage imageNamed:@"bg1"];

    // 默认绘制的内容尺寸跟图片尺寸一样大
    //    [image drawAtPoint:CGPointZero];
//    把图片绘制到一定范围内
        [image drawInRect:rect];
    // 绘图
//    平铺
//    [image drawAsPatternInRect:rect];
}

 - (void)attrText
 {

 // 绘制文字

 NSString *str = @"测试用的，哈哈哈哈.......";


 // 文字的起点
 // Attributes：文本属性

 NSMutableDictionary *textDict = [NSMutableDictionary dictionary];

 // 设置文字颜色
 textDict[NSForegroundColorAttributeName] = [UIColor redColor];

 // 设置文字字体
 textDict[NSFontAttributeName] = [UIFont systemFontOfSize:40];

 // 设置文字的空心颜色和宽度

 textDict[NSStrokeWidthAttributeName] = @3;

 textDict[NSStrokeColorAttributeName] = [UIColor yellowColor];

 // 创建阴影对象
 NSShadow *shadow = [[NSShadow alloc] init];
 shadow.shadowColor = [UIColor greenColor];
 shadow.shadowOffset = CGSizeMake(4, 4);
 shadow.shadowBlurRadius = 3;
 textDict[NSShadowAttributeName] = shadow;

 // 富文本:给普通的文字添加颜色，字体大小
 [str drawAtPoint:CGPointZero withAttributes:textDict];
 }

@end
