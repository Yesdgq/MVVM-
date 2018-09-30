//
//  CircleListViewMode.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "CircleListViewModel.h"
#import "CircleCellViewModel.h"

@interface CircleListViewModel ()

@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation CircleListViewModel

- (void)yy_initialize {
    
    @weakify(self)
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        NSMutableArray *alArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 8; i++) {
            CircleCellViewModel *cellViewModel = [[CircleCellViewModel alloc] init];
            cellViewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            cellViewModel.name = @"财税培训圈子";
            [alArray addObject:cellViewModel];
        }
        self.listHeaderViewModel.dataArray = alArray;

        NSMutableArray *reArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 8; i++) {
            CircleCellViewModel *cellViewModel = [[CircleCellViewModel alloc] init];
            cellViewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            cellViewModel.name = @"财税培训圈子";
            cellViewModel.articleNum = @"1568";
            cellViewModel.peopleNum = @"568";
            cellViewModel.topicNum = @"5749";
            cellViewModel.content = @"自己交保险是不是只能交养老和医疗，费用是多少?";
            [reArray addObject:cellViewModel];
        }
        self.dataArray = reArray;
        
        [self.listHeaderViewModel.refreshUISubject sendNext:nil];
        [self.refreshEndSubject sendNext:@(2)];
        DismissHud();
    }];
    
    [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x isEqualToNumber:@(YES)]) {
            ShowMaskStatus(@"正在加载");
        }
    }];
    
    [self.nextPageCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary  *dict) {
        @strongify(self)
        NSMutableArray *reArray = [[NSMutableArray alloc] initWithArray:self.dataArray];
        for (int i = 0; i < 8; i++) {
            CircleCellViewModel *cellViewModel = [[CircleCellViewModel alloc] init];
            cellViewModel.name = @"越野圈子";
            cellViewModel.articleNum = @"1568";
            cellViewModel.peopleNum = @"568";
            cellViewModel.topicNum = @"5749";
            cellViewModel.content = @"自己交保险是不是只能交养老和医疗，费用是多少?";
            [reArray addObject:cellViewModel];
        }
        self.dataArray = reArray;
        [self.refreshEndSubject sendNext:@(1)];
        DismissHud();
        
    }];
}

#pragma mark - getter

- (RACSubject *)refreshUI {
    if (!_refreshUI) {
        _refreshUI = [RACSubject subject];
    }
    return _refreshUI;
}

- (RACSubject *)refreshEndSubject {
    if (!_refreshEndSubject) {
        _refreshEndSubject = [RACSubject subject];
    }
    return _refreshEndSubject;
}

- (RACCommand *)refreshDataCommand {
    if (!_refreshDataCommand) {
        @weakify(self)
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            @strongify(self)
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                @strongify(self)
                self.currentPage = 1;
                
                // 网络请求
                
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _refreshDataCommand;
}

- (RACCommand *)nextPageCommand {
    if (!_nextPageCommand) {
        @weakify(self)
        _nextPageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            @strongify(self)
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                @strongify(self)
                self.currentPage++;
                
                // 网络请求
                
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _nextPageCommand;
}

- (CircleListHeaderViewModel *)listHeaderViewModel {
    if (!_listHeaderViewModel) {
        _listHeaderViewModel = [[CircleListHeaderViewModel alloc] init];
        _listHeaderViewModel.title = @"已加入的圈子";
        _listHeaderViewModel.cellClickSubject = self.cellClickSubject;
    }
    return _listHeaderViewModel;
}

- (CircleListSectionHeaderViewModel *)sectionHeaderViewModel {
    if (!_sectionHeaderViewModel) {
        _sectionHeaderViewModel = [[CircleListSectionHeaderViewModel alloc] init];
        _sectionHeaderViewModel.title = @"推荐圈子";
    }
    return _sectionHeaderViewModel;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}

- (RACSubject *)cellClickSubject {
    if (!_cellClickSubject) {
        _cellClickSubject = [RACSubject subject];
    }
    return _cellClickSubject;
}

@end
