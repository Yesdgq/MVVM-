//
//  YYView.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/27.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYView.h"
#import "AppDelegate.h"

@implementation YYView

- (instancetype)init {
    self = [super init];
    if (self) {
        // 一些必用函数写在基类里
        [self yy_setupViews];
        [self yy_bindViewModel];
    }
    return self;
}

// 用VM配置初始化View
- (instancetype)initWithViewModel:(id<YYViewModelProtocol>)viewModel {
    self = [super init];
    if (self) {
        [self yy_setupViews];
        [self yy_bindViewModel];
    }
    return self;
}

- (void)yy_bindViewModel {}

- (void)yy_setupViews{}

- (void)yy_aaddReturnKeyBoard {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
