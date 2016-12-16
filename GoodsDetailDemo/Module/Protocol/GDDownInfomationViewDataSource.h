//
//  GDDownInfomationViewDataSource.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/16.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GDDownInfomationViewDataSource <NSObject>

- (CGFloat)gd_scrollView:(UIScrollView *)scrollView heightForHeaderInSection:(NSInteger)section;
- (UIView *)gd_scrollView:(UIScrollView *)scrollView viewForHeaderInSection:(NSInteger)section;

@end
