//
//  GDUpGeneralInfomationView.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/14.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  上面的通用信息子view，内部是一个不可滚动的tableview列表
 */

@protocol GDUpGeneralInfomationViewDelegate <NSObject>

- (void)upGeneralInfomationViewHeightChange:(CGFloat)totalHeight;

@end

@interface GDUpGeneralInfomationView : UIView

@property (nonatomic, assign, readonly) CGFloat totalHeight;

@property (nonatomic, weak) id<GDUpGeneralInfomationViewDelegate>delegate;

// 模拟传数据
- (void)bindDataSource;

@end
