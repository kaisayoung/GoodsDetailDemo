//
//  GDDownParentInfomationView.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/16.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDownInfomationViewDataSource.h"
#import "GDDownInfomationViewDelegate.h"

/*
 *  下面的对应tab的子view的父view
 *  ToDo: 暂未使用，因为未想好是协议方式还是继承方式更好？！
 */

@interface GDDownParentInfomationView : UIView

@property (nonatomic, weak) id<GDDownInfomationViewDataSource>dataSource;
@property (nonatomic, weak) id<GDDownInfomationViewDelegate>delegate;

@property (nonatomic, strong) UITableView *tableView;

@end
