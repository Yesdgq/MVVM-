//
//  YYViewControllerProtocol.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/27.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YYViewModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol YYViewControllerProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <YYViewModelProtocol>)viewModle;

- (void)yy_bindViewModel;
- (void)yy_addSubviews;
- (void)yy_layoutNavigation;
- (void)yy_getNewData;
- (void)recoverKeyboard;

@end

NS_ASSUME_NONNULL_END
