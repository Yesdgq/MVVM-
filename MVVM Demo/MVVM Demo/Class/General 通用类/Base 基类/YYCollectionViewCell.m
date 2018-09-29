//
//  YYCollectionViewCell.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/29.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "YYCollectionViewCell.h"

@implementation YYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self yy_setupViews];
    }
    return self;
}

- (void)yy_setupViews {}

@end
