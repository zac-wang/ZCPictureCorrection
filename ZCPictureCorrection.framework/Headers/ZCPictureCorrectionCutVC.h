//
//  ZCPictureCorrectionCutVC.h
//  ZCPictureCorrection
//
//  Created by 王志超 on 2018/1/2.
//  Copyright © 2018年 王志超. All rights reserved.
//

//Dedected Points

#import <UIKit/UIKit.h>
#import "ZCPictureCorrectionMaskView.h"


@interface ZCPictureCorrectionCutVC : UIViewController
{
    BOOL isGray;
}

@property (strong, nonatomic) UIImage *zc_sourceImage;
@property (strong, nonatomic) UIImage *zc_adjustedImage;

@property (readonly, nonatomic) UIImageView *zc_sourceImageView;
@property (strong, nonatomic) ZCPictureCorrectionMaskView *zc_adjustRectMaskView;

/// 初始化按钮及事件
- (void)zc_initialView;
/// 重置选择区域
- (void)zc_resetRectFrame;
/// 获取 ”当前选中区域“ 的图片
- (UIImage *)zc_confirmedImage;
/// 确定区域选择
- (void)zc_confirmedImageClick;

@property(nonatomic, copy) void(^zc_comfirmFinishedImage)(UIImage *image);

@end
