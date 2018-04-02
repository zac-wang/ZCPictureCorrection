//
//  PictureCorrectionProcessVC.m
//  PictureCorrectionDemo
//
//  Created by 王志超 on 2018/1/15.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "PictureCorrectionProcessVC.h"

@interface PictureCorrectionProcessVC ()

@end

@implementation PictureCorrectionProcessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:76/255.0 alpha:1];
}

- (void)zc_initialView {
    [self setupEditor];
    
    [self setupToolbar];
}

#pragma mark 初始化样式控件
#define ImageWidth 57.0
#define ImageHeight 60
#define ImageCount 4.0
- (void)setupEditor
{
    UIView *editorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - (54 + ImageHeight), self.view.bounds.size.width, ImageHeight)];
    [self.view addSubview:editorView];
    
//    UIImageView *editorViewBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 31, self.view.bounds.size.width, 29)];
//    [editorViewBackground setImage:ZCPictureCorrectionImage(@"f-setting-tray")];
//    [editorView addSubview:editorViewBackground];
    
    float width = self.view.frame.size.width/ImageCount;
    float gap = (width - ImageWidth)/2;
    for(int i = 0; i < ImageCount; i++) {
        UIButton *settingIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [settingIcon setFrame:CGRectMake(width*i + gap, 0, ImageWidth, 58)];
        UIImage *image = [self zc_adjustPreviewImage:i imageFrameEdited:self.zc_imageFrameEdited sourceImage:self.zc_sourceImage];
        [settingIcon setBackgroundImage:image forState:UIControlStateNormal];
//        [settingIcon setBackgroundImage:ZCPictureCorrectionImage(activeImageName) forState:UIControlStateHighlighted];
        [settingIcon setTag:i];
        [settingIcon addTarget:self action:@selector(filterChanged:withEvent:) forControlEvents:UIControlEventTouchUpInside];
        [editorView addSubview:settingIcon];
    }
}

#pragma mark 初始化按钮控件
- (void)setupToolbar {
    UIToolbar *finishToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 54, self.view.bounds.size.width, 54)];
    [finishToolBar setBackgroundColor:[UIColor whiteColor]];
    
    if (@available(iOS 11.0, *)) {
        UIBarButtonItem *undoButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"picture_correction_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popCurrentViewController)];
        
        UIBarButtonItem *rotateButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"picture_correction_orientation"] style:UIBarButtonItemStylePlain target:self action:@selector(zc_rotateImageClick:)];
        
        UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"picture_correction_ok"] style:UIBarButtonItemStylePlain target:self action:@selector(zc_comfirmFinishedImageClick)];
        
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        [fixedSpace setWidth:10.0f];
        
        [finishToolBar setItems:@[fixedSpace,undoButton,flexibleSpace,rotateButton,flexibleSpace,confirmButton,fixedSpace]];
    } else {
        // Fallback on earlier versions
    }
    
    [self.view addSubview:finishToolBar];
}

- (void)zc_rotateImageClick:(UIBarButtonItem *)item {
    UIImage *image = self.zc_adjustedImage;
    switch (image.imageOrientation) {
        case UIImageOrientationRight:
            self.zc_adjustedImage = [[UIImage alloc] initWithCGImage:image.CGImage scale: 1.0 orientation: UIImageOrientationUp];
            break;
        case UIImageOrientationUp:
            self.zc_adjustedImage = [[UIImage alloc] initWithCGImage:image.CGImage scale: 1.0 orientation: UIImageOrientationLeft];
            break;
        case UIImageOrientationLeft:
            self.zc_adjustedImage = [[UIImage alloc] initWithCGImage:image.CGImage scale: 1.0 orientation:UIImageOrientationDown];
            break;
        case UIImageOrientationDown:
            self.zc_adjustedImage = [[UIImage alloc] initWithCGImage:image.CGImage scale: 1.0 orientation: UIImageOrientationRight];
            break;
        default:
            break;
    }
    self.zc_finalImageView.image = self.zc_adjustedImage;
}

- (void)popCurrentViewController {
    if(self.navigationController) {
        [self.navigationController popViewControllerAnimated:NO];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)zc_comfirmFinishedImageClick {
    if(self.zc_comfirmFinishedImage)
        self.zc_comfirmFinishedImage(self.zc_adjustedImage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
