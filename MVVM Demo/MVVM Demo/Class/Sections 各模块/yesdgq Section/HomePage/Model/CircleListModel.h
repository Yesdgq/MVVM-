//
//  CircleListModel.h
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleListModel : NSObject

@property (nonatomic, copy) NSString *idStr;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *memberCount;

@property (nonatomic, copy) NSString *topicCount;

@end

NS_ASSUME_NONNULL_END
