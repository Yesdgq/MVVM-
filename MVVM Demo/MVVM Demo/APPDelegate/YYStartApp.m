//
//  YYStartApp.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/28.
//  Copyright © 2018年 yesdgq. All rights reserved.
//  当类对象被引入项目时, runtime 会向每一个类对象发送 load 消息. load 方法还是非常的神奇的, 因为它会在每一个类甚至分类被引入时仅调用一次, 调用的顺序是父类优先于子类, 子类优先于分类. 而且 load 方法不会被类自动继承, 每一个类中的 load 方法都不需要像 viewDidLoad 方法一样调用父类的方法


#import "YYStartApp.h"

@implementation YYStartApp

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [[self class] initPersonData];
        
    });
}

#pragma mark - 初始化个人数据

+ (void)initPersonData {
    
}

@end
