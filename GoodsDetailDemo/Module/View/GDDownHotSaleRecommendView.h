//
//  GDDownHotSaleRecommendView.h
//  GoodsDetailDemo
//
//  Created by 恺撒 on 2016/12/15.
//  Copyright © 2016年 God Is A Girl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDDownInfomationViewProtocol.h"
#import "GDDownInfomationViewDataSource.h"
#import "GDDownInfomationViewDelegate.h"

/*
 *  下面的tab之一热卖推荐子view，内部是一个collectionview列表
 */

@interface GDDownHotSaleRecommendView : UIView<GDDownInfomationViewProtocol>

@property (nonatomic, weak) id<GDDownInfomationViewDataSource>dataSource;
@property (nonatomic, weak) id<GDDownInfomationViewDelegate>delegate;

@end
