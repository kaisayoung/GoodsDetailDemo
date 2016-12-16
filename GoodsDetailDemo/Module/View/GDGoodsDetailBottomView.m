//
//  GDGoodsDetailBottomView.m
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/13.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import "GDGoodsDetailBottomView.h"

@implementation GDGoodsDetailBottomView

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
        [self initSubview];
    }
    return self;
}

- (void)initSubview {
    UILabel *textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    textLabel.text = @"I am bottom view";
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLabel];
}

@end
