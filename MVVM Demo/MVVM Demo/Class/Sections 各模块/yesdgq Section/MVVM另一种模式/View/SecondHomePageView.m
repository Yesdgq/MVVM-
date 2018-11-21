//
//  SecondHomePageView.m
//  MVVM Demo
//
//  Created by yesdgq on 2018/9/30.
//  Copyright © 2018年 yesdgq. All rights reserved.
//

#import "SecondHomePageView.h"
#import "ReactiveObjC/ReactiveObjC.h"

static NSString *IdentifierHomePageCell = @"IdentifierHomePageCell";
static NSString *IdentifierHomePageHeader = @"IdentifierHomePageHeader";

@interface SecondHomePageView ()

@property (nonatomic, strong, readwrite) UITableView *mainTableView;
@property (nonatomic, strong, readwrite) UIButton *testButton;
@property (nonatomic, strong, readwrite) UIView *testView;


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
            dispatch_async(dispatch_get_main_queue(), ^{
                UILabel *label = (UILabel *)[self.testView viewWithTag:677];
                label.text = x;
            });
        }];
    }
    return self;
}


#pragma mark - getter

- (UITableView *)mainTableView {
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, self.frame.size.height-60) style:UITableViewStyleGrouped];
        _mainTableView.sectionHeaderHeight = CGFLOAT_MIN;
        _mainTableView.sectionFooterHeight = CGFLOAT_MIN;
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

#pragma mark - HomePageTableViewCell

@implementation HomePageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

+ (instancetype)defaultHomePageTableViewCell:(UITableView *)tableView
                                   indexPath:(NSIndexPath *)indexPath
                                        text:(NSString *)text
                                  detailText:(NSString *)detailText
                                   imageName:(NSString *)imageName
                                    selected:(BOOL)selected{
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IdentifierHomePageCell];
    if (!cell) {
        cell = [[HomePageTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IdentifierHomePageCell];
    }
    // 下面这些东西,全放在cell里面
    if (selected) {
        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (tableView.editing) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CGSize cellSize = [tableView rectForRowAtIndexPath:indexPath].size;
    [cell reloadDataWithIndexPath:indexPath
                          cellSize:cellSize
                              text:text
                        detailText:detailText
                         imageName:imageName];
    return cell;
}

- (void)reloadDataWithIndexPath:(NSIndexPath *)indexPath
                        cellSize:(CGSize)cellSize
                            text:(NSString *)text
                      detailText:(NSString *)detailText
                       imageName:(NSString *)imageName{
    self.textLabel.text = text;
    self.detailTextLabel.text = detailText;
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end


#pragma mark - HomePageTableViewHeader


@implementation HomePageTableViewHeader

+ (instancetype)defaultHomePageTableViewHeader:(UITableView *)tableView section:(NSInteger )section {
    
    HomePageTableViewHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:IdentifierHomePageHeader];
    if (!headerView) {
        headerView = [[HomePageTableViewHeader alloc]initWithReuseIdentifier:IdentifierHomePageHeader];
    }
    CGSize headerSize = [tableView rectForHeaderInSection:section].size;
    [headerView reloadDataWithSection:section headerSize:headerSize];
    
    return headerView;
}
- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.searchTextField];
        [self.contentView addSubview:self.editCheckAllButton];
        [self.contentView addSubview:self.cancelButton];
    }
    return self;
}

- (void)reloadDataWithSection:(NSInteger )section headerSize:(CGSize)headerSize {
    
    self.searchTextField.frame = CGRectMake(40, 10, headerSize.width-120, 40);
    self.editCheckAllButton.frame = CGRectMake(headerSize.width-60, 10, 40, 40);
    self.cancelButton.frame = CGRectMake(20, 10, 40, 40);
}

- (void)editCheckAllButtonActionClick {
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (self.editCheckAllButton.selected) {
        if ([self respondsToSelector:@selector(HomePageTableViewHeaderClickAction:)]) {
            [self HomePageTableViewHeaderClickAction:HomePageTableViewHeaderAction_ChackAll];
        }
        return;
    }
    self.editCheckAllButton.selected = !self.editCheckAllButton.selected;
    self.cancelButton.hidden = self.editCheckAllButton.selected?NO:YES;
    self.searchTextField.hidden = self.editCheckAllButton.selected?YES:NO;
    if ([self respondsToSelector:@selector(HomePageTableViewHeaderClickAction:)]) {
        [self HomePageTableViewHeaderClickAction:HomePageTableViewHeaderAction_Editing];
    }
}
- (void)cancelButtonActionClick {
    
    self.cancelButton.hidden = YES;
    self.editCheckAllButton.selected = !self.editCheckAllButton.selected;
    self.searchTextField.hidden = !self.cancelButton.hidden;
    if ([self respondsToSelector:@selector(HomePageTableViewHeaderClickAction:)]) {
        [self HomePageTableViewHeaderClickAction:HomePageTableViewHeaderAction_Cancel];
    }
}

- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc]initWithFrame:CGRectZero];
        _searchTextField.placeholder = @"搜索消息内容";
        _searchTextField.layer.opaque=YES;
        _searchTextField.layer.cornerRadius = 20;
        _searchTextField.layer.masksToBounds = YES;
        _searchTextField.borderStyle = UITextBorderStyleNone;
        _searchTextField.backgroundColor = [UIColor whiteColor];
        //        _searchTextField.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
        //        _searchTextField.rightViewMode = UITextFieldViewModeAlways;
        _searchTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 40)];
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.clearsOnBeginEditing = YES;
        _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;///占据rightView的位置
    }
    return _searchTextField;
}

- (UIButton *)editCheckAllButton {
    if (!_editCheckAllButton) {
        _editCheckAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editCheckAllButton setTitle:@"编辑" forState:UIControlStateNormal];
        [_editCheckAllButton setTitle:@"全选" forState:UIControlStateSelected];
        [_editCheckAllButton setTitleColor:[UIColor colorWithRed:(23)/255.0 green:(119)/255.0 blue:(210)/255.0 alpha:(1)] forState:UIControlStateNormal];
        _editCheckAllButton.backgroundColor = self.backgroundColor;
        [_editCheckAllButton addTarget:self action:@selector(editCheckAllButtonActionClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editCheckAllButton;
}
- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor colorWithRed:(23)/255.0 green:(119)/255.0 blue:(210)/255.0 alpha:(1)] forState:UIControlStateNormal];
        _cancelButton.backgroundColor = self.backgroundColor;
        _cancelButton.hidden=YES;
        [_cancelButton addTarget:self action:@selector(cancelButtonActionClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cancelButton;
}

@end
