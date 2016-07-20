//
//  VCView.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/20.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "VCView.h"

@implementation VCView
- (void)drawRect:(CGRect)rect
{
    // 绘图图像
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];

    [image drawInRect:rect];
    
}
@end
