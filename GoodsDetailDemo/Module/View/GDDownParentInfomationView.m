//
//  GDDownParentInfomationView.m
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/16.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import "GDDownParentInfomationView.h"
#import "UIView+GDFrameKit.h"

@interface GDDownParentInfomationView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GDDownParentInfomationView

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
    [self addSubview:tableView];
    self.tableView = tableView;
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

#pragma mark - Private Method

- (void)stopScrollFinallyWithScrollView:(UIScrollView *)scrollView {
    if (_delegate && [_delegate respondsToSelector:@selector(gd_scrollView:currentScrollOffsetY:)]) {
        [_delegate gd_scrollView:scrollView currentScrollOffsetY:scrollView.contentOffset.y];
    }
}

@end
