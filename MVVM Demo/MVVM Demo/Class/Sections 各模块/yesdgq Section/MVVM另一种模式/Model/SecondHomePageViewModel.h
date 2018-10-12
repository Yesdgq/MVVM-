//
//  SecondHomePageViewModel.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/10/12.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondHomePageViewModel : NSObject

@property (nonatomic, copy) NSString *contentText;
@property (nonatomic, copy) NSString *detailText;
@property (nonatomic, copy) NSString *imageName;

// 假数据
+ (NSMutableArray <SecondHomePageViewModel *>*)loadData:(NSArray *)data;

@end

/*
 Model的职责:原始数据的解析以及包装
 */

NS_ASSUME_NONNULL_END
