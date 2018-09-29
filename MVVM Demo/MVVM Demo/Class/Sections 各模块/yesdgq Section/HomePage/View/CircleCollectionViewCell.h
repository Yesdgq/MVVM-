//
//  CircleCollectionViewCell.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/29.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYCollectionViewCell.h"
#import "CircleCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CircleCollectionViewCell : YYCollectionViewCell

@property (nonatomic, strong) CircleCellViewModel *viewModel;

/**
 *  加入新圈子
 */
@property (nonatomic, strong) NSString *type;

@end

NS_ASSUME_NONNULL_END
