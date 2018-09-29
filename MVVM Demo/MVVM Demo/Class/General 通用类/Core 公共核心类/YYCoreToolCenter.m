//
//  YYCoreToolCenter.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYCoreToolCenter.h"
#import <SVProgressHUD.h>

@implementation YYCoreToolCenter

+ (void)load {
    [SVProgressHUD setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:1.f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    //[SVProgressHUD setInfoImage:nil];
}

void ShowSuccessStatus(NSString *statues) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:statues];
        });
    } else {
        [SVProgressHUD showSuccessWithStatus:statues];
    }
}


void ShowMessage(NSString *statues) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showInfoWithStatus:statues];
        });
    }else{
        [SVProgressHUD showInfoWithStatus:statues];
    }
}

void ShowErrorStatus(NSString *statues) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showErrorWithStatus:statues];
            [SVProgressHUD showProgress:0.5 status:@"上传" maskType:SVProgressHUDMaskTypeGradient];
        });
    }else{
        [SVProgressHUD showErrorWithStatus:statues];
    }
}


void ShowMaskStatus(NSString *statues) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showWithStatus:statues maskType:SVProgressHUDMaskTypeGradient];
        });
    }else{
        [SVProgressHUD showWithStatus:statues maskType:SVProgressHUDMaskTypeGradient];
    }
}

void ShowProgress(CGFloat progress) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showProgress:progress maskType:SVProgressHUDMaskTypeGradient];
        });
    } else {
        [SVProgressHUD showProgress:progress maskType:SVProgressHUDMaskTypeGradient];
    }
}

void DismissHud(void) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }else{
        [SVProgressHUD dismiss];
    }
}

@end
