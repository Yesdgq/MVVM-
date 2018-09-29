//
//  CircleListSectionHeaderView.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/29.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "CircleListSectionHeaderView.h"
#import "CircleListSectionHeaderViewModel.h"

@interface CircleListSectionHeaderView ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) CircleListSectionHeaderViewModel *viewModel;

@end

@implementation CircleListSectionHeaderView

- (instancetype)initWithViewModel:(id<YYViewModelProtocol>)viewModel {
    self.viewModel = (CircleListSectionHeaderViewModel *)viewModel;
    
    return [super initWithViewModel:viewModel];
}

- (void)yy_setupViews {
    [self addSubview:self.bgImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineImageView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}

- (void)updateConstraints {
//    CGFloat paddingEdge = 10;
//
//    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
//
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.left.equalTo(@(paddingEdge));
//        make.right.equalTo(@(-paddingEdge));
//        make.height.equalTo(@(20));
//    }];
//
//    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self);
//        make.height.equalTo(@(1.0));
//    }];
//
    [super updateConstraints];
}

- (void)yy_bindViewModel {
    RAC(self.titleLabel, text) = [[RACObserve(self, viewModel.title) distinctUntilChanged] takeUntil:self.rac_willDeallocSignal];
}

#pragma mark - getter

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor whiteColor];
    }
    
    return _bgImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
//        _titleLabel.textColor = MAIN_BLACK_TEXT_COLOR;
    }
    
    return _titleLabel;
}

- (UIImageView *)lineImageView {
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = [UIColor grayColor];
    }
    
    return _lineImageView;
}

@end
