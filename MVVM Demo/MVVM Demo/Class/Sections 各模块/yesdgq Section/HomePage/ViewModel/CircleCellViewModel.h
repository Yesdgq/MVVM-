//
//  CircleCellViewModel.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CircleCellViewModel : YYViewModel

@property (nonatomic, copy) NSString *headerImageStr;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *articleNum;
@property (nonatomic, copy) NSString *peopleNum;
@property (nonatomic, copy) NSString *topicNum;
@property (nonatomic, copy) NSString *content;

@end

NS_ASSUME_NONNULL_END
