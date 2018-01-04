//
//  ZCPictureCorrectionCutVC.h
//  ZCPictureCorrection
//
//  Created by 王志超 on 2018/1/2.
//  Copyright © 2018年 王志超. All rights reserved.
//

//Dedected Points

#import <UIKit/UIKit.h>


@interface ZCPictureCorrectionCutVC : UIViewController
{
    BOOL isGray;
}

@property (strong, nonatomic) UIImage *sourceImage;
@property (strong, nonatomic) UIImage *adjustedImage;
@property (readonly, nonatomic) UIImageView *sourceImageView;

/// 初始化按钮及事件
- (void)zc_initialView;
/// 重置选择区域
- (void)zc_resetRectFrame;
/// 获取 ”当前选中区域“ 的图片
- (UIImage *)zc_confirmedImage;

@property(nonatomic, copy) void(^zc_comfirmFinishedImage)(UIImage *image);

@end
