//
//  CircleListHeaderViewModel.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "CircleListHeaderViewModel.h"

@implementation CircleListHeaderViewModel

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}

- (RACSubject *)refreshUISubject {
    if (!_refreshUISubject) {
        _refreshUISubject = [RACSubject subject];
    }
    return _refreshUISubject;
}

- (RACSubject *)cellClickSubject {
    if (!_cellClickSubject) {
        _cellClickSubject = [RACSubject subject];
    }
    return _cellClickSubject;
}



@end
