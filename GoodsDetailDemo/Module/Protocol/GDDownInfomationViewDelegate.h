//
//  GDDownInfomationViewDelegate.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/16.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GDDownInfomationViewDelegate <NSObject>

- (void)gd_scrollView:(UIScrollView *)scrollView currentScrollOffsetY:(CGFloat)offsetY;

@end
