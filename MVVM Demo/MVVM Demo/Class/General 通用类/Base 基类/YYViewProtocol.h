//
//  YYViewProtocol.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/27.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YYViewModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YYViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <YYViewModelProtocol>)viewModel;

- (void)yy_bindViewModel;
- (void)yy_setupViews;
- (void)yy_aaddReturnKeyBoard;

@end

NS_ASSUME_NONNULL_END
