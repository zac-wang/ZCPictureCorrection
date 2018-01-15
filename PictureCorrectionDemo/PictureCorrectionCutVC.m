//
//  PictureCorrectionCutVC.m
//  PictureCorrectionDemo
//
//  Created by 王志超 on 2018/1/15.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "PictureCorrectionCutVC.h"
#import "PictureCorrectionProcessVC.h"

@interface PictureCorrectionCutVC ()

@end

@implementation PictureCorrectionCutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:76/255.0 alpha:1];
    
    self.zc_adjustRectMaskView.zc_fillColor = [UIColor colorWithWhite:0 alpha:0.6];
    self.zc_adjustRectMaskView.zc_strokeColor = [UIColor whiteColor];
    [self.zc_adjustRectMaskView setNeedsDisplay];
}

- (void)zc_initialView {
    float topY = self.zc_sourceImageView.frame.origin.y+self.zc_sourceImageView.frame.size.height;
    float height = self.view.bounds.size.height - topY;
    UIToolbar *adjustToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, topY, self.view.bounds.size.width, height)];
    [adjustToolBar setBackgroundColor:[UIColor whiteColor]];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"picture_correction_cancel"] style:UIBarButtonItemStylePlain target:self action:@selector(popCurrentViewController)];
    
    UIBarButtonItem *undoButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"picture_correction_reset"] style:UIBarButtonItemStylePlain target:self action:@selector(zc_resetRectFrame)];
    
    UIBarButtonItem *confirmButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"picture_correction_ok"] style:UIBarButtonItemStylePlain target:self action:@selector(zc_confirmedImageClick)];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpace setWidth:10.0f];
    
    [adjustToolBar setItems:[NSArray arrayWithObjects:fixedSpace,cancelButton,flexibleSpace,undoButton,flexibleSpace,confirmButton,fixedSpace, nil]];
    
    [self.view addSubview:adjustToolBar];
}

- (void)popCurrentViewController {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)zc_confirmedImageClick {
    
    PictureCorrectionProcessVC *finalView = [[PictureCorrectionProcessVC alloc] init];
    finalView.zc_sourceImage = [self zc_confirmedImage];
    finalView.zc_imageFrameEdited = [self.zc_adjustRectMaskView zc_frameEdited];
    finalView.zc_comfirmFinishedImage = self.zc_comfirmFinishedImage;
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.4;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    if(self.navigationController) {
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:finalView animated:NO];
    }else{
        [self.view.layer addAnimation:transition forKey:kCATransition];
        [self presentViewController:finalView animated:NO completion:nil];
    }
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
