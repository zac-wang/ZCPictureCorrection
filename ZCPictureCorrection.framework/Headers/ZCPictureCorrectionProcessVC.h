//
//  ZCPictureCorrectionProcessVC.h
//  ZCPictureCorrection
//
//  Created by 王志超 on 2018/1/2.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPictureCorrectionProcessVC : UIViewController <UIScrollViewDelegate>

@property BOOL zc_imageFrameEdited;

@property (strong, nonatomic) UIImage *zc_sourceImage;
@property (strong, nonatomic) UIImage *zc_adjustedImage;

@property (strong, nonatomic) UIImageView *zc_finalImageView;


/// 环形进度条
@property (strong, nonatomic) UIActivityIndicatorView *zc_progressIndicator;

/// 初始化按钮及事件
- (void)zc_initialView;
/// 旋转图片
- (UIImage *)zc_rotateImageWithImage:(UIImage *)image;
/// 处理图片效果类型 [0-3]
- (UIImage *)zc_adjustPreviewImage:(int)type imageFrameEdited:(BOOL)edited sourceImage:(UIImage *)image;

@property(nonatomic, copy) void(^zc_comfirmFinishedImage)(UIImage *image);

@end
