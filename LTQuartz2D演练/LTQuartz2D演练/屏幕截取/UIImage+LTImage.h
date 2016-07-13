//
//  UIImage+LTImage.h
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/13.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LTImage)
// 圆形裁剪
+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;

// 控件截屏
+ (UIImage *)imageWithCaputureView:(UIView *)view;

@end
