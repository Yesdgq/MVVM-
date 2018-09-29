//
//  HomePageViewController.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "HomePageViewController.h"
#import "CircleListView.h"
#import "CircleListViewModel.h"
#import "CircleCellViewModel.h"

@interface HomePageViewController ()

@property (nonatomic, strong) CircleListView *mainView;
@property (nonatomic, strong) CircleListViewModel *viewModel;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:.9 alpha:1.f];
}

#pragma mark - system

- (void)updateViewConstraints {
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}

#pragma mark - private

- (void)yy_addSubviews {
    [self.view addSubview:self.mainView];
}

- (void)yy_bindViewModel {
    @weakify(self)
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(CircleCellViewModel *cellViewModel) {
       @strongify(self)
        YYViewController *vc = [[YYViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)yy_layoutNavigation {
    self.title = @"圈子列表";
}


#pragma mark - getter

- (CircleListView *)mainView {
    if (!_mainView) {
        _mainView = [[CircleListView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

- (CircleListViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[CircleListViewModel alloc] init];
    }
    return _viewModel;
}



@end
