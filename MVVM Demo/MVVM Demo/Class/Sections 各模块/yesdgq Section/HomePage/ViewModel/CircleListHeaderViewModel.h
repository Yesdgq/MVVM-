//
//  CircleListHeaderViewModel.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CircleListHeaderViewModel : YYViewModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) RACSubject *refreshUISubject;
@property (nonatomic, strong) RACSubject *cellClickSubject;

@end

NS_ASSUME_NONNULL_END
