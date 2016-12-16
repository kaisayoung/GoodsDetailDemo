//
//  GDUpGeneralInfomationView.m
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/14.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import "GDUpGeneralInfomationView.h"
#import "UIView+GDFrameKit.h"

@interface GDUpGeneralInfomationView ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, assign, readwrite) CGFloat totalHeight;

// 是否是奇数，为了模拟高度改变，默认是否，奇数时返回19，偶数时返回16
@property (nonatomic, assign) BOOL isOddNumber;

@end

@implementation GDUpGeneralInfomationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initSubview {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.scrollEnabled = NO;
    [self addSubview:tableView];
    self.tableView = tableView;
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    self.panGesture.delegate = self;
    [self addGestureRecognizer:self.panGesture];
}

// 得到数据后reload一下后会自动计算出自身的contentSize，从而可以得到高度
- (void)bindDataSource {
    
    [self initSubview];
    
    [self willChangeHeight];
}

- (void)willChangeHeight {
    [self.tableView reloadData];
    self.tableView.height = self.totalHeight;
    [self nofityDelegate];
}

- (void)nofityDelegate {
    if (_delegate && [_delegate respondsToSelector:@selector(upGeneralInfomationViewHeightChange:)]) {
        [_delegate upGeneralInfomationViewHeightChange:self.totalHeight];
    }
}

- (CGFloat)totalHeight {
    return self.tableView.contentSize.height;
}

- (void)panAction:(UIPanGestureRecognizer *)gesture {

}

#pragma mark - UIGestureRecognizerDelegate 

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.panGesture) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint translation = [pan translationInView:self.tableView];
        if (translation.y == 0) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isOddNumber) return 19;
    return 16;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"通用信息%ld，是否是奇数:%d，点击我试试",indexPath.row,_isOddNumber];
    return cell;
}

// 此处只是为了模拟，实际项目中会复杂很多
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.isOddNumber = !_isOddNumber;
    [self willChangeHeight];
}

@end
