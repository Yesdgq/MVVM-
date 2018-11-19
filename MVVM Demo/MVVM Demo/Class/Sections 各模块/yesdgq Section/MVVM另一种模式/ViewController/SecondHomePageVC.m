//
//  SecondHomePageVC.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/30.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "SecondHomePageVC.h"
#import "SecondHomePageView.h"
#import "SecondHomePageViewViewModel.h"


#define KNavHeight  64
#define KTabbarHeight  49

@interface SecondHomePageVC ()

@property (nonatomic, strong) SecondHomePageView *mainView;
@property (nonatomic, strong) SecondHomePageViewViewModel *viewModel;



@end

@implementation SecondHomePageVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mainView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonItemClickAction)];
    
    [self eventFlowDirection];
    
    @weakify(self);
    // 请求数据 展示业务
    [self .viewModel requestData:^{
        @strongify(self);
        [self.mainView.mainTableView reloadData];
    }];
    
}


#pragma mark - custom method

- (void)rightBarButtonItemClickAction {
    NSLog(@"这个事件流需要分发向view传递,或者向view和viewModel传递,或者只向viewModel传递");
}

- (void)eventFlowDirection {
   
    RAC(self.mainView, testString) = RACObserve(self.viewModel, textString);
    
    @weakify(self);
    [[self.mainView rac_signalForSelector:@selector(HomePageViewTestEventActionFlow) fromProtocol:@protocol(HomePageViewDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self);
        [self.viewModel testSendEventAction];
    }];
    
    
    // 转换事件,事件流导向(push present)
    [[self.viewModel rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
        
        RACTupleUnpack(UITableView *tableView, NSIndexPath *indexPath) = x;
        
        if (tableView.editing) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"点击Cell-->%ld", (long)indexPath.row);
            
            switch (indexPath.row) {
                case 0:
                    {
                        
                    }
                    break;
                    
                default:
                    break;
            }
        });
        
    }];
    
    
}


#pragma mark - getters and setters

- (SecondHomePageView *)mainView {
    if (!_mainView) {
        _mainView = [[SecondHomePageView alloc] initWithFrame:CGRectMake(0, KNavHeight, self.view.width, self.view.height-KNavHeight-KTabbarHeight)];
        _mainView.mainTableView.delegate = self.viewModel;
        _mainView.mainTableView.dataSource = self.viewModel;
    }
    return _mainView;
}

- (SecondHomePageViewViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[SecondHomePageViewViewModel alloc]init];
    }
    return _viewModel;
}


@end
