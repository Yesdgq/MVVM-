//
//  SecondHomePageViewModel.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/10/12.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "SecondHomePageViewModel.h"

@implementation SecondHomePageViewModel

+ (NSMutableArray <SecondHomePageViewModel *>*)loadData:(NSArray *)data{
    NSMutableArray <SecondHomePageViewModel *>*result = @[].mutableCopy;
    for (NSDictionary *dict in data) {
        SecondHomePageViewModel *model = [SecondHomePageViewModel yy_modelWithJSON:dict];
        
        [result addObject:model];
    }
    return result;
}

@end
