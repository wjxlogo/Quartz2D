//
//  ScreenCaptureViewController.m
//  LTQuartz2D演练
//
//  Created by WJX on 16/7/13.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ScreenCaptureViewController.h"
#import "UIImage+LTImage.h"
@implementation ScreenCaptureViewController
- (void)viewDidLoad{
    [super viewDidLoad ];
    // 生成一张新的图片

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];

    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imageView];


    UIImage *image =  [UIImage imageWithCaputureView:self.view];

    // image转data
    // compressionQuality： 图片质量 1:最高质量

//    NSData *data = UIImageJPEGRepresentation(image,1);
//    NSString *str  =  @"路径";
//    [data writeToFile:str atomically:YES];
    [self saveImageToPhotos:image];


}
- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}
// 指定回调方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
