//
//  YYTableViewCellProtocol.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YYTableViewCellProtocol <NSObject>

@optional

- (void)yy_setupViews;
- (void)yy_bindViewModel;

@end

NS_ASSUME_NONNULL_END
