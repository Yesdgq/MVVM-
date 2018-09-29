//
//  CircleListView.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "CircleListView.h"
#import "CircleListViewModel.h"
#import "CircleListHeaderView.h"
#import "CircleListSectionHeaderView.h"
#import "HomePageTableCell.h"

@interface CircleListView () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) CircleListViewModel *viewModel;
@property (strong, nonatomic) UITableView *mainTableView;
@property (strong, nonatomic) CircleListHeaderView *listHeaderView;
@property (strong, nonatomic) CircleListSectionHeaderView *sectionHeaderView;

@end

@implementation CircleListView



- (instancetype)initWithViewModel:(id<YYViewModelProtocol>)viewModel {
    self.viewModel = (CircleListViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

#pragma mark - system

- (void)updateConstraints {
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [super updateConstraints];
}


#pragma mark - private

- (void)yy_setupViews {
    [self addSubview:self.mainTableView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)yy_bindViewModel {
    
    [self.viewModel.refreshDataCommand execute:nil];
    
    @weakify(self)
    [self.viewModel.refreshUI subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.mainTableView reloadData];
    }];
    
    [self.viewModel.refreshEndSubject subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.mainTableView reloadData];
        
        switch ([x integerValue]) {
                
            case YYHeaderRefresh_HasMoreData:{
                
                [self.mainTableView.mj_header endRefreshing];
                if (self.mainTableView.mj_footer == nil) {
                    self.mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                        @strongify(self);
                        [self.viewModel.nextPageCommand execute:nil];
                    }];
                }
                
            }
                break;
                
            case YYHeaderRefresh_HasNoMoreData:{
                [self.mainTableView.mj_header endRefreshing];
                self.mainTableView.mj_footer = nil;
            }
                break;
                
            case YYFooterRefresh_HasMoreData: {
                
                [self.mainTableView.mj_header endRefreshing];
                [self.mainTableView.mj_footer resetNoMoreData];
                [self.mainTableView.mj_footer endRefreshing];
            }
                break;
                
            case YYFooterRefresh_HasNoMoreData: {
                [self.mainTableView.mj_header endRefreshing];
                [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
            }
                break;
                
            case YYRefreshError: {
                
                [self.mainTableView.mj_footer endRefreshing];
                [self.mainTableView.mj_header endRefreshing];
            }
                break;
                
            default:
                break;
        }
    }];
}

#pragma mark - getter

- (CircleListViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[CircleListViewModel alloc] init];
    }
    return _viewModel;
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = self.listHeaderView;
        
        [_mainTableView registerClass:[HomePageTableCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([HomePageTableCell class])]];
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.viewModel.refreshDataCommand execute:nil];
        }];
        _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.viewModel.nextPageCommand execute:nil];
        }];
    }
    return _mainTableView;
}

- (CircleListHeaderView *)listHeaderView {
    if (!_listHeaderView) {
        _listHeaderView = [[CircleListHeaderView alloc] initWithViewModel:self.viewModel.listHeaderViewModel];
        _listHeaderView.frame = CGRectMake(0, 0, self.frame.size.width, 160);
    }
    return _listHeaderView;
}

- (CircleListSectionHeaderView *)sectionHeaderView {
    if (!_sectionHeaderView) {
        _sectionHeaderView = [[CircleListSectionHeaderView alloc] initWithViewModel:self.viewModel.sectionHeaderViewModel];
    }
    return _sectionHeaderView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomePageTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([HomePageTableCell class])] forIndexPath:indexPath];
    
    if (self.viewModel.dataArray.count > indexPath.row) {
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.viewModel.cellClickSubject sendNext:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 45;
}




@end
