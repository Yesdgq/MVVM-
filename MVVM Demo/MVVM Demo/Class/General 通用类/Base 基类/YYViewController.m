//
//  YYViewController.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/27.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYViewController.h"

@interface YYViewController ()

@end

@implementation YYViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    YYViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    // 常用方法绑定到基类 方便调用
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(viewController)
        [viewController yy_addSubviews];
        [viewController yy_bindViewModel];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(viewController)
        [viewController yy_layoutNavigation];
        [viewController yy_getNewData];
    }];
    
    return viewController;
}

// 使用VM配置初始化VC
- (instancetype)initWithViewModel:(id<YYViewModelProtocol>)viewModle {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - RAC

/**
 *  添加控件
 */
- (void)yy_addSubviews {}

/**
 *  绑定
 */
- (void)yy_bindViewModel {}

/**
 *  设置navation
 */
- (void)yy_layoutNavigation {}

/**
 *  初次获取数据
 */
- (void)yy_getNewData {}

@end
