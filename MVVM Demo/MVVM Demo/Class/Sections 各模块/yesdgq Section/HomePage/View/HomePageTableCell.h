//
//  HomePageTableCell.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/29.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYTableViewCell.h"
#import "CircleCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageTableCell : YYTableViewCell

@property (nonatomic, strong) CircleCellViewModel *viewModel;


@end

NS_ASSUME_NONNULL_END
