//
//  YYViewModel.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/27.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYViewModel.h"

@implementation YYViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    YYViewModel *viewModel = [super allocWithZone:zone];
    if (viewModel) {
        [viewModel yy_initialize];
    }
    return viewModel;
}

// 用Model初始化VM
- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
        
    }
    return self;
}

// 做一些数据绑定 网络回调处理
- (void)yy_initialize {}



@end
