//
//  GDMiddleTabSwitchView.m
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/15.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import "GDMiddleTabSwitchView.h"
#import "UIView+GDFrameKit.h"

@interface GDMiddleTabSwitchView ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) NSInteger titlesCount;

@end

@implementation GDMiddleTabSwitchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)getDataSourceTitlesArray:(NSArray *)titlesArray {
    
    self.titlesCount = [titlesArray count];
    CGFloat btnWidth = ceilf(self.width / _titlesCount);
    for (NSInteger i = 0; i < _titlesCount; i++) {
        UIButton *oneBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnWidth * i, 0, btnWidth, self.height - 2)];
        [oneBtn setTitle:[titlesArray objectAtIndex:i] forState:UIControlStateNormal];
        [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [oneBtn setTitleColor:[UIColor blueColor] forState:UIControlStateDisabled];
        [oneBtn addTarget:self action:@selector(oneBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
        oneBtn.tag = i + 1000;
        oneBtn.enabled = (i == 0) ? NO : YES;
        [self addSubview:oneBtn];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(btnWidth/4, self.height - 2, btnWidth/2, 2)];
    lineView.backgroundColor = [UIColor blueColor];
    [self addSubview:lineView];
    self.lineView = lineView;
}

- (void)setCurrentSelectIndex:(NSInteger)currentSelectIndex {
    
    _currentSelectIndex = currentSelectIndex;
    NSArray *subviews = self.subviews;
    [subviews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *oneBtn = (UIButton *)obj;
            oneBtn.enabled = (oneBtn.tag == currentSelectIndex + 1000) ? NO : YES;
        }
    }];
    CGFloat btnWidth = ceilf(self.width / _titlesCount);
    [UIView animateWithDuration:0.3 animations:^{
        _lineView.centerX = (btnWidth * currentSelectIndex) + btnWidth / 2.0;
    }];
}

- (void)oneBtnTapped:(UIButton *)sender {
    
    self.currentSelectIndex = sender.tag - 1000;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_delegate && [_delegate respondsToSelector:@selector(tabSwitchViewDidSelectIndex:)]) {
            [_delegate tabSwitchViewDidSelectIndex:_currentSelectIndex];
        }
    });
}

@end
