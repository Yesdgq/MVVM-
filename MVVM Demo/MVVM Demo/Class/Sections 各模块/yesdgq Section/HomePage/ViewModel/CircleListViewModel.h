//
//  CircleListViewMode.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYViewModel.h"
#import "CircleListHeaderViewModel.h"
#import "CircleListSectionHeaderViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CircleListViewModel : YYViewModel

@property (nonatomic, strong) RACSubject *refreshEndSubject;
@property (nonatomic, strong) RACSubject *refreshUI;
@property (nonatomic, strong) RACCommand *refreshDataCommand;
@property (nonatomic, strong) RACCommand *nextPageCommand;

@property (nonatomic, strong) CircleListHeaderViewModel *listHeaderViewModel;
@property (nonatomic, strong) CircleListSectionHeaderViewModel *sectionHeaderViewModel;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) RACSubject *cellClickSubject;


@end

NS_ASSUME_NONNULL_END
