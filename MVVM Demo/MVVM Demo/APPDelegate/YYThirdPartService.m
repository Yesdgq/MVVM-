//
//  YYThirdPartService.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYThirdPartService.h"

@implementation YYThirdPartService

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [[self class] initCoredata];
        
        [[self class] setKeyBord];
        
        [[self class] testReachableStaus];
        
    });
}

#pragma mark - 初始化coredata

+ (void)initCoredata {
    
}

#pragma mark - 键盘回收相关

+ (void)setKeyBord {
 
}

#pragma mark － 检测网络相关

+ (void)testReachableStaus {
    
}


@end
