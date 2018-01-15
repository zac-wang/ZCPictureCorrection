//
//  ZCPictureCorrectionMaskView.h
//  ZCPictureCorrection
//
//  Created by 王志超 on 2018/1/2.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

//            cd
//  d   -------------   c
//     |             |
//     |             |
//  da |             |  bc 
//     |             |
//     |             |
//     |             |
//  a   -------------   b
//            ab
//
// a = 1, b = 2, c = 3, d = 4

/// 选择切割区域蒙版
@interface ZCPictureCorrectionMaskView : UIView
{
    CGPoint touchOffset;
    CGPoint a;
    CGPoint b;
    CGPoint c;
    CGPoint d;
    
    BOOL frameMoved;
}

@property (strong, nonatomic) UIButton *zc_pointD;
@property (strong, nonatomic) UIButton *zc_pointC;
@property (strong, nonatomic) UIButton *zc_pointB;
@property (strong, nonatomic) UIButton *zc_pointA;

@property (strong, nonatomic) UIColor  *zc_fillColor;
@property (strong, nonatomic) UIColor  *zc_strokeColor;

@property (readonly, nonatomic) BOOL zc_frameEdited;
- (void)zc_resetFrame;
- (CGPoint)zc_coordinatesForPoint: (int)point withScaleFactor: (CGFloat)scaleFactor;

- (void)zc_bottomLeftCornerToCGPoint: (CGPoint)point;
- (void)zc_bottomRightCornerToCGPoint: (CGPoint)point;
- (void)zc_topRightCornerToCGPoint: (CGPoint)point;
- (void)zc_topLeftCornerToCGPoint: (CGPoint)point;

@end
