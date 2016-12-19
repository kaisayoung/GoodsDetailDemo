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
 *  如果想使用collectionView暂时只能将其嵌套在tableViewCell中
 */

@protocol GDDownInfomationViewProtocol <NSObject>

@property (nonatomic, strong, readonly) UITableView *scrollView;

// 考虑怎么友好支持collectionView中
//@property (nonatomic, strong, readonly) UIScrollView *scrollView;
//@property (nonatomic, strong, readonly) UIView *scrollHeaderView;

@end
