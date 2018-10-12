//
//  SecondHomePageViewModel.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/10/12.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondHomePageViewViewModel : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSString *textString;

- (void)testSendEventAction;
// 数据请求到了
- (void)requestData:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
