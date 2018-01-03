//
//  ZCPictureCorrectionProcessVC.h
//  ZCPictureCorrection
//
//  Created by 王志超 on 2018/1/2.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPictureCorrectionProcessVC : UIViewController <UIScrollViewDelegate>

@property BOOL imageFrameEdited;

@property (strong, nonatomic) UIImage *sourceImage;
@property (strong, nonatomic) UIImage *adjustedImage;

@property (strong, nonatomic) UIImageView *finalImageView;

/// 处理图片效果类型 [0-3]
- (void)zc_adjustPreviewImage:(int)currentlySelected completion:(void(^)(UIImage *image))completion;

/// 环形进度条
@property (strong, nonatomic) UIActivityIndicatorView *progressIndicator;

/// 初始化按钮及事件
- (void)zc_initialView;
/// 旋转图片
- (void)zc_rotateImage;
/// 确定选择图片
- (void)zc_comfirmFinishedImageClick;

@property(nonatomic, copy) void(^zc_comfirmFinishedImage)(UIImage *image);

@end
