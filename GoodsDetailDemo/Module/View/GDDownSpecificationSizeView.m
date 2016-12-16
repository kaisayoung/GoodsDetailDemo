//
//  GDDownSpecificationSizeView.m
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/15.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import "GDDownSpecificationSizeView.h"
#import "UIView+GDFrameKit.h"

@interface GDDownSpecificationSizeView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GDDownSpecificationSizeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor yellowColor];
    [self addSubview:tableView];
    self.tableView = tableView;
}

- (void)setTag:(NSInteger)tag {
    super.tag = tag;
    self.tableView.tag = self.tag;
}

#pragma mark - Private Method

- (void)stopScrollFinallyWithScrollView:(UIScrollView *)scrollView {
    if (_delegate && [_delegate respondsToSelector:@selector(gd_scrollView:currentScrollOffsetY:)]) {
        [_delegate gd_scrollView:scrollView currentScrollOffsetY:scrollView.contentOffset.y];
    }
}

#pragma mark - GDDownInfomationViewProtocol

- (UITableView *)scrollView {
    return self.tableView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) return;
    [self stopScrollFinallyWithScrollView:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self stopScrollFinallyWithScrollView:scrollView];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 注意以下这个方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_dataSource && [_dataSource respondsToSelector:@selector(gd_scrollView:heightForHeaderInSection:)]) {
        return [_dataSource gd_scrollView:tableView heightForHeaderInSection:section];
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_dataSource && [_dataSource respondsToSelector:@selector(gd_scrollView:viewForHeaderInSection:)]) {
        return [_dataSource gd_scrollView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

// 以下这两个方法中都是硬编码，仅是为了展示用，实际使用当中需要计算
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId11";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"尺码规则%ld",indexPath.row];;
    return cell;
}

@end
