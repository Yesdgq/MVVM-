//
//  SecondHomePageView.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/30.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "SecondHomePageView.h"
#import "ReactiveObjC/ReactiveObjC.h"

@interface SecondHomePageView ()

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) UIView *testView;

@property (nonatomic,strong) NSString *testString;

@end

@implementation SecondHomePageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mainTableView];
        [self addSubview:self.testButton];
        [self addSubview:self.testView];
        @weakify(self);

        [RACObserve(self, testString) subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            NSLog(@"---事件流已经由VM传递到了V中,进行展示数据");
            UILabel *label = (UILabel *)[self.testView viewWithTag:677];
            label.text = x;
        }];
    }
    return self;
}

#pragma mark - getter

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, self.frame.size.height-60) style:UITableViewStyleGrouped];
        _mainTableView.sectionHeaderHeight= CGFLOAT_MIN;
        _mainTableView.sectionFooterHeight= CGFLOAT_MIN;
        _mainTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, CGFLOAT_MIN)];
        _mainTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, CGFLOAT_MIN)];
        _mainTableView.allowsSelection = YES;
        _mainTableView.allowsMultipleSelection=YES;
        _mainTableView.allowsSelectionDuringEditing = YES;
        _mainTableView.allowsMultipleSelectionDuringEditing=YES;
        if ([_mainTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_mainTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
        }
        if ([_mainTableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_mainTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
        }
    }
    return _mainTableView;
}

- (UIButton *)testButton {
    if (!_testButton) {
        _testButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, self.frame.size.width/2, 40)];
        [_testButton setTitle:@"点击事件流向 V->VM" forState:UIControlStateNormal];
        [_testButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _testButton.backgroundColor = [UIColor brownColor];
        [_testButton addTarget:self action:@selector(HomePageViewTestEventActionFlow) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}

- (UIView *)testView {
    if (!_testView) {
        _testView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2, 10, self.frame.size.width/2, 40)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, 40)];
        label.tag = 677;
        label.textAlignment=NSTextAlignmentCenter;
        label.backgroundColor = [UIColor orangeColor];
        [_testView addSubview:label];
    }
    return _testView;
}

@end
