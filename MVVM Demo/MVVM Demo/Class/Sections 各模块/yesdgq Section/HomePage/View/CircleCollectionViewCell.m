//
//  CircleCollectionViewCell.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/29.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "CircleCollectionViewCell.h"

@interface CircleCollectionViewCell ()

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end


@implementation CircleCollectionViewCell

- (void)yy_setupViews {
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints {
    CGFloat paddingEdge = 10;
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@(80));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImageView.mas_bottom).offset(paddingEdge);
        make.height.equalTo(@(15));
        make.left.right.equalTo(self.headerImageView);
    }];
    
    [super updateConstraints];
}

#pragma mark - setter

- (void)setViewModel:(CircleCellViewModel *)viewModel {
    if (viewModel) {
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.headerImageStr] placeholderImage:[UIImage imageNamed:@"quanzi"]];
        self.nameLabel.text = viewModel.name;
        
        _viewModel = viewModel;
    }
}

- (void)setType:(NSString *)type {
    self.headerImageView.image = [UIImage imageNamed:@"xiaokule"];
    self.nameLabel.text = @"加入新圈子";
}

#pragma mark - getter

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
    }
    return _headerImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}


@end
