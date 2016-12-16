//
//  GDDownInfomationViewProtocol.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/16.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 *  因为tableView有tableHeaderView属性，而collectionView没有对应的，所以暂时只支持tableView
 *  如果想使用collectionView可以将其嵌套在tableViewCell中
 */

@protocol GDDownInfomationViewProtocol <NSObject>

@property (nonatomic, strong, readonly) UITableView *scrollView;

@end
