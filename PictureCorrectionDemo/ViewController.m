//
//  ViewController.m
//  PictureCorrectionDemo
//
//  Created by 王志超 on 2018/1/3.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ViewController.h"
#import <ZCEasyLibrary/ZCSelectImagePicker.h>
#import "PictureCorrectionCutVC.h"

@interface ViewController ()  {
    ZCSelectImagePicker *select;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)initButton:(id)sender {
    [self.navigationController setNavigationBarHidden:YES];
    
    select = [[ZCSelectImagePicker alloc] init];
    __weak typeof(self)weakSelf = self;
    select.zc_selectPickerController = ^(UIImage *image) {
        [weakSelf transitionToZCPictureCorrectionPictureVC:image];
    };
    [select zc_showWithViewController:self push:NO];
}

- (void)transitionToZCPictureCorrectionPictureVC:(UIImage *)image
{
    PictureCorrectionCutVC *adjustViewController = [[PictureCorrectionCutVC alloc] init];
    adjustViewController.zc_sourceImage = image;
    adjustViewController.zc_comfirmFinishedImage = ^(UIImage *image) {
        self.imageView.image = image;
        [self.navigationController popToRootViewControllerAnimated:YES];
    };
    
    [self.navigationController pushViewController:adjustViewController animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
