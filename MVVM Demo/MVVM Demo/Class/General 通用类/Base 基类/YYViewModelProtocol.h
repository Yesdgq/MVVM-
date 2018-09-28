//
//  YYViewModelProtocol.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/27.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YYViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;

/**
 *  初始化
 */
- (void)yy_initialize;

@end

NS_ASSUME_NONNULL_END
